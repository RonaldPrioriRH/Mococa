#INCLUDE "DBTREE.ch"
#Include "PROTHEUS.Ch"
#include "topconn.ch"
#Include "xIngqipr050.ch"
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    � QIPR050  � Autor �     Marcelo Pimentel  � Data � 08.04.98 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Certificado de Qualidade.                                  ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � SigaQIP                                                    ���
�������������������������������������������������������������������������Ĵ��
���String    � Ultimo utilizado -> 0036       							  ���
�������������������������������������������������������������������������Ĵ��
���			ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL.			  ���
�������������������������������������������������������������������������Ĵ��
���Programador � Data	� BOPS �  Motivo da Alteracao 					  ���
�������������������������������������������������������������������������Ĵ��
���Paulo Em�dio�16/08/00�Melhor� Revisao e compatibilizacao da funcao     ���
���            �        �      � CTOD().                               	  ���
���Marcelo Pim.�26/03/01�------�Inclusao da impressao grafica no relatorio���
���Marcelo Pim.�10/04/01�7255  �Verificacao no cadastro de especificacao  ���
���            �        �      �de produtos o campo Consta Certificado P/ ���
���            �        �      �que seja impresso somente se for = "S"    ���
���Marcelo Pim.�21/08/02�------�Melhoria na apresentacao da Tela de Para- ���
���            �        �      �metros.                                   ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function XIQIPR050() 
	Local oDlgGet
	Local oListBox
	Local nItem		:=0             
	Private lEnd	:=.F.
	Private aListBox:={}
	Private cPerg1	:="QPR051"
	Private  __cPRODUTO := CriaVar("QP6_PRODUT") //Codigo do Produto, quando a Especificacao for em Grupo      
	Private lProduto   := .F.
    Private lLabmic := .F.
    Private cIdioma := "Ingl�s"//Portug�s//Espanhol
    Private cGrupo := ""

	//��������������������������������������������������������������Ŀ
	//� Janela Principal                                             �
	//����������������������������������������������������������������
	AADD(aListBox,OemToAnsi(STR0004))		//" Texto Superior "
	AADD(aListBox,OemToAnsi(STR0005))		//" Texto Inferior "
	AADD(aListBox,OemToAnsi(STR0034))		//" Informacoes Complementares "
	AADD(aListBox,OemToAnsi(STR0006))		//" Impressao "

	//����������������������������������������������������������������Ŀ
	//� Ativa ListBox com opcoes para o array da configuracao          �
	//������������������������������������������������������������������
	DEFINE MSDIALOG oDlgGet TITLE STR0007 FROM  0,0	TO 217,297 OF oMainWnd PIXEL 	//"Certificado de Qualidade"
	@ 01,05 SAY OemToAnsi(STR0008)	SIZE 100, 07 OF oDlgGet PIXEL					//"Itens de Configuracao"
	@ 10,05 LISTBOX oListBox VAR nItem  ITEMS aListBox  ON DBLCLICK Iif(nItem<=3,R050TEXT(oListBox),Pergunte(cPerg1,.T.)) SIZE 110,90 PIXEL OF oDlgGet
	DEFINE SBUTTON FROM 10, 120 TYPE 6 ACTION (R050IMP(),oDlgGet:End()) ENABLE OF oDlgGet
	DEFINE SBUTTON FROM 26, 120 TYPE 2 ACTION oDlgGet:End() ENABLE OF oDlgGet

	ACTIVATE MSDIALOG oDlgGet CENTERED
Return(.T.)
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    �R050Text    �Autor� Marcelo Pimentel      � Data � 08.04.98 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o �Ativa Tela para preenchimento do conteudo relacionado com o ���
���          �ListBox.                                                    ���
�������������������������������������������������������������������������Ĵ��
��� Uso      �QIPR050                                                     ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function R050Text(oListBox)
	Local oDlgGet2
	Local oTexto
	Local cTexto 		:= ""
	Local oFontDialog	:= TFont():New("Arial",6,15,,.T.)

	nAt:=oListBox:nAt

	cNomeArq := "X"
	nHdl:=MSFCREATE(cNomeArq,0)
	If nHdl <= -1
		HELP(" ",1,"NODIRCQ")
		Return .T.
	Else
		If File(cNomeArq)
			FCLOSE(nHdl)
			FERASE(cNomeArq)
		Endif
	Endif

	cNomeArq := "QPR050"+Str(nAt,1)+".TXT"

	While .T.
		//��������������������������������������������������Ŀ
		//� Le arquivo                                       �
		//����������������������������������������������������
		cTexto:=MemoRead(cNomeArq)

		DEFINE MSDIALOG oDlgGet2 FROM	62,100 TO 345,610 TITLE  OemToAnsi(STR0008) PIXEL FONT oFontDialog		//"Itens de Configura��o"
		@ 003, 004 TO 027, 250 LABEL "" 	OF oDlgGet2 PIXEL
		@ 040, 004 TO 110, 250				OF oDlgGet2 PIXEL

		@ 013, 010 MSGET aListBox[nAt]		             WHEN .F. SIZE 235, 010 OF oDlgGet2 PIXEL
		@ 050, 010 GET oTexto VAR cTexto MEMO NO VSCROLL WHEN .T. SIZE 235, 051 OF oDlgGet2 PIXEL

		DEFINE SBUTTON FROM 120,190 TYPE 1 ACTION (MemoWrit( cNomeArq,cTexto ),FCLOSE(cNomeArq),oDlgGet2:End()) ENABLE OF oDlgGet2
		DEFINE SBUTTON FROM 120,220 TYPE 2 ACTION oDlgGet2:End() ENABLE OF oDlgGet2

		ACTIVATE MSDIALOG oDlgGet2 CENTERED
		Exit
	EndDo

