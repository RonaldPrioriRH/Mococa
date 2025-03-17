#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RWMAKE.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � RBRADES  � Autor � TOTVS              � Data �  12/11/10   ���
�������������������������������������������������������������������������͹��
���Descricao � Impressao de boleto Banco do Brasil e Bradesco.            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Contas a Receber - Financeiro.                             ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Dica      � Criar o campo EE_CARTEIR - C - 2 - Carteira.               ���
���          � Criar o parametro MV_TXJUR=0.05                            ���
���          � Preencher o campo EE_CODEMP com 6 digitos.                 ���
���          �                                                            ���
���          � Alteracao em 28/02/11.                                     ���
���          � Criar o campo A1_BOLETO - C - 1 - SIM ou NAO.              ���
���          � Criar o campo A1_BCO1 - Codigo do Banco Bradesco ou Brasil.���
���          � Definido que sempre que A1_BOLETO = SIM sera Bradesco e    ���
���          � impressao na empresa e A1_BOLETO = NAO sera Brasil e       ���
���          � impressao no banco.                                        ���
���          �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function RBOLETO()
//Conferir os parametros banc�rios devem estar com 11 digitos os campos abaixo 
//EE_FAXINI EE_FAXFIM
//EE_FAXATU EE_CODEMP

Local oPanel
Local oDlg1
Local oQtda
Local oValor
Local aMarked		:= {}
Local nHeight    	:= 0
Local nWidth     	:= 0
Local nOpca      	:= 0
Local aSize      	:= {}
Local aBotoes    	:= {}
Local aCoors     	:= {}
//Local lMaximized 	:= .T.

Private oMark
Private oBrowse
Private cMarkado  	:= GetMark()
Private lInverte  	:= .F.//Quando .F. traz desmarcado, qdo .T. traz tudo marcado
Private cPerg     	:= "RBRADES   "
Private cCadastro 	:= "Impressao dos boletos de cobranca bancaria."
Private nValor  	:= 0
Private nQtdTit 	:= 0
Private cIndTRB1  	:= "E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO"
Private cIndTRB2  	:= "E1_CLIENTE+E1_LOJA+E1_PREFIXO+E1_NUM"
Private cIndTRB3  	:= "E1_NOMCLI"
Private cIndTRB4  	:= "STR(E1_VALOR)"
Private lExec		:= .F.
Private cFilter		:= ''
Private _lReimprime	:= .F.
Private _lBcoCorr	:= .F. //Banco Correspondente
Private oFontLbl ; DEFINE FONT oFontLbl NAME "Arial" SIZE 6, 15 BOLD
Private aCampos    := {}
Private nRecTRB    := 0
Private nTxJur	   := 0 // analisar se possui juros? GetMV("MV_TXJUR")//Taxa de Juros considerada no Boleto.
Private nTxMora    := 0 // analisar se possui juros? GetMV("MV_TXJUR")//Taxa de Juros considerada no Boleto.

Private cRegiao    := ""

//������������������������������������������������������Ŀ
//� Faz o calculo automatico de dimensoes de objetos     �
//��������������������������������������������������������
aSize := MSADVSIZE()

//AjustaSX1(cPerg)
IF !Pergunte(cPerg)
	RETURN
ENDIF

//CriaSX1()
//If !Pergunte(cPerg,.T.)
//	Return()
//EndIf

MsgRun("Aguarde.... Selecionando Registros...",,{||CursorWait(), CriaArq(), CursorArrow()})

dbSelectArea("TRB")
TRB->(dbGoTop())

//���������������������������������������������������������������������
//� Cria a tela para selecao dos titulos.                             �
//���������������������������������������������������������������������
DEFINE MSDIALOG oDlg1 TITLE OemToAnsi("Impressao de boletos") From aSize[7],0 To aSize[6],aSize[5] OF oMainWnd PIXEL
//oDlg1:lMaximized

oPanel       := TPanel():New(0,0,'',oDlg1,, .T., .T.,, ,315,20,.T.,.T. )
oPanel:Align := CONTROL_ALIGN_TOP // Somente Interface MDI

@ 0.8 ,00.8 Say OemToAnsi("Valor Total:") OF oPanel
@ 0.8 ,0007 Say oValor VAR nValor Picture "@E 999,999,999.99" SIZE 60,8 OF oPanel
@ 0.8 ,0021 Say OemToAnsi("Quantidade:") OF oPanel
@ 0.8 ,0032 Say oQtda VAR nQtdTit Picture "@E 99999" SIZE 50,8 OF oPanel

If FlatMode()
	aCoors := GetScreenRes()
	nHeight	:= aCoors[2]
	nWidth	:= aCoors[1]
Else
	nHeight	:= 143
	nWidth	:= 315
EndIf

dbSelectArea("TRB")
TRB->(dbGoTop())

oMark := MsSelect():New("TRB","E1_OK","E1_SALDO<=0",aCampos,@lInverte,@cMarkado,{35,1,nHeight,nWidth},,,,,)
oMark:oBrowse:Align := CONTROL_ALIGN_ALLCLIENT
oMark:bMark := {|| xInvReg(cMarkado,lInverte,oValor,oQtda)}
oMark:oBrowse:bAllMark := { || xInvAll(cMarkado,oValor,oQtda) }
oMark:oBrowse:Refresh(.T.)

ACTIVATE MSDIALOG oDlg1 ON INIT (EnchoiceBar(oDlg1,{|| nOpca := 1,oDlg1:End(),lExec := .T. },{|| nOpca := 2,oDlg1:End()},,aBotoes),oMark:oBrowse:Refresh())

If nOpca <> 1
	Return
EndIf

dbSelectArea("TRB")
TRB->(dbGoTop())

While TRB->(!Eof())
	
	If Marked("E1_OK")
		AADD(aMarked,.T.)
	Else
		AADD(aMarked,.F.)
	EndIf
	
	TRB->(dbSkip())
EndDo

dbSelectArea("TRB")
TRB->(dbGoTop())

If lExec
	Processa({|lEnd|MontaRel(aMarked)})  //MONTA RELATORIO DOS MARCADOS
EndIf
dbSelectArea("TRB")

Return Nil

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MontaRel � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Impressao do rodape.                                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function MontaRel(aMarked)

Local oPrint
Local oDlg2
Local nI			:= 1
Local nVlrAbat		:= 0
Local cPortado      := ""
Local cAgencia      := ""
Local cConta        := ""
Local aDadosTit     := {}
Local aDadosBanco   := {}
Local aDatSacado    := {}
Local CB_RN_NN		:= {}
Local aBolText		:= {" ", MV_PAR16+" "+MV_PAR17,MV_PAR18}
Local aBitmap		:= {"\system\brasil.bmp","\system\bradesco.bmp"}  //Logo da empresa
Local aDadosEmp		:= {}
Local oGet1
Local dGet1 := dDataBase
Local oSay1
Local oSay2
//Local oSButton1
//Local oDlg3
Local nJuros := 0
//Local nTotAbImp := 0
Local cTitPai 		:= " "
local nValVBC := 0
local nValABT := 0

 
/*
*** Campo local de pagamento, mencionar: �Pag�vel preferencialmente na Rede Bradesco ou no Bradesco Expresso�.

*** Campo �Cedente� passa a ser denominado �Benefici�rio� e o mesmo dever� conter dados referente a RED, conforme abaixo.

�  Benefici�rio: RED S.A � CNPJ 67.915.785/0001-01 � Av. Cidade Jardim 400 -14� and. S�o Paulo/SP

*** Campo �Ag�ncia/C�digo Cedente� passa a ser denominado � Ag�ncia/C�digo Benefici�rio�.

*** Campo �Sacado� passa a ser denominado �Pagador� e o mesmo dever� conter informa��es pertinentes ao mesmo.

*** Campo �Sacador/avalista� dever� conter dados referente � MOCOCA S/A .

 Invista Cr�dito e Investimento S/A CNPJ: 12.049.737/0001-88 Rua Tabapu�, 81 CEP.: 045.33-010 S�o Paulo/ SP.

*/

IF MV_PAR05 = "990"
	aDadosEmp := {"RED S.A",;												//Nome da Empresa
	"Av. Cidade Jardim 400 -14� and.",; 								    //Endereco
	"S�o Paulo/SP ",;														//Complemento
	"CEP: 00000-000",;													    //CEP
	"PABX/FAX: ",;															//Telefones
	"CNPJ: 67.915.785/0001-01",;												//CGC
	"I.E.: " }																//I.E
	
ELSEIF MV_PAR05 = "987"
	aDadosEmp := {"Invista Cr�dito e Investimento S/A",;					//Nome da Empresa
	"Rua Tabapu�, 81",; 												    //Endereco
	"S�o Paulo/SP ",;														//Complemento
	"CEP: 04533-010",;													    //CEP
	"PABX/FAX: ",;															//Telefones
	"CNPJ: 12.049.737/0001-88",;												//CGC
	"I.E.: " }																//I.E

ELSE
	
	aDadosEmp := {ALLTRIM(SM0->M0_NOMECOM),;								//Nome da Empresa
	ALLTRIM(SM0->M0_ENDCOB),; 													    //Endereco
	ALLTRIM(SM0->M0_BAIRCOB)+", "+ALLTRIM(SM0->M0_CIDCOB)+", "+SM0->M0_ESTCOB ,;	//Complemento
	"CEP: "+SubStr(SM0->M0_CEPCOB,1,5)+"-"+SubStr(SM0->M0_CEPCOB,6,3),;				    //CEP
	"PABX/FAX: "+SM0->M0_TEL,;														//Telefones
	"CNPJ: "+SubStr(SM0->M0_CGC,1,2)+"."+SubStr(SM0->M0_CGC,3,3)+"."+ ;
	SubStr(SM0->M0_CGC,6,3)+"/"+SubStr(SM0->M0_CGC,9,4)+"-"+ ;
	SubStr(SM0->M0_CGC,13,2),;														//CGC
	"I.E.: "+SubStr(SM0->M0_INSC,1,3)+"."+SubStr(SM0->M0_INSC,4,3)+"."+ ;
	SubStr(SM0->M0_INSC,7,3)+"."+SubStr(SM0->M0_INSC,10,3) }							//I.E
	
ENDIF

oPrint := TMSPrinter():New( "Boleto Laser" )	//INSTANCIA O OBJETO
oPrint:SetPortrait() 							// ou SetLandscape()
oPrint:StartPage()								// Inicia uma nova pagina

dbSelectArea("TRB")
TRB->(dbGoTop())
ProcRegua(nRecTRB)

