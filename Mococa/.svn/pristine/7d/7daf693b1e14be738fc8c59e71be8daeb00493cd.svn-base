#include "rwmake.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ALIBE001  ºAutor  ³Sangelles           º Data ³  27/01/2013 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao de Liberacao de Empresas                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Acelerador Totvs Goias                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±º	Dados Adicionais de Alteracao/Ajustes do Fonte                        º±±  
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºData      ³ Descricao:                                                 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  
*/ 
//alterar toda trecho que esta como tarcisio.fanap@gmail.com
user Function ACOMP001(oProcess)   

Local cCNPJ := "xxxx"
Local aCond:={}, aFrete:= {}, aSubst:={}, aItensUpg := {}
Local _cC8_NUM, _cC8_FORNECE, _cC8_LOJA
Local _cEmlFor, _ix_upg, _cC8_RecNO := nTotal := 0
Local cEmail  	:= Space(30)
Local cUsermail, cMailID
Local _AreaSC8 := SC8->( GetArea() )
Local _AreaSE4 := SE4->( GetArea() )
Local _AreaSB1 := SB1->( GetArea() )
Local cEmailComp
Local lEnviado                                 
Local nDiasTime:=0
Local cEmailTST:= SuperGetMV("MV_WFETST",.F.,'')
Local lDescSB5 := SuperGetMV("MV_XDESCB5",.F.,.T.)
Local lCopia	:= SuperGetMV("MV_XCMP001",.F.,.F.)

Private cNomeFor := ""
Private cNameEmp:=Alltrim(SM0->M0_NOME)

Private lWFCO:=SC8->(FieldPos("C8_WFCO"))> 0
Private lWFID:=SC8->(FieldPos("C8_WFID"))> 0
Private lWFEMAIL:=SC8->(FieldPos("C8_WFEMAIL"))> 0
Private lTrackWF:=SuperGetMV("MV_XTRCKWF",.F.,.F.)


//Testa se existe parâmetro para desativar o WF  Claudio 11.05.15
If SuperGetMV("MV_XDWFCOT",.F.,.F.)
	Return
Endif
                     

//Se é exclusão da Cotação
If Type("ParamIXB[1]") == "N" .And. ParamIXB[1] == 5
	Return
Endif

/*** Atualiza a variavel quando nao for a rotina automatica do configurador ***/
//If len( PswRet() ) # 0
//	cUsermail := PswRet()[1][14]
//EndIF

/*** Ash BRASIL 2022/07/26 alterando a função para pegar o email do usuário ***/

cUsermail := UsrRetMail(RetCodUsr())

/***  Gera uma tabela com todas as informacoes necessarias e vinculos necessarios 
Para facilitar a cotacao os itens sao Ordenados pela Descricao ***/
cQuery := 'SELECT '+iif(lWFCO,'SC8.C8_WFCO,','')+' '+iif(lWFEMAIL,'SA2.A2_EMAIL as C8_WFEMAIL,','')+' '+iif(lWFID,'SC8.C8_WFID,','')+' SC8.C8_NUM, SC8.C8_VALIDA, SC8.C8_FILIAL, SC8.C8_CONTATO, '
cQuery += 'SC8.C8_ITEM,SC8.C8_DATPRF, SC8.C8_PRODUTO, SC8.C8_QUANT,SC8.C8_NUMSC, SC8.C8_UM, SC8.C8_DATPRF, SA2.A2_COD, SA2.A2_LOJA, '
cQuery += 'SA2.A2_NOME, SA2.A2_END,SC8.C8_XOBS, SC8.C8_VALICM,SC8.C8_XCODCOM, SC8.R_E_C_N_O_ , SA2.A2_MUN, SA2.A2_BAIRRO, SA2.A2_TEL, SA2.A2_FAX, SA2.A2_EMAIL, SB1.B1_COD, SB1.B1_DESC, SC8.R_E_C_N_O_ '
cQuery += 'FROM ' + RetSqlName("SC8") + ' SC8, ' + RetSqlName("SA2") + ' SA2, ' + RetSqlName("SB1") + ' SB1 '
cQuery += 'WHERE SC8.C8_FORNECE=SA2.A2_COD AND  SC8.C8_LOJA=SA2.A2_LOJA '
cQuery += "AND SC8.C8_PRODUTO = SB1.B1_COD AND SB1.B1_FILIAL = '" + xFilial("SB1") + "' "
cQuery += "AND SC8.C8_FILIAL = '" + xFilial("SC8") + "' AND SA2.A2_FILIAL = '" + xFilial("SA2") + "' "
cQuery += "AND SC8.D_E_L_E_T_ = ' ' AND SA2.D_E_L_E_T_ = ' ' AND SB1.D_E_L_E_T_ = ' ' "
cQuery += "AND SC8.C8_FILIAL = '"+xFilial("SC8")+"' AND SC8.C8_NUM = '"+ParamIXB[1]+"'"
If Type("ParamIXB[2]") == "C"  //Novo Participante Claudio 11.05.15
  cQuery += "AND SC8.C8_FORNECE = '"+ParamIXB[2]+"' AND SC8.C8_LOJA = '"+ParamIXB[3]+"'"
Endif
cQuery += ' ORDER BY SC8.C8_FILIAL, SC8.C8_NUM, SA2.A2_COD, SA2.A2_LOJA, SB1.B1_DESC'

cQuery := ChangeQuery(cQuery)
//memowrite("c:\sqlwf.txt",cQuery)

dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),"WAFORNEC",.T.,.T.)
//dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),"EMPENTREGA",.T.,.T.)