Return .T.
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    � R050Imp  � Autor �     Marcelo Pimentel  � Data � 08.04.98 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Certificado                                                ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � SigaQIP                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function R050Imp()

	//��������������������������������������Ŀ
	//� Par�metros para a fun��o SetPrint () �
	//����������������������������������������
	LOCAL wnrel		:="QIPR050"
	LOCAL cString	:="QPR"
	LOCAL cDesc1	:=STR0009		//"Neste relatorio sera impresso os Certificados"
	LOCAL cDesc2	:=""
	LOCAL cDesc3	:=""
	Local nVias     :=0
	Local cNota     :=""
	Local cSerie    :=""
	Local cRevi     :=""
	Local nImpEns   :=0
	Local lAchou    :=.F. 
	Local cImprCQ   := GETMV("MV_QIMPRCQ")

	// �����������������������������������Ŀ
	// � Par�metros para a fun��o Cabec()  �
	// �������������������������������������
	PRIVATE cTitulo 	:=STR0010	//"Certificado Qualidade"
	PRIVATE cRelatorio	:="QIPR050"
	PRIVATE nTamanho	:="G"

	//������������������������������������������������Ŀ
	//� Vari�veis utilizadas pela fun��o SetDefault () �
	//��������������������������������������������������
	PRIVATE aReturn 	:= {STR0011, 1,STR0012,  1, 2, 1, "",1 }		//"Zebrado"###"Administracao"
	PRIVATE nLastKey 	:= 0
	PRIVATE cPerg		:= "XQPR050"
	PRIVATE cPergR		:= "QPR50R"

	//��������������������������������������������������������������Ŀ
	//� Variaveis utilizadas para parametros                         �
	//� mv_par01           // Cliente                                �
	//� mv_par02           // Loja do Cliente                        �
	//� mv_par03           // Produto                                �
	//� mv_par04           // Data da Producao                       �
	//� mv_par05           // Lote                                   �
	//� mv_par06           // Lote                                   �
	//� mv_par07           // Nr. de Vias                            �
	//� mv_par08           // Revisao                                �
	//� mv_par09           // Impr. Ensaio Texto (Primeira/Todas)    �
	//� mv_par10           // Nota Fiscal                            �
	//� mv_par11           // Serie                                  �
	//� mv_par12           // Ordem de Produ��o                                 �
	//����������������������������������������������������������������

	Pergunte(cPerg,.F.)
    
    Private cProduto := AllTrim(MV_PAR03)
   
	//��������������������������������������������������������������Ŀ
	//� Envia controle para a funcao SETPRINT                        �
	//����������������������������������������������������������������
	If FunName() == "QIPA215"           

		Pergunte(cPergR,.F.)
		wnrel := SetPrint(cString,wnrel,cPergR,@ctitulo,cDesc1,cDesc2,cDesc3,.F.,"",.F.,nTamanho)

		//Salva variaveis do pergunte QIPR501
		nVias     :=mv_par01
		cRevi     :=Iif(Empty(AllTrim(QPK->QPK_REVI)),QA_UltRevEsp(QPK->QPK_PRODUT,,,,"QIP"),QPK->QPK_REVI)
		nImpEns   :=mv_par03
		cNota     :=mv_par04
		cSerie    :=mv_par05

		Pergunte(cPerg,.F.)

		//Atualiza variaveis do pergunte padrao do relatorio QIPR050
		mv_par01  := cIPCLIENT        // Cliente                                
		mv_par02  := cIPLoj           // Loja do Cliente                        
		mv_par03  := QPK->QPK_PRODUT  // Produto  

		//Pesquisa data da medi��o.
		dbSelectArea("QPR")     
		dbSetOrder(9)
		If dbSeek(xFilial("QPR")+QPK->QPK_OP+QPK->QPK_LOTE+QPK->QPK_NUMSER)
			mv_par04  := QPR->QPR_DTENTR     
		Else 
			mv_par04  := QPK->QPK_DTPROD	
		EndIf                      

		mv_par05  := QPK->QPK_LOTE	   // Lote                                   
		mv_par06  := QPK->QPK_NUMSER  //  Numero do Lote                                   
		mv_par07  := nVias            // Nr. de Vias                            
		mv_par08  := cRevi            // Revisao                                
		mv_par09  := nImpEns          // Impr. Ensaio Texto (Primeira/Todas)    
		mv_par10  := cNota            // Nota Fiscal                            
		mv_par11  := cSerie           // Serie  
		mv_par12  := QPK->QPK_OP      // Ordem de Produ��o  

	Else
		wnrel := SetPrint(cString,wnrel,cPerg,@ctitulo,cDesc1,cDesc2,cDesc3,.F.,"",.F.,nTamanho)
		DbSelectArea("QPK")
		DbSetOrder(2)
		If DbSeek(xFilial("QPK")+MV_PAR03) 
			mv_par08 := Iif(alltrim(mv_par08) == '', Iif(Empty(AllTrim(QPK->QPK_REVI)),QA_UltRevEsp(QPK->QPK_PRODUT,,,,"QIP"),QPK->QPK_REVI),mv_par08)
			While !EOF().AND. AllTrim(QPK->QPK_PRODUT) == AllTrim(MV_PAR03)
				If cImprCQ == "N"
					If DTOS(QPK->QPK_DTPROD) == DTOS(MV_PAR04) .AND. AllTrim(QPK_OP) == AllTrim(MV_PAR12) .AND. AllTrim(QPK_LOTE) == AllTrim(MV_PAR05) .AND.;
					AllTrim(QPK_NUMSER) == AllTrim(MV_PAR06) .AND. AllTrim(QPK_REVI) == AllTrim(MV_PAR08) .AND. !Empty(QPK_CERQUA)
						lAchou := .T.  
						Exit
					EndIf
					DbSkip()
				Else
					If DTOS(QPK->QPK_DTPROD) == DTOS(MV_PAR04) .AND. AllTrim(QPK_OP) == AllTrim(MV_PAR12) .AND. AllTrim(QPK_LOTE) == AllTrim(MV_PAR05) .AND.;
					AllTrim(QPK_NUMSER) == AllTrim(MV_PAR06) .AND. AllTrim(QPK_REVI) == AllTrim(MV_PAR08) 
						lAchou := .T.  
						Exit
					EndIf
					DbSkip() 
				Endif
			EndDo
			If !lAchou
				MsgInfo(STR0043) // "Identificada inconsistencia, favor verificar (Ordem de Producao + Lote + Num Serie + Produto + Revisao)"
				Return()
			EndIf   
		Else
			MsgInfo(STR0044) // "Identificada inconsistencia, favor verificar a chave (Produto + Data Producao)"
			return()
		EndIf

	EndIF

	If nLastKey == 27
		Set Filter to
		Return
	Endif

	SetDefault(aReturn,cString)

	If nLastKey == 27
		Set Filter to
		Return
	Endif

	RptStatus({|lEnd| A050Imp(@lEnd,wnRel,cString,cTitulo)},ctitulo)