While TRB->(!Eof())
	
	If !Empty(TRB->E1_OK)
		
		cPortado := Iif(Empty(MV_PAR21),MV_PAR05 , TRB->E1_PORTADO)
		cAgencia := Iif(Empty(MV_PAR21),MV_PAR06 , TRB->E1_AGEDEP)
		cConta   := Iif(Empty(MV_PAR21),MV_PAR07 , TRB->E1_CONTA)
		
		dbSelectArea("SA6")        //Posiciona o SA6 (Bancos)
		dbSetOrder(1)
		dbSeek(xFILIAL("SA6")+cPortado+cAgencia+cConta)
		
		dbSelectArea("SA1")        //Posiciona o SA1 (Cliente)
		dbSetOrder(1)
		dbSeek(xFILIAL("SA1")+TRB->E1_CLIENTE+TRB->E1_LOJA)
		
		//Posiciona o SEE (Parametros banco)
		dbSelectArea("SEE")
		dbSetOrder(1)
		If !dbSeek(xFILIAL("SEE")+cPortado+cAgencia+cConta)
			MsgStop("Banco : "+TRB->E1_PORTADO + " Agencia : " + TRB->E1_AGEDEP + " Conta : " + TRB->E1_CONTA +" N�o encontrado. Verifique os par�metros informados.","Aten��o")
			Return()
		EndIf
		
		//Posiciona o SE1 (Contas a Receber) - TEMPORARIO
		dbSelectArea("TRB")
		
		If !Empty(ALLTRIM(TRB->E1_NUMBCO))//OPCAO PARA USUARIO ESCOLHER SE IMPRIME OUTRO BOLETO COM O MESMAS INFORMACOES OU GERA UM NOVO NOSSO NUMERO
			
			//Atualiza com a data de vencimento atualmente utilizada no SE1
			dGet1 := TRB->E1_VENCTO
			
			DEFINE MSDIALOG oDlg2 TITLE "Opcao de Impressao" FROM 000, 000  TO 250, 290 COLORS 0, 16777215 PIXEL
			@ 009, 004 SAY oSay3 PROMPT "Boleto ja impresso: "+TRB->E1_NUMBCO SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 021, 004 SAY oSay4 PROMPT "Selecione uma opcao: " SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 032, 004 SAY oSay5 PROMPT "Atencao: Se opcao selecionada for Imprimir Novo Boleto," SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 044, 004 SAY oSay6 PROMPT "o mesmo devera ser entregue ao cliente." SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 065, 004 SAY oSay1 PROMPT "Informe uma data superior a esta, que serao" SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 076, 008 SAY oSay2 PROMPT "calculados juros por dia de atraso.        " SIZE 135, 007 OF oDlg2 COLORS 0, 16777215 PIXEL
			@ 089, 029 MSGET oGet1 VAR dGet1 SIZE 060, 010 OF oDlg2 COLORS 0, 16777215 PIXEL VALID dGet1 >= TRB->E1_VENCTO
			@ 107, 004 BUTTON oButton1 PROMPT "Reimprimir Boleto"    SIZE 045, 012 OF oDlg2 PIXEL ACTION (_lReimprime := .T. ,oDlg2:End())
			@ 107, 078 BUTTON oButton2 PROMPT "Imprimir Novo Boleto" SIZE 050, 012 OF oDlg2 PIXEL ACTION (_lReimprime := .F. ,oDlg2:End())
			
			ACTIVATE MSDIALOG oDlg2 CENTERED
		EndIf
		
		// RED
		IF MV_PAR05 = '990'
			dbSelectArea("TRB")
			aDadosBanco := {;
			"237",;		                                                                                   //Codigo do Banco
			"BANCO BRADESCO SA" ,;					                                       //Nome do Banco
			"3391-0",;//Agencia
			"6288",;   			   //Conta Corrente
			"P",;  		   //Digito da conta corrente
			"09",;     		                                                                   //Carteira
			0}                                                                                                     //Variacao
			nTxJur	   := GetMV("MV_JRS990") //Taxa de Juros considerada no Boleto.
			nTxMora    := GetMV("MV_mora990")//Taxa de Mora considerada no Boleto.
			
			// INVISTA
		ELSEIF MV_PAR05 = '987'
			dbSelectArea("TRB")
			aDadosBanco := {;
			"237",;		                                                                                   //Codigo do Banco
			"BANCO BRADESCO SA" ,;					                                       //Nome do Banco
			"3381-2",;//Agencia    "3381-0" Agencia ANTIGO
			"5197",;   			   //Conta Corrente
			"7",;  		   //Digito da conta corrente
			"09",;     		                                                                   //Carteira
			0}                                                                                                     //Variacao
			nTxJur	   := GetMV("MV_JRS987") //Taxa de Juros considerada no Boleto.
			nTxMora    := GetMV("MV_mora987")//Taxa de Mora considerada no Boleto.
			
			// OPNIAO
		ELSEIF MV_PAR05 = '997'
			dbSelectArea("TRB")
			aDadosBanco := {;
			"237",;		                                                                                   //Codigo do Banco
			"BANCO BRADESCO SA" ,;					                                       //Nome do Banco
			"3391-0",;//Agencia
			"3098",;   			   //Conta Corrente
			"8",;  		   //Digito da conta corrente
			"09",;     		                                                                   //Carteira
			0}                                                                                                     //Variacao
			nTxJur	   := GetMV("MV_JRS997") //Taxa de Juros considerada no Boleto.
			nTxMora    := GetMV("MV_mora997")//Taxa de Mora considerada no Boleto.
			
		ELSE
			dbSelectArea("TRB")
			aDadosBanco := {;
			SA6->A6_COD,;		                                                                                   //Codigo do Banco
			LEFT(SA6->A6_NOME,AT("-",SA6->A6_NOME)-1) ,;					                                       //Nome do Banco
			Iif(SA6->A6_COD=="479",StrZero(Val(ALLTRIM(SEE->EE_AGBOSTO)),7),Agencia(SA6->A6_COD,SA6->A6_AGENCIA)),;//Agencia
			Iif(SA6->A6_COD=="479",ALLTRIM(SEE->EE_CODEMP), Conta(SA6->A6_COD,SA6->A6_NUMCON)) ,;   			   //Conta Corrente
			Iif(SA6->A6_COD=="479","",SubStr(ALLTRIM(SA6->A6_NUMCON),Len(ALLTRIM(SA6->A6_NUMCON)),1))  ,;  		   //Digito da conta corrente
			ALLTRIM(SEE->EE_CODCART),;     		                                                                   //Carteira
			0}                                                                                                     //Variacao
			nTxJur	   := 0 //GetMV("MV_JRS990") //Taxa de Juros considerada no Boleto.
			nTxMora    := 0 //GetMV("MV_mora990")//Taxa de Mora considerada no Boleto.
			
		ENDIF
		
		aDatSacado := {;
		ALLTRIM(SA1->A1_NOME)		                 ,; //Razao Social
		ALLTRIM(SA1->A1_COD )                      	 ,; //Codigo
		ALLTRIM(SA1->A1_ENDCOB )+"-"+SA1->A1_BAIRROC ,; //Endereco
		ALLTRIM(SA1->A1_MUNC )                       ,; //Cidade
		SA1->A1_ESTC                                 ,; //Estado
		SA1->A1_CEPC                                 ,; //CEP
		SA1->A1_CGC                                  }  //CGC
		
		//VALOR DOS TITULOS TIPO "AB-"
		//		nVlrAbat := SomaAbat(TRB->E1_PREFIXO,TRB->E1_NUM,TRB->E1_PARCELA,"R",1,,TRB->E1_CLIENTE,TRB->E1_LOJA)
		//		nVlrAbat := SumAbatRec(TRB->E1_PREFIXO,TRB->E1_NUM,TRB->E1_PARCELA,1,"S",dDataBase,@nTotAbImp)
		
		cTitPai := TRB->(E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO+E1_CLIENTE+E1_LOJA)
		
		cQuery := "SELECT SUM(E1_SALDO) AS SALDOABAT"
		cQuery += " FROM "+RetSqlName("SE1")
		cQuery += " WHERE D_E_L_E_T_ = ' ' "
		cQuery += " AND E1_TITPAI  = '"+ cTitPai + "'"
		
		If Select("TMPABAT") > 0
			TMPABAT->(DbCloseArea())
		Endif
		TcQuery cQuery New Alias "TMPABAT"
		
		nVlrAbat := 0
		
		IF TMPABAT->SALDOABAT > 0
			nVlrAbat := TMPABAT->SALDOABAT
			dbSelectArea("TMPABAT")
			dbCloseArea()
		ENDIF
		
		// TEXTO DO ABATIMENTO
		nValVBC := 0
		nValABT := 0
		
		cQuery := "SELECT E1_TIPO, E1_SALDO "
		cQuery += " FROM "+RetSqlName("SE1")
		cQuery += " WHERE D_E_L_E_T_ = ' ' "
		cQuery += " AND E1_TITPAI  = '"+ cTitPai + "'"
		
		If Select("TMPABAT") > 0
			TMPABAT->(DbCloseArea())
		Endif
		TcQuery cQuery New Alias "TMPABAT"
		
		WHILE !EOF()
			IF TMPABAT->E1_TIPO = "VB-"
				nValVBC := nValVBC + TMPABAT->E1_SALDO
			ELSEIF TMPABAT->E1_TIPO = "AB-"
				nValABT := nValAbt + TMPABAT->E1_SALDO
			ENDIF
			DBSKIP()
		ENDDO
		
		dbSelectArea("TMPABAT")
		dbCloseArea()

		aBolText[1]:= " "  // REINICIO ESSA VARI�VEL DE IMPRESS�O

		IF nValVBC > 0
			aBolText[1]:= "Desconto Verba Comercial R$ "+alltrim(str(nValVBC,10,2))//original 7,2
		ENDIF
		IF nValABT > 0
			IF nValVBC > 0
				aBolText[1] := aBolText[1] +"   /   Desconto de Contrato R$ "+alltrim(str(nValABT,10,2))//original 7,2
			ELSE
				aBolText[1] := aBolText[1] +"Desconto de Contrato R$ "+alltrim(str(nValABT,10,2))//original 7,2
			ENDIF
		ENDIF
		
		If _lReimprime//Se Reimprime
			
			//Calcula os juros por dia de atraso
			If Empty(dGet1)
				nJuros := 0
			Else
				nJuros := (dGet1 - TRB->E1_VENCTO) * (ROUND( (TRB->E1_SALDO - nVlrAbat) * nTxJur/30 ,2))
			EndIf

//			ALLTRIM(TRB->E1_NUM)+ALLTRIM(TRB->E1_PARCELA),;//06-NRO DOCUMENTO OU NUMERO + PARCELA DO TITULO
			
			CB_RN_NN := Ret_cBarra(;
			SubStr(aDadosBanco[1],1,3),;                   //01-BANCO
			SubStr(aDadosBanco[3],1,4),;                   //02-AGENCIA
			aDadosBanco[4],;                               //03-CONTA
			aDadosBanco[5],;                               //04-DIGITO DA CONTA
			aDadosBanco[6],;                               //05-CARTEIRA
			u_Cnab_4(),;								   //06-NRO DOCUMENTO OU NUMERO + PARCELA DO TITULO
			(TRB->E1_SALDO+nJuros-nVlrAbat),;              //07-VALOR
			Iif(Empty(dGet1),TRB->E1_VENCTO,dGet1),;       //08-VENCIMENTO
			SEE->EE_CODEMP,;                               //09-CONVENIO
			Iif(SA6->A6_COD="001",SubStr(TRB->E1_NUMBCO,7,5),SubStr(TRB->E1_NUMBCO,4,8)),;//10-SEQUENCIAL
			Iif(TRB->E1_DECRESC > 0,.T.,.F.),;             //11-DESCONTO .T. OU .F.
			TRB->E1_PARCELA)                               //12-PARCELA

// 			Iif(ALLTRIM(TRB->E1_PARCELA) <> '',ALLTRIM(TRB->E1_NUM)+"-"+ALLTRIM(TRB->E1_PARCELA),ALLTRIM(TRB->E1_NUM)),;  //1-N�mero do titulo			
			aDadosTit :=  {;
			u_Cnab_4()								,;  //1-N�mero do titulo
			TRB->E1_EMISSAO							,;  //2-Data da emissao do titulo
			Date()									,;  //3-Data da emissao do boleto
			Iif(Empty(dGet1),TRB->E1_VENCTO,dGet1)  ,;  //4-Data do vencimento
			(TRB->E1_SALDO)						    ,;  //5-Valor do titulo
			ALLTRIM(CB_RN_NN[3])                    ,;  //6-Nosso numero (Ver formula para calculo)
			TRB->E1_DESCFIN+nVlrAbat				,;  //7-VAlor do Desconto do titulo
			nJuros                                  ,;  //8-Valor dos juros do titulo
			0                                       ,;  //9-Valor Acrescimo
			Iif( Empty(ALLTRIM(TRB->E1_NUMBOR)), " ", "Nro. Bordero : "+TRB->E1_NUMBOR ),; // 10-Numero do bordero
			0 } // 11-Desconto: Valor fixo ate data DD/MM/YY
		Else
			CB_RN_NN := Ret_cBarra(;
			SubStr(aDadosBanco[1],1,3),;                   //01-BANCO
			SubStr(aDadosBanco[3],1,4),;                   //02-AGENCIA
			aDadosBanco[4],;                               //03-CONTA
			aDadosBanco[5],;                               //04-DIGITO DA CONTA
			aDadosBanco[6],;                               //05-CARTEIRA
			u_Cnab_4(),;				 				   //06-NRO DOCUMENTO OU NUMERO + PARCELA DO TITULO
			(TRB->E1_SALDO-nVlrAbat),;                     //07-VALOR
			TRB->E1_VENCTO,;                               //08-VENCIMENTO
			SEE->EE_CODEMP,;                               //09-CONVENIO
			SEE->EE_FAXATU,;                               //10-SEQUENCIAL
			Iif(TRB->E1_DECRESC > 0,.T.,.F.),;             //11-DESCONTO .T. OU .F.
			TRB->E1_PARCELA)                               //12-PARCELA
			
			aDadosTit :=  {;
			u_Cnab_4()								,;  //1-N�mero do titulo
			TRB->E1_EMISSAO							,;  //2-Data da emissao do titulo
			Date()									,;  //3-Data da emissao do boleto
			TRB->E1_VENCTO							,;  //4-Data do vencimento
			(TRB->E1_SALDO)							,;  //5-Valor do titulo
			ALLTRIM(CB_RN_NN[3])                    ,;  //6-Nosso numero (Ver formula para calculo)
			TRB->E1_DESCFIN + nVlrAbat				,;  //7-VAlor do Desconto do titulo
			0                                       ,;  //8-Valor dos juros do titulo
			0                                       ,;  //9-Valor Acrescimo
			Iif( Empty(ALLTRIM(TRB->E1_NUMBOR)), " ", "Nro. Bordero : "+TRB->E1_NUMBOR ),; // 10-Numero do bordero
			0 } // 11-Desconto: Valor fixo ate data DD/MM/YY
		EndIf
		
		//Posiciona no Contas a Receber para pegar o vendedor 1
		dbSelectArea("SE1")
		dbSetOrder(1)
		If dbSeek(TRB->E1_FILIAL+TRB->E1_PREFIXO+TRB->E1_NUM+TRB->E1_PARCELA+TRB->E1_TIPO)
			
			//Posiciona no vendedor pra buscar a regional
			dbSelectArea("SA3")
			dbSetOrder(1)
			If dbSeek(xFILIAL("SA3")+SE1->E1_VEND1)
				cRegiao := ALLTRIM(SA3->A3_REGIAO)
			EndIf
		EndIf
		
		//MONTAGEM DO BOLETO
		Impress(oPrint,aBitmap,aDadosEmp,aDadosTit,aDadosBanco,aDatSacado,aBolText,CB_RN_NN)
		If !_lReimprime   //SE OPCAO REIPRESSAO FOR VERDADEIRA SERA MONTADO O BOLETO SEM GERAR UM NOVO NUMERO
			
			Begin Transaction
			dbSelectArea("SEE")
			dbSetOrder(1)
			RecLock("SEE",.F.)
			SEE->EE_FAXATU := StrZero(Val(SEE->EE_FAXATU) + 1,11)  //INCREMENTA P/ TODOS OS BANCOS
			MsUnlock()
			
			dbSelectArea("SE1")
			dbSetOrder(1)
			IF dbSeek(TRB->E1_FILIAL+TRB->E1_PREFIXO+TRB->E1_NUM+TRB->E1_PARCELA+TRB->E1_TIPO)
				RecLock("SE1",.F.)
				//ajuste para gravar o digito verificador no NUMBCO
				SE1->E1_NUMBCO := Substr(StrTran(StrTran(CB_RN_NN[3],"/",""),"-",""),3,12)//GRAVA NOSSO NUMERO NO TITULO SEM A CARTEIRA
				//SE1->E1_NUMBCO := Substr(StrTran(StrTran(CB_RN_NN[3],"/",""),"-",""),3,11)//GRAVA NOSSO NUMERO NO TITULO SEM A CARTEIRA
	  
	            IF EMPTY(MV_PAR21)
					SE1->E1_PORTADO	:= MV_PAR05 
					SE1->E1_AGEDEP  := MV_PAR06 
					SE1->E1_CONTA   := MV_PAR07 
	            ENDIF 
				MsUnlock()
            ELSE
                MSGBOX("Registro n�o encontrado (SE1) => "+TRB->E1_PREFIXO+TRB->E1_NUM+TRB->E1_PARCELA+TRB->E1_TIPO)
            ENDIF
			End Transaction
		EndIf
		
	EndIf//TRB->E1_OK
	
	_lReimprime := .F.
	TRB->(dbSkip())
	IncProc()
	nI++
EndDo
//FIM DA PARTE QUE GERA O NUMERO DO BORDERO

oPrint:EndPage()     // Finaliza a pagina
oPrint:Preview()     // Visualiza antes de imprimir

Return nil

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Impress  � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Impressao do corpo do boleto.                              ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Impress(oPrint,aBitmap,aDadosEmp,aDadosTit,aDadosBanco,aDatSacado,aBolText,CB_RN_NN)

Local oFont8
Local oFont10
Local oFont14
Local oFont16
Local oFont16n
Local oFont20
Local oFont24
Local oBrush  //Fundo no valor do titulo
//Local aCoords1 := {150,1900,250,2300}   // FICHA DO SACADO//
//Local aCoords2 := {420,1900,490,2300}   // FICHA DO SACADO
//Local aCoords3 := {1270,1900,1370,2300} // FICHA DO CAIXA
//Local aCoords4 := {1540,1900,1610,2300} // FICHA DO CAIXA
//Local aCoords5 := {2390,1900,2490,2300} // FICHA DE COMPENSACAO
//Local aCoords6 := {2660,1900,2730,2300} // FICHA DE COMPENSACAO
Local nI       := 0

Local nLin1    := 600    //Linha que define os dados do Recibo do Sacado
Local nLinBar1 := 14.5   //Linha do codigo de barras no Recibo do Sacado
Local nColBar1 := 1.2    //Coluna do codigo de barras no Recibo do Sacado
Local nComBar1 := 0.0253 //Comprimento do codigo de barras no Recibo do Sacado
Local nAltBar1 := 1.0    //Altura do codigo de barras no Recibo do Sacado

