//Importação de XML gerando uma pre-nota de entrada automaticamente
// TI Mococa 23/07/2018

#Include 'Protheus.ch'
#Include 'Totvs.ch'
#INCLUDE "rwmake.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "XMLXFUN.CH"
#include "ap5mail.ch"
#INCLUDE "TBICONN.CH"
#include "fileio.ch"

User Function ImpCte()
Private oLeXml

//Montagem da tela de processamento.
@ 200,1 TO 380,380 DIALOG oLeXml TITLE OemToAnsi("Leitura dos Arquivos XML")
@ 02,10 TO 080,190
@ 10,018 Say " Este programa ira importar o conteudo dos arquivos XML's,"
@ 18,018 Say " da   pasta  padrão  C:\CTE\ ."  //definida  no   parametro  MV_XIMPXML."
@ 26,018 Say " Ao Final caso ocorra erros, será gerado um log no disco C:"

@ 60,128 BMPBUTTON TYPE 01 ACTION Processa( {|| LEXML() } )
@ 60,158 BMPBUTTON TYPE 02 ACTION Close(oLeXml)

Activate Dialog oLeXml Centered
Return .t.
Static Function LEXML()

Local cAREA := GETAREA()
Local _n := 0 
Local nArqXml := 0

Private nBaseIcm		:= 0
Private _cTes           := ""
Private nPerIcm         := 0
Private nValIcm := 0
Private cfopCom := ALLTRIM(getMv("MV_XCTECOM",," "))
Private cfopRep := ALLTRIM(getMV("MV_XCTEREP",," "))
Private cfopGara := ALLTRIM(getMv("MV_XCTEGARA",," "))
Private cfopBon := ALLTRIM(getMv("MV_XCTEBON",," "))
Private xCTECFOP := ALLTRIM(getMv("MV_XCTECFOP",," "))
//Private cCond3Forn := ALLTRIM(getMv("MV_XFORNEC"))
Private cCond07 := ALLTRIM(getMv("MV_IMP07"))
Private cCond30 := ALLTRIM(getMv("MV_IMP30"))
Private lFrete :=  getMv("MV_XFRETE",.T.,.F.)
Private lRetVal := .T.


Private serNF := ALLTRIM(getMv("MV_XSERNF",,"03"))
Private _nI, nTotItem
Private _aItems
Private oXML
Private aAreaSD2 := getArea("SD2")
Private aReg        :={}
Private _aItems     :={}
Private aCabNE      :={}
Private aItemNe     :={}
Private _aNfSaida	   :={}

Private nXmlStatus  	:= 0
Private nTotItem    	:= 0
Private nI          	:= 0
Private nQtde       	:= 0
Private nUnitar     	:= 0
Private nTotal      	:= 0

Private cItem       	:= ""
Private cArqXml     	:= ""
Private cCodEan     	:= ""
Private cProduto    	:= ""
Private cModelo     	:= ""
Private cXml        	:= "" , oXml
Private cNota       	:= ""
Private cCnpjFor    	:= ""
Private cCodFor     	:= ""
Private cLojaFor    	:= ""
Private cCondPGT		:= ""
Private cUm         	:= ""
Private cNfOri      	:= ""
Private cSeriOri    	:= ""
Private _cLog       	:= ""
Private cProduto    	:= ""
Private cDescpr     	:= ""
Private cMarca      	:= ""
Private cSegum      	:= ""
Private cCC         	:= ""
Private cLocal      	:= ""
Private cDtvalid    	:= ""
Private cFret           := ""
Private _ccVend         := ""
Private _CodGru         := ""
Private _Prod           := ""
Private _DescProd       := ""
//	Private _Natur       := ""
Private lOkArquivo  	:= .f.
Private lMSErroAuto	:= .F.
Private lMSHelpAuto 	:= .F.
Private cSerieCte := ""
Private cNumCte := ""
Private dperiodo := ""
Private cDoc :=""
Private nPesoBruto := 0

Private aInfQ 	:= {}
Private aVLCte 	:= {}
Private aVLCte2 := {}
Private aVLCte3 := {}

Private nMes := 0
Private nAno := 0
Private cMenNotaXml := ""

Private lDadosSaidaCorreto := .T.

cFatura				:= SPACE(15)
_msgX					:= ""
_lCopi					:= .t.
lLog 					:= .f.
//	cOutSaid				:= .f.   //Caso verdadeiro a NF de saida Não e de vendas.
_cCombo				:= ""
_nPesoCte				:= 0
_cTipFrete				:= ""
nValCarga				:= 0

//Fecha a tela informativa de confirmacao da rotina
Close(oLeXml)

// carrega o array _aItems com os nomes de todos os arquivos do diretorio
_cPath := GETMV("MV_XIMPXML")  //C:\CTE\ alterar o Parametros para MV_XIMPXML Importação de CTE 12.1.25  possui o mesmo parametro MV_IMPXML como Lógico
aDIR(_cPath+"*.XML",_aITEMS)

/*
//Cria diretorio com nome da fatura para armazenar os arquivos XML.
if !EXISTDIR("\cte\"+alltrim(cusername)+"-"+dtos(ddatabase)+"-"+strtran(time(),":",""))
if MakeDir("\cte\"+alltrim(cusername)+"-"+dtos(ddatabase)+"-"+strtran(time(),":","")) <> 0
Alert("Não foi possÃ­vel criar o diretÃ³rio: "+CURDIR()+"\cte\"+alltrim(cusername)+"-"+dtos(ddatabase)+"-"+strtran(time(),":","")+". Verifique! "+cValToChar(FError()))
return()
else
_cDirFat	:= "\cte\"+alltrim(cusername)+"-"+dtos(ddatabase)+"-"+strtran(time(),":","")+"\"
endif
else
Alert("Diretorio ja Existe.")
endif
*/
// retirado o bloco acima pois não consigo criar o arquivo na system, deixei fixo
_cDirFat	:= "system\cte\"