Return .T.
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    � A050Imp  � Autor � Marcelo Pimentel      � Data � 08.04.98 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Rela��o dos Certificados                                   ���
�������������������������������������������������������������������������Ĵ��
���Sintaxe   � A050Imp(lEnd,wnRel,cString)                                ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � SigaQIP                                                    ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function A050Imp(lEnd,wnRel,cString,cTitulo)
	Local aMeses		:={STR0021,STR0022,STR0023,STR0024,STR0025,STR0026,STR0027,STR0028,STR0029,STR0030,STR0031,STR0032}	//"Janeiro"###"Fevereiro"###"Marco"###"Abril"###"Maio"###"Junho"###"Julho"###"Agosto"###"Setembro"###"Outubro"###"Novembro"###"Dezembro"
	Local dDat			:=Ctod("  /  /  ")
	Local cCliente		:=mv_par01
	Local cLoja			:=mv_par02
	Local cData			:=""
	Local cArqTxt		:=""
	Local cTexto		:=""
	Local cImpTxt		:=""
	Local cEnsaio		:=""
	Local cChave		:=""
	Local cSeek			:=""
	Local cTxtRes		:=""
	Local cTxt			:=""
	Local cLabor		:=""
	Local cRevi			:= If(Empty(mv_par08),QA_UltRevEsp(mv_par03,,,,"QIP"), mv_par08) 
	Local cLote			:=""
	Local cLaborat		:=""
	Local aTexto		:={}
	Local aTxtRes		:={}
	Local aLinha		:={}
	Local cImpLinha	:={}
	Local cbCont		:=00
	Local nVlrMin		:=999999
	Local nVlrMax		:=-999999
	Local nVlrUnic		:=0
	Local nC				:=0
	Local nCount		:=0
	Local nV				:=1
	Local nX				:=0
	Local nAmostra		:=0
	Local nPorcent		:=0
	Local lUnic			:=.T.
	Local nContador	:=1
	Local cOp			:=mv_par12
	Local cOperacao	:=""
	Local cRoteiro 	:=""
	Local CbTxt
	Local cNomArq		:=""
	Local cPrd 			:=mv_par03
	Local dDatOP		:=mv_par04
	Local cLot			:=Padr(mv_par05,TamSX3("QPR_LOTE")[1]) 
	Local cNumSer       :=Padr(mv_par06,TamSX3("QPR_NUMSER")[1]) 
	Local lEnsaio		:=.F.
	Local lChecaQQ7		:=.F.
	Local aAreaQPR		:= {}
	Local lImpTxt       := .T.
	Local lPula         := .T.
	Local nMedia        := 0
	Local nPosQPR       := 0
	Local nOrdQPR       := 0
	Local nPosQQ7       := 0
	Local nOrdQQ7       := 0
	Local nPosSA1       := 0
	Local nOrdSA1       := 0
	Local nPosQP6       := 0
	Local nOrdQP6       := 0
	Local nPosSC2       := 0
	Local nOrdSC2       := 0
	Local nRecQPR       := 0
	Local cAcentos 		:= ""

	Private Titulo 	 := cTitulo
	Private Cabec1 	 := ""
	Private Cabec2	 := ""
	Private	nomeprog := "QIPR050"
	Private cTamanho := "M"
	Private nTipo	 := 0

	//��������������������������������������������������������������Ŀ
	//� Variaveis utilizadas para Impressao do Cabecalho e Rodape    �
	//����������������������������������������������������������������
	li       := 80
	m_pag    := 1

	//��������������������������������������������������������������Ŀ
	//� Verifica se deve comprimir ou nao                            �
	//����������������������������������������������������������������
	nTipo := If(aReturn[4]==1,15,18)

	If Empty(mv_par12)
		dbSelectArea("QPR")
		dbSetOrder(6)
		DbSeek(xFilial("QPR")+cPrd+cRevi+Dtos(dDatOP)+cLot)
	Else 
		dbSelectArea("QPR")
		dbSetOrder(1)
		DbSeek(xFilial("QPR")+cOp)
	EndIf
	nPosQPR  := QPR->(RecNo())
	nOrdQPR  := QPR->(IndexOrd())


	dbSelectArea("SC2")
	dbSetOrder(1)
	If !Empty(QPR->QPR_OP)
		cSeek := QPR->QPR_OP
	Else
		cSeek := cOp
	Endif
	If dbSeek(xFilial("SC2")+cSeek)
		nPosSC2  := SC2->(RecNo())
		nOrdSC2  := SC2->(IndexOrd())
		cRoteiro := SC2->C2_ROTEIRO
	Endif

	dbSelectArea("QPK")
	dbSetOrder(1)
	If !Empty(QPR->QPR_OP)
		cSeek := QPR->QPR_OP+cLot+cNumser
	Else
		cSeek := cOp+cLot+cNumser
	Endif
	If dbSeek(xFilial("QPK")+cSeek)
		nPosQQ7  := QQ7->(RecNo())
		nOrdQQ7  := QQ7->(IndexOrd())
	Endif

	//��������������������������������������������������������������Ŀ
	//� Verifica se existe amarra��o Cliente x Produto               �
	//����������������������������������������������������������������
	If Empty(cCliente) .and. !Empty(QPR->QPR_CLIENT)
		cCliente := QPK->QPK_CLIENT
		cLoja    := QPK->QPK_LOJA
	EndIF 

	//��������������������������������������������������������������Ŀ
	//� Variaveis utilizadas para parametros                         �
	//� mv_par01           // Resultados:1-Minimo/Maximo 2-Vlr.Unico �
	//� mv_par02           // Observacao da Entrega:  1-Sim 2-Nao    �
	//� mv_par03           // Justificativa do Laudo: 1-Sim 2-Nao    �
	//����������������������������������������������������������������
	Pergunte(cPerg1,.F.)
	//��������������������������������������������������������������Ŀ
	//� Posiciona em Registros de outros arquivos                    �
	//����������������������������������������������������������������
	dbSelectArea("QQ7")
	dbSetOrder(1)
	If dbSeek(xFilial("QQ7")+QPR->QPR_PRODUT+cCliente+cLoja)
		nPosQQ7  := QQ7->(RecNo())
		nOrdQQ7  := QQ7->(IndexOrd())
	Endif

	dbSelectArea("SA1")
	dbSetOrder(1)
	If dbSeek(xFilial("SA1")+cCliente+cLoja)
		nPosSA1  := SA1->(RecNo())
		nOrdSA1  := SA1->(IndexOrd())
	Endif

	dbSelectArea("QP6")
	dbSetOrder(1)
	If !Empty(QPR->QPR_PRODUT)
		cSeek := QPR->QPR_PRODUT+Inverte(QPR->QPR_REVI)
	Else
		cSeek := cPrd+Inverte(cRevi)
	Endif
	If dbSeek(xFilial("QP6")+cSeek)
		nPosQP6  := QP6->(RecNo())
		nOrdQP6  := QP6->(IndexOrd())
	Endif

	dbSelectArea("QPL")
	dbSetOrder(3)
	If dbSeek(xFilial("QPL")+QPK->QPK_OP+QPK->QPK_LOTE+QPK->QPK_NUMSER+cRoteiro+Space(TamSX3("QPL_OPERAC")[1])+Space(TamSX3("QPL_LABOR")[1])) .AND. QPR->QPR_OPERAC $ mv_par13
		dbSelectArea("QPD")
		dbSetOrder(1)
		If dbSeek(xFilial("QPD")+QPL->QPL_LAUDO)
			If QPD->QPD_CATEG == '4'
				MessageDlg(OemToAnsi(STR0035),OemToAnsi(STR0036),2)		//'Devido o laudo estar com Libera��o Urgente, n�o ser� poss�vel emitir o Certificado de Qualidade.'###'Aten��o'
				dbSelectArea("QPR")
				RetIndex("QPR")
				dbSetOrder(1)
				Set Filter To
				If File(cNomArq+OrdBagExt())
					Ferase(cNomArq+OrdBagExt())
				EndIf
				Return .T.
			EndIf	
		EndIf
	EndIf

	//��������������������������������������������������������������Ŀ
	//� Inclusao do Certificado de qualidade ao Titulo.              �
	//����������������������������������������������������������������
	cTitulo += " - " +QPK->QPK_CERQUA

	If Empty(mv_par07)
		mv_par07 := 1
	EndIf

	SetRegua(mv_par07)

	For nContador := 1 To mv_par07
		IncRegua(nContador)		//Incrementar a Regua
		If nContador > 1
			//Retorna a Ordem/Posicao Atual dos arquivos para  executar uma  nova  impressao do certificado
			QPR->(DbGoto(nPosQPR))
			QPR->(DbSetOrder(nOrdQPR))
			QQ7->(DbGoto(nPosQQ7))
			QQ7->(DbSetOrder(nOrdQQ7))
			SA1->(DbGoto(nPosSA1))
			SA1->(DbSetOrder(nOrdSA1))
			QP6->(DbGoto(nPosQP6))
			QP6->(DbSetOrder(nOrdQP6))
			SC2->(DbGoto(nPosSC2))
			SC2->(DbSetOrder(nOrdSC2))
			cOperacao:= ""
			cLabor:= ""
			lEnsaio		:=.F.
		EndIf
		m_pag := 1
		Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)

		cData := AllTrim(SM0->M0_CIDENT)+","+ Str(day(dDataBase)) + STR0014 + aMeses[month(dDataBase)] + STR0014 + StrZero(year(dDataBase),4)		//" de "###" de "
		@ Li,132-Len(cData) PSAY cData
		Li++
		@Li,01 PSAY STR0045+Replicate(".",23-Len(STR0045))+":"//Produto
		If !Empty(QPR->QPR_PRODUT)
		
		
			cSql := " SELECT EE2_TEXTO " 
			cSql += " FROM "+RetSqlName("EE2") "
			cSql += " WHERE D_E_L_E_T_ <> '*' "
			cSql += " AND EE2_FILIAL = '"+SUBSTR(QPR->QPR_FILIAL,1,2)+"' 
			cSql += " AND EE2_IDIOMA LIKE '%ESPANHOL%' "//
			cSql += " AND EE2_COD = '"+AllTrim(QPR->QPR_PRODUT)+"' 
			
			cSql := ChangeQuery(cSql)
			
			If Select("TMP") > 0
				TMP->(DbCloseArea())
			EndIf  
	
			//MemoWrite("c:\temp\Idiomas.txt",cSql)
			TcQuery cSql New Alias "TMP" 	
	
			@Li,27 PSAY AllTrim(QPR->QPR_PRODUT)+" - "+Alltrim(MSMM(TMP->EE2_TEXTO,100))+" - "+QPR->QPR_REVI +" / "+AllTrim(QP6->QP6_DESCPO)
	
		Else
			@Li,27 PSAY AllTrim(cPrd)+" - "+AllTrim(QP6->QP6_DESCPO) +" - "+cRevi
		Endif
		Li++
		@Li,01 PSAY STR0046+Replicate(".",23-Len(STR0046))+":"//Cliente
		@Li,27 PSAY AllTrim(cCliente)+"/"+cLoja+" - "+SA1->A1_NOME
		
		@Li,090 PSAY STR0051+Replicate(".",23-Len(STR0051))+":"//VAlidade
		@Li,117 PSAY QPK->QPK_DTPROD+QP6->QP6_SHLF
		
		Li++
		@Li,01 PSAY STR0049+Replicate(".",23-Len(STR0049))+":"//Dt. Produccion//@Li,01 PSAY "Data da Producao"+Replicate(".",23-Len("Data da Producao"))+":"
		@Li,27 PSAY QPK->QPK_DTPROD
		
		@Li,090 PSAY STR0056+Replicate(".",23-Len(STR0056))+":"//Pedido
		@Li,117 PSAY mv_par15 
		
		 //Qtd.Expedida
		
		@Li,52 PSAY STR0052+Replicate(".",19-Len(AllTrim(TitSX3("QPR_LOTE")[1])))+":"//Lote
		@Li,75 PSAY cLot         
		//@Li,100 PSAY "Teste1"         
		If !Empty(QPR->QPR_NUMSER)
			@Li,94  PSAY AllTrim(TitSX3("QPR_NUMSER")[1])+Replicate(".",19-Len(AllTrim(TitSX3("QPR_NUMSER")[1])))+":"
			@Li,115 PSAY QPR->QPR_NUMSER
		EndIF
		If !Empty(MV_PAR10) .or. !Empty(MV_PAR11)
			@Li,97 PSAY STR0040+Replicate(".",19-Len(STR0040))+":"
			@Li,120 PSAY MV_PAR10
		EndIf
		Li++
		@Li,01 PSAY STR0050+Replicate(".",23-Len(STR0050))+":"//Ordem de produ��o
		
		@Li,090 PSAY STR0055+Replicate(".",23-Len(STR0055))+":"//Container
		@Li,117 PSAY mv_par16 
		
		
		If !Empty(QPR->QPR_OP)
			@Li,27 PSAY QPR->QPR_OP
		Else
			@Li,27 PSAY cOp
		Endif
		@Li,52 PSAY AllTrim(TitSX3("QEK_TAMLOT")[1])+Replicate(".",19-Len(AllTrim(TitSX3("QEK_TAMLOT")[1])))+":"
		SAH->(dbSeek(xFilial("SAH")+QPK->QPK_UM))
		@Li,75 PSAY Alltrim(str(QPK->QPK_TAMLOT))+" "+SAH->AH_UMRES
		If !Empty(MV_PAR10) .or. !Empty(MV_PAR11)
			@Li,97 PSAY STR0041+Replicate(".",19-Len(STR0041))+":"
			@Li,120 PSAY MV_PAR11
		EndIf
		
		Li+=1
		
		@Li,001 PSAY STR0053+Replicate(".",23-Len(AllTrim(TitSX3("QEK_TAMLOT")[1])))+":"+MV_PAR14 +" "+u_funTraduz(SAH->AH_UMRES,cIdioma)//Qtd.Expedida
		
		Li+=1
		//��������������������������������������������������������������Ŀ
		//� Chave de ligacao da medicao com outros arquivos              �
		//����������������������������������������������������������������
		cChave := QQ7->QQ7_CHAVE

		//���������������������������������������������������������Ŀ
		//� Faz a Impress�o do Texto-Amarracao Prod.xCliente QQ7    �
		//�����������������������������������������������������������
		If mv_par02 == 1
			dbSelectArea("QA2")
			dbSetOrder(1)
			If dbSeek(xFilial("QA2")+"QIPA070 "+cChave)
				@Li,01 PSAY "OBS.: "
				While QA2->(!Eof()) .And. xFilial("QA2") == QA2->QA2_FILIAL .And. QA2->QA2_CHAVE == cChave
					If Li > 55
						Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo)
					Endif
					@Li,08 PSAY StrTran(QA2_TEXTO, "\13\10", "")
					Li++
					dbSkip()
				EndDo
			EndIf
			Li++
		EndIf	

		//��������������������������������������������������Ŀ
		//� Faz a Impress�o do Texto superior                �
		//����������������������������������������������������
		cArqTxt := "XIQPR0501"+".TXT"
		If File(cArqTxt)
			cTexto:=MemoRead(cArqTxt)
			For nC := 1 To MLCOUNT(cTexto,130)
				aLinha := MEMOLINE(cTexto,130,nC)
				cImpTxt   := ""
				cImpLinha := ""
				For nCount := 1 To Len(aLinha)
					cImpTxt := Substr(aLinha,nCount,1)
					If AT(cImpTxt,cAcentos)>0
						cImpTxt:=Substr(cAcSubst,AT(cImpTxt,cAcentos),1)
					EndIf
					cImpLinha := cImpLinha+cImpTxt
				Next nCount
				@Li,01 PSAY cImpLinha
				Li++
			Next nC
		EndIf
		Li++

		//�������������������������������������������������������������������Ŀ
		//� Faz a Impress�o dos Ensaios especificado com Encontrado           �
		//���������������������������������������������������������������������

		aAreaQPR	:= GetArea()
		dbSelectArea("QPR")
		dbSetOrder(9)
		If dbSeek(xFilial("QPR")+QPK->QPK_OP+QPK->QPK_LOTE+QPK->QPK_NUMSER)

			While QPR->(!Eof()) .and. xFilial("QPR") == QPR->QPR_FILIAL .And. ;
			QPK->QPK_OP+QPK->QPK_LOTE+QPK->QPK_NUMSER == QPR->QPR_OP+QPR->QPR_LOTE+QPR->QPR_NUMSER
				lPula:= .T.
				lEnsaio:=.F.  
				nRecQPR := QPR->(Recno())
				//�������������������������������������������������������������������Ŀ
				//� Checa a exist�ncia do registro na amarra��o Produto x Cliente.    �
				//� Se existir, ser� impresso somente os ensaios selecionados.        �
				//� Se n�o achar o registro, ser� impresso todos os ensaios, sem      �
				//� a checagem.                                                       �
				//���������������������������������������������������������������������
				QQ7->(dbSetOrder(1))
				If QQ7->(dbSeek(xFilial("QQ7")+QPR->QPR_PRODUT+cCliente+cLoja,.T.))
					lChecaQQ7 := .T.
				Endif

				If lChecaQQ7
					If !QQ7->(dbSeek(xFilial("QQ7")+QPR->QPR_PRODUT+cCliente+cLoja+QPR->QPR_LABOR+;
					QPR->QPR_ENSAIO+cRoteiro+QPR->QPR_OPERAC)) .AND. QPR->QPR_OPERAC $ mv_par13
						dbSkip()
						Loop
					EndIf	
				EndIf

				If  cOperacao == QPR->QPR_OPERAC .AND. cLabor == QPR->QPR_LABOR	.AND. cEnsaio == QPR->QPR_ENSAIO .AND. QPR->QPR_OPERAC $ mv_par13
					dbSkip()
					Loop
				EndIF

				If QIP50OC(cRoteiro)
					If cOperacao <> QPR->QPR_OPERAC
						cLabor := ""
						cEnsaio:=""		
						cOperacao:= QPR->QPR_OPERAC
						Li++
						@Li,01 PSAY STR0033+QPR->QPR_OPERAC+ " - "+u_funTraduz(RetDesOper(QPR->QPR_OP,cOperacao,QPR->QPR_PRODUT,QPR->QPR_REVI),cIdioma)		// "OPERACAO : "
					EndIf
				Endif


				If cLabor <> QPR->QPR_LABOR	
					cEnsaio:=""		
					dbSelectArea("QP1")
					dbSetOrder(1)
					If dbSeek(xFilial("QP1")+QPR->QPR_ENSAIO)

						If QP1->QP1_TPCART <> "X"
							If QP7->(dbSeek(xFilial("QP7")+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO)) .AND. QPR->QPR_OPERAC $ mv_par13
								If QP7->QP7_CERTIF == "S"
									lPula := .F.
									cLabor:= QPR->QPR_LABOR
								EndIf
							EndIf
						Else	
							If QP8->(DbSeek(xFilial()+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO)) .AND. QPR->QPR_OPERAC $ mv_par13
								If QP8->QP8_CERTIF == "S"
									lPula := .F.
									cLabor:= QPR->QPR_LABOR
								EndIf
							EndIf
						EndIf

						//��������������������������������������������������������������������Ŀ
						//�Nao imprime ensaio que esta setado para nao constar no certificado. �
						//����������������������������������������������������������������������
						If lPula
							cLabor:= " "
							DbSelectArea("QPR")
							DbSkip()
							Loop
						EndIf

						Li++
						@Li,01 PSAY STR0015+QPR->QPR_LABOR		//"LABORATORIO : "
						Li++			

						lEnsaio:= .T.			
						If mv_par01 ==1 .And. QP1->QP1_TPCART <> "X"
							@Li,082 PSAY STR0016		//"Especificado"
							@Li,114 PSAY STR0017		//"Encontrados"
						Else
							If QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS/TXT"
								@Li,082 PSAY STR0016		//"Especificado"
								@Li,114 PSAY STR0020		//"Encontrado"
							EndIf
						EndIf
					EndIf

					Li++
					If lEnsaio
						@Li,001 PSAY STR0048 //TitSX3("QPR_ENSAIO")[1]
						@Li,047 PSAY STR0047//TitSX3("QP7_METODO")[1]//Metodo
						@Li,065 PSAY STR0058//Subs(TitSX3("QP7_UNIMED")[1],1,9)
						If mv_par01 ==1 .And. QP1->QP1_TPCART <> "X"
							@Li,077 PSAY STR0018		//"Minimo"
							@Li,093 PSAY STR0019		//"Maximo"
							@Li,108 PSAY STR0057//"Resultado Final"		//"Minimo"//@Li,108 PSAY STR0018		//"Minimo"//tarcisio1
							//@Li,125 PSAY STR0019		//"Maximo"tarcisio1
						Else
							If QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS"
								@Li,077 PSAY STR0018		//"Minimo"
								@Li,093 PSAY STR0019		//"Maximo"	
								@Li,116 PSAY STR0042        //"Media"
							Else
								@Li,077 PSAY STR0018		//"Minimo"
								@Li,093 PSAY STR0019		//"Maximo"
								@Li,108 PSAY STR0057//"Resultado Final"		//"Minimo"//@Li,108 PSAY STR0018		//"Minimo"//tarcisio1
							EndIf
						EndIf
						Li++
						@Li,01 PSAY Replicate("=",130)
						Li++
					EndIf
					If Li > 55
						Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
					EndIf
				EndIf

				dbSelectArea("QP1")
				dbSetOrder(1)
				If dbSeek(xFilial("QP1")+QPR->QPR_ENSAIO)

					If cEnsaio <> QPR->QPR_ENSAIO 

						If QP1->QP1_TPCART <> "X"
							dbSelectArea("QP7")
							dbSetOrder(1)
							If dbSeek(xFilial("QP7")+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO) .AND. QPR->QPR_OPERAC $ mv_par13
								If QP7->QP7_CERTIF == "S"
									//@Li,01 PSAY QP1->QP1_DESCPO //CONTAGEM TOTAL
									if len(CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO)))>42
										
										@Li,01 PSAY SubStr(CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO)),1,42)//u_funTraduz(QP1->QP1_DESCPO,cIdioma)//QP1->QP1_DESCPO
										
									else
										
										@Li,01 PSAY CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO))
									
									endif//u_funTraduz(QP1->QP1_DESCPO,cIdioma) //CONTAGEM TOTAL//QP1->QP1_DESCPO
									@Li,47 PSAY QP7->QP7_METODO
									SAH->(dbSeek(xFilial("SAH")+QP7->QP7_UNIMED))
									@Li,65 PSAY iif(AllTrim(Upper(SAH->AH_UMRES))$"NOTA",u_funTraduz(SAH->AH_UMRES,cIdioma),AllTrim(SAH->AH_UMRES))//u_funTraduz(SAH->AH_UMRES,cIdioma)
									If mv_par01 = 1
										If QP7_MINMAX == "1"
											@Li,78 PSAY QP7->QP7_LIE
											@Li,93 PSAY QP7->QP7_LSE

                                            if AllTrim(QPR->QPR_LABOR)$"LABMIC"
												lLabmic := .T.
											endif
                                            
										ElseIf QP7_MINMAX == "2"
											@Li,78 PSAY QP7->QP7_LIE
											@Li,93 PSAY ">>>"
										ElseIf QP7_MINMAX == "3"
											@Li,78 PSAY "<<<"
											@Li,93 PSAY QP7->QP7_LSE
                                            
                                            if AllTrim(QPR->QPR_LABOR)$"LABMIC"
												lLabmic := .T.
											endif
										    
										EndIf
									ElseIf QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS"  
										@Li,78 PSAY QP7->QP7_LIE
										@Li,93 PSAY QP7->QP7_LSE
                                        
                                        if AllTrim(QPR->QPR_LABOR)$"LABMIC"
											lLabmic := .T.
										endif
                                        
									Else
										@ li,65 PSAY Padc(AllTrim(QP7->QP7_NOMINA), 38)
									Endif
									lEnsaio := .T.
								Else
									lEnsaio	:= .F.
								EndIf
							EndIf
						Else
							dbSelectArea("QP8")
							dbSetOrder(1)
							If dbSeek(xFilial()+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO) .AND. QPR->QPR_OPERAC $ mv_par13
								If QP8->QP8_CERTIF == "S"
									//						Li++
									If Li > 55
										Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
									EndIf
									
									if len(CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO)))>42
										
										@Li,01 PSAY SubStr(CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO)),1,42)//u_funTraduz(QP1->QP1_DESCPO,cIdioma)//QP1->QP1_DESCPO
										
									else
										
										@Li,01 PSAY CapitalAce(AllTrim(QP1->QP1_DESCIN))+"/"+CapitalAce(AllTrim(QP1->QP1_DESCPO))
									
									endif
									
									@Li,47 PSAY QP8->QP8_METODO
									lEnsaio := .T.
								Else
									lEnsaio	:= .F.
								EndIf	
							EndIf
						EndIf
					EndIF	    
				Endif

				If Li > 55
					Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
				EndIf
				dDat		:= QPR->QPR_DTMEDI
				cLote		:= QPR->QPR_LOTE
				cLaborat	:= QPR->QPR_LABOR
				cEnsaio		:= QPR->QPR_ENSAIO
				cOp			:= QPR->QPR_OP
				If lEnsaio
					dbSelectArea("QPR")
					dbSetOrder(9)
					IF dbSeek(xFilial("QPR")+cOp+cLote+QPK->QPK_NUMSER+cRoteiro+cOperacao+cLaborat+cEnsaio+dTos(dDat)) .AND. QPR->QPR_OPERAC $ mv_par13

						lImpTxt  := .T.
						nVlrUnic := ""
						//�������������������������������������������������������������������Ŀ
						//�Defini��o das vari�veis para impress�o:                            �
						//�Cartas:XBR,XBS,XMR,IND,HIS,C,NP,U,P : nVlrMin,nVlrMax,nVlrUnic     �
						//���������������������������������������������������������������������
						While QPR->(!Eof()) .And. xFilial("QPR") == QPR->QPR_FILIAL .And.;
						cPrd     	== QPR->QPR_PRODUT	.And.	cRevi		== QPR->QPR_REVI .And.;
						dDat		== QPR->QPR_DTMEDI	.And.	cLote		== QPR->QPR_LOTE .And.;  
						cLaborat	== QPR->QPR_LABOR	.And. 	cOperacao	== QPR->QPR_OPERAC .And. QPR->QPR_OPERAC $ mv_par13 .And. ;
						cOp			== QPR->QPR_OP .And. QPK->QPK_NUMSER  == QPR->QPR_NUMSER .And.;        
						cEnsaio	== QPR->QPR_ENSAIO				
							lEnsaio := .t.
							If lEnsaio
								If li > 55
									Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
								EndIf

								IncRegua()

								cChave:= QPR->QPR_CHAVE
								//�������������������������������������������������������������������Ŀ
								//�Os tipos de cartas:XBR|XBS|XMR|IND|HIS - Se o param. for "Minimo/  �
								//�Maximo"-ira considerar o menor e o maior valor. Se o param. for    �
								//�"Valor Unico-Ser� o maior valor encontrado ou menor fora da espec. �
								//���������������������������������������������������������������������
								If QP1->QP1_TPCART <> "X"
									If QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS"
										dbSelectArea("QPS")
										dbSetOrder(1)
										If dbSeek(xFilial("QPS")+cChave)
											While QPS->(!Eof()) .And. 	QPS->QPS_FILIAL == xFilial("QPS") .And. ;
											QPS->QPS_CODMED == cChave

												nVlrMin:=IIF(SuperVal(QPS->QPS_MEDICA)<SuperVal(nVlrMin) .Or. ;
												SuperVal(nVlrMin)==0,QPS->QPS_MEDICA,nVlrMin)
												nVlrMax:=IIF(SuperVal(QPS->QPS_MEDICA)>SuperVal(nVlrMax),QPS->QPS_MEDICA,nVlrMax)

												If mv_par01 == 2 // Valor Unico
													nVlrUnic := Alltrim(Str(SuperVal(nVlrUnic) + SuperVal(QPS->QPS_MEDICA)))
													nMedia ++
												EndIf

												dbSkip()
											EndDo
										EndIf

									ElseIf QP1->QP1_CARTA$"C  /NP "
										//�������������������������������������������������������������������Ŀ
										//�Os tipos de carta : C / NP -Se o param. for "Minimo/Maximo", o Mi- �
										//�nimo ser� 0, o M�ximo ser� o maior valor da 1a. medicao do QPS p/  �
										//�cada data/hora. Sempre existem 1 medi��o para cada data/hora.      �
										//�Se param. for "Valor Unico" - Ser� o maior valor do QPS.           �
										//���������������������������������������������������������������������			
										dbSelectArea("QPS")
										dbSetOrder(1)
										If dbSeek(xFilial("QPS")+cChave)
											While QPS->(!Eof()) .And. 	QPS->QPS_FILIAL == xFilial("QPS") .And. ;
											QPS->QPS_CODMED == cChave

												nVlrMax:=IIF(SuperVal(QPS->QPS_MEDICA)>SuperVal(nVlrMax),QPS->QPS_MEDICA,nVlrMax)

												dbSkip()
											EndDo
											If mv_par01 == 2 // Valor Unico
												If SuperVal(nVlrMax) > SuperVal(QP7->QP7_LSE) .Or. SuperVal(nVlrUnic) == 0
													nVlrUnic:= nVlrMax
												EndIf
											EndIf
										EndIf

									ElseIf AllTrim(QP1->QP1_CARTA)=="U"
										//�������������������������������������������������������������������Ŀ
										//�O  tipo  de carta : U      -Se o param. for "Minimo/Maximo", o Mi- �
										//�nimo ser� 0, o M�ximo ser� o maior valor da 2a. medicao do QPS p/  �
										//�cada data/hora. Sempre existem 2 regs. medi��es para cada data/hora�
										//�Se param. for "Valor Unico" - Ser� a 2a. medi��o do QPS para a 1a. �
										//�data/hora.                                                         �
										//���������������������������������������������������������������������
										dbSelectArea("QPS")
										dbSetOrder(1)
										If dbSeek(xFilial("QPS")+cChave)
											While QPS->(!Eof()) .And. 	QPS->QPS_FILIAL == xFilial("QPS") .And. ;
											QPS->QPS_CODMED == cChave
												If nV == 2
													nVlrMax:=IIF(SuperVal(QPS->QPS_MEDICA)>SuperVal(nVlrMax),QPS->QPS_MEDICA,nVlrMax)
													nV:=0
													If mv_par01 == 2 .And. lUnic
														nVlrUnic := QPS->QPS_MEDICA
														lUnic:= .F.
													EndIf
												EndIf
												nV++
												dbSkip()
											EndDo
										EndIf

									ElseIf AllTrim(QP1->QP1_CARTA)=="P"
										//�������������������������������������������������������������������Ŀ
										//�O  tipo  de carta : P      -Se o param. for "Minimo/Maximo", o Mi- �
										//�nimo ser� 0, o M�ximo ser� o maior valor de :                      �
										//�Amostra * (Porcent./100)                                           �
										//�Se param. for "Valor Unico" - Ser� o maior valor da Amostra:       �
										//�Amostra * (Porcent./100)                                           �
										//���������������������������������������������������������������������
										dbSelectArea("QPS")
										dbSetOrder(1)
										If dbSeek(xFilial("QPS")+cChave)
											While QPS->(!Eof()) .And. 	QPS->QPS_FILIAL == xFilial("QPS") .And. ;
											QPS->QPS_CODMED == cChave

												If QPS->QPS_INDMED == "A"
													nAmostra := QPS->QPS_MEDICA
												ElseIf QPS->QPS_INDMED == "P"
													nPorcent := QPS->QPS_MEDICA
												EndIf
												If !Empty(nAmostra) .And. !Empty(nPorcent)
													nVlrMax:= IIF(SuperVal(nAmostra) * (SuperVal(nPorcent) / 100 ) > SuperVal(nVlrMax),SuperVal(nAmostra) * (SuperVal(nPorcent) / 100 ),nVlrMax)
													nAmostra:= ""
													nPorcent:= ""
													If mv_par01 == 2 // Valor Unico
														nVlrUnic:= Str(nVlrMax)
													EndIf
												EndIf
												dbSkip()
											EndDo
										EndIf
									EndIf
								Else	
									//�����������������������������������������������������������������Ŀ
									//�O tipo de Carta:TXT ir� o 1o. resultado encontrado ou Todas Med. �
									//�������������������������������������������������������������������
									If (Len(aTexto) == 0 .And. Len(aTxtRes) == 0) .Or. mv_par09 == 2
										aTexto  := {}
										aTxtRes := {}
										lImpTxT := .T.
										If Len(aTexto) == 0
											cTxt := QP8->QP8_TEXTO
											While ! Empty(cTxt)
												Aadd(aTexto, Left(cTxt, 23))
												cTxt := Subs(cTxt, 24, Len(cTxt))
											EndDo
										EndIf

										If Len(aTxtRes) == 0							
											dbSelectArea("QPQ")
											dbSetOrder(1)
											If dbSeek(xFilial()+cChave)
												cTxtRes:= QPQ->QPQ_MEDICA
												nX:=0

												While ! Empty(cTxtRes)
													Aadd(aTxtRes, Left(cTxtRes, 23))
													cTxtRes := Subs(cTxtRes, 24, Len(cTxtRes))
												EndDo
											Endif
										EndIf	


										nTot:= IIF(Len(aTexto)>Len(aTxtRes),Len(aTexto),Len(aTxtRes))
										For nC := 1 to nTot
											If lImpTxT
												If Len(aTexto) >= nC
													If	!Empty(aTexto[nC])
														@Li,077 PSAY Alltrim(aTexto[nC])
													EndIf
												EndIf	
											EndIf
											If  Len(aTxtRes) >= nC
												If	!Empty(aTxtRes[nC])
                                                	//@Li,108 PSAY AllTrim(aTxtRes[nC])
													@Li,108 PSAY AllTrim(aTxtRes[nC])
												EndIf
											EndIf
											If Li > 55
												Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
											EndIf
											Li++
										Next nC
									Endif							

								EndIf

								If Li > 55
									Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.) 
								EndIf
							Else
								li++
							EndIf
							dbSelectArea("QPR")
							dbSkip()
						EndDo

					EndIf

					If QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS" .and. mv_par01 == 2 // Valor Unico
						nVlrUnic := Alltrim(Str(SuperVal(nVlrUnic) /nMedia))
					EndIF   
				Endif

				If lEnsaio
					//���������������������������������������������������������������Ŀ
					//�Faz impress�o de todas as cartas                               �
					//�����������������������������������������������������������������
					If QP1->QP1_TPCART <> "X"
						If QP1->QP1_CARTA$"XBR/XBS/XMR/IND/HIS"
							If mv_par01 == 1
								if lLabmic .AND. val(nVlrMin)<10
									@Li,114-Len(AllTrim("<1x10^1")) PSAY iif(lLabmic ,iif(val(nVlrMin)<10,"<1x10^1",funNotacao(val(nVlrMin))),AllTrim(nVlrMin))//"tarcisio"//AllTrim(nVlrMin)
								else 
									@Li,114-Len(AllTrim(nVlrMin)) PSAY iif(lLabmic ,iif(val(nVlrMin)<10,"<1x10^1",funNotacao(val(nVlrMin))),AllTrim(nVlrMin))//"tarcisio"//AllTrim(nVlrMin)
								endif
								lLabmic := .F.
							Else
								@Li,104 PSAY Padc(AllTrim(StrTran(nVlrUnic,".",",")), 27)
							EndIf

						ElseIf AllTrim(QP1->QP1_CARTA)$"C/NP/U/P"
							If mv_par01 == 1
								@Li,113 PSAY "0"  
								If ValType(nVlrMax) = "N"
									@Li,130-Len(AllTrim(Str(nVlrMax))) PSAY AllTrim(Str(nVlrMax))
								Else                                                              
									@Li,130-Len(AllTrim(nVlrMax)) PSAY AllTrim(nVlrMax)
								EndIf
							Else
								@Li,104 PSAY Padc(AllTrim(StrTran(nVlrUnic,".",",")), 27)
							EndIf
						EndIf
					EndIf
					
					

					If QP1->QP1_TPCART == "X"
						aTexto:={}
						aTxtRes:={}
					Else
						nVlrMin :=999999
						nVlrMax :=-999999
						nVlrUnic:=""
						lUnic   :=.T.
						nMedia  :=0
						Li++
					EndIf	
				EndIf
				dbSelectArea("QPR")
				dbSetOrder(9)
				dbGoTo(nRecQPR)
				dbSkip()
			EndDo
			RestArea(aAreaQPR)
			lEnsaio := .T.	//Flag para impressao dos ensaios
		Endif

		cQry := " SELECT B1_GRUPO  "
			cQry += " FROM "+ RetSqlName("SB1")  
			cQry += " WHERE D_E_L_E_T_ <> '*' AND B1_COD = '"+AllTrim(QPK->QPK_PRODUTO)+"'  "

			cQry := ChangeQuery(cQry)

			//MemowRite("C:\Temp\XQIPR0502.TXT",cQry)

			if Select("TRB") > 0
				TRB->(DbCloseArea())
			endif

			dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "TRB", .F., .T.)  

			aAreaZZD := ZZD->(GetArea())

			ZZD->(DbSelectArea("ZZD"))
			ZZD->(DbSetOrder(2))
			ZZD->(DbGotop())

			If Li > 65
				Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)//Pula Pagina
			EndIf

			Li++
			Li++
			@Li,082 PSAY STR0016		//"Especificado"
			@Li,114 PSAY STR0017		//"Encontrados"
			@Li,001 PSAY STR0059	//Contaminantes
			@Li,01 PSAY "____________________________________________________________________________________________________________________________________"//cImpLinha
			Li++
			
			//@Li,01 PSAY STR0048+"                      						"+STR0047+"							"+STR0058+"																																											"+STR0061+"			"+STR0060
			
			@Li,001 PSAY STR0048 //Ensaio
			@Li,047 PSAY STR0047 //Metodos	
			@Li,065 PSAY STR0058 //Un.Medida
			@Li,077 PSAY STR0018 //"Minimo"		
			@Li,093 PSAY STR0019 //Maximo	
			@Li,108 PSAY STR0057 //Resultado Final
			
			@Li,01 PSAY "____________________________________________________________________________________________________________________________________"//cImpLinha
			Li++ 

			if ZZD->(DbSeek(xFilial("ZZD")+AllTrim(TRB->B1_GRUPO)))
			
			cGrupo := AllTrim(TRB->B1_GRUPO)

				While !ZZD->(Eof()) .AND. ZZD->ZZD_FILIAL == xFilial("ZZD") .AND. ZZD->ZZD_GRUPO == AllTrim(TRB->B1_GRUPO)

					@Li,001 PSAY u_funTraduz(ZZD->ZZD_DESC,cIdioma)   						
					@Li,047 PSAY u_funTraduz(ZZD->ZZD_DESCSB,cIdioma) 						
					@Li,065 PSAY "<<<"
					@Li,077 PSAY ZZD->ZZD_SIMBOL 						 
					@Li,093 PSAY TRANSFORM( ZZD->ZZD_VALOR,'@E 999.99' )
					@Li,108 PSAY ZZD->ZZD_VALOR2		
					
					Li++
					ZZD->(DbSkip())

				enddo

			endif
			
			if cGrupo$GetMv("MV_XGRPCQ",,"1003")
				Li++
				@Li,001 PSAY STR0063
				Li++
			endif
			
			RestArea(aAreaZZD)
			
			If Li > 65
				Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)//Pula Pagina
			EndIf
			
			Li++
			Li++
			