Local nLin2    := 1930   //Linha que define os dados da Ficha de Compensacao
Local nLinBar2 := 25.2   //Linha do codigo de barras na Ficha de Compensacao
Local nColBar2 := 1.2    //Coluna do codigo de barras na Ficha de Compensacao
Local nComBar2 := 0.0253 //Comprimento do codigo de barras na Ficha de Compensacao
Local nAltBar2 := 1.3    //Altura do codigo de barras na Ficha de Compensacao

//Parametros de TFont.New()
//1.Nome da Fonte (Windows)
//3.Tamanho em Pixels
//5.Bold (T/F)
oFont8  := TFont():New("Arial",9,8 ,.T.,.F.,5,.T.,5,.T.,.F.)
oFont10 := TFont():New("Arial",9,10,.T.,.T.,5,.T.,5,.T.,.F.)
oFont12 := TFont():New("Arial",9,12,.T.,.T.,5,.T.,5,.T.,.F.)
oFont14	:= TFont():New("Arial",9,14,.T.,.T.,5,.T.,5,.T.,.F.)
oFont14n:= TFont():New("Arial",9,13,.T.,.F.,5,.T.,5,.T.,.F.)
oFont16 := TFont():New("Arial",9,16,.T.,.T.,5,.T.,5,.T.,.F.)
oFont16n:= TFont():New("Arial",9,16,.T.,.F.,5,.T.,5,.T.,.F.)
oFont20 := TFont():New("Arial",9,20,.T.,.T.,5,.T.,5,.T.,.F.)
oFont24 := TFont():New("Arial",9,24,.T.,.T.,5,.T.,5,.T.,.F.)

//oBrush := TBrush():New("",4)
//oBrush := TBrush():New(,CLR_BLUE,,)
oBrush := TBrush():New(,,,)

oPrint:StartPage()   // Inicia uma nova pagina

oPrint:Line (150,100,150,2300)

//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                   INICIO - Comprovante de Entrega.                                                       �
//����������������������������������������������������������������������������������������������������������������������������
oPrint:Say  (84,1850,"Comprovante de Entrega"                              ,oFont10)

oPrint:Line (250,100,250,1300 )
oPrint:Line (350,100,350,1300 )
oPrint:Line (420,100,420,2300 )
oPrint:Line (490,100,490,2300 )
oPrint:Say  (510,100,"Codigo Baixa"                                   ,oFont8)
oPrint:Say  (510,350,aDadosTit[1]                                     ,oFont8)

oPrint:Say  (510,950,aDadosTit[10]                                     ,oFont8)//Nro Bordero

oPrint:Line (350,400,420,400)
oPrint:Line (420,500,490,500)
oPrint:Line (350,625,420,625)
oPrint:Line (350,750,420,750)

oPrint:Line (150,1300,490,1300 )
oPrint:Line (150,2300,490,2300 )
oPrint:Say  (150,1310 ,"MOTIVOS DE N�O ENTREGA (para uso do entregador)"                             ,oFont8)
oPrint:Say  (200,1310 ,"|   | Mudou-se"                             ,oFont8)
oPrint:Say  (270,1310 ,"|   | Recusado"                             ,oFont8)
oPrint:Say  (340,1310 ,"|   | Desconhecido"                         ,oFont8)

oPrint:Say  (200,1580 ,"|   | Ausente"                             ,oFont8)
oPrint:Say  (270,1580 ,"|   | N�o Procurado"                             ,oFont8)
oPrint:Say  (340,1580 ,"|   | Endere�o insuficiente"                             ,oFont8)

oPrint:Say  (200,1930 ,"|   | N�o existe o N�mero"                             ,oFont8)
oPrint:Say  (270,1930 ,"|   | Falecido"                             ,oFont8)
oPrint:Say  (340,1930 ,"|   | Outros(anotar no verso)"                             ,oFont8)

oPrint:Say  (420,1310 ,"Recebi(emos) o bloqueto"                             ,oFont8)
oPrint:Say  (450,1310 ,"com os dados ao lado."                             ,oFont8)
oPrint:Line (420,1700,490,1700)
oPrint:Say  (420,1705 ,"Data"                             ,oFont8)
oPrint:Line (420,1900,490,1900)
oPrint:Say  (420,1905 ,"Assinatura"                             ,oFont8)


IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  (150,100 ,"Benefici�rio"                             ,oFont8)
ELSE
	oPrint:Say  (150,100 ,"Cedente"                             ,oFont8)
ENDIF	
oPrint:Say  (190,100 ,Iif(_lBcoCorr,aDadosBanco[8],aDadosEmp[1]+" - "+aDadosEmp[6])   ,oFont10)

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  (250,100 ,"Pagador"                              ,oFont8)
ELSE
	oPrint:Say  (250,100 ,"Sacado"                              ,oFont8)
ENDIF	
oPrint:Say  (290,100 ,aDatSacado[1]+" ("+aDatSacado[2]+")"  ,oFont10)

oPrint:Say  (350,100 ,"Data do Vencimento"                              ,oFont8)
If aDadosBanco[1] $ "341,237"  //SE ITAU,BRADESCO
	oPrint:Say  (380,100 ,SubStr(DTOS(aDadosTit[4]),7,2)+"/"+SubStr(DTOS(aDadosTit[4]),5,2)+"/"+SubStr(DTOS(aDadosTit[4]),1,4)  ,oFont10)
Else
	oPrint:Say  (380,100 ,DTOC(aDadosTit[4])                               ,oFont10)
EndIf

oPrint:Say  (350,405 ,"Nro.Documento"                                  ,oFont8)
oPrint:Say  (380,410 ,aDadosTit[1]                                     ,oFont10)
//450
oPrint:Say  (350,630,"Moeda"                                   ,oFont8)
oPrint:Say  (380,660,"R$"     				                            ,oFont10)
//655
oPrint:Say  (350,755,"Valor/Quantidade"                               ,oFont8)
oPrint:Say  (380,765,ALLTRIM(Transform((aDadosTit[5]+aDadosTit[8]-aDadosTit[7]),"@E 999,999,999.99")),oFont10)

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  (420,100 ,"Agencia/Cod. Benefici�rio"                           ,oFont8)
ELSE
	oPrint:Say  (420,100 ,"Agencia/Cod. Cedente"                           ,oFont8)
ENDIF	
oPrint:Say  (450,100,aDadosBanco[3]+"/"+aDadosBanco[4]+Iif(!Empty(aDadosBanco[5]),"-"+aDadosBanco[5],""),oFont10)

oPrint:Say  (420,505,"Nosso N�mero"                                   ,oFont8)
oPrint:Say  (450,520,aDadosTit[6]                                     ,oFont10)   //450,520
//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                   FIM - Comprovante de Entrega.                                                          �
//����������������������������������������������������������������������������������������������������������������������������







//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                   INICIO - Ficha do Sacado.                                                              �
//����������������������������������������������������������������������������������������������������������������������������
For nI := 100 To 2300 Step 50
	oPrint:Line( nLin1, nI, nLin1, nI+30)
Next nI

nLin1 += 190

oPrint:Line (nLin1,100,nLin1,2300)
oPrint:Line (nLin1,650,(nLin1-100),650 )
oPrint:Line (nLin1,900,(nLin1-100),900 )

If aDadosBanco[1] == "389"
	oPrint:Say  (84,100,aDadosBanco[2],oFont10 )
ElseIf aDadosBanco[1] == "001"
	oPrint:SayBitMap(nLin1 - 105 ,110,aBitMap[1],450,100)
ElseIf aDadosBanco[1] == "237"
	oPrint:SayBitMap(nLin1 - 105 ,110,aBitMap[2],450,100)
Else
	oPrint:Say  (84,100,aDadosBanco[2],oFont12 )
EndIf

oPrint:Say  ((nLin1 - 88),680,aDadosBanco[1]+"-"+Modulo11(aDadosBanco[1],aDadosBanco[1]),oFont20 )//Codigo do banco
oPrint:Say  ((nLin1 - 66),920,CB_RN_NN[2],oFont14n)   //LINHA DIGITAVEL // (nLin1 - 66)  = 1204

oPrint:Line ((nLin1 + 100),100,(nLin1 + 100),2300 )  // (nLin1 + 100)  = 1370
oPrint:Line ((nLin1 + 200),100,(nLin1 + 200),2300 )  // (nLin1 + 200)  = 1470
oPrint:Line ((nLin1 + 270),100,(nLin1 + 270),2300 )  // (nLin1 + 270)  = 1540
oPrint:Line ((nLin1 + 340),100,(nLin1 + 340),2300 )  // (nLin1 + 340)  = 1610

oPrint:Line ((nLin1 + 200), 500,(nLin1 + 340), 500)  // (nLin1 + 200)  = 1470 , (nLin1 + 340)  = 1610
oPrint:Line ((nLin1 + 270), 750,(nLin1 + 340), 750)  // (nLin1 + 270)  = 1540 , (nLin1 + 340)  = 1610
oPrint:Line ((nLin1 + 200),1000,(nLin1 + 340),1000)  // (nLin1 + 200)  = 1470 , (nLin1 + 340)  = 1610
oPrint:Line ((nLin1 + 200),1350,(nLin1 + 270),1350)  // (nLin1 + 200)  = 1470 , (nLin1 + 270)  = 1540
oPrint:Line ((nLin1 + 200),1550,(nLin1 + 340),1550)  // (nLin1 + 200)  = 1470 , (nLin1 + 340)  = 1610

oPrint:Say  (nLin1,100 ,"Local de Pagamento",oFont8) // nLin1 = 1270

If aDadosBanco[1] == "237"
	oPrint:Say  ((nLin1 + 40),100 ,"Pag�vel preferencialmente na Rede Bradesco ou no Bradesco Expresso." ,oFont10) // (nLin1 + 40) = 1310
ElseIf aDadosBanco[1] == "341"
	oPrint:Say  ((nLin1 + 40),100 ,"At� o vencimento, preferencialmente no Itau e ap�s o vencimento, somente no Itau." ,oFont10) // (nLin1 + 40) = 1310
Else
	oPrint:Say  ((nLin1 + 40),100 ,"At� o vencimento pagavel em qualquer banco." ,oFont10) // (nLin1 + 40) = 1310
EndIf

oPrint:Say  (nLin1,1910,"Vencimento",oFont8) // nLin1 = 1270
If aDadosBanco[1] $ "341/237"  //SE ITAU,BRADESCO
	oPrint:Say  ((nLin1 + 40),2000,ALLTRIM(SubStr(DTOS(aDadosTit[4]),7,2)+"/"+SubStr(DTOS(aDadosTit[4]),5,2)+"/"+SubStr(DTOS(aDadosTit[4]),1,4))  ,oFont10) //(nLin1 + 40) = 1310
Else
	oPrint:Say  ((nLin1 + 40),2000,ALLTRIM(DTOC(aDadosTit[4]))                               ,oFont10)// (nLin1 + 40) = 1310
EndIf

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  ((nLin1 + 100),100 ,"Benefici�rio"                                              ,oFont8)   // (nLin1 + 100) = 1370
ELSE
	oPrint:Say  ((nLin1 + 100),100 ,"Cedente"                                              ,oFont8)   // (nLin1 + 100) = 1370
ENDIF	
oPrint:Say  ((nLin1 + 125),100 ,Iif(_lBcoCorr,aDadosBanco[8],aDadosEmp[1]+" - "+aDadosEmp[6]) ,oFont10)  // (nLin + 140) = 1410
oPrint:Say  ((nLin1 + 160),100 ,Iif(_lBcoCorr,aDadosBanco[8],aDadosEmp[2]+" - "+aDadosEmp[3]) ,oFont10)  // (nLin + 140) = 1410

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  ((nLin1 + 100),1910,"Ag�ncia/C�digo Benefici�rio"                         ,oFont8) // (nLin1 + 100) = 1370
ELSE
	oPrint:Say  ((nLin1 + 100),1910,"Ag�ncia/C�digo Cedente"                         ,oFont8) // (nLin1 + 100) = 1370
ENDIF	
oPrint:Say  ((nLin1 + 140),2000,ALLTRIM(aDadosBanco[3]+"/"+aDadosBanco[4]+Iif(!Empty(aDadosBanco[5]),"-"+aDadosBanco[5],"")),oFont10) // (nLin + 140) = 1410

oPrint:Say  ((nLin1 + 200),100 ,"Data do Documento"                              ,oFont8) // (nLin1 + 200) = 1470
If aDadosBanco[1] == "237"  //SE BRADESCO
	oPrint:Say  ((nLin1 + 230),100 ,SubStr(DTOS(aDadosTit[2]),7,2)+"/"+SubStr(DTOS(aDadosTit[2]),5,2)+"/"+SubStr(DTOS(aDadosTit[2]),1,4)  ,oFont10) // (nLin1 + 230) = 1500
Else
	oPrint:Say  ((nLin1 + 230),100 ,DTOC(aDadosTit[2])                               ,oFont10)  // (nLin1 + 230) = 1500
EndIf

oPrint:Say  ((nLin1 + 200),505 ,"Nro.Documento"                                  ,oFont8)  // (nLin1 + 200) = 1470
oPrint:Say  ((nLin1 + 230),605 ,aDadosTit[1]                                     ,oFont10)  // (nLin1 + 230) = 1500

oPrint:Say  ((nLin1 + 200),1005,"Esp�cie Doc."                                   ,oFont8)   // (nLin1 + 200) = 1470
oPrint:Say  ((nLin1 + 230),1105,"DM"                                             ,oFont10) // (nLin1 + 230) = 1500

oPrint:Say  ((nLin1 + 200),1355,"Aceite"                                         ,oFont8)  // (nLin1 + 200) = 1470
oPrint:Say  ((nLin1 + 230),1455,"N"                                             ,oFont10)   // (nLin1 + 230) = 1500

oPrint:Say  ((nLin1 + 200),1555,"Data do Processamento"                          ,oFont8)   // (nLin1 + 200) = 1470

If aDadosBanco[1] == "237"   //SE BRADESCO
	oPrint:Say  ((nLin1 + 230),1655,SubStr(DTOS(aDadosTit[2]),7,2)+"/"+SubStr(DTOS(aDadosTit[2]),5,2)+"/"+SubStr(DTOS(aDadosTit[2]),1,4)  ,oFont10) // (nLin1 + 230) = 1500
Else
	oPrint:Say  ((nLin1 + 230),1655,DTOC(aDadosTit[2])                               ,oFont10)  // (nLin1 + 230) = 1500
EndIf

oPrint:Say  ((nLin1 + 200),1910,"Nosso N�mero"                                   ,oFont8)   // (nLin1 + 200) = 1470

oPrint:Say  ((nLin1 + 230),1920,ALLTRIM(aDadosTit[6])                            ,oFont10) // (nLin1 + 230) = 2000

oPrint:Say  ((nLin1 + 270),100 ,"Uso do Banco"                                   ,oFont8) // (nLin1 + 270) = 1540

oPrint:Say  ((nLin1 + 270),505 ,"Carteira"                                       ,oFont8)   // (nLin1 + 270) = 1540
oPrint:Say  ((nLin1 + 300),555 ,aDadosBanco[6]+IF(Empty(ALLTRIM(aDadosBanco[7])),"","-"+aDadosBanco[7]),oFont10) // (nLin1 + 300) = 1570