// Processa todas as NFEs do Diretorio
For nArqXml := 1 To Len(_aItems)
	
	nBaseIcm		:= 0 
	_cTes           := ""
	nPerIcm         := 0 
	
	_nPsCBcte	:= 0
	_nPsCte	:= 0
	_nVolCTe	:= 0
	
	incproc("Importando arquivo XML......")
	
	lOkArquivo  := .f.
	aItemNe := {}
	
	MoveOK := u_MoveArq()
	If MoveOK
		// Capture o Nome do Arquivo em Formato XML
		cArqXml := _cDirFat+_aItems[nArqXml]
		
		cError   := ""
		cWarning := ""
		
		//Gera o Objeto XML
		oXml := XmlParserFile( cArqXml, "_", @cError, @cWarning )
		
		// Verificacao se a leitura foi ok. -  0=OK, 1=Arquivo nao Encontrado, 2=Erro de Abertura, 3=Xml Invalido, -1= Erro no NOD
		nStatus := @cError
	Else
		MSGSTOP("Problemas para Copiar o Arquivo, Verifique!")
		return()
	Endif
	
	If !empty(nStatus)
		MSGSTOP("O Arquivo: " + cArqXml + " esta com Problemas.  ->  "+nStatus)
		_MsgInv := "O Arquivo: " + cArqXml + " esta com Problemas.  ->  "+nStatus
		_msgX	+= _MsgInv+CHR(13)+CHR(10)
		lLog := .t.
		//   _WriteLog(_MsgInv)
		lGrava := .F.
		incproc()
		Loop
	EndIf
	
	// Verificacao se O CTE e' para a empresa corrente
	
	cCnpjEmp := (oXML:_CTEPROC:_CTE:_INFCTE:_REM:_CNPJ:TEXT)     //// Conhecimento de Frete sobre as vendas
	If Alltrim(cCnpjEmp)$ "52502507000147/52502507000309/52502507000813/52502507006692/52502507000651/52502507006269/52502507006854/52502507001208/52502507001623/52502507001895/52502507002271/52502507001976"
		If Alltrim(cCnpjEmp) <> Alltrim(SM0->M0_CGC)
			MSGSTOP("A NFE: "+ alltrim(cArqXml) + " CTE de compra,não é destinada para esta Empresa Corrente: "+ alltrim(SM0->M0_CODIGO) +"-"+ alltrim(SM0->M0_FILIAL)+" "+alltrim(SM0->M0_NOME))
			RESTAREA(cAREA)
			Return
		EndIf
	EndIf
	
	/*
	If !Alltrim(cCnpjEmp)$ "08700812000151/08700812000232/08703941000101/08509253000105/07219703000154/05104810000101/05742388000110/08509253000369/18480874000159/08700812000313"
	cCnpjEmp := (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CNPJ:TEXT)  //// Conhecimento de Frete sobre as compras
	If Alltrim(cCnpjEmp) <> Alltrim(SM0->M0_CGC)
	MSGSTOP("A NFE: "+ alltrim(cArqXml) + " CTE de venda,Não é Destinada Para esta Empresa Corrente: "+ alltrim(SM0->M0_CODIGO) +"-"+ alltrim(SM0->M0_FILIAL)+" "+ alltrim(SM0->M0_NOME))
	RESTAREA(cAREA)
	Return                                   
	EndIf
	EndIf
	*/
	// Totais de Itens da NFE
	// Antes, verifico se os itens vem numa variavel tipo array ou nao
	
	
	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_REM')  <> 'U' // undefined
		aNfsCte	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_REM, "_INFNFE")
		_cChDoc	:= "1"
	ENDIF
	//	if aNfsCte == nil
	//	aNfsCte	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_REM, "_INFNF")
	//	_cChDoc	:= "2" //Xml utiliza numero e serie das notas.
	//		endif
	
	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC')  <> 'U' // undefined
		if aNfsCte == nil
			
			aNfsCte	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC, "_INFNF")
			_cChDoc	:= "2" //Xml utiliza numero e serie das notas.
		endif
	ENDIF
	
	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC')  <> 'U' // undefined
		if aNfsCte == nil
			aNfsCte	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC, "_INFOUTROS")
			_cChDoc	:= "2" //Xml utiliza numero e serie das notas.
		endif
	ENDIF
	
	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC')  <> 'U' // undefined
		if aNfsCte == nil
			aNfsCte	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC, "_INFNFE")   //RICARDO FIUZAS  30/05/14
			_cChDoc	:= "1" //Xml utiliza as chaves da NF
		endif
	ENDIF
	
	If VALTYPE(aNfsCte) = "A"
		nTotItem 	:= len(aNfsCte)
	Else
		nTotItem := 1
	EndIf
	
	_aNfSaida	:= ARRAY(nTotItem,2)
	// Array para os Itens do CTe
	aItemNE:={}
	
	DBSELECTAREA("SA1")
	SA1->(DBGOTOP())
	SA1->(DBSETORDER(3))
	
	If (XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_DEST,"_CNPJ") <> Nil )// Ajuste para pegar a Tag Destinatário do CTE estava gravando o Remetente Mococa na SF8
	cCnpjCli 	:= (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CNPJ:TEXT)
	
	ElseIf (XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_DEST,"_CPF") <> Nil )
	cCnpjCli 	:= (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CPF:TEXT)  // Erro Quando emitido Destinatário CPF caso Vitor
	
	EndIF
	
	//cCnpjCli 	:= (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CNPJ:TEXT) //Ajuste para pegar a Tag Destinatário do CTE estava gravando o Remetente Mococa na SF8
	//cCnpjCli 	:= (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CPF:TEXT)  //Palitavo CPF Vitor
	cClient     := Posicione("SA1",3,"    "+cCnpjCli,'A1_COD')
	cLojaCli    := Posicione("SA1",3,"    "+cCnpjCli,'A1_LOJA')
	//		EndIf
	
	cCnpjFor 	:= (oXML:_CTEPROC:_CTE:_INFCTE:_EMIT:_CNPJ:TEXT)
	
	/*cFornece 	:= Posicione("SA2",3,"    "+cCnpjFor,'A2_COD')     //TRANSPORTADORA
	cLojaFor 	:= Posicione("SA2",3,"    "+cCnpjFor,'A2_LOJA')*/
	
	DBSELECTAREA("SA2")
	SA2->(DBGOTOP())
	SA2->(DBSETORDER(3))
	if SA2->(DBSEEK(xFilial("SA2") + cCnpjFor))
		cFornece 	:= SA2->A2_COD     //TRANSPORTADORA
		cLojaFor 	:= SA2->A2_LOJA
		cCondPGT	:= SA2->A2_COND //pega a Condição de PGTO cadastro Fornecedor
		
		if	Empty(cCondPGT)
				cCondPGT := "07" // Condição padrão para as Transportador 15 dias
		endif	
	else
		msgStop("Fornecedor com CNPJ: "+cCnpjFor+" não encontrado")
	endif
	
	cNumCte		:= Padl(oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_NCT:TEXT,9,"0")
	cSerieCte	:= Padl(oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_SERIE:TEXT,3,"0")
	dEmissao	:= STOD(STRTRAN((oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_DHEMI:TEXT),"-",""))
	dHora		:= STRTRAN((oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_DHEMI:TEXT),":","")
	nValorUn	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_VTPREST:TEXT))
	cChaveCte	:= (oXML:_CTEPROC:_PROTCTE:_INFPROT:_CHCTE:TEXT)
	_cDest		:= (oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_ENDERDEST:_UF:TEXT)
	//cSuframa	:= Posicione("SA1",3,xFilial("SA1")+(oXML:_CTEPROC:_CTE:_INFCTE:_DEST:_CNPJ:TEXT),'A1_CALCSUF')

    //Validação Peso Bruto quando é Array
    IF type('oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_VCARGA:TEXT')  <> 'U' // undefined
    	aInfQ		:= (oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ)
    ENDIF
	
    if valtype(aInfQ) = "A"
	For _n := 1 to len(aInfQ)
		IF type('oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA')  <> 'U' // undefined
			
			if ("PESO BRUTO") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
					nPesoBruto := VAL(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
			else
					nPesoBruto := 0
			endif
			
		ENDIF
	next _n
	//Validação Peso Bruto quando é Objeto 
	elseif valtype(aInfQ) = "O"
		nPesoBruto := VAL(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ:_QCARGA:TEXT)	
	else
		nPesoBruto := 0
	endif 
	
	//Validação dos impostos Caique Mercadante 
	
	aVLCte	:= XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS, "_ICMS00") // 
	aVLCte2 := XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS, "_ICMSOUTRAUF")
	aVLCte3 := XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS, "_ICMSSN")
	aVLCte4 := XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS, "_ICMS45")
	aVLCte5 := XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS, "_ICMS41")	
                                                              