//***********************************************************************************	
			
			cSql := " SELECT QAA010.QAA_NOME MICROBIOLOGIA "
			cSql += " FROM "+ RetSqlName("QPR")  "
			cSql += " LEFT JOIN "+ RetSqlName("QAA")+" ON QAA010.D_E_L_E_T_ <> '*' AND QAA010.QAA_MAT = QPR010.QPR_ENSR "
			cSql += " WHERE QPR010.QPR_OP = '"+QPK->QPK_OP+"' "
			cSql += " AND QPR010.D_E_L_E_T_ <> '*' "
			cSql += " AND QPR010.QPR_LABOR LIKE '%LABMIC%'  "
			cSql += " GROUP BY QAA010.QAA_NOME "
			
			cSql := ChangeQuery(cSql)
			
			If Select("TMP2") > 0
				TMP2->(DbCloseArea())
			EndIf  
	
			//MemoWrite("c:\temp\Microbiologia.txt",cSql)
			
			TcQuery cSql New Alias "TMP2"
			
//***********************************************************************************		
			
			cSql := " SELECT QQK_OPERAC "
			cSql += " FROM "+RetSqlName("QQK")"
			cSql += " WHERE D_E_L_e_t_ <> '*' "
			cSql += " AND QQK_PRODUT = '"+QPR->QPR_PRODUT+"' "
			
			cSql := ChangeQuery(cSql)
			
			If Select("TMP3") > 0
				TMP3->(DbCloseArea())
			EndIf  
	
			//MemoWrite("c:\temp\Intermediario.txt",cSql)
			
			TcQuery cSql New Alias "TMP3"
	