oPrint:Say  ((nLin1 + 270),755 ,"Esp�cie"                                        ,oFont8)  // (nLin1 + 270) = 1540
oPrint:Say  ((nLin1 + 300),805 ,"R$"                                             ,oFont10) // (nLin1 + 300) = 1570

oPrint:Say  ((nLin1 + 270),1005,"Quantidade"                                     ,oFont8) // (nLin1 + 270) = 1540
oPrint:Say  ((nLin1 + 270),1555,"Valor"                                          ,oFont8) // (nLin1 + 270) = 1540

oPrint:Say  ((nLin1 + 270),1910,"(=)Valor do Documento"                          ,oFont8) // (nLin1 + 270) = 1540

//oPrint:Say  ((nLin1 + 300),2000,ALLTRIM(Transform(aDadosTit[5],"@E 999,999,999.99")),oFont10)  // (nLin1 + 300) = 1570
oPrint:Say  ((nLin1 + 300),2000,(ALLTRIM(Transform((aDadosTit[5]+aDadosTit[8]-aDadosTit[7]),"@E 999,999,999.99"))),oFont10)  // (nLin1 + 300) = 1570


If aDadosBanco[1] == "341"
	oPrint:Say  ((nLin1 + 340),100 ,"Instru��es/Todos as informa��es deste bloqueto s�o de exclusiva responsabilidade do cedente",oFont8) // (nLin1 + 340) = 1610
Else
	oPrint:Say  ((nLin1 + 340),100 ,"Instru��es/Texto de responsabilidade do cedente",oFont8) // (nLin1 + 340) = 1610
EndIf

// Alteracao para padronizacao da mensagem do boleto
oPrint:Say  ((nLin1 + 370),100 ,"Juros para dia de atraso - R$ " + ALLTRIM(Transform( ROUND((aDadosTit[5]+aDadosTit[8]-aDadosTit[7])*nTxJur/30 ,2),"@E 999,999,999.99")) + " Ap�s " + DTOC(aDadosTit[4]) ,oFont8) // (nLin1 + 480) = 1750
oPrint:Say  ((nLin1 + 405),100 ,"Multa de 2,00% a partir de " + DTOC(aDadosTit[4] + 30), oFont8)
oPrint:Say  ((nLin1 + 440),100 ,"Protesto " + DTOC(aDadosTit[4] + 15) + " - A partir desta data.", oFont8)

oPrint:Say  ((nLin1 + 475),100 ,Iif(aDadosTit[11] > 0, "Desconto: Valor fixo at� data " + DTOC(aDadosTit[4]) + " - R$ "+;
ALLTRIM(Transform(aDadosTit[11],"@E 999,999.99")), " "), oFont8)
IF MV_PAR05 = "990"
	// TEXTO RED
	oPrint:Say  ((nLin1 + 510),100 ,"Titulo cedido a Red S/A", oFont8)
ELSEIF MV_PAR05 = "997"
	// TEXTO RED
	oPrint:Say  ((nLin1 + 510),100 ,"Titulo cedido a Sifra S/A", oFont8)
ELSEIF MV_PAR05 = "987"
	// TEXTO RED
	oPrint:Say  ((nLin1 + 510),100 ,"Titulo cedido a Invista S/A", oFont8)
ENDIF
//oPrint:Say  ((nLin1 + 510),100 ,Iif(MV_PAR17>0,"Desconto dia por antecipacao R$ "+ALLTRIM(Transform((aDadosTit[5]*MV_PAR17/100)/30,"@E 999,999.99")),"") ,oFont8) // (nLin1 + 390)= 1660

oPrint:Say  ((nLin1 + 550 ),100 ,aBolText[1]                                     ,oFont8) //	(nLin1 + 530) = 1800
oPrint:Say  ((nLin1 + 585 ),100 ,aBolText[2]                                     ,oFont8) //	(nLin1 + 580) = 1850
oPrint:Say  ((nLin1 + 620 ),100 ,aBolText[3]                                     ,oFont8) //	(nLin1 + 630) = 1900

oPrint:Say  ((nLin1 + 340),1910,"(-)Desconto/Abatimento"                         ,oFont8)	//	(nLin1 + 340) = 1610
//oPrint:Say  ((nLin1 + 370),2000,(ALLTRIM(Transform((aDadosTit[7]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850


oPrint:Say  ((nLin1 + 410),1910,"(-)Outras Dedu��es"                             ,oFont8) 	//	(nLin1 + 410) = 1680
oPrint:Say  ((nLin1 + 480),1910,"(+)Mora/Multa"                                  ,oFont8) 	//	(nLin1 + 480) = 1750
//oPrint:Say  ((nLin1 + 510),2000,(ALLTRIM(Transform((aDadosTit[8]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

oPrint:Say  ((nLin1 + 550),1910,"(+)Outros Acr�scimos"                           ,oFont8) // (nLin1 + 550) = 1820
//oPrint:Say  ((nLin1 + 580),2000,Iif(aDadosTit[9]=0," " , ALLTRIM(Transform(aDadosTit[9],"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

oPrint:Say  ((nLin1 + 620),1910,"(=)Valor Cobrado"                               ,oFont8) // (nLin1 + 620) = 1890
//oPrint:Say  ((nLin1 + 650),2000,(ALLTRIM(Transform((aDadosTit[5]+aDadosTit[8]-aDadosTit[7]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  ((nLin1 + 690) ,100 ,"Pagador:"                                       ,oFont8) // (nLin1 + 690) = 1960
ELSE
	oPrint:Say  ((nLin1 + 690) ,100 ,"Sacado:"                                       ,oFont8) // (nLin1 + 690) = 1960
ENDIF	                                                              
oPrint:Say  ((nLin1 + 718) ,210 ,aDatSacado[1]+" ("+aDatSacado[2]+") "+ALLTRIM(SubStr(aDatSacado[7],1,2)+"."+SubStr(aDatSacado[7],3,3)+"."+ SubStr(aDatSacado[7],6,3)+"/"+SubStr(aDatSacado[7],9,4)+"-"+SubStr(aDatSacado[7],13,2))+" "    ,oFont8) // (nLin1 + 718) = 1988
oPrint:Say  ((nLin1 + 760) ,210 ,aDatSacado[3]                                    	,oFont8) // (nLin1 + 760) = 2030
oPrint:Say  ((nLin1 + 800) ,210 ,Substr(aDatSacado[6],1,2)+"."+Substr(aDatSacado[6],3,3)+"-"+Substr(aDatSacado[6],6,3)+"  "+aDatSacado[4]+" - "+aDatSacado[5] ,oFont8) // (nLin1 + 800) = 2070
//oPrint:Say  ((nLin1 + 800) ,210 ,aDatSacado[6]+"  "+aDatSacado[4]+" - "+aDatSacado[5] ,oFont8) // (nLin1 + 800) = 2070


oPrint:Say  ((nLin1 + 800),1905,"Codigo Baixa"                                   ,oFont8) // (nLin1 + 800) = 2070
oPrint:Say  ((nLin1 + 800),2100,aDadosTit[1]                                     ,oFont8) // (nLin1 + 800) = 2070

IF MV_PAR05 $ "990/987/997/237"
	//oPrint:Say  ((nLin1 + 655),100 ,"Sacador/Avalista: "+ALLTRIM(SM0->M0_NOMECOM)+"-"+ALLTRIM(SubStr(SA1->A1_CGC,1,2)+"."+SubStr(SA1->A1_CGC,3,3)+"."+ SubStr(SA1->A1_CGC,6,3)+"/"+SubStr(SA1->A1_CGC,9,4)+"-"+SubStr(SA1->A1_CGC,13,2))+"-"+ALLTRIM(SM0->M0_ENDCOB)+"-"+ALLTRIM(SM0->M0_BAIRCOB)+", "+ALLTRIM(SM0->M0_CIDCOB)+", "+SM0->M0_ESTCOB     ,oFont8) // (nLin1 + 655) = 1925
	oPrint:Say  ((nLin1 + 655),100 ,"Sacador/Avalista: "+ALLTRIM(SM0->M0_NOMECOM)+" - "+ALLTRIM(SubStr(SM0->M0_CGC,1,2)+"."+SubStr(SM0->M0_CGC,3,3)+"."+ SubStr(SM0->M0_CGC,6,3)+"/"+SubStr(SM0->M0_CGC,9,4)+"-"+SubStr(SM0->M0_CGC,13,2))+" - "+ALLTRIM(SM0->M0_ENDCOB)+"-"+ALLTRIM(SM0->M0_BAIRCOB)+", "+ALLTRIM(SM0->M0_CIDCOB)+", "+SM0->M0_ESTCOB     ,oFont8) // (nLin1 + 655) = 1925
	
ELSE
	oPrint:Say  ((nLin1 + 655),100 ,"Sacador/Avalista: "+Iif(_lBcoCorr,aDadosEmp[1],"")                               ,oFont8) // (nLin1 + 655) = 1925
ENDIF	
oPrint:Say  ((nLin1 + 840),1500,"Autentica��o Mec�nica "                        ,oFont8)  // (nLin1 + 840) = 2110
oPrint:Say  ((nLin1 + 840),2000,"Recibo do Sacado"                              ,oFont10) // (nLin1 + 840) = 2110


oPrint:Line (nLin1        ,1900,(nLin1 + 690),1900 ) // nLin1 = 1270 ,  (nLin1 + 690) = 1960
oPrint:Line ((nLin1 + 410),1900,(nLin1 + 410),2300 ) // (nLin1 + 410) = 1680, (nLin1 + 410) = 1680
oPrint:Line ((nLin1 + 480),1900,(nLin1 + 480),2300 ) // (nLin1 + 480) = 1750
oPrint:Line ((nLin1 + 550),1900,(nLin1 + 550),2300 ) // (nLin1 + 550) = 1820 ,
oPrint:Line ((nLin1 + 620),1900,(nLin1 + 620),2300 ) // (nLin1 + 620) = 1890
oPrint:Line ((nLin1 + 690),100 ,(nLin1 + 690),2300 ) // (nLin1 + 690) = 1960

oPrint:Line ((nLin1 + 835),100,(nLin1 + 835),2300  ) // (nLin1 + 835) = 2105
/*
Par�metros
[01] nTypeBar - String com o tipo do codigo de barras
"EAN13","EAN8","UPCA" ,"SUP5" ,"CODE128"
"INT25","MAT25,"IND25","CODABAR","CODE3_9"
[02] nRow - Numero da Linha em centimentros
[03] nCol - Numero da coluna em centimentros
[04] cCode - String com o conteudo do codigo
[05] oPrint - Obejcto Printer
[06] lcheck - Se calcula o digito de controle
[07] color - Numero da Cor, utilize a "common.ch"
[08] lHort - Se imprime na Horizontal
[09] nWidth - Numero do Tamanho da barra em centimetros
[10] nHeigth - Numero da Altura da barra em milimetros
[11] lBanner - Se imprime o linha em baixo do codigo
[12] cFont - String com o tipo de fonte
[13] cMode - String com o modo do codigo de barras
[14] Onde o 14� lPrint se imprime apenas no server, o default � .F.
15� e 16� passara um indice de ajuste,o default � 1 se passar 0.5 por exemplo diminuira.
*/
MSBAR("INT25"  ,nLinBar1,nColBar1,CB_RN_NN[1],oPrint,.F.,,   ,nComBar1,nAltBar1,,,,.F.)
//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                    FIM - Ficha do Sacado.                                                                �
//����������������������������������������������������������������������������������������������������������������������������










//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                   INICIO - Ficha de Compensacao.                                                         �
//����������������������������������������������������������������������������������������������������������������������������
// PONTILHAMENTO
For nI := 100 To 2300 Step 50
	oPrint:Line( nLin2, nI, nLin2, nI+30) // nLin2 = 2270
Next nI

oPrint:Line ((nLin2 + 120),100,(nLin2 + 120),2300)   // (nLin2 + 120) = 2390
oPrint:Line ((nLin2 + 120),650,(nLin2 + 20),650 )    // (nLin2 + 120), (nLin2 + 20) = 2290
oPrint:Line ((nLin2 + 120),900,(nLin2 + 20),900 )    // (nLin2 + 120), (nLin2 + 20) = 2290

If aDadosBanco[1] == "389"
	oPrint:Say  ((nLin2 + 54),100,aDadosBanco[2],oFont10 ) // (nLin2 + 54) = 2324
ElseIf aDadosBanco[1] == "001"
	oPrint:SayBitMap(nLin2 + 15,110,aBitMap[1],450,100)
ElseIf aDadosBanco[1] == "237"
	oPrint:SayBitMap(nLin2 + 15,110,aBitMap[2],450,100)
Else
	oPrint:Say  ((nLin2 + 54),100,aDadosBanco[2],oFont12 ) // (nLin2 + 54) = 2324
EndIf


//oPrint:Say  ((nLin2 + 130),680,aDadosBanco[1]+"-"+Modulo11(aDadosBanco[1],aDadosBanco[1]),oFont20 ) //Codigo do banco
oPrint:Say  ((nLin2 + 25),680,aDadosBanco[1]+"-"+Modulo11(aDadosBanco[1],aDadosBanco[1]),oFont20 ) //Codigo do banco
oPrint:Say  ((nLin2 + 54),920,CB_RN_NN[2],oFont14n) //linha digitavel // (nLin2 + 54) = 2324

oPrint:Line ((nLin2 + 220),100,(nLin2 + 220),2300 ) // (nLin2 + 220) = 2490
oPrint:Line ((nLin2 + 320),100,(nLin2 + 320),2300 ) // (nLin2 + 320) = 2590
oPrint:Line ((nLin2 + 390),100,(nLin2 + 390),2300 ) // (nLin2 + 390) = 2660
oPrint:Line ((nLin2 + 460),100,(nLin2 + 460),2300 ) // (nLin2 + 460) = 2730

oPrint:Line ((nLin2 + 320), 500,(nLin2 + 460), 500) // (nLin2 + 320) = 2590 , (nLin2 + 460) = 2730
oPrint:Line ((nLin2 + 390), 750,(nLin2 + 460), 750) // (nLin2 + 390) = 2660 , (nLin2 + 460) = 2730
oPrint:Line ((nLin2 + 320),1000,(nLin2 + 460),1000) // (nLin2 + 320) = 2590 , (nLin2 + 460) = 2730
oPrint:Line ((nLin2 + 320),1350,(nLin2 + 390),1350) // (nLin2 + 320) = 2590 , (nLin2 + 390) = 2660
oPrint:Line ((nLin2 + 320),1550,(nLin2 + 460),1550) // (nLin2 + 320) = 2590 , (nLin2 + 460) = 2730

oPrint:Say  ((nLin2 + 120),100 ,"Local de Pagamento"                             ,oFont8)  // (nLin2 + 120) = 2390

If aDadosBanco[1] == "237"  //SE BRADESCO
	oPrint:Say  ((nLin2 + 160),100 ,"Pag�vel preferencialmente na Rede Bradesco ou no Bradesco Expresso."       ,oFont10) // (nLin2 + 160) = 2430