//	DbSelectArea("SF2")
//	dbgotop()
//	DbSetOrder(1)
	
	//Comentar até a cMenNotaXml Para não ajustar a gravação da SF8
 //	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC')  <> 'U' // undefined
 //		cNFChave	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC, "_INFNFE")
 //	ENDIF
	
//	cNumNF		:= substr(cNFChave:_CHAVE:TEXT,26,9)
//	cSerieNF	:= substr(cNFChave:_CHAVE:TEXT,23,3)
	
//	cDoc := Posicione("SF2",1,xFilial("SF2")+cNumNF+cSerieNF,"F2_DOC")   
		
//	    dperiodo 		:= DTOC(SF2->F2_EMISSAO)
	    
//	    cMenNotaXml := "FRETE DE VENDA DE MERCADORIAS REF. PERIODO "+ SUBSTR(dperiodo,4,2)+"/"+SUBSTR(dperiodo,7,4)

	cMenNotaXml := "FRETE DE VENDA DE MERCADORIAS"
	
	
	//IF nValIcm =
	u_DocOrig()
	
	if(!lDadosSaidaCorreto)
		restarea(cArea)
		return
	endif
	
//	_aNfSaida[1][1] := PADL(alltrim(_aNfSaida[1][1]),3,"0")
//	_aNfSaida[1][2] := PADL(alltrim(_aNfSaida[1][2]),9,"0")
	if!(fNotaFiscalSaida())
		_MsgInv := "Erro na leitura da nota fiscal de saida"
		msgStop(_MsgInv,"IMPCTE")
		//   _WriteLog(_MsgInv)
		return
	endif
	
	//cOutSaid := .F. // Variavel inicializada mas fora do tempo de execução ficando como o valor
	// da ultima entrada de XML, sendo necessario inicia-lo ao fim da execução
	// e inicio da execução seguinte. 15/05/2014 - Ricardo Lima / Guilherme.
	
	// Se tipo igual PA  devera ser tes 163  ou 164 se for Goias ou Suframa
	// Se tipo diferente PA devera ser tes 336
	
	//	If sd2->d2_tp = "PA" .and. _cTes = "336"
	//   Msginfo("Tes incorreta, do conhecimento de frete"+cNumCte+"!!!!!")
	//EndIf
	
	//###############################################################################################
	//## U_ValExist() // Validar se existe um CTE para a NF de Origem. - Lucas Martins
	//###############################################################################################
	If U_ValExist()
		
		//CTT _ccvend
		DBSELECTAREA("CTT")
		CTT->(DBGOTOP())
		CTT->(DBSETORDER(1)) //CTT_FILIAL, CTT_CUSTO
		if CTT->(DBSEEK(xFilial("CTT")+ _ccvend))
			_ccvend 	:= CTT->CTT_CUSTO     //TRANSPORTADORA
		else
			msgStop("Centro de custo: "+_ccvend+" não encontrado")
		endif
		
		// Realiza a entrada do CTe utilizando a Rotina automática
		DbSelectArea("SF1")
		DbSetOrder(1)
		If !DbSeek(xFilial("SF1")+cNumCte+cSerieCte+cFornece+cLojaFor)
			
			aCABEC	:= {}
			aITENS	:= {}
			aITENS2	:= {}
			
			AADD(aCABEC,{"F1_FILIAL"   ,xFILIAL("SF1"),nil})
			AADD(aCABEC,{"F1_TIPO"     ,"N",nil})
			AADD(aCABEC,{"F1_FORMUL"   ,"N",nil})
			AADD(aCABEC,{"F1_DOC"      ,cNumCte,nil})
			AADD(aCABEC,{"F1_SERIE"    ,cSerieCte,nil})
			AADD(aCABEC,{"F1_EMISSAO"  ,dEmissao,nil})
			AADD(aCABEC,{"F1_FORNECE"  ,cFornece,Nil})
			AADD(aCABEC,{"F1_LOJA"     ,cLojaFor,nil})
			AADD(aCABEC,{"F1_ESPECIE"  ,"CTE",nil})
			AADD(aCABEC,{"F1_COND"     ,cCondPGT,nil}) // alterado 23/04/2020
			//AADD(aCABEC,{"F1_COND"     ,"07",nil}) //Criada essa condição de Pagamento Caique Mercadante 06/09/2018 
			AADD(aCABEC,{"F1_BASEICM"  ,nBaseIcm,nil})
			AADD(aCABEC,{"F1_VALMERC"  ,nValorUn,nil})
			AADD(aCABEC,{"F1_VALBRUT"  ,nValorUn,nil})
			AADD(aCABEC,{"F1_VALICM"   ,nValIcm,nil})
			AADD(aCABEC,{"F1_CHVNFE"   ,cChaveCte,nil})
			AADD(aCABEC,{"F1_EMINFE"   ,dEmissao,nil})
			AADD(aCABEC,{"F1_HORNFE"   ,SUBSTR(dHora,12,6),nil})
			AADD(aCABEC,{"F1_MENNOTA"  ,cMenNotaXml,nil})
			AADD(aCABEC,{"E2_NATUREZ"  ,"0202006",nil})
			//AADD(aCABEC,{"E2_VENCTO"   ,DataValida(dDataBase+30,.T.),nil})
			AADD(aCABEC,{"F1_TPCTE"    ,"N",nil})
			AADD(aCABEC,{"F1_TPFRETE"  ,"F",nil}) 
			AADD(aCABEC,{"F1_PBRUTO"   ,nPesoBruto,nil}) // Pega o Peso Bruto do array no xml Caique Mercadante 06/09/2018
			AADD(aCABEC,{"F1_NFELETR"  ,cNumCte,nil})   
				
			AADD(aITENS,{"D1_FILIAL"   ,xFILIAL("SD1"),NIL})
			AADD(aITENS,{"D1_ITEM"     ,"0001",NIL})
			AADD(aITENS,{"D1_COD"      ,_Prod ,NIL})
			AADD(aITENS,{"D1_XDESCRI"  ,_DescProd ,nil})
			AADD(aITENS,{"D1_UM"       ,"UN",nil})
			AADD(aITENS,{"D1_QUANT"    ,1,nil})
			AADD(aITENS,{"D1_VUNIT"    ,nValorUn,nil})
			AADD(aITENS,{"D1_TOTAL"    ,nValorUn,nil}) //ricardo fiuza's estava dando o erro.
			AADD(aITENS,{"D1_TES"      ,_cTes,NIL})
			AADD(aITENS,{"D1_TIPO"     ,"N",nil})
			AADD(aITENS,{"D1_FORMUL"   ,"N",nil})
			AADD(aITENS,{"D1_EMISSAO"  ,dEmissao,nil})
			AADD(aITENS,{"D1_FORNECE"  ,cFornece,nil})
			AADD(aITENS,{"D1_LOJA"     ,cLojaFor,nil})
			AADD(aITENS,{"D1_CC"       ,"305001",nil})
			AADD(aITENS,{"D1_PICM"     ,nPerIcm,nil})
			AADD(aITENS,{"D1_VALICM"   ,nValIcm,nil})
			AADD(aITENS2,aITENS) 
			
			Begin Transaction
			lMSHelpAuto  := .T.
			lMSERROAUTO := .F.
			//alert("Teste1")
			MSEXECAUTO({|X,Y,Z| MATA103(X,Y,Z)},aCABEC,aITENS2,3)
			//alert("Teste2")
			cOutSaid := .F.
			
			if lMSERROAUTO
				MOSTRAERRO()
				//		Return()
			else
				u_amarra() //	alert("CAROLINE FUNCIONOU !!!!!") //
		/*		
	    // Ajusta a data de vencimento, pois não foi possível pela execauto
		    _aArSE2 := GetArea()
			dbSelectArea("SE2")
			dbSetOrder(6)
			If DbSeek(xFilial("SE2") + cFornece + cLojaFor + cSerieCte + cNumCte)
			 If RecLock("SE2",.F.)
			 
			 //Tratativa condição Pagamento 7 dias para X Fornecedores
			 //Alterado para 07 dias 03/04/2019/Chamado-178-Alteração na data de vencimento ct-e
               if alltrim(cFornece) $ cCond07
               E2_VENCTO     := DataValida(dDataBase+7,.T.)
               E2_VENCREA    := DataValida(dDataBase+7,.T.) 
               
               //Alterado para 30 dias 03/04/2019/Chamado-178-Alteração na data de vencimento ct-e
               elseif alltrim(cFornece) $ cCond30
               E2_VENCTO     := DataValida(dDataBase+30,.T.)
               E2_VENCREA    := DataValida(dDataBase+30,.T.) 
               
               else
               //Alterado para 20 dias 20/12/2018 Chamado-170-Alteração na data de vencimento ct-e
               //Alterado para 15 dias 06/02/2019 Chamado-170-Alteração na data de vencimento ct-e
               E2_VENCTO     := DataValida(dDataBase+15,.T.)
               E2_VENCREA    := DataValida(dDataBase+15,.T.) 
               MsUnlock()
               
               endif
             EndIf
            EndIf
           RestArea(_aArSE2)
           */
				
			endif
			
			End Transaction
		else
			ApMsgInfo("CTe "+cNumCte+" ja existe no sistema!")
			_MsgInv := "CTe "+cNumCte+" ja existe no sistema!"
			_msgX	+= _MsgInv+CHR(13)+CHR(10)
							//_WriteLog(_MsgInv)
		endif
		_MsgInv := "Processo de importação do CTe "+cNumCte+" concluído."+CHR(13)+CHR(10)+"********************************************************************************"+CHR(13)+CHR(10)
		_msgX	+= _MsgInv+CHR(13)+CHR(10)
		  //_WriteLog(_MsgInv)
		
		If lLog
		Else
			if FeRase(_cPath+_aItems[nArqXml]) = 0
				_MsgInv := "O Arquivo:  "+_aItems[nArqXml]+" foi Apagado da pasta "+_cPath
				_msgX	+= _MsgInv+CHR(13)+CHR(10)
									//   _WriteLog(_MsgInv)
			else
				_MsgInv := "Arquivo:  "+_aItems[nArqXml]+" Não foi Apagado da pasta "+_cPath
				_msgX	+= _MsgInv+CHR(13)+CHR(10)
				
									//   _WriteLog(_MsgInv)
			endif
			
			//ApMsgInfo("Processo de Importação finalizado.")
			_MsgInv := "Processo de Importação finalizado."
			_msgX	+= _MsgInv+CHR(13)+CHR(10)
								  //_WriteLog(_MsgInv)
		EndIf
		
		If PswSeek( cUsuario, .T. )
			_dUsr		:= PSWRET() // Retorna vetor com informações do usuário
			_nomUsr	:= _dUsr[1][4]
			_emailUsr 	:= _dUsr[1][14]
		else
			_nomUsr	:= "NDA"
			_emailUsr 	:= ""
		EndIf
		
		_cassunto	:= "Importação dos XML's dos CTe's - Fatura:  "+cFatura+_emailUsr
		_canexos	:= _cDirFat+"/"+Alltrim(cFatura)+"XML.LOG"
		//_emailx() depois colocar essa função
	Endif