//***********************************************************************************

			TMP3->(DbGotop())
			nxCont	  := 0
			cOperacao := ""
			While nxCont < 2
				cOperacao := TMP3->QQK_OPERAC 
				nxCont++
				TMP3->(DbSkip())
			enddo
			
//***********************************************************************************

			cSql := " SELECT QAA010.QAA_NOME ANALISTALABORATORIO "
			cSql += " FROM "+ RetSqlName("QPR")  "
			cSql += " LEFT JOIN "+ RetSqlName("QAA")+" ON QAA010.D_E_L_E_T_ <> '*' AND QAA010.QAA_MAT = QPR010.QPR_ENSR "
			cSql += " WHERE QPR010.QPR_OPERAC = '"+cOperacao+"' "
			cSql += " AND QPR010.D_E_L_E_T_ <> '*' "	
			cSql += " AND QPR_OP = '"+QPK->QPK_OP+"' "
			cSql += " GROUP BY QAA010.QAA_NOME "
			
			cSql := ChangeQuery(cSql)
			
			If Select("TMP4") > 0
				TMP4->(DbCloseArea())
			EndIf  
	
			//MemoWrite("c:\temp\OutraAssinatura.txt",cSql)
			
			TcQuery cSql New Alias "TMP4"

//***********************************************************************************		
			
			@Li,01 PSAY "____________________________________________________________________________________________________________________________________"//cImpLinha
			//Assinaturas.
			Li++
			@Li,001 PSAY CapitalAce(AllTrim(TMP4->ANALISTALABORATORIO))  						
			@Li,060 PSAY CapitalAce(AllTrim(TMP2->MICROBIOLOGIA))						
			@Li,105 PSAY iif(cFilAnt$"0102","Rossana Pereira Rabelo","Rossana Pereira Rabelo")					 
			Li++
			@Li,001 PSAY STR0064//Analista de Laborat�rio 						
			@Li,060 PSAY STR0065//Microbiologia						
			@Li,105 PSAY STR0066//Coordenadora Cq
			Li++
			Li++	
		
		dbSelectArea("QPL")
		dbSetOrder(2)                          
		If !Empty(cLote)
			cSeek := xFilial("QPL")+cOP+cLote+Space(TamSX3("QPL_OPERAC")[1])+Space(TamSX3("QPL_LABOR")[1])
		Else
			cSeek := xFilial("QPL")+cOP
		Endif
		If dbSeek(cSeek)
			dbSelectArea("QPD")
			dbSetOrder(1)
			If dbSeek(xFilial("QPD")+QPL->QPL_LAUDO)
				Li+=2
				@Li,01 PSAY STR0067+Replicate(".",15-Len(STR0067))+": "+CapitalAce(QPD->QPD_DESCIN)
				Li++
				@Li,01 PSAY STR0068+Replicate(".",15-Len(STR0068))+": "+Dtoc(QPL->QPL_DTLAUD)
				Li++
				If !Empty(QPL->QPL_QTREJ)
					SAH->(dbSeek(xFilial("SAH")+QPK->QPK_UM))
					@Li,01 PSAY STR0069+;
					Replicate(".",15-Len(STR0069))+": "+;
					QPL->QPL_QTREJ+" "+u_funTraduz(SAH->AH_UMRES,cIdioma)
					Li++
				EndIf
				If mv_par03 == 1
					@Li,01 PSAY STR0070+Replicate(".",15-Len(STR0070))+": "+QPL->QPL_JUSTLA
					Li++
				EndIf      
			Endif
		EndIf


		Li+=2

		//��������������������������������������������������Ŀ
		//� Faz a Impress�o das Informa��es Complementares   �
		//����������������������������������������������������
		/*cArqTxt := "QPR0503"+".TXT"
		If File(cArqTxt)
			cTexto:=MemoRead(cArqTxt)
			For nC := 1 To MLCOUNT(cTexto,130)
				aLinha := MEMOLINE(cTexto,130,nC)
				cImpTxt   := ""
				cImpLinha := ""
				For nCount := 1 To Len(aLinha)
					cImpTxt := Substr(aLinha,nCount,1)
					If AT(cImpTxt,cAcentos)>0
						cImpTxt:=Substr(cAcSubst,AT(cImpTxt,cAcentos),1)
					EndIf
					@Li,01 PSAY "____________________________________________________________________________________________________________________________________"//cImpLinha
                    cImpLinha := cImpLinha+cImpTxt
				Next nCount
				@Li,01 PSAY cImpLinha
				Li++
				If Li > 55
					Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
				EndIf
			Next nC
		EndIf

		Li+=5*/

		//��������������������������������������������������Ŀ
		//� Faz a Impress�o do Texto inferior                �
		//����������������������������������������������������
		cArqTxt := "XIQPR0502"+".TXT"
		If File(cArqTxt)
			cTexto:=MemoRead(cArqTxt)
			For nC := 1 To MLCOUNT(cTexto,130)
				aLinha := MEMOLINE(cTexto,130,nC)
				cImpTxt   := ""
				cImpLinha := ""
				For nCount := 1 To Len(aLinha)
					cImpTxt := Substr(aLinha,nCount,1)
					If AT(cImpTxt,cAcentos)>0
						cImpTxt:=Substr(cAcSubst,AT(cImpTxt,cAcentos),1)
					EndIf
					cImpLinha := cImpLinha+cImpTxt
				Next nCount
				@Li,01 PSAY cImpLinha
				Li++
				If Li > 55
					Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
				EndIf
			Next nC

		EndIf
		Li++
		Li++

		If Li > 65//Pula Pagina
			Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
		EndIf

		If Li > 65
			Cabec(cTitulo,Cabec1,Cabec2,nomeprog,cTamanho,nTipo,,.F.)
		EndIf

		@Li,01 PSAY "[ "+STR0062+" ]"
		Li++
		@Li,01 PSAY "[kg =  kilograms/quilograma] [FQ = Physico-chemical/F�sico-Quimico] [N.M.P. = Most probable number/N�mero mais provavel]" 
		Li++
		@Li,01 PSAY "[M�n. = Minimum/M�nimo] [�g = microgram/micrograma] [MB = Microbiology/Microbiologia] [M�x. = Maximum/M�ximo]" 
		Li++
		@Li,01 PSAY "[U.F.C = Colony-forming unit/Unidade formadora de colonia] [Col. = Coliforms/Coliformes] [mg = miligrams/miligramas]" 
		Li++
		@Li,01 PSAY "[N.D. =  No Detected/N�o Detectado] [cps = centipoise/centipoise] [ml = milliliter/mililitro] [� = micro/micro]" 
		Li++
		@Li,01 PSAY "[Un. = Unit/Unidade] [% = percentage/porcentagem] [g = grams/gramas]"
		Li++			
	Next nContador
	Li+=2
	//Alert(str(Li))
	//If Li != 80
	If Li > 70
		roda(CbCont,cbtxt,'G')
	EnDif
	//��������������������������������������������������������������Ŀ
	//� Restaura a Integridade dos dados                             �
	//����������������������������������������������������������������
	dbSelectArea("QPR")
	RetIndex("QPR")
	dbSetOrder(1)
	Set Filter To

	If File(cNomArq+OrdBagExt())
		Ferase(cNomArq+OrdBagExt())
	EndIf

	Set device to Screen

	If aReturn[5] == 1
		Set Printer To
		dbCommitAll()
		OurSpool(wnrel)
	Endif

	MS_FLUSH()