ElseIf aDadosBanco[1] == "341"
	oPrint:Say  ((nLin2 + 160),100 ,"At� o vencimento, preferencialmente no Itau e Ap�s o vencimento, somente no Itau." ,oFont10) // (nLin2 + 160) = 2430
Else
	oPrint:Say  ((nLin2 + 160),100 ,"At� o vencimento pagavel em qualquer banco"       ,oFont10)  // (nLin2 + 160) = 2430
EndIf


oPrint:Say  ((nLin2 + 120),1910,"Vencimento"                                     ,oFont8) // (nLin2 + 120) = 2390
If aDadosBanco[1] $ "341,237"  //SE ITAU,BRADESCO
	oPrint:Say  ((nLin2 + 160),2000,ALLTRIM(SubStr(DTOS(aDadosTit[4]),7,2)+"/"+SubStr(DTOS(aDadosTit[4]),5,2)+"/"+SubStr(DTOS(aDadosTit[4]),1,4)),oFont10) // (nLin2 + 160) = 2430
Else
	oPrint:Say  ((nLin2 + 160),2000,ALLTRIM(DTOC(aDadosTit[4]))                                    ,oFont10) // (nLin2 + 160) = 2430
EndIf

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  ((nLin2 + 220),100 ,"Benefici�rio"                                        ,oFont8) // (nLin2 + 220) = 2490
ELSE
	oPrint:Say  ((nLin2 + 220),100 ,"Cedente"                                        ,oFont8) // (nLin2 + 220) = 2490
ENDIF	
oPrint:Say  ((nLin2 + 245),100 ,Iif(_lBcoCorr,aDadosBanco[8],aDadosEmp[1]+" - "+aDadosEmp[6]) ,oFont10) // (nLin2 + 260) = 2530
oPrint:Say  ((nLin2 + 280),100 ,Iif(_lBcoCorr,aDadosBanco[8],aDadosEmp[2]+" - "+aDadosEmp[3]) ,oFont10) // (nLin2 + 260) = 2530

IF MV_PAR05 $ "990/987/997/237"                                       
	oPrint:Say  ((nLin2 + 220),1910,"Ag�ncia/C�digo Benefici�rio"                         ,oFont8) // (nLin2 + 220) = 2490
ELSE
	oPrint:Say  ((nLin2 + 220),1910,"Ag�ncia/C�digo Cedente"                         ,oFont8) // (nLin2 + 220) = 2490
ENDIF	
oPrint:Say  ((nLin2 + 260),2000,ALLTRIM(aDadosBanco[3]+"/"+aDadosBanco[4]+Iif(!Empty(aDadosBanco[5]),"-"+aDadosBanco[5],"")),oFont10) // (nLin2 + 260) = 2530

oPrint:Say  ((nLin2 + 320),100 ,"Data do Documento"                      ,oFont8)  // (nLin2 + 320) = 2590

If aDadosBanco[1] == "237"   //SE BRADESCO
	oPrint:Say  ((nLin2 + 350),100 ,SubStr(DTOS(aDadosTit[2]),7,2)+"/"+SubStr(DTOS(aDadosTit[2]),5,2)+"/"+SubStr(DTOS(aDadosTit[2]),1,4)  ,oFont10) // (nLin2 + 350) = 2620
Else
	oPrint:Say  ((nLin2 + 350),100 ,DTOC(aDadosTit[2])                               ,oFont10) // (nLin2 + 350) = 2620
EndIf


oPrint:Say  ((nLin2 + 320),505 ,"Nro.Documento"                      ,oFont8) // (nLin2 + 320) = 2590
oPrint:Say  ((nLin2 + 350),605 ,aDadosTit[1]                        ,oFont10) // (nLin2 + 350) = 2620

oPrint:Say  ((nLin2 + 320),1005,"Esp�cie Doc."                                   ,oFont8) // (nLin2 + 320) = 2590
oPrint:Say  ((nLin2 + 350),1105,"DM"                                             ,oFont10)// (nLin2 + 350) = 2620

oPrint:Say  ((nLin2 + 320),1355,"Aceite"                                         ,oFont8)// (nLin2 + 320) = 2590
oPrint:Say  ((nLin2 + 350),1455,"N"                                             ,oFont10)// (nLin2 + 350) = 2620

oPrint:Say  ((nLin2 + 320),1555,"Data do Processamento"                          ,oFont8) // (nLin2 + 320) = 2590

If aDadosBanco[1] == "237"   //SE BRADESCO
	oPrint:Say  ((nLin2 + 350),1655,SubStr(DTOS(aDadosTit[2]),7,2)+"/"+SubStr(DTOS(aDadosTit[2]),5,2)+"/"+SubStr(DTOS(aDadosTit[2]),1,4)  ,oFont10) // (nLin2 + 350) = 2620
Else
	oPrint:Say  ((nLin2 + 350),1655,DTOC(aDadosTit[2])                               ,oFont10) // (nLin2 + 350) = 2620
EndIf


oPrint:Say  ((nLin2 + 320),1910,"Nosso N�mero"                                   ,oFont8) // (nLin2 + 320) = 2590

oPrint:Say  ((nLin2 + 350),1920,ALLTRIM(aDadosTit[6])                             ,oFont10) // (nLin2 + 350) = 2000

oPrint:Say  ((nLin2 + 390),100 ,"Uso do Banco"                                   ,oFont8) // (nLin2 + 390) = 2660

oPrint:Say  ((nLin2 + 390),505 ,"Carteira"                                       ,oFont8) // (nLin2 + 390) = 2660
oPrint:Say  ((nLin2 + 420),555 ,aDadosBanco[6]+IF(Empty(ALLTRIM(aDadosBanco[7])),"","-"+aDadosBanco[7]),oFont10)

oPrint:Say  ((nLin2 + 390),755 ,"Esp�cie"                                        ,oFont8)   // (nLin2 + 390) = 2660
oPrint:Say  ((nLin2 + 420),805 ,"R$"                                             ,oFont10) // (nLin2 + 420) = 2690

oPrint:Say  ((nLin2 + 390),1005,"Quantidade"                                     ,oFont8) // (nLin2 + 390) = 2660
oPrint:Say  ((nLin2 + 390),1555,"Valor"                                          ,oFont8) // (nLin2 + 390) = 2660

oPrint:Say  ((nLin2 + 390),1910,"(=)Valor do Documento"                          ,oFont8) // (nLin2 + 390) = 2660
//oPrint:Say  ((nLin2 + 420),2000,ALLTRIM(Transform(aDadosTit[5],"@E 999,999,999.99")),oFont10) // (nLin2 + 420) = 2690
oPrint:Say  ((nLin2 + 420),2000,(ALLTRIM(Transform((aDadosTit[5]+aDadosTit[8]-aDadosTit[7]),"@E 999,999,999.99"))),oFont10) // (nLin2 + 420) = 2690

If aDadosBanco[1] == "341"
	oPrint:Say  ((nLin2 + 460),100 ,"Instru��es/Todos as informa��es deste bloqueto s�o de exclusiva responsabilidade do cedente",oFont8) // (nLin2 + 460) = 2730
Else
	oPrint:Say  ((nLin2 + 460),100 ,"Instru��es/Texto de responsabilidade do cedente",oFont8) // (nLin2 + 460) = 2730
EndIf

// Alteracao para padronizacao da mensagem do boleto
oPrint:Say  ((nLin2 + 490),100 ,"Juros para dia de atraso - R$ " + ALLTRIM(Transform( ROUND( (aDadosTit[5]+aDadosTit[8]-aDadosTit[7])*nTxJur/30 ,2),"@E 999,999,999.99")) + " Ap�s " + DTOC(aDadosTit[4]) ,oFont8) // (nLin1 + 480) = 1750
oPrint:Say  ((nLin2 + 525),100 ,"Multa de 2,00% a partir de " + DTOC(aDadosTit[4] + 30), oFont8)
oPrint:Say  ((nLin2 + 560),100 ,"Protesto " + DTOC(aDadosTit[4] + 15) + " - A partir desta data.", oFont8)

oPrint:Say  ((nLin2 + 595),100 ,Iif(aDadosTit[11] > 0, "Desconto: Valor fixo at� Data " + DTOC(aDadosTit[4]) + " - R$ "+;
ALLTRIM(Transform(aDadosTit[11],"@E 999,999.99")), " "), oFont8)

IF MV_PAR05 = "990"
	// TEXTO RED
	oPrint:Say  ((nLin2 + 620),100 ,"Titulo cedido a Red S/A", oFont8)
ELSEIF MV_PAR05 = "997"
	// TEXTO RED
	oPrint:Say  ((nLin2 + 620),100 ,"Titulo cedido a Sifra S/A", oFont8)
ELSEIF MV_PAR05 = "987"
	// TEXTO RED
	oPrint:Say  ((nLin2 + 620),100 ,"Titulo cedido a Invista S/A", oFont8)
ENDIF
//oPrint:Say  ((nLin1 + 510),100 ,Iif(MV_PAR17>0,"Desconto dia por antecipacao R$ "+ALLTRIM(Transform((aDadosTit[5]*MV_PAR17/100)/30,"@E 999,999.99")),"") ,oFont8) // (nLin1 + 390)= 1660
//oPrint:Say  ((nLin2 + 630),100 ,Iif(MV_PAR17>0,"Desconto dia por antecipacao R$ "+ALLTRIM(Transform((aDadosTit[5]*MV_PAR17/100)/30,"@E 999,999.99")),"") ,oFont8) // (nLin2 + 510) = 2780
//oPrint:Say  (2780,100 ,Iif(aDadosTit[7]>0,"Conceder desconto de R$ "+ALLTRIM(Transform(aDadosTit[7],"@E 999,999.99"))+" ate o vencimento","") ,oFont10)
//oPrint:Say  ((nLin2 + 600),100 ,Iif(aDadosTit[8]>0, "AP�S O VENCIMENTO COBRAR R$ "+ALLTRIM(Transform(aDadosTit[8],"@E 999,999.99"))+" POR DIA DE ATRASO",""),oFont10) // (nLin2 + 600) = 2870
//oPrint:Say  (2880,100 ,Iif(aDadosTit[8]>0, "AP�S O VENCIMENTO COBRAR MULTA DE R$ ",""),oFont10)

oPrint:Say  ((nLin2 + 670),100 ,aBolText[1]                                      ,oFont8) // (nLin2 + 650) = 2920
oPrint:Say  ((nLin2 + 705),100 ,aBolText[2]                                      ,oFont8) // (nLin2 + 700) = 2970
oPrint:Say  ((nLin2 + 740),100 ,aBolText[3]                                      ,oFont8) // (nLin2 + 750) = 3020

oPrint:Say  ((nLin2 + 460),1910,"(-)Desconto/Abatimento"                         ,oFont8) // (nLin2 + 460) = 2730
//oPrint:Say  ((nLin2 + 490),2000,(ALLTRIM(Transform((aDadosTit[7]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

oPrint:Say  ((nLin2 + 530),1910,"(-)Outras Dedu��es"                             ,oFont8) // (nLin2 + 530) = 2800
oPrint:Say  ((nLin2 + 600),1910,"(+)Mora/Multa"                                  ,oFont8) // (nLin2 + 600) = 2870
//oPrint:Say  ((nLin2 + 630),2000,(ALLTRIM(Transform((aDadosTit[8]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

oPrint:Say  ((nLin2 + 670),1910,"(+)Outros Acr�scimos"                           ,oFont8) // (nLin2 + 670) = 2940
//oPrint:Say  ((nLin2 + 700),2000,Iif(aDadosTit[9] = 0," ", ALLTRIM(Transform(aDadosTit[9],"@E 999,999,999.99"))),oFont10) // (nLin2 + 700) = 2970

oPrint:Say  ((nLin2 + 740),1910,"(=)Valor Cobrado"                               ,oFont8) // (nLin2 + 740) = 3010
//oPrint:Say  ((nLin2 + 770),2000,(ALLTRIM(Transform((aDadosTit[5]+aDadosTit[8]-aDadosTit[7]),"@E 999,999,999.99"))),oFont10) // (nLin1 + 580) = 1850

IF MV_PAR05 $ "990/987/997/237"
	oPrint:Say  ((nLin2 + 810),100 ,"Pagador"                                         ,oFont8) // (nLin2 + 810) = 3080
ELSE
	oPrint:Say  ((nLin2 + 810),100 ,"Sacado"                                         ,oFont8) // (nLin2 + 810) = 3080
ENDIF	
oPrint:Say  ((nLin2 + 838) ,210 ,aDatSacado[1]+" ("+aDatSacado[2]+")"+" CNPJ: "+ALLTRIM(SubStr(aDatSacado[7],1,2)+"."+SubStr(aDatSacado[7],3,3)+"."+ SubStr(aDatSacado[7],6,3)+"/"+SubStr(aDatSacado[7],9,4)+"-"+SubStr(aDatSacado[7],13,2))+" "  	,oFont8) // (nLin2 + 838) = 3108
oPrint:Say  ((nLin2 + 878) ,210 ,aDatSacado[3]                                    	,oFont8) // (nLin2 + 878) = 3148
oPrint:Say  ((nLin2 + 918) ,210 ,Substr(aDatSacado[6],1,2)+"."+Substr(aDatSacado[6],3,3)+"-"+Substr(aDatSacado[6],6,3)+"  "+aDatSacado[4]+" - "+aDatSacado[5] ,oFont8) // (nLin2 + 918) = 3188

oPrint:Say  ((nLin2 + 918),1905,"Codigo Baixa"                                   ,oFont8) // (nLin2 + 918) = 3188
oPrint:Say  ((nLin2 + 918),2100,aDadosTit[1]                                     ,oFont8) // (nLin2 + 918) = 3188

IF MV_PAR05 $ "990/987/997/237"
	//oPrint:Say  ((nLin2 + 775),100 ,"Sacador/Avalista: "+ALLTRIM(SM0->M0_NOMECOM)+"-"+ALLTRIM(SM0->M0_ENDCOB)+"-"+ALLTRIM(SM0->M0_BAIRCOB)+", "+ALLTRIM(SM0->M0_CIDCOB)+", "+SM0->M0_ESTCOB     ,oFont8) // (nLin2 + 775) = 3045
	oPrint:Say  ((nLin2 + 775),100 ,"Sacador/Avalista: "+ALLTRIM(SM0->M0_NOMECOM)+" - "+ALLTRIM(SubStr(SM0->M0_CGC,1,2)+"."+SubStr(SM0->M0_CGC,3,3)+"."+ SubStr(SM0->M0_CGC,6,3)+"/"+SubStr(SM0->M0_CGC,9,4)+"-"+SubStr(SM0->M0_CGC,13,2))+" - "+ALLTRIM(SM0->M0_ENDCOB)+"-"+ALLTRIM(SM0->M0_BAIRCOB)+", "+ALLTRIM(SM0->M0_CIDCOB)+", "+SM0->M0_ESTCOB     ,oFont8) // (nLin2 + 775) = 3045
	
ELSE
	oPrint:Say  ((nLin2 + 775),100 ,"Sacador/Avalista: "+Iif(_lBcoCorr,aDadosEmp[1],"")  ,oFont8) // (nLin2 + 775) = 3045