Next nArqXml

If lRetVal = .F.
ApMsgInfo("Processo de Importação Interrompido, verificar CTE.")
Else
ApMsgInfo("Processo de Importação finalizado.")
EndIf

RESTAREA(cAREA)
Return(aReg)


//Função para gravar os Log's de error.
Static Function _WriteLog(_MsgInv)
_cLog +=_MsgInv+CHR(13)+CHR(10)
//Memowrite(_cDirFat+Alltrim(cFatura)+"XML.LOG",_cLog)
//Memowrite(_cPath+Alltrim(cFatura)+"XML.LOG",_cLog)
Return

//Função para enviar e-mail com o resultado da importa
Static Function _emailX()

Local cAccount  := 'Importação_CTe'
Local cEnvia    := 'helpdesk@vitapan.com.br'
Local cServer   := '10.1.1.34'
Local cPassword := '6Y6GFDcf3h'

_para := "ti@vitapan.com.br; "+_emailUsr

_cMsg := '</table>'
_cMsg += '<br><br>'
_cMsg += '<font face="Arial Black" size="4">  '+SM0->M0_NOME+ '</font> <br>'
_cMsg += '<br>'
_cMsg += '<font face="Arial" size="2"> Importação dos XML: em '+dtoc(date())+ " As " + Time() + '     Por '+alltrim(cusername)+ '</font> <br>'
_cMsg += '<br>'
_cMsg += '<font face="Arial" size="2"> Segue em anexo o LOG com as informações do processo de imoprtação do XML </font> <br>'
_cMsg += '<br>'
_cMsg += '<table border=1 width=700>'
_cMsg += '<tr>'
_cMsg += '<td rowspan=2 width=80>'+_msgX+'</td>'
_cMsg += '</tr>'
_cMsg += '<tr>'
_cMsg += '</table>'
_cMsg += '<br>'
_cMsg += '<font face="Arial" size="1"> Este e-mail foi gerado automaticamente pelo sistema, favor Não responder.</b></font> <br>'
_cMsg += '</body>'
_cMsg += '</html>'

CONNECT SMTP SERVER cServer ACCOUNT cAccount PASSWORD cPassword Result lConectou
SEND MAIL FROM cEnvia TO _para SUBJECT _cassunto BODY _cMsg RESULT lEnviado

_para := ""
return()


//Função para amarrar as NF's transportadas ao CTe.
User Function Amarra()
Local _nI := 0 

_nPsLnf			:= 0
_nPsBnf			:= 0
_nVolNf			:= 0