Return .T.         

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �QIPR050   �Autor  �Renata Cavalcante   � Data �  05/15/07   ���
�������������������������������������������������������������������������͹��
���Desc.     �Fun��o para verifica��o se h� ensaios com Certificado como  ���
���          �S(Sim) para a Opera��o. Tanto ensaios texto qto dimensionais���
�������������������������������������������������������������������������͹��
���Uso       � Verifica��o dos Ensaios                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function QIP50OC(cRoteiro)

	Local aAreaQPR:= GETAREA("QPR")
	Local aAreaQQ7:= GETAREA("QQ7")
	Local lRetorno:=.F.

	Dbselectarea("QP7")
	Dbsetorder(1)

	If DbSeek(xFilial("QP7")+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO) .AND. QPR->QPR_OPERAC $ mv_par13
		While QP7->(!Eof())   .And. QP7->QP7_OPERAC == QPR->QPR_OPERAC .AND. QPR->QPR_OPERAC $ mv_par13
			If QP7->QP7_CERTIF == "S"
				lRetorno:= .T. 
				exit
			EndIf	 
			QP7->(DBSKIP())
		Enddo
	Else

		DbSelectarea("QP8")
		Dbsetorder(1)

		If DbSeek(xFilial()+QPR->QPR_PRODUT+QPR->QPR_REVI+cRoteiro+QPR->QPR_OPERAC+QPR->QPR_ENSAIO) .AND. QPR->QPR_OPERAC $ mv_par13
			While QP8->(!Eof())   .And. QP8->QP8_OPERAC == QPR->QPR_OPERAC .AND. QPR->QPR_OPERAC $ mv_par13
				If QP8->QP8_CERTIF == "S"
					lRetorno:= .T.
					exit
				EndIf
				QP8->(DBSKIP())

			Enddo
		Endif
	Endif


	Restarea(aAreaQPR)
	Restarea(aAreaQQ7)