ENDIF	
oPrint:Say  ((nLin2 + 960),1500,"Autentica��o Mec�nica -"                        ,oFont8) // (nLin2 + 960) = 3230
If aDadosBanco[1] == "341"
	oPrint:Say  ((nLin2 + 960),2000,"Ficha de Compensa��o"                       ,oFont8) // (nLin2 + 960) = 3230
Else
	oPrint:Say  ((nLin2 + 960),1960,"Ficha de Compensa��o"                       ,oFont8) // (nLin2 + 960) = 3230
EndIf


oPrint:Line ((nLin2 + 120),1900,(nLin2 + 810),1900 ) // (nLin2 + 120) = 2390 , (nLin2 + 810) = 3080
oPrint:Line ((nLin2 + 530),1900,(nLin2 + 530),2300 ) // (nLin2 + 530) = 2800
oPrint:Line ((nLin2 + 600),1900,(nLin2 + 600),2300 ) // (nLin2 + 600) = 2870
oPrint:Line ((nLin2 + 670),1900,(nLin2 + 670),2300 ) // (nLin2 + 670) = 2940
oPrint:Line ((nLin2 + 740),1900,(nLin2 + 740),2300 ) // (nLin2 + 740) = 3010
oPrint:Line ((nLin2 + 810),100 ,(nLin2 + 810),2300 ) // (nLin2 + 810) = 3080

oPrint:Line ((nLin2 + 955),100,(nLin2 + 955),2300) // (nLin2 + 955) = 3225

/*
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Parametros� 01 cTypeBar String com o tipo do codigo de barras          ���
���          �             "EAN13","EAN8","UPCA" ,"SUP5"   ,"CODE128"     ���
���          �             "INT25","MAT25,"IND25","CODABAR" ,"CODE3_9"    ���
���          � 02 nRow     Numero da Linha em centimentros                ���
���          � 03 nCol     Numero da coluna em centimentros               ���
���          � 04 cCode    String com o conteudo do codigo                ���
���          � 05 oPr      Objeto Printer                                 ���
���          � 06 lcheck   Se calcula o digito de controle                ���
���          � 07 Cor      Numero  da Cor, utilize a "common.ch"          ���
���          � 08 lHort    Se imprime na Horizontal                       ���
���          � 09 nWidth   Numero do Tamanho da barra em centimetros      ���
���          � 10 nHeigth  Numero da Altura da barra em milimetros        ���
���          � 11 lBanner  Se imprime o linha em baixo do codigo          ���
���          � 12 cFont    String com o tipo de fonte                     ���
���          � 13 cMode    String com o modo do codigo de barras CODE128  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
MSBAR("INT25"  ,nLinBar2,nColBar2,CB_RN_NN[1],oPrint,.F.,,,nComBar2,nAltBar2,,,,.F.)
//��������������������������������������������������������������������������������������������������������������������������Ŀ
//�                                   FIM - Ficha de Compensacao.                                                            �
//����������������������������������������������������������������������������������������������������������������������������

oPrint:EndPage() // Finaliza a pagina

Return Nil

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Modulo10 � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Calculo do Modulo10.                                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Modulo10(cData)

Local L,D,P := 0
Local B     := .F.

L := Len(cData)  //TAMANHO DE BYTES DO CARACTER
B := .T.
D := 0     //DIGITO VERIFICADOR

While L > 0
	P := Val(SubStr(cData, L, 1))
	If (B)
		P := P * 2
		If P > 9
			P := P - 9
		EndIf
	EndIf
	D := D + P
	L := L - 1
	B := !B
EndDo

D := 10 - (Mod(D,10))

If D = 10
	D := 0
EndIf

Return(D)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Modulo11 � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Calculo do Modulo11.                                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Modulo11(cData,cBanc)

Local L, D, P := 0
Local _cRet := ""

If cBanc == "001"  // Banco do brasil
	L := Len(cdata)
	D := 0
	P := 10
	While L > 0
		P := P - 1
		D := D + (Val(SubStr(cData, L, 1)) * P)
		If P = 2
			P := 10
		EndIf
		L := L - 1
	EndDo
	D := mod(D,11)
	If D == 10
		D := "X"
	Else
		_cRet := ALLTRIM(Str(D))
	EndIf
ElseIf cBanc == "237" .Or. cBanc == "341" .Or. cBanc == "389" .Or. cBanc == "453" .Or. cBanc == "399" .Or. cBanc == "422" // Bradesco/Itau/Mercantil/Rural/HSBC/Safra
	L := Len(cdata)
	D := 0
	P := 1
	While L > 0
		P := P + 1
		D := D + (Val(SubStr(cData, L, 1)) * P)
		If P = 7
			P := 1
		EndIf
		L := L - 1
	EndDo
	D := 11 - (mod(D,11))
	
	If (D == 1 .Or. D == 0 .Or. D == 10 .Or. D == 11) .And. (cBanc == "289" .Or. cBanc == "453" .Or. cBanc == "399")
		D := 0
	EndIf
	
	If cBanc == "237"
		//_cRet := Iif(D == 10  .Or. D == 11,"P", ALLTRIM(Str(D)))
		_cRet := Iif(D == 10 ,"P", Iif(D == 11,"0",ALLTRIM(Str(D))))
	Else
		_cRet := ALLTRIM(Str(D))
	EndIf
ElseIf cBanc == "479"  //BOSTON
	L := Len(cdata)
	D := 0
	P := 1
	While L > 0
		P := P + 1
		D := D + (Val(SubStr(cData, L, 1)) * P)
		If P = 9
			P := 1
		EndIf
		L := L - 1
	EndDo
	D := Mod(D*10,11)
	If D == 10
		D := 0
	EndIf
	_cRet := ALLTRIM(Str(D))
Else
	L := Len(cdata)
	D := 0
	P := 1
	While L > 0
		P := P + 1
		D := D + (Val(SubStr(cData, L, 1)) * P)
		If P = 9
			P := 1
		EndIf
		L := L - 1
	EndDo
	D := 11 - (mod(D,11))
	If (D == 10 .Or. D == 11)
		D := 1
	EndIf
	_cRet := ALLTRIM(Str(D))
EndIf

Return(_cRet)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Mod11B9  � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Calculo do  modelo 11 na base 9.                           ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Especifico para calculo do digito verificador geral do     ���
���          � codigo de barras.                                          ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Mod11B9(cData)

Local L, D, P := 0
Local _cRet := ""

L := Len(cdata)
D := 0
P := 1
While L > 0
	P := P + 1
	D := D + (Val(SubStr(cData, L, 1)) * P)
	If P = 9
		P := 1
	End
	L := L - 1
End
D := 11 - (mod(D,11))

// Se D for igual a zero, um ou maior que nove, entao D sera igual a um. Caso contrario, nao sera alterado.
D := Iif(D == 0 .Or. D == 1 .Or. D > 9 ,1,D)

_cRet := ALLTRIM(Str(D))

Return _cRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �Ret_cBarra� Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Retorna os strings para inpress�o do Boleto.               ���
���          �                                                            ���
���          � CB = String para o cod.barras, RN = String com o numero    ���
���          � digitavel.                                                 ���
���          � Cobranca nao identificada:                                 ���
���          � numero do boleto = Titulo + Parcela                        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Ret_cBarra(cBanco,cAgencia,cConta,cDacCC,cCarteira,cNroDoc,nValor,dvencimento,cConvenio,cSequencial,_lTemDesc,_cParcela)

Local cNNumSDig    := ""
Local cCpoLivre    := ""
Local cCBSemDig    := ""
Local cCodBarra    := ""
Local cNossoNum    := ""
Local cCodEmp      := StrZero(Val(SubStr(cConvenio,1,6)),6)
Local blvalorfinal := StrZero(INT((nValor)*(100*10)/10),10)
Local cFatVenc     := StrZero(dVencimento - CTOD("07/10/1997"),4)//Fator Vencimento - POSICAO DE 06 A 09


//_cParcela := NumParcela(_cParcela)

If cBanco == "001"  // BANCO DO BRASIL
	//Se Convenio/Cod. Empresa tem 7 digitos
	If Len(ALLTRIM(cConvenio)) == 7
		If Empty(ALLTRIM(TRB->E1_NUMBCO)) .Or. !_lReimprime
			//Nosso Numero sem digito
			cNNumSDig := ALLTRIM(cConvenio)+StrZero(Val(cSequencial),10)
			//Nosso Numero com digito
			//cNNum := cNNumSDig
			//Nosso Numero para impressao
			cNossoNum := cNNumSDig
		Else
			cNossoNum := TRB->E1_NUMBCO
		EndIf
		cCpoLivre := "000000"+ALLTRIM(cNossoNum)+ cCarteira
	Else
		If Empty(ALLTRIM(TRB->E1_NUMBCO)) .Or. !_lReimprime
			//Nosso Numero sem digito
			cNNumSDig := cCodEmp+StrZero(Val(cSequencial),5)
			//Nosso Numero para impressao
			cNossoNum := cNNumSDig +"-"+ Modulo11(cNNumSDig,cBanco)
		Else
			//Nosso Numero sem digito
			cNNumSDig := SubStr(TRB->E1_NUMBCO,1,11)
			//Nosso Numero para impressao
			cNossoNum := SubStr(TRB->E1_NUMBCO,1,10) + "-" + RIGHT(ALLTRIM(TRB->E1_NUMBCO),1)
		EndIf
		cCpoLivre := cNNumSDig+cAgencia + StrZero(Val(cConta),8) + cCarteira
	EndIf
ElseIf cBanco == "237" // Banco BRADESCO
	//Nosso Numero
	If Empty(ALLTRIM(TRB->E1_NUMBCO)) .Or. !_lReimprime
		//Nosso nro sem o digito
		cNNumSDig := cCarteira + StrZero(Val(cSequencial),11)
		//Nosso Numero para impressao
		cNossoNum := cCarteira + '/' + StrZero(Val(cSequencial),11) + '-' + ALLTRIM(  Modulo11( cNNumSDig,cBanco ) )
	Else
		//Nosso Nro sem o digito
		cNNumSDig := cCarteira+SubStr(TRB->E1_NUMBCO,1,11)
		//Nosso Numero para impressao
		cNossoNum := cCarteira+"/" + SubStr(TRB->E1_NUMBCO,1,11) + "-" + RIGHT(ALLTRIM(TRB->E1_NUMBCO),1)
	EndIf
	
	cCpoLivre := cAgencia + cNNumSDig + StrZero(Val(cConta),7) + "0"
	
ElseIf cBanco == "389" // Banco MERCANTIL
	//Nosso Numero sem digito
	cNNumSDig := cAgencia+"30"+cCarteira+StrZero(Val(cSequencial),6)
	//Nosso Numero
	cNNum := "30"+cCarteira+ StrZero(Val(cSequencial),6) + Modulo11(cNNumSDig,cBanco)
	//Nosso Numero para impressao
	cNossoNum := "30"+cCarteira+ StrZero(Val(cSequencial),6) +"-"+ Modulo11(cNNumSDig,cBanco)
	cCpoLivre := cAgencia + cNNum + StrZero(Val(SubStr(cConvenio,1,9)),9)+Iif(_lTemDesc,"0","2")
ElseIf cBanco == "453" // Banco RURAL
	//Nosso Numero sem digito
	cNNumSDig := StrZero(Val(cSequencial),7)
	//Nosso Numero
	cNNum := cNNumSDig + ALLTRIM( Str( modulo10( cNNumSDig ) ) )
	//Nosso Numero para impressao
	cNossoNum := cNNumSDig +"-"+ ALLTRIM( Str( modulo10( cNNumSDig ) ) )
	cCpoLivre := "0"+StrZero(Val(cAgencia),3) + StrZero(Val(cConta),10)+cNNum+"000"
ElseIf cBanco == "341"  // Banco ITAU
	If !(ALLTRIM(cCarteira) $ "126,131,146,150,168")
		//Nosso Numero sem digito
		cNNumSDig := cCarteira+StrZero(Val(cSequencial),8)
		//Nosso Numero
		cNNum := cCarteira+StrZero(Val(cSequencial),8) + ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5)+cNNumSDig ) ) )
		//Nosso Numero para impressao
		cNossoNum := cCarteira+"/"+StrZero(Val(cSequencial),8) +'-' + ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5) + cNNumSDig ) ) )
	Else
		//Nosso Numero sem digito
		cNNumSDig := cCarteira+StrZero(Val(cNroDoc),6)+ _cParcela
		//Nosso Numero
		cNNum := cCarteira+StrZero(Val(cNroDoc),6) + _cParcela + ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5)+cNNumSDig ) ) )
		//Nosso Numero para impressao
		cNossoNum := cCarteira+"/"+StrZero(Val(cNroDoc),6)+ _cParcela +'-' + ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5) + cNNumSDig ) ) )
	EndIf
	cCpoLivre := cNNumSDig+ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5)+cNNumSDig ) ) )+StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5)+ALLTRIM( Str( modulo10( StrZero(Val(cAgencia),4) + StrZero(Val(cConta),5) ) ) )+"000"
ElseIf cBanco == "399"  // Banco HSBC
	//Nosso Numero sem digito
	cNNumSDig := StrZero(Val(SubStr(cConvenio,1,5)),5)+StrZero(Val(cSequencial),5)
	//Nosso Numero
	cNNum := cNNumSDig + Modulo11(cNNumSDig,cBanco)
	//Nosso Numero para impressao
	cNossoNum := cNNumSDig +"-"+ Modulo11(cNNumSDig,cBanco)
	
	cCpoLivre := cNNum+StrZero(Val(cAgencia),4) + StrZero(Val(cConta),7)+"001"
	
ElseIf cBanco == "422"  // Banco SAFRA
	//Nosso Numero sem digito
	cNNumSDig := StrZero(Val(cSequencial),8)
	//Nosso Numero
	cNNum := cNNumSDig + Modulo11(cNNumSDig,cBanco)
	//Nosso Numero para impressao
	cNossoNum := cNNumSDig +"-"+ Modulo11(cNNumSDig,cBanco)
	
	cCpoLivre := "7"+StrZero(Val(cAgencia),4) + StrZero(Val(cConta),10)+cNNum+"2"
	
ElseIf cBanco == "479" // Banco BOSTON
	cCodEmp := StrZero(Val(SubStr(cConvenio,1,9)),9)
	//Nosso Numero sem digito
	cNNumSDig := StrZero(Val(cSequencial),8)
	//Nosso Numero
	cNNum := cNNumSDig + Modulo11(cNNumSDig,cBanco)
	//Nosso Numero para impressao
	cNossoNum := cNNumSDig +"-"+ Modulo11(cNNumSDig,cBanco)
	
	cCpoLivre := cCodEmp+"000000"+cNNum+"8"
EndIf


//Dados para Calcular o Dig Verificador Geral
cCBSemDig := cBanco + "9" + cFatVenc + blvalorfinal + cCpoLivre
//Codigo de Barras Completo
If cBanco == "237"
	cCodBarra := cBanco + "9" + Mod11B9(cCBSemDig) + cFatVenc + blvalorfinal + cCpoLivre
Else
	cCodBarra := cBanco + "9" + Modulo11(cCBSemDig) + cFatVenc + blvalorfinal + cCpoLivre
EndIf

//Digito Verificador do Primeiro Campo
cPrCpo := cBanco + "9" + SubStr(cCodBarra,20,5)
cDvPrCpo := ALLTRIM(Str(Modulo10(cPrCpo)))

//Digito Verificador do Segundo Campo
cSgCpo := SubStr(cCodBarra,25,10)
cDvSgCpo := ALLTRIM(Str(Modulo10(cSgCpo)))

//Digito Verificador do Terceiro Campo
cTrCpo := SubStr(cCodBarra,35,10)
cDvTrCpo := ALLTRIM(Str(Modulo10(cTrCpo)))

//Digito Verificador Geral
cDvGeral := SubStr(cCodBarra,5,1)

//Linha Digitavel
cLindig := SubStr(cPrCpo,1,5) + "." + SubStr(cPrCpo,6,4) + cDvPrCpo + " "   //primeiro campo
cLinDig += SubStr(cSgCpo,1,5) + "." + SubStr(cSgCpo,6,5) + cDvSgCpo + " "   //segundo campo
cLinDig += SubStr(cTrCpo,1,5) + "." + SubStr(cTrCpo,6,5) + cDvTrCpo + " "   //terceiro campo
cLinDig += " " + cDvGeral              //dig verificador geral
cLinDig += "  " + SubStr(cCodBarra,6,4)+SubStr(cCodBarra,10,10)  // fator de vencimento e valor nominal do titulo

Return({cCodBarra,cLinDig,cNossoNum})

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Agencia  � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Retorna a agencia.                                         ���
���          �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Agencia(cBanco,cAgencia)

Local cRet := ""

If cBanco $ "479/389"
	cRet := ALLTRIM(SEE->EE_AGBOSTO)
ElseIf cBanco == "341" .Or. cBanco == "422"
	cRet := StrZero(Val(ALLTRIM(cAgencia)),4)
ElseIf cBanco == "001"
	cRet := ALLTRIM(cAgencia)+"-1"//Fixou o digito porque nao tinha o mesmo no cadastro
ElseIf cBanco == "237"
	//Alterado 30-05-12 pois na agencia atual nao tem digito
	//cRet := ALLTRIM(cAgencia)+"-4"//Fixou o digito porque nao tinha o mesmo no cadastro
	cRet := ALLTRIM(cAgencia)
Else
	cRet := SubStr(StrZero(Val(ALLTRIM(cAgencia)),5),1,4)+"-"+SubStr(StrZero(Val(ALLTRIM(cAgencia)),5),5,1)
EndIf

Return(cRet)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � Conta    � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Retorna a conta.                                           ���
���          �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Conta(cBanco,cConta)

Local cRet := ""

If cBanco $ "479/389"
	cRet := ALLTRIM(SEE->EE_CODEMP)
ElseIf cBanco == "341"
	cRet := StrZero(Val(SubStr(ALLTRIM(cConta),1,Len(ALLTRIM(cConta))-1)),5)
Else
	cRet := SubStr(ALLTRIM(cConta),1,Len(ALLTRIM(cConta))-1)
EndIf

Return(cRet)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �NumParcela� Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Retorna o numero da parcela.                               ���
���          �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function NumParcela(cParcela)

Local cRet := ""

If ASC(cParcela) >= 65 .Or. ASC(cParcela) <= 90
	cRet := StrZero(Val(Chr(ASC(cParcela)-16)),2)
Else
	cRet := StrZero(Val(cParcela),2)
EndIf

Return(cRet)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � xInvAll  � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Rotina para inverter a marcacao de todos os registros.     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � xProcessa().                                               ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � xInvReg  � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Rotina para inverter a marcacao do registro posicionado.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � xProcessa().                                               ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � CriaArq  � Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao do arquivo temporario.                 ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CriaArq()

Local aEstru  := {}
Local cQuery  := ""
Local cTamParc:= TamSx3("E1_PARCELA")[1] //Tamanho do campo Parcela do titulo

//�������������������������������������������������������������������
//� Armazena no array aEstru a estrutura dos campos da tabela.      �
//�������������������������������������������������������������������
AADD(aEstru,{"E1_OK"        ,'C',02,0})
AADD(aEstru,{"E1_FILIAL"    ,'C',04,0})
AADD(aEstru,{"E1_PREFIXO"   ,'C',03,0})
AADD(aEstru,{"E1_NUM"       ,'C',09,0})
AADD(aEstru,{"E1_PARCELA"   ,'C',cTamParc,0})
AADD(aEstru,{"E1_TIPO"      ,'C',03,0})
AADD(aEstru,{"E1_PORTADO"   ,'C',03,0})
AADD(aEstru,{"E1_AGEDEP"    ,'C',05,0})
AADD(aEstru,{"E1_CONTA"     ,'C',10,0})
AADD(aEstru,{"E1_NUMBCO"    ,'C',17,0})
AADD(aEstru,{"E1_NUMBOR"    ,'C',06,0})
AADD(aEstru,{"E1_CLIENTE"   ,'C',06,0})
AADD(aEstru,{"E1_LOJA"      ,'C',04,0})
AADD(aEstru,{"E1_NOMCLI"    ,'C',20,0})
AADD(aEstru,{"E1_EMISSAO"   ,'D',08,0})
AADD(aEstru,{"E1_VENCTO"    ,'D',08,0})
AADD(aEstru,{"E1_VENCREA"   ,'D',08,0})
AADD(aEstru,{"E1_VALOR"     ,'N',14,2})
AADD(aEstru,{"E1_SALDO"     ,'N',14,2})
AADD(aEstru,{"E1_DESCFIN"   ,'N',05,2})
AADD(aEstru,{"E1_TIPODES"   ,'C',01,0})
AADD(aEstru,{"E1_DECRESC"   ,'N',14,2})
AADD(aEstru,{"E1_BCO1"      ,'C',03,0})

//���������������������������������������������������������������������
//� Armazena no array aCampos o nome, picture e descricao dos campos. �
//���������������������������������������������������������������������
AADD( aCampos ,{"E1_OK"       ,""," "           ," "})
AADD( aCampos ,{"E1_FILIAL"   ,"","Filial"      ,PesqPict("SE1","E1_FILIAL")})
AADD( aCampos ,{"E1_PREFIXO"  ,"","Prefixo"     ,PesqPict("SE1","E1_PREFIXO")})
AADD( aCampos ,{"E1_NUM"      ,"","Numero"      ,PesqPict("SE1","E1_NUM")})
AADD( aCampos ,{"E1_PARCELA"  ,"","Parcela"     ,PesqPict("SE1","E1_PARCELA")})
AADD( aCampos ,{"E1_TIPO"     ,"","Tipo"        ,PesqPict("SE1","E1_TIPO")})
AADD( aCampos ,{"E1_PORTADO"  ,"","Banco"       ,PesqPict("SE1","E1_PORTADO")})
AADD( aCampos ,{"E1_AGEDEP"   ,"","Agencia"     ,PesqPict("SE1","E1_AGEDEP")})
AADD( aCampos ,{"E1_CONTA"    ,"","Conta"       ,PesqPict("SE1","E1_CONTA")})
AADD( aCampos ,{"E1_NUMBCO"   ,"","N� no Banco" ,PesqPict("SE1","E1_NUMBCO")})
AADD( aCampos ,{"E1_NUMBOR"   ,"","Bordero"     ,PesqPict("SE1","E1_NUMBOR")})
AADD( aCampos ,{"E1_CLIENTE"  ,"","Cliente"     ,PesqPict("SE1","E1_CLIENTE")})
AADD( aCampos ,{"E1_LOJA"     ,"","Loja"        ,PesqPict("SE1","E1_LOJA")})
AADD( aCampos ,{"E1_NOMCLI"   ,"","Nome"        ,PesqPict("SE1","E1_NOMCLI")})
AADD( aCampos ,{"E1_EMISSAO"  ,"","Emissao"     ,PesqPict("SE1","E1_EMISSAO")})
AADD( aCampos ,{"E1_VENCTO"   ,"","Vencto"      ,PesqPict("SE1","E1_VENCTO")})
AADD( aCampos ,{"E1_VENCREA"  ,"","Vencto Real" ,PesqPict("SE1","E1_VENCREA")})
AADD( aCampos ,{"E1_VALOR"    ,"","Valor"       ,PesqPict("SE1","E1_VALOR",14,2)})
AADD( aCampos ,{"E1_SALDO"    ,"","Saldo"       ,PesqPict("SE1","E1_SALDO",14,2)})
AADD( aCampos ,{"E1_DESCFIN"  ,"","% Desconto"  ,PesqPict("SE1","E1_DESCFIN",5,2)})
AADD( aCampos ,{"E1_TIPODES"  ,"","Tipo Descont",PesqPict("SE1","E1_TIPODES")})
AADD( aCampos ,{"E1_DECRESC"  ,"","Decrescimo"  ,PesqPict("SE1","E1_DECRESC",14,2)})
AADD( aCampos ,{"E1_BCO1"     ,"","Banco 1"     ,PesqPict("SA1","A1_BCO1")})

//���������������������������������������������������������������������������������������������
//� Cria o arquivo fisicamente no diretorio "/StartPath/".                                    �
//� Se o 2o parametro dFwTemporaryTableab for .T. cria o arquivo, se .F. retorna um nome aleatorio.   �
//���������������������������������������������������������������������������������������������
cArqTRB1 := FwTemporaryTable(aEstru,.T.)
cArqTRB2 := FwTemporaryTable(Nil   ,.F.)
cArqTRB3 := FwTemporaryTable(Nil   ,.F.)
cArqTRB4 := FwTemporaryTable(Nil   ,.F.)

//�������������������������������������������������������������������
//� Verifica se ja existe um arquivo com mesmo nome, se sim deleta. �
//�������������������������������������������������������������������
If Select("TRB") <> 0
	TRB->(dbCloseArea())
EndIf

//�������������������������������������������������������������������
//� Permite o uso do arquivo criado dentro do protheus.             �
//�������������������������������������������������������������������
Use &cArqTRB1 Alias TRB NEW

//�������������������������������������������������������������������
//� Cria os indices para o arquivo.                                 �
//�������������������������������������������������������������������
//cFilter := "ALLTRIM(E1_PORTADO) == '' .Or. E1_PORTADO = '" + MV_PAR05 + "' "
cFilter := "E1_PORTADO = '" + MV_PAR21 + "' "

IndRegua("TRB",cArqTRB1,cIndTRB1,,cFilter,OemToAnsi("Selecionando Registros..."));dbClearIndex()
IndRegua("TRB",cArqTRB2,cIndTRB2,,,OemToAnsi("Selecionando Registros..."));dbClearIndex()
IndRegua("TRB",cArqTRB3,cIndTRB3,,,OemToAnsi("Selecionando Registros..."));dbClearIndex()
IndRegua("TRB",cArqTRB4,cIndTRB4,,,OemToAnsi("Selecionando Registros..."));dbClearIndex()

//�������������������������������������������������������������������
//� Agrega um arquivo de indice a um Alias ativo no sistema.        �
//�������������������������������������������������������������������
dbSelectArea("TRB")
dbSetIndex(cArqTRB1+OrdBagExt())
dbSetIndex(cArqTRB2+OrdBagExt())
dbSetIndex(cArqTRB3+OrdBagExt())
dbSetIndex(cArqTRB4+OrdBagExt())

//�������������������������������������������������������������������
//� Query para selecao dos dados.                                   �
//�������������������������������������������������������������������
/*
cQuery := "SELECT E1_FILIAL, E1_PREFIXO,E1_NUM,E1_PARCELA,E1_PORTADO,E1_AGEDEP,E1_CONTA,E1_TIPO,E1_NATUREZ,E1_CLIENTE,E1_LOJA,E1_NOMCLI,"
cQuery += " E1_EMISSAO,E1_VENCTO,E1_VENCREA,E1_VALOR,E1_SALDO, E1_DESCFIN,E1_TIPODES,E1_NUMBCO, E1_DECRESC, E1_NUMBOR"
cQuery += " FROM "+RetSqlName("SE1")
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND E1_FILIAL  =       '"+ xFILIAL("SE1")  +"'"
cQuery += " AND E1_PREFIXO BETWEEN '"+MV_PAR01+"' AND '"+MV_PAR02+"'"
cQuery += " AND E1_NUM     BETWEEN '"+MV_PAR03+"' AND '"+MV_PAR04+"'"
cQuery += " AND E1_NUMBOR  BETWEEN '"+MV_PAR09+"' AND '"+MV_PAR10+"'"
cQuery += " AND (E1_PORTADO =      '"+MV_PAR05+"' OR  E1_PORTADO = ' ')"
cQuery += " AND E1_SALDO <> 0"
cQuery += " AND SUBSTRING(E1_TIPO,3,1)  <> '-'"
*/