//Realiza a amarração do CTe com as NF's de Saida
For _nI := 1 to len(_aNfSaida)
	DbSelectArea("SF2")
	DbSetOrder(1)
	//		If DbSeek(xFilial("SF2")+Alltrim(_aNfSaida[_nI][2])+Alltrim(_aNfSaida[_nI][1])+"  ")
	If DbSeek(xFilial("SF2")+Alltrim(_aNfSaida[_nI][2]))
		
		if len(_aNfSaida) > 1
			_nVal		:= (nValorUn/nValCarga)*sf2->f2_valbrut
			_nValICM	:= (_nVal*nPerIcm)/100
		else
			_nVal	:= nValorUn
			_nValIcm	:= nValIcm
		endif
		
		//RECLOCK("SF2",.F.)
		//sf2->f2_serfret	:= cSerieCte
		//sf2->f2_numfret	:= cNumCte
		//sf2->f2_vlfrete	:= _nVal
		//sf2->f2_icmsfr	:= _nValICM
		//sf2->f2_obsfr	:= _cTipFrete
		//sf2->f2_tipfret	:= _cCombo
		//MSUNLOCK()
		_nPsLnf			:= _nPsLnf+sf2->f2_pliqui
		_nPsBnf			:= _nPsBnf+sf2->f2_pbruto
		_nVolNf			:= _nVolNf+sf2->f2_volume1
		_MsgInv 		:= "Realizada a amarração da NF:  "+_aNfSaida[_nI][2]+" ao CTe:  "+cNumCte
		_msgX	+= _MsgInv+CHR(13)+CHR(10)
		//   _WriteLog(_MsgInv)
	
		DbSelectArea("SF8")
		DbSetOrder(1)
		If !DbSeek(xFilial("SF8")+cNumCte+cSerieCte+cFornece+cLojaFor)
			RECLOCK("SF8",.T.)
			SF8->F8_FILIAL  	:= xFilial("SF8")
			SF8->F8_NFDIFRE    	:= cNumCte
			SF8->F8_SEDIFRE   	:= cSerieCte
			SF8->F8_DTDIGIT  	:= dDatabase
			SF8->F8_TRANSP  	:= cFornece  //TRANSPORTADOR
			SF8->F8_LOJTRAN    	:= cLojaFor
			SF8->F8_FORNECE  	:= cClient
			SF8->F8_LOJA		:= cLojaCli  
			SF8->F8_NFORIG  	:= SF2->F2_DOC
			SF8->F8_SERORIG     := SF2->F2_SERIE
			
			//SF8->F8_TPFRTE  	:= cFret
			//SF8->F8_TIPONF  	:="S"
			SF8->F8_ORIGEM  	:="IMPCTE"
			MSUNLOCK()

			_MsgInv := "Realizada a gravação das informações auxiliares na tabela SF8 do CTe: "+cNumCte+" - NF Saida : "+SF2->F2_DOC
			_msgX	+= _MsgInv+CHR(13)+CHR(10)
			//   _WriteLog(_MsgInv)

			
		EndIf
	else
		_MsgInv := "Não foi localizada a NF:  "+_aNfSaida[_nI][2]+" do CTe:  "+cNumCte+". Não foi realizada a amarração dessta NF."
		_msgX	+= _MsgInv+CHR(13)+CHR(10)
		//   _WriteLog(_MsgInv)
		lLog := .t.
	endif
Next _nI

// Grava a tabela auxiliar ZZX, com todas as NFEs Importadas.
/*

cArqTxt := cArqXml
nHdl    := fOpen(cArqTxt,68)

fSeek(nHdl,0,0)
mZZxml := FREADSTR(NHDL,65000)
nFOrig := SF2->F2_DOC
cSerOrig := SF2->F2_SERIE

DbSelectArea("SF8")
DbSetOrder(1)
If !DbSeek(xFilial("SF8")+cNumCte+cSerieCte+cFornece+cLojaFor)
	RECLOCK("SF8",.T.)
	SF8->F8_FILIAL  	:= xFilial("SF8")
	SF8->F8_NFDIFRE    	:= cNumCte
	SF8->F8_SEDIFRE   	:= cSerieCte
	SF8->F8_DTDIGIT  	:= dDatabase
	SF8->F8_TRANSP  	:= cFornece  //TRANSPORTADOR
	SF8->F8_LOJTRAN    	:= cLojaFor
	SF8->F8_FORNECE  	:= cClient
	SF8->F8_NFORIG  	:= nFOrig
	SF8->F8_SERORIG     := cSerOrig
	SF8->F8_LOJA		:= cLojaCli
	//SF8->F8_TPFRTE  	:= cFret
	//SF8->F8_TIPONF  	:="S"
	SF8->F8_ORIGEM  	:="IMPCTE"
	MSUNLOCK()
	
	_MsgInv := "Realizada a gravação das informações auxiliares na tabela SF8 do CTe:  "+cNumCte
	_msgX	+= _MsgInv+CHR(13)+CHR(10)
			//   _WriteLog(_MsgInv)
EndIf
*/

return


//Função para mover os arquivos.
User Function MoveArq()

//Mover os arquivos para pasta com nome da Fatura
if CPYT2S(_cPath+_aItems[nArqXml],_cDirFat,.T.)
	_MsgInv := "Arquivo:  "+_aItems[nArqXml]+" Copiado com sucesso para a pasta "+ _cDirFat
	_msgX	+= _MsgInv+CHR(13)+CHR(10)
			//   _WriteLog(_MsgInv)
else
	_MsgInv := "Não foi possivel copiar o Arquivo:  "+_aItems[nArqXml]+" para a pasta, "+ _cDirFat+"e o mesmo Não será apagado da pasta "+_cPath
	_msgX	+= _MsgInv+CHR(13)+CHR(10)
	_lCopi	:= .f.
	
			//   _WriteLog(_MsgInv)
endif
return(_lCopi)


//Função para mover os arquivos.
User Function DocOrig()
local nStatus := 0
Local _nI := 0

cCompFret	:= XmlChildEx(oXML:_CTEPROC:_CTE:_INFCTE:_VPREST, "_COMP")

/*msginfo("mensagem de alerta")*/
if cCompFret == nil
	aTipFrete	:= " "
else
	aTipFrete	:= (oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP)
endif

IF type('oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_VCARGA:TEXT')  <> 'U' // undefined
	nValCarga	:= val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_VCARGA:TEXT)
	aInfQ		:= (oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ)
ENDIF
//ApMsgInfo("Gravação realizada com sucesso do CTe "+cNumCte)
_MsgInv := "Gravação do CTe  "+cNumCte+"  realizada com sucesso."
_msgX	+= _MsgInv+CHR(13)+CHR(10)
//   _WriteLog(_MsgInv)