/*** Gera um laco para para possibilitar que sera executados todos os itens da cotacao ***/
while !WAFORNEC->( eof() ) .and. xFilial("SC8")+ParamIXB[1] == (WAFORNEC->C8_FILIAL+WAFORNEC->C8_NUM)
	
	/*** Verifica se a cotacao ja foi respondida ***/
	if lWFCO .and. WAFORNEC->C8_WFCO == "1004"
		
		WAFORNEC->( dbSkip() )
		Loop
		
	endif
	
	/*** Atualiza variaveis com as informacoes da cotacao posicionada ***/
	cNomeFor := alltrim(WAFORNEC->A2_NOME)
              
	_cC8_FILIAL  := WAFORNEC->C8_FILIAL
	_cC8_NUM     := WAFORNEC->C8_NUM
	_cC8_FORNECE := WAFORNEC->A2_COD
	_cC8_LOJA    := WAFORNEC->A2_LOJA
	
	_cEmlFor 	 := AllTrim(WAFORNEC->A2_EMAIL)
	_cC8_RecNO   := WAFORNEC->R_E_C_N_O_
	aItensUpg 	 := {}

     //Email para teste Claudio 11.05.15
     if !empty(cEmailTST)
		
     	_cEmlFor:= _cEmlFor+';'+cEmailTST
		
     endif	
	
	/*** Verifica no cadastro do fornecedor se o mesmo possui o campo e-mail preenchido ***/

	if Empty( _cEmlFor )

		AVISO("Atenção", "E-mail do fornecedor não informado! Não vai ser possivel o envio do mesmo!", {"Ok"})
		/*** Atualizar a cotacao (SC8) para nao processar novamente (falta da informacao e-mail) ***/
		SC8->( DbGoTo(_cC8_RecNO) )
		
		RecLock('SC8') 
		if lWFID
		  SC8->C8_WFID := "WF9999"
		endif  
		SC8->( MsUnlock() )
		
		WAFORNEC->( dbSkip() )
		Loop
		
	endif
	
	/*** Armazena os dados do usuario atualmente logado ***/
	PswOrder(1)
	if PswSeek(Substr(cUsuario,7,15),.t.)
		aInfo    := PswRet(1)
		_cUser   := aInfo[1,2]
	endIf
	                                                                       
	if empty(SuperGetMv("MV_WFWS"))
		AVISO("Atenção", "O parametro MV_WFWS não foi informado! O processo de WF de Cotação será abortado!", {"Ok"})
        return
	endif       
	
	if empty(SuperGetMv("MV_WFDIR"))
   		AVISO("Atenção", "O parametro MV_WFDIR não foi informado! O processo de WF de Cotação será abortado!", {"Ok"})
        return	
	endif
	
	 /*** Inicia um novo Processo de Workflow para env ***/
	 oProcess := TWFProcess():New( "COTPRE", "Cotação de Preços" )
	 oProcess :NewTask( "Fluxo de Cotação de Preços", "/workflow/cotacao5.htm" )    
	 
	 oProcess:ohtml:valbyname('proc_link2', 'http://'+SuperGetMv("MV_WFWS")+"/" )
	 oProcess:ohtml:valbyname('proc_link3', 'http://'+SuperGetMv("MV_WFWS")+SuperGetMv("MV_WFDIR")+"/" )
	 if lTrackWF
	   oProcess:Track('1000',"Gerando o Processo de Workflow para o fornecedor: "+Trim(cNomeFor),SubStr(cUsuario,7,15))
	 endif  
	
	/*** Preenche os dados do cabecalho ***/
	oHtml    := oProcess:oHTML
	oHtml:ValByName( "WF2P11", "WFHTTPRET.APL")
	oHtml:ValByName( "C8_CONTATO" , WAFORNEC->C8_CONTATO  )
	                                                                   
	oHtml:ValByName( "C8_FILIAL"  , WAFORNEC->C8_FILIAL		)
	oHtml:ValByName( "C8_NUM"    , WAFORNEC->C8_NUM		)
	oHtml:ValByName( "C8_VALIDA" , substr(WAFORNEC->C8_VALIDA,7,2)+"/"+substr(WAFORNEC->C8_VALIDA,5,2)+"/"+substr(WAFORNEC->C8_VALIDA,1,4) )
	oHtml:ValByName( "C8_FORNECE", WAFORNEC->A2_COD 	)
	oHtml:ValByName( "C8_LOJA"   , WAFORNEC->A2_LOJA	)
	oHtml:ValByName( "A2_NOME"   , WAFORNEC->A2_NOME   )
	oHtml:ValByName( "A2_END"    , WAFORNEC->A2_END    )
	oHtml:ValByName( "A2_MUN"    , WAFORNEC->A2_MUN    )
	oHtml:ValByName( "A2_BAIRRO" , WAFORNEC->A2_BAIRRO )
	oHtml:ValByName( "A2_TEL"    , WAFORNEC->A2_TEL    )
	oHtml:ValByName( "A2_FAX"    , WAFORNEC->A2_FAX    )
	
	SC8->(DbGoto(WAFORNEC->R_E_C_N_O_)) 
	cObs := AllTrim(SC8->C8_OBS)

	/*** Preenche de Entrega ***/
	cNome 	 := ""
	cTelf 	 := ""	
	
	aAreaSc8Bk := SC8->(GetArea())
	aAreaSY1Bk := SY1->(GetArea())
	
	SC8->(DbSelectArea("SC8"))
	SC8->(DbSetOrder(1))
	SC8->(DbGotop())
	if SC8->(DbSeek(WAFORNEC->C8_FILIAL+WAFORNEC->C8_NUM))
		
		While !SC8->(Eof()) .AND. WAFORNEC->C8_FILIAL == SC8->C8_FILIAL .AND. WAFORNEC->C8_NUM == SC8->C8_NUM
			
			SC8->(RecLock("SC8",.F.))
			
				SC8->C8_XCODCOM := AllTrim(Posicione("SY1",3,xFilial("SY1")+__cUserId,"Y1_COD"))//if SY1->(DbSeek(xFilial("SY1")+cUser))3
			
			SC8->(MsUnlock())
			
			SC8->(DbSkip())
		
		enddo
	
	endif  
	
	RestArea(aAreaSc8Bk)
	RestArea(aAreaSY1Bk)
	
	if !empty(Posicione("SY1",1,xFilial("SY1")+SC8->C8_XCODCOM,"Y1_NOME"))
		cNome := Posicione("SY1",1,xFilial("SY1")+SC8->C8_XCODCOM,"Y1_NOME")
	endif
	if !empty(Posicione("SY1",1,xFilial("SY1")+SC8->C8_XCODCOM,"Y1_TEL"))
		cTelf := Posicione("SY1",1,xFilial("SY1")+SC8->C8_XCODCOM,"Y1_TEL")
	endif
	
	oHtml:ValByName( "C8_ENDENTREGA2", trim(SM0->M0_CIDENT)+" - "+SM0->M0_ESTENT+" - "+Transform(SM0->M0_CEPENT,"@R X9.999.-999") +" - "+trim(SM0->M0_BAIRENT))//trim(SM0->M0_CEPENT) )
	oHtml:ValByName( "C8_ENDENTREGA1", trim(SM0->M0_NOME)+" - "+SM0->M0_ENDENT+" - "+Transform(SM0->M0_CGC,"@R X9.999.999/9999-99") )
	oHtml:ValByName( "C8_ENDENTREGA0", "Comprador : "+cNome +" - Telefone : "+ cTelf)
	
	// Inicia a localizacao das Formas de Pagamento
	aCond:={}
	SE4->( dbSetOrder(1) )
	if SE4->( dbSeek(xFilial("SE4") + SA2->A2_COND ) )
		//aAdd( aCond, SE4->E4_Codigo + " - " + SE4->E4_Descri )
		//Trocado a Cond Pgto 001 - A VISTA por 100 - Vista, nos pedidos do Protheus dpto de Compras utiliza a condição 100  
		aAdd( aCond, IIF(SE4->E4_Codigo == "001", "100" + " - " + "A VISTA", SE4->E4_Codigo + " - " + SE4->E4_Descri ) )
	endif
	
	SE4->( dbGoTop() )
    while !SE4->( Eof() )
	    if SE4->E4_Filial == xFilial("SE4")
        	//aAdd( aCond, SE4->E4_Codigo + " - " + SE4->E4_Descri )
        	//Trocado a Cond Pgto 001 - A VISTA  por 100 - Vista, nos pedidos do Protheus dpto de Compras utiliza a condição 100 
        	aAdd( aCond, IIF(SE4->E4_Codigo == "001", "100" + " - " + "A VISTA", SE4->E4_Codigo + " - " + SE4->E4_Descri ) )
        Endif
        SE4->( dbSkip() )
    enddo
	
	/*** Inicia o Processo de Substituição das variaveis dos Itens da Cotação no HTML ***/
	while !WAFORNEC->( eof() ) .and. WAFORNEC->C8_FILIAL = xFilial("SC8") ;
		.and. WAFORNEC->C8_NUM  = _cC8_NUM ;
		.and. WAFORNEC->A2_COD 	= _cC8_FORNECE ;
		.and. WAFORNEC->A2_LOJA = _cC8_LOJA
		
		if aScan(aItensUpg, {|x| x[2] = (WAFORNEC->A2_COD+WAFORNEC->A2_LOJA+WAFORNEC->B1_COD) } ) > 0
			
			WAFORNEC->( dbSkip() )
			Loop
			
		endif
		
		aAdd( (oHtml:ValByName( "it.item"    )), WAFORNEC->C8_ITEM    )
		aAdd( (oHtml:ValByName( "it.produto" )), WAFORNEC->C8_PRODUTO ) //, o fornecedor quer a referencia do produto
		//Trata descrição cientifica Claudio 11.05.15
		_cDescB5 := Posicione("SB5", 1, xFilial("SB5")+WAFORNEC->C8_PRODUTO, "B5_CEME" )
		if !Empty(_cDescB5) .AND. lDescSB5
		  aAdd( (oHtml:ValByName( "it.descri"  )), trim(_cDescB5) )
		else		
		  aAdd( (oHtml:ValByName( "it.descri"  )), trim(WAFORNEC->B1_DESC) )
		endif  
		aAdd( (oHtml:ValByName( "it.quant"   )), TRANSFORM( WAFORNEC->C8_QUANT,'@E 99,999.99' ) )
		aAdd( (oHtml:ValByName( "it.um"      )), WAFORNEC->C8_UM      )
		aAdd( (oHtml:ValByName( "it.preco"   )), TRANSFORM( 0.00,'@E 99,999.99' ) )
		aAdd( (oHtml:ValByName( "it.valor"   )), TRANSFORM( 0.00,'@E 99,999.99' ) )
		aAdd( (oHtml:ValByName( "it.ipi"     )), TRANSFORM( 0.00,'@E 99.99' ) )
		aAdd( (oHtml:ValByName( "it.prazo"   )), "0" )
		
		aAdd( (oHtml:ValByName( "it.icms"    )), TRANSFORM( 0.00,'@E 99.99' ) )
		aAdd( (oHtml:ValByName( "it.dtprf"    )), substr(WAFORNEC->C8_DATPRF,7,2)+"/"+substr(WAFORNEC->C8_DATPRF,5,2)+"/"+substr(WAFORNEC->C8_DATPRF,1,4) )
		aAdd( (oHtml:ValByName( "it.obs"   	 )), cObs)
	
		aAdd( aItensUpg, {WAFORNEC->R_E_C_N_O_,(WAFORNEC->A2_COD+WAFORNEC->A2_LOJA+WAFORNEC->B1_COD)})
		nDiasTime:=stod(WAFORNEC->C8_VALIDA)-dDatabase
		WAFORNEC->( dbSkip() )
		
	enddo
	
	oHtml:ValByName( "Pagamento", aCond    )
	oHtml:ValByName( "Frete"    , {"CIF","FOB"}   )
	oHtml:ValByName( "subtot"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	oHtml:ValByName( "vldesc"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	oHtml:ValByName( "aliipi"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	//	oHtml:ValByName( "Valipi"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	oHtml:ValByName( "valfre"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	oHtml:ValByName( "totped"   , TRANSFORM( 0 ,'@E 999,999.99' ) )
	
	oProcess:cSubject := "Processo de geração de Cotação de Preços N." + _cC8_NUM
	//	oProcess:cTo      := SubStr(cUsuario,7,15) //Documentação solicita que se altere para o usuário microsiga e não mais o email usando a variavel: _cEmlFor
	oProcess:cTo      := 'cotpre' //Documentação solicita que se altere para o usuário microsiga e não mais o email usando a variavel: _cEmlFor
	oProcess:bReturn  := "U_MT130WFR(1)"       // Funçao de Retorno
	nDiasTime:=iif(nDiasTime<0,0,nDiasTime)  
	//Alert(Str(nDiasTime))
	oProcess:bTimeOut := { { "U_MT130WFR(3)", nDiasTime, 0 , 2 } } //oProcess:bTimeOut := { { funcao, dias, horas, minutos0 } }
	

	cMailID := oProcess:Start() // Inicia o processo com o Messenger ativo gera o HTML na pasta do usuário pelo messenger.
	

	
	cAviso:='Solicitação de Cotação de Preços N.'+_cC8_NUM+' - '+cNameEmp
	
//	cLink:='http://'+GetMv("MV_WFBRWSR")+'/emp' + cEmpAnt + '/'+'workflow'+'/' + cMailId + '.htm'
	cLink:='http://'+SuperGetMv("MV_WFWS")+'/messenger'+'/emp' + cEmpAnt + '/'+'cotpre'+'/' + cMailId + '.htm'
	
	//Envia email de Aviso
	xHTM := '<HTML><BODY>'
	xHTM += '<hr>'
	xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
	xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
	xHTM += '<hr>'
	xHTM += '<br>'
	xHTM += '<b><font face="Verdana" SIZE=3> Prezado(a) Fornecedor(a)</b></p>'
	xHTM += '<br>'
	xHTM += 'Favor clicar no link abaixo para participar do processo de cotação em referencia<BR> <br>'
	xHTM += "<a href="+cLink+" title="+cLink+">Ver Cotação</a> <br><br>  "//+cLink
	xHTM += '<p>'
	xHTM += '<b>Prezado(a) fornecedor(a), não responda esse e-mail,<br> para enviar a cotação, preencha o formulário através do link e clique em enviar.</b>'
	xHTM += '</BODY></HTML>'
	
	
	//Parametros necessarios para a rotina
	// MV_RELACNT - Conta a ser utilizada no envio de E-Mail
	// MV_RELFROM - E-mail utilizado no campo FROM no envio
	// MV_RELSERV - Nome do Servidor de Envio de E-mail utilizado no envio
	// MV_RELAUTH - Determina se o Servidor de Email necessita de Autenticação
	// MV_RELAUSR - Usuário para Autenticação no Servidor de Email
	// MV_RELAPSW - Senha para Autenticação no Servidor de Email
	
	oMail := SendMail():new()     
	
	
	
	oMail:SetTo(_cEmlFor)
	//oMail:SetTo("tarcisio.fanap@gmail.com")
	
	
	
	
	oMail:SetFrom(Alltrim(SuperGetMv("MV_RELFROM",," ")))
	//    oMail:SetSubject('Aviso - '+cAviso)
	oMail:SetSubject('Solicitação de Cotação de Preços - '+cNameEmp)
	oMail:SetBody(xHTM)
	oMail:SetEchoMsg(.F.)
	lEnviado := oMail:Send()
	if lEnviado
		//ok (opc)
	else
		ALERT(oMail:CLOGMSG)
	endif
	if lTrackWF
	  oProcess:Track('1001',"Enviando o e-mail para o fornecedor: "+Trim(cNomeFor),SubStr(cUsuario,7,15))
	endif
	//WFSendMail() Comentado Claudio 11.05.14  isso não usa mais.
	
	// Busca os itens para Gravar as informações já processadas do WorkFlow
	for _ix_upg := 1 to Len(aItensUpg)
		
		SC8->( DbGoTo(aItensUpg[_ix_upg,1]) )
		
		RecLock('SC8')
		//		If Empty(C8_WFDT)
		//			SC8->C8_WFDT   := dDataBase
		//		EndIF
		//SC8->oProcess    := "1003"
		if lWFEMAIL
		  SC8->C8_WFEMAIL := iif( cUsername == "Administrador", SuperGetMV("MV_RELACNT"), cUsermail )
		endif  
		if lWFID
		  SC8->C8_WFID    := oProcess:fProcessID
		endif  
		SC8->( MsUnlock() )
		
	next _ix_upg
	//	RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1002',RetCodUsr(),"Aguardando retorno do fornecedor: "+Trim(WAFORNEC->A2_NOME))
	if lTrackWF
	  oProcess:Track('1002',"Aguardando retorno do fornecedor: "+Trim(cNomeFor),SubStr(cUsuario,7,15))
	endif  
	If lEnviado
		AVISO("Informação", "E-mail enviado com sucesso para o fornecedor : "+Trim(cNomeFor)+" e-mail: "+Trim(_cEmlFor) , {"Ok"})
	EndIf	

enddo
WAFORNEC->( DbCloseArea() )
	 
if lWFEMAIL.and.type("SC8->C8_WFEMAIL") == 'U'
   	AVISO("Atenção", "Para este processo funcionar é necessário criaro o campo SC8->C8_WFEMAIL!", {"Ok"})
  	return
endif
If lCopia .AND. MsgYesNo("Deseja receber uma cópia da cotação?")
     
	cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP"))
	//Envia email de Aviso
	xHTM := '<HTML><BODY>'
	xHTM += '<hr>'
	xHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
	xHTM += '<b><font face="Verdana" SIZE=3>'+cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
	xHTM += '<hr>'
	xHTM += '<br>'
	xHTM += '<b><font face="Verdana" SIZE=3> Prezado(a) Fornecedor(a)</b></p>'
	xHTM += '<br>'
	xHTM += 'Favor clicar no link abaixo para participar do processo de cotação em referencia<BR> <br>'
	xHTM += "<a href="+cLink+" title="+cLink+">Ver Cotação</a> <br><br>  "//+cLink
	xHTM += '<p>'
	xHTM += '<b>Prezado(a) comprador(a), não responda esse e-mail,<br> Não envie a cotação, esse processo deve ser feito pelo fornecedor.</b>'
	xHTM += '</BODY></HTML>'
	
	oMail := SendMail():new()  
	
	
	
	
	oMail:SetTo(cEmailComp)
	//oMail:SetTo("tarcisio.fanap@gmail.com")



	
	oMail:SetFrom(Alltrim(SuperGetMv("MV_RELFROM",," ")))
	oMail:SetSubject('Solicitação de Cotação de Preços - '+cNameEmp)
	oMail:SetBody(xHTM)
	oMail:SetEchoMsg(.F.)
	lEnviado := oMail:Send()
	
EndIf
/*** Restaura Ambiente ***/
RestArea( _AreaSC8 )
RestArea( _AreaSE4 )
RestArea( _AreaSB1 )
Return NIL


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±    
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³XMT130WFR  ºAutor  ³Anderson Machado    º Data ³  08/01/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Faz a gravacao no retorno do workflow                       º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TBC-GO                                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function MT130WFR(AOpcao, oProcess)
Local aCab   		:={}
Local aItem 	 	:= {}
Local nUsado 		:= 0   
Local nTotaCot		:= 0 
Local aRelImp 		:= MaFisRelImp("MT150",{"SC8"})
Local _AreaSC8 		:= SC8->( GetArea() )
Local _AreaSE4 		:= SE4->( GetArea() )
Local _AreaSB1 		:= SB1->( GetArea() )
Local aProdPrench	:= {}
Local _cValPreco 	:= ""
Local cFilCot		:= ""
Local cNumCot		:= ""
Local cFornCot		:= ""
Local cLojaCot		:= ""
Local cItemCot		:= ""
Local _nVlrPreco 	:= _nTotPed := _nVlDesc := 0
Local cEmailTST		:= SuperGetMV("MV_WFETST",.F.,'')
Local lFreteProp	:= SuperGetMV("MV_XFRETPR",.F.,.T.)

Private cNameEmp	:=Alltrim(SM0->M0_NOME)
Private lWFCO		:=SC8->(FieldPos("C8_WFCO"))> 0
Private lWFID		:=SC8->(FieldPos("C8_WFID"))> 0  
Private lWFEMAIL	:=SC8->(FieldPos("C8_WFEMAIL"))> 0
Private lTrackWF	:=SuperGetMV("MV_XTRCKWF",.F.,.F.)

if ValType(aOpcao) = "A"
	aOpcao := aOpcao[1]
endif    

Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Opção: "+ alltrim(str(aOpcao)) )


if aOpcao == NIL
	aOpcao := 0
	
elseif aOpcao == 1
                     
	_cC8_NUM     := oProcess:oHtml:RetByName("c8_num")
	_cC8_Filial  := oProcess:oHtml:RetByName("c8_filial")	
	_cC8_FORNECE := oProcess:oHtml:RetByName("c8_fornece")
	_cC8_LOJA    := oProcess:oHtml:RetByName("c8_loja") 

elseif aOpcao == 2
	_cC8_NUM     := oProcess:oHtml:RetByName("c8_num")
	_cC8_Filial  := oProcess:oHtml:RetByName("c8_filial")	
	_cC8_FORNECE := oProcess:oHtml:RetByName("c8_fornece")
	_cC8_LOJA    := oProcess:oHtml:RetByName("c8_loja")  

elseif aOpcao == 3 //TimeOut

			SPCTimeOut( oProcess )
			Return
endif
	Conout(" ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" C8_NUM: "+ alltrim(_cC8_NUM) )
	Conout(" ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" C8_FORNECE: "+ alltrim(_cC8_FORNECE) )
	Conout(" ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" C8_FORNECE: "+ alltrim(_cC8_LOJA) )

Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Posicionando na SC8: " + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA )


dbSelectArea("SC8")
dbSetOrder(1)
if !dbSeek( _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA )
	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Não achou SC8 (1): " + _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA )	
endif

/*** Cotacao Recebida ***/
Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Aprovação igual a  " + cValToChar(oProcess:oHtml:RetByName("Aprovacao")))	

if oProcess:oHtml:RetByName("Aprovacao") = "S"
	
	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Antes de Chamar processo 1003")	

	//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1003',RetCodUsr(),"Processando a resposta da Cotação N."+_cC8_NUM+" do Fornecedor: "+_cC8_FORNECE)
	if lTrackWF
	  oProcess:Track('1003',"Processando a resposta da Cotação N."+_cC8_NUM+" do Fornecedor: "+_cC8_FORNECE , SubStr(cUsuario,7,15))
	endif  

	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Depois de Chamar processo 1003")	

	
	_cC8_VLDESC := oProcess:oHtml:RetByName("VLDESC" )
	_cC8_ALIIPI := oProcess:oHtml:RetByName("ALIIPI" )
	_cC8_VALFRE := oProcess:oHtml:RetByName("VALFRE" )
	
	/*** Verifica o frete ***/
	if oProcess:oHtml:RetByName("Frete") = "FOB"
		_cC8_RATFRE := 0
	endif
	
	/*** Atualizacao dos valores da cotacao na SC8 ***/
	for _nind := 1 to len(oProcess:oHtml:RetByName("it.preco"))
		
		//BASE DO ICMS
		MaFisIni(PADR(_cC8_FORNECE,9,""),_cC8_LOJA,"F","N","R",aRelImp)
		MaFisIniLoad(1)
		
		For nY := 1 To Len(aRelImp)
			MaFisLoad(aRelImp[nY][3],SC8->(FieldGet(FieldPos(aRelImp[nY][2]))),1)
		Next nY
		
		MaFisEndLoad(1)
		
		dbSelectArea("SB1")
		dbSetOrder(1)
		dbSeek( xFilial() + oProcess:oHtml:RetByName("it.produto")[_nind] )
		cIcm := SC8->C8_PICM
		
		_cC8_ITEM := oProcess:oHtml:RetByName("it.item")[_nind]
		dbSelectArea("SC8")
		dbSetOrder(1)
		if !dbSeek( _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA + _cC8_ITEM )
				Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Não achou SC8 (2): " + _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA)	
		endif

	  Conout("Verifica se o prazo tenha vencido não permite gravacao ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+if(lWFID," SC8->C8_WFID: "+SC8->C8_WFID,''))	
		
		/*** Verifica se o prazo tenha vencido não permite gravacao ***/
		If lWFID.and. SC8->C8_WFID = "9999"
			//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1004',RetCodUsr(),"Cotação N."+Padr(_cC8_NUM,6)+" recebida fora do prazo do fornecedor: "+Padr(_cC8_FORNECE,6))
			Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Antes de Chamar processo 1004")	
            if lTrackWF
			  oProcess:Track('1004',"Cotação N."+Padr(_cC8_NUM,6)+" recebida fora do prazo do fornecedor: "+_cC8_FORNECE, SubStr(cUsuario,7,15))
			endif  

			Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Depois de Chamar processo 1004")	
			
			/*** Restaura Ambiente ***/
			RestArea( _AreaSC8 )
			RestArea( _AreaSE4 )
			RestArea( _AreaSB1 )
			Return
			
		EndIf
		
		Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Executando o RecLock(SC8,.f.) para C8_WFCO   := 1004 ")	
	
		dbSelectArea("SC8")
		dbSetOrder(1)
		if dbSeek( _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA + _cC8_ITEM )

	   		Conout("Achou SC8!!!! XXXXXXXXXXXXX tarcisio3 ")	
	
			RecLock("SC8",.f.)
		
			if lWFCO
			  SC8->C8_WFCO   := "1004"
			endif  
			SC8->C8_MOTIVO := trim( oProcess:oHtml:RetByName("motivo") )  
			SC8->C8_XOBS   := trim( oProcess:oHtml:RetByName("c8_xobs") ) 
			
			cxObs  := " Observação do Fornecedor : "+ trim( oProcess:oHtml:RetByName("c8_xobs") )
			cxObs2 := " Observação : "+ AllTrim(SC8->C8_OBS) 
			
			
			if !empty(trim( oProcess:oHtml:RetByName("c8_xobs"))) .AND. !empty(AllTrim(SC8->C8_OBS))
			
				cxObs3 := cxObs+cxObs2
				
			elseif !empty(trim( oProcess:oHtml:RetByName("c8_xobs"))) .AND. empty(AllTrim(SC8->C8_OBS))
			
				cxObs3 := cxObs
				
			elseif empty(trim( oProcess:oHtml:RetByName("c8_xobs"))) .AND. !empty(AllTrim(SC8->C8_OBS))	
			
			
				cxObs3 := cxObs2
				
			elseif empty(trim( oProcess:oHtml:RetByName("c8_xobs"))) .AND. empty(AllTrim(SC8->C8_OBS))	 
			
				cxObs3 := "Não Existe Observação para essa cotação!"
			
			endif
			
			Conout(cxObs)
			Conout(cxObs2)
			Conout(cxObs3)			
			
			SC8->C8_OBS    := cxObs3  //Substr(Dtoc(Date()),1,5)+'-'+Substr(Time(),1,5)+':'+SC8->C8_MOTIVO
			
			_cValPreco := StrTran(AllTrim(oProcess:oHtml:RetByName("it.preco")[_nind]),",",".")
		   	SC8->C8_PRECO  := Round(Val(_cValPreco),TamSX3("C8_PRECO")[2])

			_cValPreco := StrTran(AllTrim(oProcess:oHtml:RetByName("it.valor")[_nind]),",",".")
			SC8->C8_TOTAL  := Round(Val(_cValPreco),TamSX3("C8_TOTAL")[2])
			                  					
			_cValPreco := StrTran(AllTrim(oProcess:oHtml:RetByName("it.ipi")[_nind]),",",".")
			SC8->C8_ALIIPI := Round(Val(_cValPreco),TamSX3("C8_ALIIPI")[2])

			_nPrazo := Trim(oProcess:oHtml:RetByName("it.prazo")[_nind])
			SC8->C8_PRAZO  := Val( _nPrazo )
			
			
			//caso o IPI não seja zero
			If Val(oProcess:oHtml:RetByName("it.ipi"  )[_nind])>0
				SC8->C8_VALIPI  := Round(Val(StrTran(StrTran(oProcess:oHtml:RetByName("it.ipi"  )[_nind],".",""),",","."))*Val(StrTran(StrTran(oProcess:oHtml:RetByName("it.valor"  )[_nind],".",""),",","."))/100,2)//Round(Val(StrTran(StrTran(oProcess:oHtml:RetByName("it.ipi"  )[_nind],".",""),",","."))*val(oProcess:oHtml:RetByName("it.valor")[_nind])/100,2) //(Val(oProcess:oHtml:RetByName("it.ipi"  )[_nind])*Val(oProcess:oHtml:RetByName("it.valor")[_nind]))/100
				ConOut("Ipi -> "+oProcess:oHtml:RetByName("it.ipi"  )[_nind])
				ConOut("Valor ->"+oProcess:oHtml:RetByName("it.valor")[_nind])
				ConOut("Calculo -> "+str(Round(Val(StrTran(StrTran(oProcess:oHtml:RetByName("it.ipi"  )[_nind],".",""),",","."))*Val(StrTran(StrTran(oProcess:oHtml:RetByName("it.valor"  )[_nind],".",""),",","."))/100,2)))
				ConOut("Campo -> "+str(SC8->C8_VALIPI))
				SC8->C8_BASEIPI := SC8->C8_TOTAL
			EndIf
			
			//caso o icm nao seja zero
			MaFisAlt("IT_ALIQICM",cIcm,1)
			C8_PICM        := MaFisRet(1,"IT_ALIQICM")
			
			If C8_PICM >0
				
				C8_BASEICM     := SC8->C8_TOTAL
				MaFisAlt("IT_VALICM",cIcm,1)
				C8_VALICM      := MaFisRet(1,"IT_VALICM")
				
			EndIf
			
			SC8->C8_COND   := Substr(oProcess:oHtml:RetByName("pagamento"),1,3)
			//Trocar Condição de Pagamento Daniele
			//If SC8->C8_COND == "001"
				//SC8->C8_COND := "100"	
			//EndIf
			
			SC8->C8_TPFRETE:= Substr(oProcess:oHtml:RetByName("Frete"),1,1)
			
			
			/*** Preenche variaveis ***/
			_cValPreco := StrTran(AllTrim(oProcess:oHtml:RetByName("it.preco")[_nind]),",",".")
			_nVlrPreco := Round(Val(_cValPreco),TamSX3("C8_PRECO")[2])
			
			_cValPreco := StrTran(AllTrim(oProcess:oHtml:RetByName("totped")),",",".")
			_nTotPed := Round(Val(_cValPreco),TamSX3("C8_PRECO")[2])
			
		
			_cValFrete := StrTran(AllTrim(oProcess:oHtml:RetByName("valfre")),",",".")//Trim(oProcess:oHtml:RetByName("valfre"))
			Conout("( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Valor Frete: "+_cValFrete )	
				
			_cValFrete := Round(Val(_cValFrete),TamSX3("C8_PRECO")[2])	
			
			//carrego os itens preenchidos na cotacao para calcular proporcionalmente o frete para os produtos
			if lFreteProp .And. SC8->C8_TOTAL > 0 .And. _cValFrete > 0  
				
				nTotaCot += SC8->C8_TOTAL
				
				Aadd( aProdPrench, {SC8->C8_FILIAL,;
									SC8->C8_NUM,;
									SC8->C8_FORNECE,;
									SC8->C8_LOJA,;
									SC8->C8_ITEM,;
									_cValFrete } )
					 
			endif
			
			//caso nao esteja ativado o frete proporcional, replica o valor para todos os itens
			if !lFreteProp
				SC8->C8_VALFRE := _cValFrete //( ( Val(oProcess:oHtml:RetByName("it.quant")[_nind]) * ( _nVlrPreco / _nTotPed ) ) * _cValFrete )
				Conout("( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Gravado Valor Frete2: "+alltrim(str(_cValFrete)) )
            endif
            
			
			/*** Preenche variaveis (valor desconto) ***/
			_vldesc := StrTran(AllTrim(oProcess:oHtml:RetByName("vldesc")),",",".")//Trim(oProcess:oHtml:RetByName("vldesc"))
			_vldesc := Round(Val(_vldesc),TamSX3("C8_PRECO")[2])
			
			iif( _vldesc == 0 ,;
			SC8->C8_VLDESC := 0, ;
			SC8->C8_VLDESC := ( (Val(oProcess:oHtml:RetByName("it.quant")[_nind]) * (_nVlrPreco / (_nTotPed +_vldesc)) ) * _vldesc ) )
			
			MsUnlock()
			MaFisEnd()
			
		else
				Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Não achou SC8 (2): " + _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA)	
		endif
		
		Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Fim Execução do RecLock(SC8,.f.) para C8_WFCO   := 1004 ")	

	next
	//calculo o valor de frete proporcional aos itens preenchidos
	if lFreteProp
		
		SC8-> ( DbSetOrder(1) ) //C8_FILIAL+C8_NUM+C8_FORNECE+C8_LOJA+C8_ITEM+C8_NUMPRO+C8_ITEMGRD
		
		For nX := 1 To Len( aProdPrench )
			 
			cFilCot		:= aProdPrench[nX,1]
			cNumCot		:= aProdPrench[nX,2]
			cFornCot	:= aProdPrench[nX,3]
			cLojaCot	:= aProdPrench[nX,4]
			cItemCot	:= aProdPrench[nX,5]
			nFreteCot	:= aProdPrench[nX,6]
			
			if SC8->( DbSeek( cFilCot + cNumCot + cFornCot + cLojaCot +  cItemCot ) ) 
			
				//proporcao do item sobre a cotacao
				nPercentItem	:= SC8->C8_TOTAL / nTotaCot
				
				//calculo o frete proporcional ao item 
				nFreteItem	:= NoRound( nFreteCot * nPercentItem, 2 )
		   	    
		   		RecLock("SC8",.F.)
		   			SC8->C8_VALFRE	:= nFreteItem
		   		SC8->( MsUnlock() )
		   			
		   	endif
		   	
		Next nX
		
	endif
	
	
	//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1005',RetCodUsr(),"Concluido a atualzação da cotação do fornecedor: "+_cC8_FORNECE)
	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Antes de Chamar processo 1005")	
    if lTrackWF
	  oProcess:Track('1005', "Concluido a atualzação da cotação do fornecedor: "+_cC8_FORNECE, SubStr(cUsuario,7,15))            
	endif  
	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Depois de Chamar processo 1005")	
	
	
	
	//cEmailComp := "tarcisio.fanap@gmail.com"
	cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP")) 
	
	
	
	
	Aprovar(oProcess,cEmailComp,_cC8_NUM,_cC8_Filial)
	oProcess:Finish()  //Finalizo o Processo
	

Else //caso tenha sido rejeitado
	
	Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Foi rejeitado de Chamar processo '1006' - Iniciando")	

	aCab := {	{"C8_NUM"	,_cC8_NUM,NIL}}
	if lTrackWF
	  oProcess:Track('1006', "O fornecedor "+_cC8_FORNECE+" informou sua desistência no processo de Cotação N."+Padr(_cC8_NUM,6), SubStr(cUsuario,7,15))
	endif  
	//	RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1006',RetCodUsr(),"O fornecedor "+_cC8_FORNECE+" informou sua desistência no processo de Cotação N."+Padr(_cC8_NUM,6))
	
	/*** Atualiza os itens da cotação na SC8 ***/
	for _nind := 1 to len(oProcess:oHtml:RetByName("it.preco"))
		
		_cC8_ITEM := oProcess:oHtml:RetByName("it.item")[_nind]
		
		dbSelectArea("SC8")
		dbSetOrder(1)
		if !dbSeek( _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA + _cC8_ITEM )
				Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Não achou SC8 (3): " + _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA )	
		endif
		
		Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Executando o RecLock(SC8,.f.)(2) para C8_WFCO   := 1004 ")	
	
		RecLock("SC8",.f.)
		SC8->C8_MOTIVO := Substr(Dtoc(Date()),1,5)+'-'+Substr(Time(),1,5)+':'+trim( oProcess:oHtml:RetByName("motivo") )
		SC8->C8_XOBS := Substr(Dtoc(Date()),1,5)+'-'+Substr(Time(),1,5)+':'+trim( oProcess:oHtml:RetByName("c8_xobs") )
		MsUnlock()

		Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Fim Execução do RecLock(SC8,.f.)(2) para C8_WFCO   := 1004 ")	
		
		//lMsErroAuto := .F.
		
		//aadd(aItem,   {{"C8_ITEM",_cC8_ITEM ,NIL},;
		///				{"C8_FORNECE",_cC8_FORNECE ,NIL},;
		//				{"C8_LOJA",_cC8_LOJA ,NIL}})
		
		//		MSExecAuto({|x,y,z| mata150(x,y,z)},aCab,aItem,5) //EXCLUI
		
		//		ConOut( iif(lMsErroAuto, "Erro de Execução ao tentar cancelar a Cotação", "Ok, Pedido Cancelado") )
		//RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1007',RetCodUsr(),"Cancelado a Cotação N."+Padr(_cC8_NUM,6)+" do fornecedor "+Padr(_cC8_FORNECE,6))
		Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" 1007 Cancelado a Cotação N."+Padr(_cC8_NUM,6)+" do fornecedor "+_cC8_FORNECE)
        if lTrackWF
		  oProcess:Track('1007',"Cancelado a Cotação N."+Padr(_cC8_NUM,6)+" do fornecedor "+_cC8_FORNECE, SubStr(cUsuario,7,15))
		endif  
		
	Next
	//	RastreiaWF(oProcess:fProcessID+'.'+oProcess:fTaskID,oProcess:fProcCode,'1008',RetCodUsr(),"Enviando e-mail de notificação ao Comprador de desistência do fornecedor: "+Padr(_cC8_FORNECE,6)+" da Cotação de Preços N."+Padr(_cC8_NUM,6))
	
	cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP"))
    //Email para teste Claudio 11.05.15
    if !empty(cEmailTST)
		cEmailComp:=cEmailTST
    endif

  Conout("INICIO DE RETORNO WF COTACAO ( WF COTACAO) Data: "+dtoc(ddatabase)+ "Hora: "+time()+" Enviando e-mail de notificação ao Comprador de desistência do fornecedor: "+_cC8_FORNECE+" da Cotação de Preços N."+Padr(_cC8_NUM,6))	
    if lTrackWF
	  oProcess:Track('1008',"Enviando e-mail de notificação ao Comprador de desistência do fornecedor: "+_cC8_FORNECE+" da Cotação de Preços N."+Padr(_cC8_NUM,6), SubStr(cUsuario,7,15))
	endif  
	Reprovar(oProcess, cEmailComp, _cC8_NUM,_cC8_Filial)
	oProcess:Finish()  //Finalizo o Processo

endif

/*** Restaura Ambiente ***/
RestArea( _AreaSC8 )
RestArea( _AreaSE4 )
RestArea( _AreaSB1 )
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³Reprovar  ºAutor  ³Anderson Machado    º Data ³  09/01/09   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Envia e-mail para os compradores                            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TBC-GO                                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static function Reprovar(oProcess,cEmailComp,_cC8_NUM,_cC8_Filial)
Local _user := Subs(cUsuario,7,15)
Local _cHTM := ""
Local _cNrCotacao := oProcess:oHtml:RetByName("C8_FORNECE")+oProcess:oHtml:RetByName("C8_LOJA")
Local _cAviso:="NOTIFICAÇÃO - Desistência do fornecedor na Cotação de Preços - "+cNameEmp+"  Nr. "+_cC8_NUM
Local _cFornecedor := Posicione("SA2", 1, xFilial("SA2")+_cNrCotacao, "A2_NOME" )
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')   
Private lWFEMAIL:=SC8->(FieldPos("C8_WFEMAIL"))> 0
Private lTrackWF:=SuperGetMV("MV_XTRCKWF",.F.,.F.)

_cHTM := '<HTML><BODY>'
_cHTM += '<hr>'
_cHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
_cHTM += '<b><font face="Verdana" SIZE=3>'+_cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
_cHTM += '<hr>'
_cHTM += '<br>'
_cHTM += '<br>'
_cHTM += 'O fornecedor <b>'+Trim(_cFornecedor)+'</b> informa sua desistência na Cotação de Nr. <b>'+_cC8_NUM+'</b>, Filial: <b>'+_cC8_Filial+'</b> <BR><BR>'
_cHTM += 'Sob motivo: <b>'+oProcess:oHtml:RetByName("motivo")+'</b> <BR><BR>'
_cHTM += '</BODY></HTML>'

//Email para teste Claudio 11.05.15
if !empty(cEmailTST)
  cEmailComp:=cEmailTST
endif

oMail := SendMail():new()



oMail:SetTo(iif( !empty(cEmailComp), cEmailComp, SuperGetMv("MV_WFCMP") ))
//oMail:SetTo("tarcisio.fanap@gmail.com") 



oMail:SetFrom(Alltrim(SuperGetMv("MV_RELFROM",," ")))
oMail:SetSubject(_cAviso)
oMail:SetBody(_cHTM)
oMail:SetEchoMsg(.f.)
if oMail:Send()
	//ok (opc)
else
	//erro (opc)
endif
if lTrackWF
  oProcess:Track('1009',"Finalizado a participação do fornecedor: "+_cC8_FORNECE+" da Cotação de Preços N."+Padr(_cC8_NUM,6), SubStr(cUsuario,7,15))
endif  

return

Static function Aprovar(oProcess,cEmailComp,_cC8_NUM,_cC8_Filial)
Local _user := Subs(cUsuario,7,15)
Local _cHTM := ""
Local _cNrCotacao := oProcess:oHtml:RetByName("C8_FORNECE")+oProcess:oHtml:RetByName("C8_LOJA")
Local _cAviso:="NOTIFICAÇÃO - Participação do fornecedor na Cotação de Preços - "+cNameEmp+"  Nr. "+_cC8_NUM
Local _cFornecedor := Posicione("SA2", 1, xFilial("SA2")+_cNrCotacao, "A2_NOME" )
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')   
Private lWFEMAIL:=SC8->(FieldPos("C8_WFEMAIL"))> 0
Private lTrackWF:=SuperGetMV("MV_XTRCKWF",.F.,.F.)

_cHTM := '<HTML><BODY>'
_cHTM += '<hr>'
_cHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
_cHTM += '<b><font face="Verdana" SIZE=3>'+_cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
_cHTM += '<hr>'
_cHTM += '<br>'
_cHTM += '<br>'
_cHTM += 'O fornecedor <b>'+Trim(_cFornecedor)+'</b> informa sua participação na Cotação de Nr. <b>'+_cC8_NUM+'</b>, Filial: <b>'+_cC8_Filial+'</b> <BR><BR>'
_cHTM += 'Sob motivo: <b>'+oProcess:oHtml:RetByName("motivo")+'</b> <BR><BR>'
_cHTM += '</BODY></HTML>'

//Email para teste Claudio 11.05.15
if !empty(cEmailTST)
  cEmailComp:=cEmailTST
endif

oMail := SendMail():new()



oMail:SetTo(iif( !empty(cEmailComp), cEmailComp, SuperGetMv("MV_WFCMP") ))
//oMail:SetTo("tarcisio.fanap@gmail.com")




oMail:SetFrom(Alltrim(SuperGetMv("MV_RELFROM",," ")))
oMail:SetSubject(_cAviso)
oMail:SetBody(_cHTM)
oMail:SetEchoMsg(.f.)
if oMail:Send()
	//ok (opc)
else
	//erro (opc)
endif
if lTrackWF
  oProcess:Track('1009',"Finalizado a participação do fornecedor: "+_cC8_FORNECE+" da Cotação de Preços N."+Padr(_cC8_NUM,6), SubStr(cUsuario,7,15))
endif  

return

STATIC Function SPCTimeOut( oProcess )
Local cEmailTST:=SuperGetMV("MV_WFETST",.F.,'')
Private cNameEmp:=Alltrim(SM0->M0_NOME)
Private lWFEMAIL:=SC8->(FieldPos("C8_WFEMAIL"))> 0
Private lTrackWF:=SuperGetMV("MV_XTRCKWF",.F.,.F.)                                                  

_cC8_NUM     := oProcess:oHtml:RetByName("C8_NUM"     )
_cC8_Filial  := oProcess:oHtml:RetByName("C8_FILIAL"     )	
_cC8_FORNECE := oProcess:oHtml:RetByName("C8_FORNECE" )
_cC8_LOJA    := oProcess:oHtml:RetByName("C8_LOJA"    )

ConOut("Funcao de TIMEOUT executada Cotação "+_cC8_NUM+ " "+_cC8_FORNEC )

/*** PEGA O EMAIL PARA AVISAR O COMPRADOR ***/
cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP"))


/*** Atualiza os itens da cotação na SC8 ***/
for _nind := 1 to len(oProcess:oHtml:RetByName("it.preco"))
	
	_cC8_ITEM := oProcess:oHtml:RetByName("it.item")[_nind]
	
	dbSelectArea("SC8")
	dbSetOrder(1)
	dbSeek( _cC8_Filial + Padr(_cC8_NUM,6) + _cC8_FORNECE + _cC8_LOJA + _cC8_ITEM )
	
	RecLock("SC8",.f.)
	SC8->C8_MOTIVO := 'AUTOMATICO: Falta de retorno'
	MsUnlock()
	
	/*** PEGA O EMAIL PARA AVISAR O COMPRADOR ***/
	cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP"))

	//Email para teste Claudio 11.05.15
	if !empty(cEmailTST)
	  cEmailComp:=cEmailTST
	endif
	if lTrackWF
	  oProcess:Track('1007',"Cancelado a Cotação N."+Padr(_cC8_NUM,6)+" do fornecedor "+_cC8_FORNECE, SubStr(cUsuario,7,15))
	endif  
	
Next

_cAviso:="NOTIFICAÇÃO - Cotação finalizada por falta de resposta - "+cNameEmp+"- Cotação No "+_cC8_NUM
_cHTM := '<HTML><BODY>'
_cHTM += '<hr>'
_cHTM += '<p  style="word-spacing: 0; line-height: 100%; margin-top: 0; margin-bottom: 0">'
_cHTM += '<b><font face="Verdana" SIZE=3>'+_cAviso+' &nbsp; '+dtoc(date())+'&nbsp;&nbsp;&nbsp;'+time()+'</b></p>'
_cHTM += '<hr>'
_cHTM += '<br>'
_cHTM += '<br>'
_cHTM += 'O fornecedor <b>'+_cC8_FORNECE+'</b> teve sua Cotação finalizada por falta de retorno - Cotação Nr. <b>'+_cC8_NUM+'</b> <BR><BR>'
_cHTM += '</BODY></HTML>'


oMail := SendMail():new()


cEmailComp := if(lWFEMAIL,SC8->C8_WFEMAIL,SuperGetMv("MV_WFCMP"))
//oMail:SetTo("tarcisio.fanap@gmail.com")
oMail:SetTo(cEmailComp)


oMail:SetFrom(Alltrim(SuperGetMv("MV_RELFROM",," ")))
oMail:SetSubject(_cAviso)
oMail:SetBody(_cHTM)
oMail:SetEchoMsg(.t.)
if oMail:Send()
	//ok (opc)
else
	//erro (opc)
endif

oProcess:Finish()  //Finalizo o Processo
Return 