cQuery := "SELECT E1_FILIAL, E1_PREFIXO,E1_NUM,E1_PARCELA,E1_PORTADO,E1_AGEDEP,E1_CONTA,E1_TIPO,E1_NATUREZ,E1_CLIENTE,E1_LOJA,E1_NOMCLI,"
//cQuery += " E1_EMISSAO,E1_VENCTO,E1_VENCREA,E1_VALOR,E1_SALDO, E1_DESCFIN,E1_TIPODES,E1_NUMBCO,E1_DECRESC,E1_NUMBOR,A1_BOLETO,A1_BCO1,C5_CONVENI"
cQuery += " E1_EMISSAO,E1_VENCTO,E1_VENCREA,E1_VALOR,E1_SALDO, E1_DESCFIN,E1_TIPODES,E1_NUMBCO,E1_DECRESC,E1_NUMBOR,A1_BCO1"
cQuery += " FROM "+RetSqlName("SE1")+" SE1, "+RetSqlName("SA1")+" SA1
//, "+RetSqlName("SC5")+" SC5
cQuery += " WHERE SE1.D_E_L_E_T_ = ' ' AND SA1.D_E_L_E_T_ = ' '"
// AND SC5.D_E_L_E_T_ = ' '"
//cQuery += " AND SE1.E1_FILIAL  = '"+ xFILIAL("SE1")  +"'"
cQuery += " AND SA1.A1_FILIAL  = '"+ xFILIAL("SA1")  +"'"
//cQuery += " AND SC5.C5_FILIAL  = '"+ xFILIAL("SC5")  +"'"
cQuery += " AND SE1.E1_PREFIXO BETWEEN '"+MV_PAR01+"' AND '"+MV_PAR02+"'"
cQuery += " AND SE1.E1_NUM     BETWEEN '"+MV_PAR03+"' AND '"+MV_PAR04+"'"
cQuery += " AND SE1.E1_NUMBOR  BETWEEN '"+MV_PAR08+"' AND '"+MV_PAR09+"'"
cQuery += " AND SE1.E1_VENCREA BETWEEN '"+DTOS(MV_PAR14)+"' AND '"+DTOS(MV_PAR15)+"'"
cQuery += " AND SE1.E1_EMISSAO BETWEEN '"+DTOS(MV_PAR19)+"' AND '"+DTOS(MV_PAR20)+"'"
cQuery += " AND SE1.E1_PORTADO =      '"+MV_PAR21+"'"
cQuery += " AND SE1.E1_SALDO <> 0"
cQuery += " AND SE1.E1_TIPO = 'NF'"
cQuery += " AND SE1.E1_CLIENTE = SA1.A1_COD"
cQuery += " AND SE1.E1_LOJA    = SA1.A1_LOJA"
//cQuery += " AND SE1.E1_PEDIDO  = SC5.C5_NUM"