// Realiza a amarração do CTe as notas informadas no XML
if _cChDoc = "1"  //Pega o Numero da Nota pela Chave.
	if nTotItem = 1
		if (!type("aNfsCte:_CHAVE:TEXT,25,1") == 'U' .AND. !type("aNfsCte:_CHAVE:TEXT,26,9") == 'U')
			_aNfSaida[nTotItem][1]	:= substr(aNfsCte:_CHAVE:TEXT,23,3) //Serie da NF de Venda
			_aNfSaida[nTotItem][2]	:= substr(aNfsCte:_CHAVE:TEXT,26,9) //Numero da NF de Venda
		else
			MsgStop("O xml nao possui dados da nota fiscal de saida, por favor lancar CTE manualmente.","IMPCTE")
			lDadosSaidaCorreto := .F.
			// Renomeando um arquivo no Client de origem.txt para destino.txt , na pasta c:\Temp
			nStatus1 := frename('C:\CTE\'+_aItems[nArqXml] , 'C:\CTE\'+substr(_aItems[nArqXml],1,(len(_aItems[nArqXml])-4))+'.ERR')
			IF nStatus1 == -1
				MsgStop('Falha na operação 1 : FError '+str(ferror(),4))
			else
				MsgStop('Arquivo renomeado para '+'C:\CTE\'+substr(_aItems[nArqXml],1,(len(_aItems[nArqXml])-4))+'.ERR')
			Endif
			return
		endif
	else
		For _nI := 1 to nTotItem
			_aNfSaida[_nI][1]	:= substr(aNfsCte[_nI]:_CHAVE:TEXT,23,3) //Serie da NF de Venda
			_aNfSaida[_nI][2]	:= substr(aNfsCte[_nI]:_CHAVE:TEXT,26,9) //Numero da NF de Venda
		Next _nI
	endif
elseif _cChDoc = "2" //o Nodo do Objeto ja tras o numero da Nota e serie
	if nTotItem = 1
		//	_aNfSaida[nTotItem][1]	:= aNfsCte:_SERIE:TEXT+"  " //Serie da NF de Venda   TIROU PQ JM NUNES NÃƒO TEM SERIE     19/01/15
		_aNfSaida[nTotItem][2]	:=  PADL(aNfsCte:_NDOC:TEXT,9,"0") //Numero da NF de Venda
		//		_aNfSaida[nTotItem][2]	:= "0000"+aNfsCte:_NDOC:TEXT //Numero da NF de Venda
	else
		For _nI := 1 to nTotItem
			//_aNfSaida[_nI][1]	:= aNfsCte[_nI]:_SERIE:TEXT+"  " //Serie da NF de Venda
			_aNfSaida[_nI][2]	:= Padl(aNfsCte[_nI]:_NDOC:TEXT,9,"0") //Numero da NF de Venda
		Next _nI
	endif
Endif

if valtype(aTipFrete) = "A"
	_nValFrete 	:= val(oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP[1]:_VCOMP:TEXT)
	_cTipFrete		:= (oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP[1]:_XNOME:TEXT)
	
	For _nl := 1 to len(aTipFrete)
		_nValAtu	:= val(oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP[_nl]:_VCOMP:TEXT)
		if _nValFrete < _nValAtu
			_nValFrete 	:= _nValAtu
			_cTipFrete	:= (oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP[_nl]:_XNOME:TEXT)
		endif
	next _nl
elseif valtype(aTipFrete) = "C" .and. aTipFrete	== " "
	_nValFrete	:= val(oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_VREC:TEXT)
	_cTipFrete	:= "FRETE VALOR"
else
	_nValFrete	:= val(oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP:_VCOMP:TEXT)
	_cTipFrete	:= (oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_COMP:_XNOME:TEXT)
	
endif

if valtype(aInfQ) = "A"
	For _n := 1 to len(aInfQ)
		IF type('oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA')  <> 'U' // undefined
			
			if ("PESO") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
				if !("CUBADO") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
					_nPsCte := val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
				elseif ("CUBADO") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
					_nPsCBcte := val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
				endif
			elseif ("VOLUMES") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT .OR. ("VOLUME") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
				_nVolCTe := val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
			elseif ("CAIXAS") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT .OR. ("CAIXA") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
				_nVolCTe := val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
			elseif ("UNIDADE") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT .OR. ("UNIDADES") $ oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_TPMED:TEXT
				_nVolCTe := val(oXML:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFCARGA:_INFQ[_n]:_QCARGA:TEXT)
			endif
		ENDIF
	next _n
endif

_nPesoCte	:= iif(_nPsCBcte>_nPsCte,_nPsCBcte,_nPsCte)

if ("PESO") $ _cTipFrete .OR. ("Peso") $ _cTipFrete .OR. ("peso") $ _cTipFrete
	_cCombo := "FP"
elseif ("VALOR") $ _cTipFrete .or. ("Valor") $ _cTipFrete .or. ("valor") $ _cTipFrete
	_cCombo := "FV"
else
	_cCombo := "OU"
endif
return()


// função para validar se a transportadora já fez a cobrança da Nosta Fiscal.

User Function ValExist()

// Verificar se existe o Fornecedor Cadastrado
IF (cFornece+cLojaFor = " ")
	Alert("Não Existe Fornecedor cadastrador com este CNPJ: "+cCnpjFor)
	lRetVal := .F.
ENDIF

// Verificar se existe uma nota fiscal igual ao documento de origem do XML.
For _nI := 1 to len(_aNfSaida)
	
	DbSelectArea("SF2")
	DbSetOrder(1)
	
	If !DbSeek(xFilial("SF2")+Alltrim(_aNfSaida[_nI][2]))
		_MsgInv := "Não foi localizada a NF:  "+_aNfSaida[_nI][2]+" do CTe:  "+cNumCte+". Não foi realizada a amarração desta NF."
		_msgX	+= _MsgInv+CHR(13)+CHR(10)
		//   _WriteLog(_MsgInv)
		lLog := .t.
		lRetVal := .F.
	endif
Next _nI

//Validação para ver se existe CTE para o mesma Transportadora      ## Lucas Fiuza's / 15/04/2015
//F8_FILIAL+F8_TRANSP+F8_LOJTRAN+F8_NFORIG    - Indice 5
//Ajuste Indice 2 da Mococa F8_FILIAL+F8_NFORIG+F8_SERORIG+F8_FORNECE+F8_LOJA                                                                                                               
DbSelectArea("SF8")
DbSetOrder(2)
//IF DbSeek(xFilial("SF8") + cFornece + cLojaFor + SF2->F2_DOC)
IF DbSeek(xFilial("SF8") + SF2->F2_DOC + SF2->F2_SERIE + cFornece + cLojaFor )
	Alert("Existe um outro CTE : "+cNumCte+" , Incluso para a NF : "+SF2->F2_DOC+" , do Fornecedor : "+cFornece+" - "+Posicione("SA2",1,"    "+cFornece+cLojaFor,'A2_NOME'))
	lRetVal := .F. 
EndIF

// Validação para Não deixar incluir cobrança de frete FOB no sistema.
IF SF2->F2_TPFRETE == "F" .and. lFrete = .F.  
	Alert("Nota : "+SF2->F2_DOC+" esta com o CTE : "+cNumCte+" Destinado para o cliente pagar, tipo de Frete - FOB. Solicitar autorização para Diretoria com cópia ao departamento de Tecnologia da Informação ! ")
	lRetVal := .F.
ELSEIF SF2->F2_TPFRETE == "F" .and. lFrete = .T.
	Alert("Nota : "+SF2->F2_DOC+" esta com o CTE : "+cNumCte+" Destinado para o cliente pagar, tipo de Frete - FOB, com autorização de inclussão pela Diretoria parametro MV_XFRETE ! ")
ENDIF

Return lRetVal

static function fNotaFiscalSaida()
local lRet := .T.              
local cTipoFM := "70"

SD2->(DbSelectArea("SD2"))
SD2->(DbSetOrder(3))//D2_FILIAL, D2_DOC, D2_SERIE, D2_CLIENTE, D2_LOJA, D2_COD, D2_ITEM, R_E_C_N_O_, D_E_L_E_T_
If SD2->(DbSeek(ALLTRIM(xFilial("SD2")+ _aNfSaida[1][2]  + _aNfSaida[1][1] )))

	_Prod	 := "55010049"
	_DescProd := "FRETE VENDA"

	// começa aqui
	CHKFILE("SF1",.F.)
	CHKFILE("SD1",.F.)
	CHKFILE("SA2",.F.)
	DBSelectArea("SA2")
	DBSetOrder(1)
	If !DBSeek(xFilial("SA2") + cFornece + cLojaFor )
		msgbox("Fornecedor/Loja não encontrado " + cFornece + cLojaFor)
	EndIf
	
	CHKFILE("SB1",.F.)
	DBSelectArea("SB1")
	DBSetOrder(1)
	If !DBSeek(xFilial("SB1") + _prod )
		msgbox("Produto não encontrado " + _prod)
	EndIf
	
	RegToMemory( "SF1", .F., .F. ) //cria um registro do SC5 em memoria
	cSeek  := xFilial("SF1")+SF1->F1_DOC
	bWhile := {|| D1_FILIAL+D1_DOC }
	aNoFields := {"D1_DESEST"}
	//cria um registro de sc6 (aCols) para exeucao das rotinas customizadas de calculo de data de entrega, etc
	FillGetDados(3,"SD1",1,cSeek,bWhile,/*{{bCond,bAction1,bAction2}}*/,aNoFields,/*aYesFields*/,/*lOnlyYes*/,/*cQuery*/,/*bMontCols*/,.F.,/*aHeaderAux*/,/*aColsAux*/,/*{|| AfterCols(cArqQry) }*/,/*bBeforeCols*/,/*bAfterHeader*/,"SD1")
	
	n:= 1//variavel padrao da acols
	
	MaFisSave() // Garda Area Do MatXFIS()
	MaFisToCols({}/*aHeader*/,{}/*aCols*/,,"TMK271")
	MaFisClear()
	MaFisEnd()
	
	//inicializa funcoes fiscais
	aRelImp := MaFisRelImp("MT100",{"SF1","SD1"})
	
	//calcula os impostos envolvidos
	MaFisIni(SA2->A2_COD,SA2->A2_LOJA,"F","N",SA2->A2_TIPO,,,.T.,"SB1","MATA103",Nil,Nil,"")
	_cTES := MaTesInt(1,cTipoFM, cFornece,cLojaFor, "F", _Prod)
	DBSelectArea("SF4")
	DBSetOrder(1)
	If !DBSeek(xFilial("SF4") + _cTes )
		MSGBOX("TES não encontrado " + _cTes)
	EndIf
	
	//TERMINA AQUI
	
	//if SubStr(SD2->D2_CF,2,3) $ xCTECFOP//CFOP de venda
		//alterado Caique Mercadante Pega ICMS das TAGS do XML 
	if xFilial('SD2') <> ' ' .and. aVLCte <> nil // TAG ICMS00
		nPerIcm	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMS00:_PICMS:TEXT))
		nBaseIcm:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMS00:_VBC:TEXT))
		nValIcm	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMS00:_VICMS:TEXT))
		cFret   := "002"
		
		elseif xFilial('SD2') <> ' ' .and. aVLCte2 <> nil   // TAG ICMSOUTRAUF
		//Validação Danielda 15/02/19 - 
			 if ("90") $ oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMSOUTRAUF:_CST:TEXT .OR. ("40") $ oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMSOUTRAUF:_CST:TEXT
			 nPerIcm	:= 0
			 nBaseIcm:= 0
			 nValIcm	:= 0
			 cFret   := "002"
			 
			 else
			 nPerIcm	:= VAL ((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMSOUTRAUF:_PICMSOUTRAUF:TEXT))
			 nValIcm	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMSOUTRAUF:_VICMSOUTRAUF:TEXT))
			 nBaseIcm	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_IMP:_ICMS:_ICMSOUTRAUF:_VBCOUTRAUF:TEXT))
			 cFret   	:= "002" 
			 endif
	
		
		elseif xFilial('SD2') <> ' ' .and. aVLCte3 <> nil .or. aVLCte4 <> nil .or. aVLCte5 <> nil //TAG ICMSSN ou ICMS45 ou ICMS41
		nPerIcm	:= 0
		nBaseIcm:= 0
		nValIcm	:= 0
		cFret   := "002"
	else
		
		MsgAlert("CTE informado possui as TAGS de IMPOSTOS divergentes as configuradas. Comunicar Departamento de TI e verificar CTE lançado " + cNumCte)
	
	endif