Return(lRetorno)  

static function funNotacao(_cNumero)

	Default _cNumero := ""
	//nNumero := 4990547861
	nQuant  := len(alltrim(str(_cNumero)))

	if nQuant == 1       
		cValor := alltrim(str(_cNumero))+"*10^0"
	elseif  nQuant == 2
		cValor := alltrim(str(_cNumero/10))+"*10^1"    
	elseif  nQuant == 3
		cValor := alltrim(str(_cNumero/100))+"*10^2"
	elseif  nQuant == 4
		cValor := alltrim(str(_cNumero/1000))+"*10^3"
	elseif  nQuant == 5
		cValor := alltrim(str(_cNumero/10000))+"*10^4"
	elseif  nQuant == 6
		cValor := alltrim(str(_cNumero/100000))+"*10^5"  
	elseif  nQuant == 7
		cValor := alltrim(str(_cNumero/1000000))+"*10^6"
	elseif  nQuant == 8
		cValor := alltrim(str(_cNumero/10000000))+"*10^7"             
	elseif  nQuant == 9
		cValor := alltrim(str(_cNumero/100000000))+"*10^8"           
	elseif  nQuant == 10
		cValor := alltrim(str(_cNumero/1000000000))+"*10^9"        
	elseif  nQuant == 11
		cValor := alltrim(str(_cNumero/10000000000))+"*10^10"                                           
	endif

return(cValor)