MemoWrite("C:\teste\BRADESCO.sql",cQuery)

TCQUERY cQuery NEW ALIAS "FIN"

dbSelectArea("FIN")
Count To nRecTRB

dbSelectArea("FIN")
FIN->(dbGoTop())

While FIN->(!Eof())
	
	dbSelectArea("TRB")
	TRB->(dbGoTop())
	
	RecLock("TRB",.T.)
	//Pela regra definida com o Sr. Leandro do Financeiro
	//somente vai ser SIM no campo A1_BOLETO os casos onde
	//o boleto eh impresso na Empresa e obrigatoriamente eles
	//serao do Bradesco, os demais tambem sao boletos, porem
	//impressos no banco e obrigatoriamente Banco do Brasil.
	
	//	If ALLTRIM(FIN->A1_BOLETO) == "S" .And. ALLTRIM(FIN->C5_CONVENI) $ "8#9"//Convenio 8-Contra Entrega e 9-Via Boleto
	TRB->E1_OK := cMarkado
	//Atualiza as variaveis da tela
	nQtdTit++
	nValor += FIN->E1_SALDO
	//	Else
	//	   TRB->E1_OK := Space(2)
	//	EndIf
	TRB->E1_FILIAL   := FIN->E1_FILIAL
	TRB->E1_PREFIXO  := FIN->E1_PREFIXO
	TRB->E1_NUM      := FIN->E1_NUM
	TRB->E1_PARCELA  := FIN->E1_PARCELA
	TRB->E1_TIPO     := FIN->E1_TIPO
	TRB->E1_CLIENTE  := FIN->E1_CLIENTE
	TRB->E1_LOJA     := FIN->E1_LOJA
	TRB->E1_NOMCLI   := FIN->E1_NOMCLI
	TRB->E1_EMISSAO  := STOD(FIN->E1_EMISSAO)
	TRB->E1_VENCTO   := STOD(FIN->E1_VENCTO)
	TRB->E1_VENCREA  := STOD(FIN->E1_VENCREA)
	TRB->E1_VALOR    := FIN->E1_VALOR
	TRB->E1_SALDO    := FIN->E1_SALDO
	TRB->E1_NUMBCO   := FIN->E1_NUMBCO
	TRB->E1_PORTADO  := FIN->E1_PORTADO
	TRB->E1_AGEDEP   := FIN->E1_AGEDEP
	TRB->E1_CONTA    := FIN->E1_CONTA
	TRB->E1_DESCFIN  := FIN->E1_DESCFIN
	TRB->E1_TIPODES  := FIN->E1_TIPODES
	TRB->E1_DECRESC  := FIN->E1_DECRESC
	TRB->E1_NUMBOR   := FIN->E1_NUMBOR
	TRB->E1_BCO1     := FIN->A1_BCO1
	MsUnlock("TRB")
	
	FIN->(dbSkip())
EndDo

//dbSelectArea("FIN")
//dbCloseArea("FIN")

Return
/*/
���������������������������������������������������������������������������������
�����������������������������������������������������������������������������Ŀ��
���Fun��o    �  AjustSX1    � Autor                         � Data � 30/11/01 ���
�����������������������������������������������������������������������������Ĵ��
���Descri��o � Adiciona perguntas no SX1                                      ���
�����������������������������������������������������������������������������Ĵ��
���Uso       � MT416U                                                         ���
������������������������������������������������������������������������������ٱ�
���������������������������������������������������������������������������������
����������������������������������������������������������������������������������
/*/
Static Function AjustaSX1()

Local aArea	  := GetArea()
Local nx      := 0
Local ny      := 0
Local nPosCpo := 0
Local aReg	:= {}
//��������������������������������������������������������������Ŀ
//� Variavel lPyme utilizada para Tratamento do Siga PyME        �
//����������������������������������������������������������������
Local lPyme:= Iif(Type("__lPyme") <> "U",__lPyme,.F.)

aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","01"},{"X1_PERGUNT","Prefixo de"}		,{"X1_VARIAVL","mv_ch1"},{"X1_TIPO","C"},{"X1_TAMANHO",3}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par01"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","02"},{"X1_PERGUNT","Prefixo at�"}	,{"X1_VARIAVL","mv_ch2"},{"X1_TIPO","C"},{"X1_TAMANHO",3}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par02"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","03"},{"X1_PERGUNT","N. Fiscal de"}	,{"X1_VARIAVL","mv_ch3"},{"X1_TIPO","C"},{"X1_TAMANHO",9}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par03"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","04"},{"X1_PERGUNT","N. Fiscal At�"}	,{"X1_VARIAVL","mv_ch4"},{"X1_TIPO","C"},{"X1_TAMANHO",9}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par04"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","05"},{"X1_PERGUNT","Banco "}			,{"X1_VARIAVL","mv_ch5"},{"X1_TIPO","C"},{"X1_TAMANHO",3}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par05"},{"X1_F3","SA6"},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","06"},{"X1_PERGUNT","Agencia"}		,{"X1_VARIAVL","mv_ch6"},{"X1_TIPO","C"},{"X1_TAMANHO",5}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par06"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","07"},{"X1_PERGUNT","Conta "}			,{"X1_VARIAVL","mv_ch7"},{"X1_TIPO","C"},{"X1_TAMANHO",10},{"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par07"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","08"},{"X1_PERGUNT","Bordero de"}		,{"X1_VARIAVL","mv_ch8"},{"X1_TIPO","C"},{"X1_TAMANHO",6}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par08"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","09"},{"X1_PERGUNT","Bordero At�"}	,{"X1_VARIAVL","mv_ch9"},{"X1_TIPO","C"},{"X1_TAMANHO",6}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par09"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","10"},{"X1_PERGUNT","Cliente de"}		,{"X1_VARIAVL","mv_cha"},{"X1_TIPO","C"},{"X1_TAMANHO",6}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par10"},{"X1_F3","SA1"},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","11"},{"X1_PERGUNT","Loja Cli. de"}	,{"X1_VARIAVL","mv_chb"},{"X1_TIPO","C"},{"X1_TAMANHO",2}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par11"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","12"},{"X1_PERGUNT","Cliente At�"}	,{"X1_VARIAVL","mv_chc"},{"X1_TIPO","C"},{"X1_TAMANHO",6}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par12"},{"X1_F3","SA1"},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","13"},{"X1_PERGUNT","Loja Cli. At�"}	,{"X1_VARIAVL","mv_chd"},{"X1_TIPO","C"},{"X1_TAMANHO",2}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par13"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","14"},{"X1_PERGUNT","Vencimento de"}	,{"X1_VARIAVL","mv_che"},{"X1_TIPO","D"},{"X1_TAMANHO",8}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par14"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","15"},{"X1_PERGUNT","Vencimento At�"}	,{"X1_VARIAVL","mv_chf"},{"X1_TIPO","D"},{"X1_TAMANHO",8}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par15"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","16"},{"X1_PERGUNT","Instru��o 1"}	,{"X1_VARIAVL","mv_chg"},{"X1_TIPO","C"},{"X1_TAMANHO",50},{"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par16"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","17"},{"X1_PERGUNT","Instru��o 2"}	,{"X1_VARIAVL","mv_chh"},{"X1_TIPO","C"},{"X1_TAMANHO",50},{"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par17"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","18"},{"X1_PERGUNT","Instru��o 3"}	,{"X1_VARIAVL","mv_chi"},{"X1_TIPO","C"},{"X1_TAMANHO",50},{"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par18"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","19"},{"X1_PERGUNT","Emiss�o de"}		,{"X1_VARIAVL","mv_chj"},{"X1_TIPO","D"},{"X1_TAMANHO",8}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par19"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","20"},{"X1_PERGUNT","Emiss�o At�"}	,{"X1_VARIAVL","mv_chk"},{"X1_TIPO","D"},{"X1_TAMANHO",8}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par20"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","21"},{"X1_PERGUNT","Banco Busca "}	,{"X1_VARIAVL","mv_chl"},{"X1_TIPO","C"},{"X1_TAMANHO",3}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par21"},{"X1_F3","SA6"},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","22"},{"X1_PERGUNT","Agencia Busca"}	,{"X1_VARIAVL","mv_chm"},{"X1_TIPO","C"},{"X1_TAMANHO",5}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par22"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})
aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","23"},{"X1_PERGUNT","Conta Busca"}	,{"X1_VARIAVL","mv_chn"},{"X1_TIPO","C"},{"X1_TAMANHO",10},{"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","G"},{"X1_VAR01","mv_par23"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01",""},{"X1_DEF02",""}})

//aadd(aReg,{{"X1_GRUPO",cPerg},{"X1_ORDEM","19"},{"X1_PERGUNT","Correspondente"}	,{"X1_VARIAVL","mv_chj"},{"X1_TIPO","N"},{"X1_TAMANHO",1}, {"X1_DECIMAL",0},{"X1_PRESEL",0},{"X1_GSC","C"},{"X1_VAR01","mv_par19"},{"X1_F3",""},{"X1_PYME","S"},{"X1_DEF01","987-INVISTA"},{"X1_DEF02","990-RED"},{"X1_DEF03","997-OPNIAO"},{"X1_DEF04","000-TODOS"}})

//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)

For nx := 1 to Len(aReg)
	//Retirado Sangelles 22/03/2022 ->If !dbSeek(aReg[nx][1][2]+aReg[nx][2][2])
	cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		cQry := " SELECT * FROM " 				  + cPulaLinha
		cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry += " WHERE " 						  + cPulaLinha
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
		cQry += " AND X1_GRUPO = '" +aReg[nx][1][2]+aReg[nx][2][2]+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)

		RecLock("SX1",.T.)
		For ny := 1 to Len(aReg[nx])
			nPosCpo := SX1->(FieldPos(aReg[nx][ny][1]))
			If nPosCpo > 0
				SX1->(FieldPut(nPosCpo,aReg[nx][ny][2]))
			EndIf
		Next ny
		MsUnlock()
	Else
		If lPyme .And. SX1->X1_PYME == "N"
			RecLock("SX1",.F.)
			SX1->X1_PYME := "S"
			MsUnlock()
		EndIf
	EndIf
Next nx

RestArea(aArea)
Return

/*/
���������������������������������������������������������������������������������
�����������������������������������������������������������������������������Ŀ��
���Fun��o    �  Cnab_4      � Autor                         � Data � 30/11/01 ���
�����������������������������������������������������������������������������Ĵ��
���Descri��o � Tratativa na parcela                                           ���
�����������������������������������������������������������������������������Ĵ��
���Uso       �                                                                ���
������������������������������������������������������������������������������ٱ�
���������������������������������������������������������������������������������
����������������������������������������������������������������������������������
/*/

User Function Cnab_4()

 Local cNum := TRB->E1_NUM
 Local cPcl := TRB->E1_PARCELA
 Local cRet := ""

 if empty(AllTrim(cPcl))
  cRet := cNum+"-0"
 elseif AllTrim(Str(Val(cPcl)))$"1"
  cRet := cNum+"-1"
 elseif AllTrim(Str(Val(cPcl)))$"2"
  cRet := cNum+"-2"
 elseif AllTrim(Str(Val(cPcl)))$"3"
  cRet := cNum+"-3"
 elseif AllTrim(Str(Val(cPcl)))$"4"
  cRet := cNum+"-4"
 elseif AllTrim(Str(Val(cPcl)))$"5"
  cRet := cNum+"-5"
 elseif AllTrim(Str(Val(cPcl)))$"6"
  cRet := cNum+"-6"
 elseif AllTrim(Str(Val(cPcl)))$"7"
  cRet := cNum+"-7"
 elseif AllTrim(Str(Val(cPcl)))$"8"
  cRet := cNum+"-8"
 elseif AllTrim(Str(Val(cPcl)))$"9"
  cRet := cNum+"-9"
 elseif AllTrim(Str(Val(cPcl)))$"10"
  cRet := cNum+"-A"
 elseif AllTrim(Str(Val(cPcl)))$"11"
  cRet := cNum+"-B"
 elseif AllTrim(Str(Val(cPcl)))$"12"
  cRet := cNum+"-C"
 elseif AllTrim(Str(Val(cPcl)))$"13"
  cRet := cNum+"-D"
 elseif AllTrim(Str(Val(cPcl)))$"14"
  cRet := cNum+"-E"
 elseif AllTrim(Str(Val(cPcl)))$"15"
  cRet := cNum+"-F"
 elseif AllTrim(Str(Val(cPcl)))$"16"
  cRet := cNum+"-G"
 elseif AllTrim(Str(Val(cPcl)))$"17"
  cRet := cNum+"-H"
 elseif AllTrim(Str(Val(cPcl)))$"18"
  cRet := cNum+"-I"
 elseif AllTrim(Str(Val(cPcl)))$"19"
  cRet := cNum+"-J"
 elseif AllTrim(Str(Val(cPcl)))$"20"
  cRet := cNum+"-K"
 elseif AllTrim(Str(Val(cPcl)))$"21"
  cRet := cNum+"-L"
 elseif AllTrim(Str(Val(cPcl)))$"22"
  cRet := cNum+"-M"
 elseif AllTrim(Str(Val(cPcl)))$"23"
  cRet := cNum+"-N"
 elseif AllTrim(Str(Val(cPcl)))$"24"
  cRet := cNum+"-O"
 elseif AllTrim(Str(Val(cPcl)))$"25"
  cRet := cNum+"-P"
 elseif AllTrim(Str(Val(cPcl)))$"26"
  cRet := cNum+"-Q"
 elseif AllTrim(Str(Val(cPcl)))$"27"
  cRet := cNum+"-R"
 elseif AllTrim(Str(Val(cPcl)))$"28"
  cRet := cNum+"-S"
 elseif AllTrim(Str(Val(cPcl)))$"29"
  cRet := cNum+"-T"
 elseif AllTrim(Str(Val(cPcl)))$"30"
  cRet := cNum+"-U"
 elseif AllTrim(Str(Val(cPcl)))$"31"
  cRet := cNum+"-V"
 elseif AllTrim(Str(Val(cPcl)))$"32"
  cRet := cNum+"-W"
 elseif AllTrim(Str(Val(cPcl)))$"33"
  cRet := cNum+"-X"
 elseif AllTrim(Str(Val(cPcl)))$"34"
  cRet := cNum+"-Y"
 elseif AllTrim(Str(Val(cPcl)))$"35"
  cRet := cNum+"-Z"
 endif

Return(AllTrim(cRet))