else
	if(MSGYESNO( "Nota fiscal de saida: Serie:"+ _aNfSaida[1][1] +" Documento: "+ _aNfSaida[1][2] +" Não foi encontrada. Gostaria de inserir um novo documento?", "Erro NFS" ))
		if(fTelaNotaFiscalSaida())
			fNotaFiscalSaida()
		else
			return .F.
		endif
	else
		return .F.
	endif
endif
return lRet

static function fTelaNotaFiscalSaida()
Local oButton1
Local oButton2
Local oGet1
Local oGet2
Local oGroup1
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local cGet3 := cNumCte
Private cGet1 := "   "
Private cGet2 := "         "
Private lRet := .F.
Static oDlg

DEFINE MSDIALOG oDlg TITLE "New Dialog" FROM 000, 000  TO 300, 300 COLORS 0, 16777215 PIXEL

@ 000, 000 GROUP oGroup1 TO 150, 150 PROMPT "Tela NFS" OF oDlg COLOR 0, 16777215 PIXEL
@ 050, 005 SAY oSay1 PROMPT "Serie:" SIZE 025, 012 OF oDlg COLORS 0, 16777215 PIXEL
@ 050, 030 MSGET oGet1 VAR cGet1 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 065, 005 SAY oSay2 PROMPT "N. Doc" SIZE 025, 012 OF oDlg COLORS 0, 16777215 PIXEL
@ 065, 030 MSGET oGet2 VAR cGet2 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 028, 005 SAY oSay3 PROMPT "Insira os Dados:" SIZE 040, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 115, 015 BUTTON oButton1 PROMPT "Ok" SIZE 037, 012 OF oDlg ACTION oDlgFim(1) PIXEL
@ 115, 095 BUTTON oButton2 PROMPT "Cancelar" SIZE 037, 012 OF oDlg ACTION oDlgFim(2)  PIXEL
@ 015, 005 SAY oSay4 PROMPT "CTE:" SIZE 015, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 015, 020 MSGET oGet3 VAR cGet3 SIZE 060, 010 OF oDlg COLORS 0, 16777215 WHEN .F.  PIXEL

ACTIVATE MSDIALOG oDlg CENTERED
return lRet

static function oDlgFim(_lIni)

//Se ok
if(_lIni == 1)
	_aNfSaida[1][1] := PADL(alltrim(cGet1),3,"0")
	_aNfSaida[1][2] := PADL(alltrim(cGet2),9,"0")
	lRet := .T.
	oDlg:end()
endif
//Se cancelar
if(_lIni == 2)
	lRet := .F.
	oDlg:end()
endif
return



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ xInvAll  º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para inverter a marcacao de todos os registros.     º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ xProcessa().                                               º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function xInvAll(cMarca,oValor,oQtda)

Local nReg     := TRB->(Recno())
Local lMarcado := .F.

dbSelectArea("TRB")
dbGoTop()

While TRB->(!Eof())
	
	lMarcado := IsMark("E1_OK", cMarca, lInverte)
	If lMarcado .Or. lInverte
		RecLock("TRB", .F.)
		TRB->E1_OK := Space(2)
		MsUnLock()
		nQtdTit--
		nValor -= TRB->E1_SALDO
	Else
		RecLock("TRB", .F.)
		TRB->E1_OK := cMarca
		MsUnLock()
		nQtdTit++
		nValor += TRB->E1_SALDO
	EndIf
	
	nQtdTit:= Iif(nQtdTit<0,0,nQtdTit)
	nValor := Iif(nValor<0 ,0,nValor)
	
	TRB->(dbSkip())
EndDo

TRB->(dbGoto(nReg))

oValor:Refresh()
oQtda:Refresh()
oMark:oBrowse:Refresh(.T.)

Return Nil
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ xInvReg  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Rotina para inverter a marcacao do registro posicionado.   º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ xProcessa().                                               º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function xInvReg(cMarca,lInverte,oValor,oQtda)

Local lMarcado := IsMark("E1_OK",cMarca,lInverte)

If lMarcado
	nValor += TRB->E1_SALDO
	nQtdTit++
Else
	nValor -= TRB->E1_SALDO
	nQtdTit--
EndIf

oValor:Refresh()
oQtda:Refresh()

Return



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ CriaArq  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para criacao do arquivo temporario.                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CriaArq()

Local aEstru  := {}
Local cQuery  := ""

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Armazena no array aEstru a estrutura dos campos da tabela.      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AADD(aEstru,{"TRB_OK"       ,'C',02,0})
AADD(aEstru,{"TRB_FILIAL"   ,'C',04,0})
AADD(aEstru,{"TRB_SERCTE"   ,'C',03,0})
AADD(aEstru,{"TRB_NUMCTE"   ,'C',09,0})
AADD(aEstru,{"TRB_SERNF"    ,'C',03,0})
AADD(aEstru,{"TRB_NUMNF"    ,'C',09,0})
AADD(aEstru,{"TRB_VALOR"    ,'N',14,2})
AADD(aEstru,{"TRB_NOMEXML"  ,'C',50,0})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Armazena no array aCampos o nome, picture e descricao dos campos. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AADD( aCampos ,{"TRB_OK"      ,""," "           ," "})
AADD( aCampos ,{"TRB_FILIAL"  ,"","Filial"      ,"@!"})
AADD( aCampos ,{"TRB_SERCTE"  ,"","Ser. CTE"    ,"@!"})
AADD( aCampos ,{"TRB_NUMCTE"  ,"","Num. CTE"    ,"@!"})
AADD( aCampos ,{"TRB_SERNF"   ,"","Ser. NF"     ,"@!"})
AADD( aCampos ,{"TRB_NUMNF"   ,"","Num. NF"     ,"@!"})
AADD( aCampos ,{"TRB_VALOR"   ,"","Valor Frete" ,"@E 999.999,99"})
AADD( aCampos ,{"TRB_NOMEXML" ,"","Nome XML"    ,"@!"})

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria o arquivo fisicamente no diretorio "/StartPath/".                                    ³
//³ Se o 2o parametro dFwTemporaryTableab for .T. cria o arquivo, se .F. retorna um nome aleatorio.   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
cArqTRB1 := FwTemporaryTable(aEstru,.T.)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Verifica se ja existe um arquivo com mesmo nome, se sim deleta. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If Select("TRB") <> 0
	TRB->(dbCloseArea())
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Permite o uso do arquivo criado dentro do protheus.             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Use &cArqTRB1 Alias TRB NEW

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Cria os indices para o arquivo.                                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
//cFilter := "ALLTRIM(E1_PORTADO) == '' .Or. E1_PORTADO = '" + MV_PAR05 + "' "
//cFilter := "E1_PORTADO = '" + MV_PAR21 + "' "

//IndRegua("TRB",cArqTRB1,cIndTRB1,,cFilter,OemToAnsi("Selecionando Registros..."));dbClearIndex()
IndRegua("TRB",cArqTRB1,cIndTRB1,,,OemToAnsi("Selecionando Registros..."));dbClearIndex()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Agrega um arquivo de indice a um Alias ativo no sistema.        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("TRB")
dbSetIndex(cArqTRB1+OrdBagExt())

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Query para selecao dos dados.                                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

aDIR(_cPath+"*.XML",_aITENS)

// Processa todas as CTEs do Diretorio
For nArqXmltrb := 1 To Len(_aItems)
	
	lOkArquivo  := .f.
	aItemNe := {}
	
	// Capture o Nome do Arquivo em Formato XML
	cArqXmltrb := _cDirFat+_aItems[nArqXmltrb]
	
	cError   := ""
	cWarning := ""
	
	//Gera o Objeto XML
	oXml := XmlParserFile( cArqXmltrb, "_", @cError, @cWarning )
	
	// Verificacao se a leitura foi ok. -  0=OK, 1=Arquivo nao Encontrado, 2=Erro de Abertura, 3=Xml Invalido, -1= Erro no NOD
	nStatus := @cError

	If !empty(nStatus)
		MSGSTOP("O Arquivo: " + cArqXmltrb + " esta com Problemas.  ->  "+nStatus)
		incproc()
		Loop
	EndIf
	
	// Verificacao se O CTE e' para a empresa corrente
	
	cCnpjEmp := (oXML:_CTEPROC:_CTE:_INFCTE:_REM:_CNPJ:TEXT)     //// Conhecimento de Frete sobre as vendas
	DBSELECTAREA("SM0")
	SM0->(DBGOTOP())
	SM0->(DBSETORDER(3))
	IF DBSEEK("01"+cCnpjEmp)
	   cFilxml := SM0->M0_CODFIL
	EndIf

	cNumCte		:= Padl(oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_NCT:TEXT,9,"0")
	cSerieCte	:= Padl(oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_SERIE:TEXT,3,"0")
	dEmissao	:= STOD(STRTRAN((oXML:_CTEPROC:_CTE:_INFCTE:_IDE:_DHEMI:TEXT),"-",""))
	nValorUn	:= VAL((oXML:_CTEPROC:_CTE:_INFCTE:_VPREST:_VTPREST:TEXT))
	cChaveCte	:= (oXML:_CTEPROC:_PROTCTE:_INFPROT:_CHCTE:TEXT)
	IF type('oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC')  <> 'U' // undefined
		cNFChave	:= XmlChildEx(oXml:_CTEPROC:_CTE:_INFCTE:_INFCTENORM:_INFDOC, "_INFNFE")
	ENDIF

	cNumNF		:= substr(cNFChave:_CHAVE:TEXT,26,9)
	cSerieNF	:= substr(cNFChave:_CHAVE:TEXT,23,3)

	dbSelectArea("TRB")
	TRB->(dbGoTop())
	
	RecLock("TRB",.T.)
	TRB->E1_OK := cMarkado
	nQtdTit++
	nValor += nValorUn

	TRB_FILIAL  := cFilxml
	TRB_SERCTE  := cSerieCte
	TRB_NUMCTE  := cNumCte
	TRB_SERNF   := cSerieNF
	TRB_NUMNF   := cNumNF
	TRB_VALOR   := nValorUn
	TRB_NOMEXML := cChaveCte+".xml"
	
	MsUnlock("TRB")
	
Next nArqXmltrb

Return
