#include "rwmake.ch"

/*
�������������������������������������������������������������������������Ŀ��
���Funo    � RGPER01  � Autor � Renato Marinheiro     � Data � 22/09/06 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Emissao de Recibos de Pagamento                            ���
�������������������������������������������������������������������������Ĵ��
���Sintaxe   � RGPER01(void)                                              ���
�������������������������������������������������������������������������Ĵ��
���Parametros�                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � Generico                                                   ���
�������������������������������������������������������������������������Ĵ��
���         ATUALIZACOES SOFRIDAS DESDE A CONSTRUAO INICIAL.             ���
�������������������������������������������������������������������������Ĵ��
���Programador � Data   � BOPS �  Motivo da Alteracao                     ���
�������������������������������������������������������������������������Ĵ��
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/


User Function RGPER005()

//��������������������������������������������������������������Ŀ
//� Define Variaveis Locais (Basicas)                            �
//����������������������������������������������������������������
Local cString:="SRA"        // alias do arquivo principal (Base)

//-- 06/11/07 - Danielli Local aOrd   := {"Matricula"}
Local aOrd   := {"Nome", "Matricula", "C.Custo", "C.Custo + Nome"}
Local cDesc1 := "Emiss�o de Recibos de Pagamento."
Local cDesc2 := "Ser� impresso de acordo com os parametros solicitados pelo"
Local cDesc3 := "usuario."

//��������������������������������������������������������������Ŀ
//� Define Variaveis Locais (Programa)                           �
//����������������������������������������������������������������
Local nExtra,cIndCond,cIndRD
Local Baseaux := "S", cDemit := "N"
Public _oPrint

//��������������������������������������������������������������Ŀ
//� Define o numero da linha de impress�o como 0                 �
//����������������������������������������������������������������
//SetPRD(0,0)

//��������������������������������������������������������������Ŀ
//� Define Variaveis Private(Basicas)                            �
//����������������������������������������������������������������
Private aReturn  := {"Zebrado", 1,"Administracao", 2, 2, 1, "",1 }	//"Zebrado"###"Administra��o"
Private nomeprog := "RGPER005"
Private aLinha   := { },nLastKey := 0
Private cPerg    := "RGPE02"
Private cSem_De  := "  /  /    "
Private cSem_Ate := "  /  /    "
Private nAteLim , nBaseFgts , nFgts , nBaseIr , nBaseIrFe
Private cCompac , cNormal
Private aDriver
Private aCodBenef := {}
//��������������������������������������������������������������Ŀ
//� Define Variaveis Private(Programa)                           �
//����������������������������������������������������������������
Private aFunc := {}
Private aProve := {}
Private aDesco := {}
Private aBases := {}
Private aInfo  := {}
Private aCodFol:= {}
Private li     := _PROW()
Private Titulo := "EMISSAO DE RECIBOS DE PAGAMENTOS"
Private nTamanho	:= "M"
Private limite		:= 132

//��������������������������������������������������������������Ŀ
//� Envia controle para a funcao SETPRINT                        �
//����������������������������������������������������������������
wnrel := "RGPER004"            //Nome Default do relatorio em Disco
wnrel := SetPrint(cString,wnrel,cPerg,Titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,,nTamanho )

//��������������������������������������������������������������Ŀ
//� Define a Ordem do Relatorio                                  �
//����������������������������������������������������������������
nOrdem :=  aReturn[8]

//��������������������������������������������������������������Ŀ
//� Verifica as perguntas selecionadas                           �
//����������������������������������������������������������������
//fValidSX1()
Pergunte("RGPE02",.F.)
//��������������������������������������������������������������Ŀ
//� Carregando variaveis mv_par?? para Variaveis do Sistema.     �
//����������������������������������������������������������������
dDataRef   := mv_par01
nTipRel    := 1
Esc        := mv_par02
cFilDe     := mv_par03	//Filial De
cFilAte    := mv_par04	//Filial Ate
cCcDe      := mv_par05			//Centro de Custo De
cCcAte     := mv_par06				//Centro de Custo Ate
cMatDe     := mv_par07				//Matricula Des
cMatAte    := mv_par08			//Matricula Ate
cNomDe     := mv_par09				//Nome De
cNomAte    := mv_par10				//Nome Ate
Mensag11   := substr(mv_par11,1,1)										 	//Mensagem 1
Mensag12   := substr(mv_par11,2,1)										 	//Mensagem 1
Mensag21   := substr(mv_par12,1,1)											//Mensagem 2
Mensag22   := substr(mv_par12,2,1)										 	//Mensagem 1
Mensag31   := substr(mv_par13,1,1)											//Mensagem 3
Mensag32   := substr(mv_par13,2,1)										 	//Mensagem 1
Mensag4    := mv_par14											//Mensagem 3
Mensag5    := mv_par15											//Mensagem 3

cSituacao  := mv_par16	//Situacoes a Imprimir
cCategoria := mv_par17	//Categorias a Imprimir
cBaseAux   := If(mv_par18 == 1,"S","N")							//Imprimir Bases

If aReturn[5] == 1 .and. nTipRel == 1
	li := 0
EndIf

cMesAnoRef := StrZero(Month(dDataRef),2) + StrZero(Year(dDataRef),4)
cAnoMesRef := StrZero(Year(dDataRef),4)  + StrZero(Month(dDataRef),2)  
//��������������������������������������������������������������Ŀ
//� Inicializa Impressao                                         �
//����������������������������������������������������������������
If !fInicia(cString,nTipRel)
	Return
Endif

//MsgRun("Gerando relat�rio, aguarde...", "", {|| CursorWait(), R030IMPL(@lEnd,wnRel,cString,cMesAnoRef), CursorArrow()})

RptStatus({|lEnd| R030ImpL(@lEnd,wnRel,cString,cMesAnoRef)},Titulo)  // Chamada do Relatorio

Return(  NIL )

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    � R030IMP  � Autor � R.H. - Ze Maria       � Data � 14.03.95 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Processamento Para emissao do Recibo                       ���
�������������������������������������������������������������������������Ĵ��
���Sintaxe   � R030Imp(lEnd,WnRel,cString,cMesAnoRef,lTerminal)			      ���
�������������������������������������������������������������������������Ĵ��
���Parametros�                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � Generico                                                   ���
�������������������������������������������������������������������������Ĵ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������*/
Static Function R030ImpL(lEnd,WnRel,cString,cMesAnoRef)
//��������������������������������������������������������������Ŀ
//� Define Variaveis Locais (Basicas)                            �
//����������������������������������������������������������������
Local lIgual                 //Vari�vel de retorno na compara�ao do SRD
Local cArqNew                //Vari�vel de retorno caso SRD # SX3
Local aOrdBag     := {}
Local cMesArqRef  := If(Esc == 4,"13"+Right(cMesAnoRef,4),cMesAnoRef)
Local cArqMov     := ""
//Local aCodBenef   := {}
Local cNroHoras   := &("{ || If(SRD->RD_QTDSEM > 0, SRD->RD_QTDSEM, SRD->RD_HORAS) }")
Local nHoras      := 0
Local nMes, nAno
Public cCodFunc	  := ""		//-- codigo da Funcao do funcionario
Public cDescFunc  := ""		//-- Descricao da Funcao do Funcionario
Public _n         := 1

Private cAliasMov := ""
Private cDtPago
Private cPict1	:=	"@E 999,999,999.99"
Private cPict2 := 	"@E 99,999,999.99"
Private cPict3 :=	"@E 999,999.99"
If MsDecimais(1) == 0
	cPict1	:=	"@E 99,999,999,999"
	cPict2 	:=	"@E 9,999,999,999"
	cPict3 	:=	"@E 99,999,999"
Endif

If Esc == 4
	cMesArqRef := "13" + Right(cMesAnoRef,4)
Else
	cMesArqRef := cMesAnoRef
Endif

//��������������������������������������������������������������Ŀ
//| Verifica se existe o arquivo de fechamento do mes informado  |
//����������������������������������������������������������������
//If !OpenSRD( cMesArqRef, @cAliasMov, @aOrdBag, @cArqMov, @dDataRef , NIL  )
//	Return(  NIL  )
//Endif

//��������������������������������������������������������������Ŀ
//� Selecionando a Ordem de impressao escolhida no parametro.    �
//����������������������������������������������������������������
dbSelectArea( "SRA")
If nOrdem == 1
	dbSetOrder(3)
ElseIf nOrdem == 2
	dbSetOrder(1)
ElseIf nOrdem == 3
	dbSetOrder(2)
ElseIf nOrdem == 4
	dbSetOrder(8)
Endif

dbGoTop()

//��������������������������������������������������������������Ŀ
//� Selecionando o Primeiro Registro e montando Filtro.          �
//����������������������������������������������������������������
If nOrdem == 1
	dbSeek(cFilDe + cNomDe + cMatDe,.T.)
	cInicio := "SRA->RA_FILIAL + SRA->RA_NOME" // + SRA->RA_MAT"
	cFim    := cFilAte + cNomAte // + cMatAte
ElseIf nOrdem == 2
	cInicio := "SRA->RA_FILIAL + SRA->RA_MAT"
	dbSeek(cFilDe + cMatDe,.T.)
	cFim    := cFilAte + cMatAte
ElseIf nOrdem == 3
	dbSeek(cFilDe + cCcDe + cMatDe,.T.)
	cInicio  := "SRA->RA_FILIAL + SRA->RA_CC + SRA->RA_MAT"
	cFim     := cFilAte + cCcAte + cMatAte
ElseIf nOrdem == 4
	dbSeek(cFilDe + cCcDe + cNomDe,.T.)
	cInicio  := "SRA->RA_FILIAL + SRA->RA_CC + SRA->RA_NOME"
	cFim     := cFilAte + cCcAte + cNomAte
Endif

dbSelectArea("SRA")
//��������������������������������������������������������������Ŀ
//� Carrega Regua Processamento                                  �
//����������������������������������������������������������������
SetRegua(RecCount())	// Total de elementos da regua

aFunc  :={}         // Zera Lancamentos
aProve :={}         // Zera Lancamentos
aDesco :={}         // Zera Lancamentos
aBases :={}         // Zera Lancamentos
aImpos :={}         // Zera Lancamentos
DESC_MSG:={}
FLAG:= CHAVE := 0

Desc_Fil   := Desc_End := DESC_CC:= DESC_FUNC:= ""
DESC_MSG1  := DESC_MSG2:= DESC_MSG3:= Space(01)
DESC_MSG4  := DESC_MSG5:= Space(62)
cFilialAnt := "  "
Vez        := 0
OrdemZ     := 0

While SRA->( !Eof() .And. &cInicio <= cFim )
	
	//��������������������������������������������������������������Ŀ
	//� Movimenta Regua Processamento                                �
	//����������������������������������������������������������������
	
	IncRegua()  // Anda a regua
	
	If lEnd
		@Prow()+1,0 PSAY cCancel
		Exit
	Endif
	//��������������������������������������������������������������Ŀ
	//� Consiste Parametrizacao do Intervalo de Impressao            �
	//����������������������������������������������������������������
	If 	(SRA->RA_NOME < cNomDe)    .Or. (SRA->Ra_NOME > cNomAte)    .Or. ;
		(SRA->RA_MAT < cMatDe)     .Or. (SRA->Ra_MAT > cMatAte)     .Or. ;
		(SRA->RA_CC < cCcDe)       .Or. (SRA->Ra_CC > cCcAte)
		SRA->(dbSkip(1))
		Loop
	EndIf
	
	nAteLim := nBaseFgts := nFgts := nBaseIr := nBaseIrFe := 0.00
	
	Ordem_rel := 1     // Ordem dos Recibos
	
	//��������������������������������Ŀ
	//� Verifica Data Demissao         �
	//����������������������������������
	cSitFunc := SRA->RA_SITFOLH
	dDtPesqAf:= CTOD("01/" + Left(cMesAnoRef,2) + "/" + Right(cMesAnoRef,4))
	If cSitFunc == "D" .And. (!Empty(SRA->RA_DEMISSA) .And. MesAno(SRA->RA_DEMISSA) > MesAno(dDtPesqAf))
		cSitFunc := " "
	Endif

	//��������������������������������������������������������������Ŀ
	//� Consiste situacao e categoria dos funcionarios			     |
	//����������������������������������������������������������������
	If !( cSitFunc $ cSituacao ) .OR.  ! ( SRA->RA_CATFUNC $ cCategoria )
		dbSkip()
		Loop
	Endif
	If cSitFunc $ "D" .And. Mesano(SRA->RA_DEMISSA) # Mesano(dDataRef)
		dbSkip()
		Loop
	Endif
	
	fBuscaFunc(dDataRef, @cCodFunc, @cDescFunc   )
	
	aAdd(aFunc,{SRA->RA_MAT,;             
	Left(SRA->RA_NOME,28),;
	fCodCBO(SRA->RA_FILIAL,cCodFunc ,dDataRef),;
	SRA->RA_CC,;                                              // Fernando Ventura - Mudei a tabela de Centro de Custo para a Antiga
	Posicione("CTT",1,SRA->RA_FILIAL+SRA->RA_CC,"CTT_DESC01"),;	//Posicione("SI3",1,SRA->RA_FILIAL+SRA->RA_CC,"I3_DESC"),; 	
	cEmpAnt+"/"+SRA->RA_FILIAL ,;
	TRANSFORM(strzero(ORDEM_REL,3),"9999"),;
	cCodFunc,;
	cDescFunc,;
	SRA->RA_SALARIO,;
	MONTH(SRA->RA_NASC),;
	Substr(Sra->Ra_BcDepSal,1,3),;
	SRA->RA_BCDEPSAL,;
	SRA->RA_CTDEPSAL,;
	substr(dtos(SRA->RA_ADMISSA),7,2) + "/" + substr(dtos(SRA->RA_ADMISSA),5,2)+ "/" + substr(dtos(SRA->RA_ADMISSA),1,4),;
	})
	
	If SRA->RA_Filial # cFilialAnt
		If ! Fp_CodFol(@aCodFol,Sra->Ra_Filial) .Or. ! fInfo(@aInfo,Sra->Ra_Filial)
			Exit
		Endif
		Desc_Fil := aInfo[3]
		Desc_End := aInfo[4]                // Dados da Filial
		Desc_CGC := aInfo[8]
		DESC_MSG1:= DESC_MSG2:= DESC_MSG3:= Space(01)
		DESC_MSG4:=DESC_MSG5:=Space(62)
		
		// MENSAGENS
		If MENSAG11 # SPACE(1) .or. MENSAG12 # SPACE(1)
			If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG11)
				DESC_MSG1 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG12)
					DESC_MSG1 := DESC_MSG1 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG12)
					DESC_MSG1 := DESC_MSG1 + Left(SRX->RX_TXT,30)
				Endif
			ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG11)
				DESC_MSG1 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG12)
					DESC_MSG1 := DESC_MSG1 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG12)
					DESC_MSG1 := DESC_MSG1 + Left(SRX->RX_TXT,30)
				Endif
			Endif
		Endif
		If MENSAG21 # SPACE(1) .or. MENSAG22 # SPACE(1)
			If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG21)
				DESC_MSG2 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG22)
					DESC_MSG2 := DESC_MSG2 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG22)
					DESC_MSG2 := DESC_MSG2 + Left(SRX->RX_TXT,30)
				Endif
			ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG21)
				DESC_MSG2 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG22)
					DESC_MSG2 := DESC_MSG2 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG22)
					DESC_MSG2 := DESC_MSG2 + Left(SRX->RX_TXT,30)
				Endif
			Endif
		Endif
		
		If MENSAG31 # SPACE(1) .or. MENSAG32 # SPACE(1)
			If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG31)
				DESC_MSG3 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG32)
					DESC_MSG3 := DESC_MSG3 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG32)
					DESC_MSG3 := DESC_MSG3 + Left(SRX->RX_TXT,30)
				Endif
			ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG31)
				DESC_MSG3 := Left(SRX->RX_TXT,30)
				If FPHIST82(SRA->RA_FILIAL,"06",SRA->RA_FILIAL+MENSAG32)
					DESC_MSG3 := DESC_MSG3 + Left(SRX->RX_TXT,30)
				ElseIf FPHIST82(SRA->RA_FILIAL,"06","  "+MENSAG32)

					DESC_MSG3 := DESC_MSG3 + Left(SRX->RX_TXT,30)
				Endif
			Endif
		Endif
		DESC_MSG4 := Mensag4
		DESC_MSG5 := Mensag5
		
		dbSelectArea("SRA")
		cFilialAnt := SRA->RA_FILIAL
	Endif
	aAdd(DESC_MSG,{DESC_MSG1,DESC_MSG2,DESC_MSG3,DESC_MSG4,DESC_MSG5})

/*	
	_TOTVENC := 0
	_TOTDESC := 0
	
	If Esc == 1 .OR. Esc == 2  // adto ou folha
		dbSelectArea("SRD")
		dbSetOrder(1)
		If dbSeek(SRA->RA_FILIAL + SRA->RA_MAT)
			While !Eof() .And. SRD->RD_FILIAL+SRD->RD_MAT == SRA->RA_FILIAL+SRA->RA_MAT
				If (Esc == 1) .And. (SRD->RD_Pd == aCodFol[7,1])      // Desconto de Adto
					//fSomaPd("P",aCodFol[6,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Elseif (Esc == 1) .And. (SRD->RD_Pd == aCodFol[12,1])
					//fSomaPd("D",aCodFol[9,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTDESC+=SRD->RD_VALOR
				Elseif (Esc == 1) .And. (SRD->RD_Pd == aCodFol[8,1])
					//fSomaPd("P",aCodFol[8,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Else
					If PosSrv( SRD->RD_Pd , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							If cPaisLoc == "PAR" .and. Eval(cNroHoras) == 30
								LocGHabRea(Ctod("01/"+SubStr(DTOC(dDataRef),4)), Ctod(StrZero(F_ULTDIA(dDataRef),2)+"/"+Strzero(Month(dDataRef),2)+"/"+right(str(Year(dDataRef)),2)),@nHoras)
							Else
								nHoras := Eval(cNroHoras)
							Endif
							//fSomaPd("P",SRD->RD_PD,nHoras,SRD->RD_VALOR,SRD->RD_MAT)
							_TOTVENC+=SRD->RD_Valor
						Endif
					Elseif SRV->RV_TIPOCOD == "2"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							//fSomaPd("D",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
							_TOTDESC+=SRD->RD_Valor
						Endif
					Elseif SRV->RV_TIPOCOD == "3"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							//fSomaPd("B",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
						Endif
					Endif
				Endif
				If ESC = 1
					If SRD->RD_PD == aCodFol[10,1]
						nBaseIr := SRD->RD_VALOR
					Endif
				ElseIf SRD->RD_PD == aCodFol[13,1]
					nAteLim += SRD->RD_VALOR
				Elseif SRD->RD_PD$ aCodFol[108,1]+'*'+aCodFol[17,1]
					nBaseFgts += SRD->RD_VALOR
				Elseif SRD->RD_PD$ aCodFol[109,1]+'*'+aCodFol[18,1]
					nFgts += SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[15,1]
					nBaseIr += SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[16,1]
					nBaseIrFe += SRD->RD_VALOR
				Endif
				dbSelectArea("SRD")
				dbSkip()
			Enddo
		Endif
	Elseif Esc == 3
		//��������������������������������������������������������������Ŀ
		//� Busca os codigos de pensao definidos no cadastro beneficiario�
		//����������������������������������������������������������������
		fBusCadBenef(@aCodBenef, "131",{aCodfol[172,1]})
		dbSelectArea("SRD")
		dbSetOrder(1)
		If dbSeek(SRA->RA_FILIAL + SRA->RA_MAT)
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_MAT == SRD->RD_FILIAL + SRD->RD_MAT
				If SRD->RD_PD == aCodFol[22,1]
					//fSomaPd("P",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Elseif Ascan(aCodBenef, { |x| x[1] == SRD->RD_PD }) > 0
					//fSomaPd("D",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTDESC+=SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[108,1] .Or. SRD->RD_PD == aCodFol[109,1] .Or. SRD->RD_PD == aCodFol[173,1]
					//fSomaPd("B",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
				Endif
				
				If SRD->RD_PD == aCodFol[108,1]
					nBaseFgts := SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[109,1]
					nFgts     := SRD->RD_VALOR
				Endif
				dbSelectArea("SRD")
				dbSkip()
			Enddo
		Endif
	Elseif Esc == 4
		dbSelectArea("SRI")
		dbSetOrder(2)
		If dbSeek(SRA->RA_FILIAL + SRA->RA_CC + SRA->RA_MAT)
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_CC + SRA->RA_MAT == SRI->RI_FILIAL + SRI->RI_CC + SRI->RI_MAT
				If PosSrv( SRI->RI_PD , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
					//fSomaPd("P",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
					_TOTVENC = _TOTVENC + SRI->RI_VALOR
				Elseif SRV->RV_TIPOCOD == "2"
					//fSomaPd("D",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
					_TOTDESC = _TOTDESC + SRI->RI_VALOR
				Elseif SRV->RV_TIPOCOD == "3"
					//fSomaPd("B",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
				Endif
				
				If SRI->RI_PD == aCodFol[19,1]
					nAteLim += SRI->RI_VALOR
				Elseif SRI->RI_PD$ aCodFol[108,1]
					nBaseFgts += SRI->RI_VALOR
				Elseif SRI->RI_PD$ aCodFol[109,1]
					nFgts += SRI->RI_VALOR
				Elseif SRI->RI_PD == aCodFol[27,1]
					nBaseIr += SRI->RI_VALOR
				Endif
				dbSkip()
			Enddo
		Endif
	Elseif Esc == 5
		dbSelectArea("SR1")
		dbSetOrder(1)
		If dbSeek( SRA->RA_FILIAL + SRA->RA_MAT )
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_MAT ==	SR1->R1_FILIAL + SR1->R1_MAT
				If PosSrv( SR1->R1_PD , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
					//fSomaPd("P",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
					_TOTVENC = _TOTVENC + SR1->R1_VALOR
				Elseif SRV->RV_TIPOCOD == "2"
					//fSomaPd("D",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
					_TOTDESC = _TOTDESC + SR1->R1_VALOR
				Elseif SRV->RV_TIPOCOD == "3"
					//fSomaPd("B",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
				Endif
				dbskip()
			Enddo
		Endif
	Endif
	*/
	dbSelectArea("SRA")
	
	
	If nTipRel == 1
		If Vez = 0  .and. nTipRel # 3  .and. aReturn[5] # 1
			//��������������������������������������������������������������Ŀ
			//� Descarrega teste de impressao                                �
			//����������������������������������������������������������������
			//_TOTDESC := 0
			//_TOTVENC := 0
			If mv_par01 = 2
				Loop
			Endif
		ENDIF
	Endif
	dbSelectArea("SRA")
	SRA->( dbSkip() )
	_TOTDESC := 0
	_TOTVENC := 0
	_n++
EndDo

fImpressaoL()   // Impressao do Recibo de Pagamento


//��������������������������������������������������������������Ŀ
//� Seleciona arq. defaut do Siga caso Imp. Mov. Anteriores      �
//����������������������������������������������������������������
If !Empty( cAliasMov )
	fFimArqMov( cAliasMov , aOrdBag , cArqMov )
EndIf


//��������������������������������������������������������������Ŀ
//� Termino do relatorio                                         �
//����������������������������������������������������������������
dbSelectArea("SRD")
dbSetOrder(1)          // Retorno a ordem 1
dbSelectArea("SRI")
dbSetOrder(1)          // Retorno a ordem 1
dbSelectArea("SRA")
SET FILTER TO
RetIndex("SRA")

If !(Type("cArqNtx") == "U")
	fErase(cArqNtx + OrdBagExt())
Endif


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    �fImpressao� Autor � R.H. - Ze Maria       � Data � 14.03.95 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � IMRESSAO DO RECIBO FORMULARIO CONTINUO                     ���
�������������������������������������������������������������������������Ĵ��
���Sintaxe   � fImpressao()                                               ���
�������������������������������������������������������������������������Ĵ��
���Parametros�                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � Generico                                                   ���
�������������������������������������������������������������������������Ĵ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������*/
Static Function fImpressaoL()

Local nConta    := nContr := nContrT:=0
Local aDriver   := LEDriver()
Local _i        := 0
Local _aPos1    := {2000, 1900, 2100, 2300}
Local _aPos2    := {2270, 1900, 2340, 2300}
Local _aBmp     := {}
Local _aEmp     := {}
Local _oFont8   := Nil
Local _oFont10  := Nil
Local _oFont12  := Nil
Local _oFont16  := Nil
Local _oFont16n := Nil
Local _oFont24  := Nil
Local _oBrush   := Nil
Local cString   := ""
Local nCol      := 0
Local _lmesmo   := .F.
Local _Cont     := 0
Local _pag      := 0

Private TOTVENC := {}
Private TOTDESC := {}
Private aLanca  := {}      
Private aImpos  := {}      
Private nLinhas :=19              // Numero de Linhas do Miolo do Recibo
Private cCompac := aDriver[1]
Private cNormal := aDriver[2]

aAdd (_aBmp, GetSrvProfString("Startpath","") + "holerite" + cEmpAnt + ".BMP")	//Logo da empresa   
//aAdd(_aBmp, GetSrvProfString("Startpath","") + "DANFE" + cEmpAnt + ".BMP")	//Logo da empresa   


aAdd(_aEmp, SM0->M0_NOMECOM)	//Nome da Empresa
aAdd(_aEmp, Alltrim(SM0->M0_ENDCOB) + ", " +AllTrim(SM0->M0_BAIRCOB) +" - "+ AllTrim(SM0->M0_CIDCOB) + "-" + SM0->M0_ESTCOB )//Endere�o
aAdd(_aEmp, AllTrim(SM0->M0_CIDCOB) + ", " + SM0->M0_ESTCOB+ " , "+"CEP: " + Transform(SM0->M0_CEPCOB, "@R 99999-999")) //CEP
aAdd(_aEmp, "PABX/FAX: 55 " + SUBSTR(SM0->M0_TEL,3,2)+" "+SUBSTR(SM0->M0_TEL,5,4)+" "+SUBSTR(SM0->M0_TEL,9,4)+" / 55 "+ SUBSTR(SM0->M0_FAX,3,2)+" "+SUBSTR(SM0->M0_FAX,5,4)+" "+SUBSTR(SM0->M0_FAX,9,4)) //Telefones
aAdd(_aEmp, "CNPJ : " + Transform(SM0->M0_CGC, "@R 99.999.999/9999-99")) //CGC
aAdd(_aEmp, "I.E.: " + Transform(SM0->M0_INSC, "@R 999.999.999.999")) // IE

Ordem_Rel := 1

_oPrint := TMSPrinter():New( "Recibo Laser" )
_oPrint:SetPortrait() // ou SetLandscape()

//Par�metros de TFont.New()
//1.Nome da Fonte (Windows)
//3.Tamanho em Pixels
//5.Bold (T/F)

_oFont8   := TFont():New("Arial", 09,08,   ,.F., ,    , ,   ,.F.)
_oFont10  := TFont():New("Arial", 09,10,.T.,.F.,5,.T.,5,.T.,.F.)
_oFont4   := TFont():New("Arial", 09,08,.T.,.T.,5,.T.,5,.T.,.F.)  //-- 07/11/07 - Danielli
_oFont12  := TFont():New("Arial", 09,12,.T.,.F.,5,.T.,5,.T.,.F.)
_oFont16  := TFont():New("Arial", 09,16,.T.,.F.,5,.T.,5,.T.,.F.)
_oFont16n := TFont():New("Arial", 09,16,.T.,.T.,5,.T.,5,.T.,.F.)
_oFont24  := TFont():New("Arial", 09,24,.T.,.T.,5,.T.,5,.T.,.F.)

_oBrush   := TBrush():New("",4)

//-- 06/11/07 - Danielli
For _I := 1 TO Len(aFunc)
	 
  aLanca  := {}         // Zera Lancamentos	
  TOTVENC := {}
	TOTDESC := {}
	aImpos  := {}

	llanca(aFunc[_I][1],aFunc[_I][4])

	_Cont  := 0
	_pag   := IIf(Abs(Len(aLanca)/18)<=1,1,2)
	z      := 0
	_nctaz := 1

	For y := 1 to _pag

		_oPrint:StartPage()   // Inicia uma nova p�gina

		//--
		If mv_par19 == 2
	    cQtd := 2          
		Else    
	    cQtd := 1  
		ENDIF
		//-- 

		For z := 1 to cQtd //-- 2

			//��������������������������������������������������������������Ŀ
			//� Carrega Funcao do Funcion. de acordo com a Dt Referencia     �
			//����������������������������������������������������������������
			fBuscaFunc(dDataRef, @cCodFunc, @cDescFunc   )
			_reltipo := IIF(z==1," Recibo de Pagamento de Sal�rio"," Recibo de Pagamento de Sal�rio")

			//If cEmpAnt == "01" .Or. cEmpAnt == "80"
			_oPrint:SayBitmap(_Cont+045, 0100, _aBmp[1], 650, 115)
//			Else
//				_oPrint:Say(_Cont+045, 0100, _aEmp[1], _oFont10)
			//Endif

			_oPrint:Say(_Cont+045, 0850, _aEmp[1], _oFont10)
			_oPrint:Say(_Cont+080, 0850, _aEmp[2], _oFont10)
//			_oPrint:Say(_Cont+080, 0850, _aEmp[3], _oFont10) 
			_oPrint:Say(_Cont+115, 0850, _aEmp[5], _oFont10) 
//			_oPrint:Say(_Cont+115, 1350, _aEmp[6], _oFont10) 

			_oPrint:Box(_Cont+0180, 0100, _Cont+0280, 2300)

			_oPrint:Say(_Cont+0200, 0600, _Reltipo, _oFont16)
			_oPrint:Say(_Cont+0200, 1900, MesExtenso(MONTH(dDataRef))+"/"+STR(YEAR(dDataRef),4), _oFont16)

			_oPrint:Box(_Cont+0280, 0100, _Cont+0390, 2300)

			_oPrint:Say(_Cont+0290, 0115, "C�digo"                 , _oFont8)
			_oPrint:Say(_Cont+0290, 0225, "Nome do Funcion�rio"    , _oFont8)
			_oPrint:Say(_Cont+0290, 0815, "CBO"                    , _oFont8)
			_oPrint:Say(_Cont+0290, 0965, "Cto. Custo"             , _oFont8)
			_oPrint:Say(_Cont+0290, 1165, "Descri��o do Cto. Custo", _oFont8)
			_oPrint:Say(_Cont+0290, 1565, "Data de Admiss�o", _oFont8)			
			_oPrint:Say(_Cont+0290, 1965, "Emp./Fil."              , _oFont8)
			_oPrint:Say(_Cont+0290, 2240, "Fl."                    , _oFont8)
			
			_oPrint:Say(_Cont+0320, 0115, aFunc[_I][1], _oFont4)//codigo
			_oPrint:Say(_Cont+0320, 0225, aFunc[_I][2], _oFont4)//nome do funcionario
			_oPrint:Say(_Cont+0320, 0815, aFunc[_I][3], _oFont4)//cbo
			_oPrint:Say(_Cont+0320, 0965, aFunc[_I][4], _oFont4)//cto custo
			_oPrint:Say(_Cont+0320, 1165, aFunc[_I][5], _oFont4)//descricao do cto custo
			_oPrint:Say(_Cont+0320, 1565, aFunc[_I][15], _oFont4)//data de admissao
			_oPrint:Say(_Cont+0320, 1975, aFunc[_I][6], _oFont4)//empresa
			_oPrint:Say(_Cont+0320, 2240, StrZero(y,3), _oFont4)//folha
			
			_oPrint:Say(_Cont+0350, 0115, "Fun��o"             , _oFont8)
			_oPrint:Say(_Cont+0350, 0235, aFunc[_I][8]        , _oFont4)
			_oPrint:Say(_Cont+0350, 0335, "Descri��o da Fun��o", _oFont8)
			_oPrint:Say(_Cont+0350, 0735, aFunc[_I][9]        , _oFont4)
			
			_oPrint:Box(_Cont+0400, 0100, _Cont+1380, 2300)

			_oPrint:Line(_Cont+0400, 0250, _Cont+1080, 0250)
			_oPrint:Line(_Cont+0400, 1150, _Cont+1080, 1150)
			_oPrint:Line(_Cont+0400, 1300, _Cont+1380, 1300)
			_oPrint:Line(_Cont+0400, 1800, _Cont+1380, 1800)

			_oPrint:Say(_Cont+0410, 0125, "C�digo"     , _oFont8)
			_oPrint:Say(_Cont+0410, 0655, "Descri��o"  , _oFont8)
			_oPrint:Say(_Cont+0410, 1159, "Refer�ncia" , _oFont8)
			_oPrint:Say(_Cont+0410, 1450, "Vencimentos", _oFont8)
			_oPrint:Say(_Cont+0410, 1950, "Descontos"  , _oFont8)
			
			_oPrint:Line(_Cont+0450, 0100, _Cont+0450, 2300)

			_w := 0
			For nConta := _nctaz To Len(aLanca)
				If nConta <= iif(y >= 2,(nlinhas+_nctaz),nlinhas)  //.and. _pag > 2
                  //If aLanca[nConta,7] == y
					_w := _w + 30
					cString := Transform(aLanca[nConta,5],cPict2)
					nCol    := If(aLanca[nConta,1]="P",1630,If(aLanca[nConta,1]="D",2130,0255))
					_oPrint:Say(_Cont+0440+_w, 0155, aLanca[nConta,2] , _oFont8)
					_oPrint:Say(_Cont+0440+_w, 0255, aLanca[nConta,3] , _oFont8)
					
					If aLanca[nConta,1] # "B"        // So Imprime se nao for base
						If aLanca[nConta,4] <= 9.99
//							_oPrint:Say(_Cont+0440+_w, 1193, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)
							_oPrint:Say(_Cont+0440+_w, 1193, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)							
						Endif
						If aLanca[nConta,4] <= 99.99 .and. aLanca[nConta,4] > 9.99
//							_oPrint:Say(_Cont+0440+_w, 1185, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)
							_oPrint:Say(_Cont+0440+_w, 1187, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)							
						Endif
						If aLanca[nConta,4] <= 999.99 .and. aLanca[nConta,4] > 99.99
//							_oPrint:Say(_Cont+0440+_w, 1175, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)
							_oPrint:Say(_Cont+0440+_w, 1179, TRANSFORM(aLanca[nConta,4],"999.99"), _oFont8)							
						Endif
					Endif
					If aLanca[nConta,5] <= 9.99
//						_oPrint:Say(_Cont+0440+_w, nCol+28, cString            , _oFont8)
						_oPrint:Say(_Cont+0440+_w, nCol+16, cString            , _oFont8)						
					Endif
					If aLanca[nConta,5] <= 99.99 .and. aLanca[nConta,5] > 9.99
//						_oPrint:Say(_Cont+0440+_w, nCol+20, cString            , _oFont8)
						_oPrint:Say(_Cont+0440+_w, nCol+13, cString            , _oFont8)						
					Endif
					If aLanca[nConta,5] <= 999.99 .and. aLanca[nConta,5] > 99.99
//						_oPrint:Say(_Cont+0440+_w, nCol+10, cString            , _oFont8)
						_oPrint:Say(_Cont+0440+_w, nCol+07, cString            , _oFont8)						
					Endif
					If aLanca[nConta,5] <= 9999.99 .and. aLanca[nConta,5] > 999.99
						_oPrint:Say(_Cont+0440+_w, nCol, cString            , _oFont8)						
					Endif
					
					nContr ++
					nContrT ++

					If nContr = nLinhas //.And. nContrT < Len(aLanca)
						nContr:=0
						Ordem_Rel ++
						//afunc[1][7] := Ordem_Rel
						_w := _w + 30
						_oPrint:Say(_Cont+1205, nCol-20, "CONTINUA !!!" , _oFont8)
//					_oPrint:Say(_Cont+1205, 2130,TRANSFORM((TOTVENC[1][2]-TOTDESC[1][2]),cPict1), _oFont8)
						
						//Mensagens
						
						_oPrint:Line(_Cont+1080, 0100, _Cont+1080, 2300)
						
						_oPrint:Say(_Cont+1090, 1450, "Total de Vencimentos", _oFont8)
						_oPrint:Say(_Cont+1090, 1950, "Total de Descontos"   , _oFont8)
						_oPrint:Line(_Cont+1180,1300, _Cont+1180, 2300)
						_oPrint:Say(_Cont+1205, 1315, "Valor L�quido      ==>"   , _oFont10)
						
						_oPrint:Box(_Cont+1280, 0100, _Cont+1380, 2300)
						_oPrint:Say(_Cont+1295, 0150, "Sal�rio-Base"   , _oFont8)
						_oPrint:Say(_Cont+1295, 0500, "Sal. Contr. INSS"   , _oFont8)
						_oPrint:Say(_Cont+1295, 1000, "Base C�lc. FGTS"   , _oFont8)
						_oPrint:Say(_Cont+1295, 1305, "F.G.T.S. do M�s"   , _oFont8)
						_oPrint:Say(_Cont+1295, 1600, "Base C�lc. IRRF"   , _oFont8)
						_oPrint:Say(_Cont+1295, 2000, "Faixa IRRF"   , _oFont8)
						
						_oPrint:Box(_Cont+1390, 0100, _Cont+1600, 2300)
						_oPrint:Say(_Cont+1395, 0150, "DECLARO TER RECEBIDO A IMPORT�NCIA L�QUIDA DISCRIMINADA NESTE RECIBO.", _oFont8 )
						_oPrint:Say(_Cont+1520, 0150, " ________/________/________  "                                        , _oFont10)
						_oPrint:Say(_Cont+1520, 0950, " ____________________________________________________________"        , _oFont10)
						_oPrint:Say(_Cont+1560, 0150, "                    DATA                   "                          , _oFont10)
						_oPrint:Say(_Cont+1560, 1150, " ASSINATURA DO FUNCION�RIO                              "             , _oFont10)
						//If nContrT > Len(aLanca) .and. z==2
						_lmesmo := .T.
						
						//Else
						//  If nContrT < Len(aLanca) .and. z==1
						//    _lmesmo := .T.
						//  Endif
						//Endif
					Endif
				  //Endif	
				Endif       
	
			Next nConta
			
			If !_lmesmo .or. (y >= 2 .and. _lmesmo)
				//Mensagens
				
				_oPrint:Say(_Cont+1080, 0115, DESC_MSG[_I][1], _oFont8)
				_oPrint:Say(_Cont+1110, 0115, DESC_MSG[_I][2], _oFont8)
				_oPrint:Say(_Cont+1140, 0115, DESC_MSG[_I][3], _oFont8)
				IF MONTH(dDataRef) = aFunc[_I][11]
					_oPrint:Say(_Cont+1170, 0115, "F E L I Z   A N I V E R S A R I O  ! !", _oFont8)
					_oPrint:Say(_Cont+1200, 0115, DESC_MSG[_I][5], _oFont8)
					
				ELSE
					_oPrint:Say(_Cont+1170, 0115, DESC_MSG[_I][4], _oFont8)
					_oPrint:Say(_Cont+1200, 0115, DESC_MSG[_I][5], _oFont8)
				ENDIF
				
				//Mensagens da conta corrente
				
				IF SRA->RA_BCDEPSAL # SPACE(8)
					If aFunc[_I][12] = "001"
						Desc_Bco := "Banco do Brasil  "
					ElseIf aFunc[_I][12] = "399"
							Desc_Bco := "Banco HSBC  "  
					ElseIf aFunc[_I][12] = "237"
							Desc_Bco := "Banco Bradesco  "  
					ElseIf aFunc[_I][12] = "104"
							Desc_Bco := "Caixa Economica Federal  " 
					ElseIf aFunc[_I][12] = "341"
							Desc_Bco := "Banco Ita�  "   
					Endif
//					Desc_Bco := DescBco(Sra->Ra_BcDepSal,Sra->Ra_Filial)  //-- DESABILITEI AQUI
					
					_oPrint:Say(_Cont+1230, 0115, "CRED: "+aFunc[_I][13]+" - "+DESC_BCO+"CONTA: " + aFunc[_I][14], _oFont8)
				ENDIF
				
				_oPrint:Line(_Cont+1080, 0100, _Cont+1080, 2300)
				
				_oPrint:Say(_Cont+1090, 1450, "Total de Vencimentos", _oFont8)
				_oPrint:Say(_Cont+1090, 1950, "Total de Descontos"   , _oFont8)
				_oPrint:Line(_Cont+1180, 1300, _Cont+1180, 2300)
				_oPrint:Say(_Cont+1205, 1315, "Valor Liquido      ==>"   , _oFont10)
				
				If TOTVENC[1][2] <= 9.99
					_oPrint:Say(_Cont+1130, 1658,TRANSFORM(TOTVENC[1][2],cPict1), _oFont8)
				Endif
				If TOTVENC[1][2] <= 99.99 .and. TOTVENC[1][2] > 9.99
					_oPrint:Say(_Cont+1130, 1650,TRANSFORM(TOTVENC[1][2],cPict1), _oFont8)
				Endif
				If TOTVENC[1][2] <= 999.99 .and. TOTVENC[1][2] > 99.99
					_oPrint:Say(_Cont+1130, 1640,TRANSFORM(TOTVENC[1][2],cPict1), _oFont8)
				Endif
				If TOTVENC[1][2] <= 9999.99 .and. TOTVENC[1][2] > 999.99
					_oPrint:Say(_Cont+1130, 1630,TRANSFORM(TOTVENC[1][2],cPict1), _oFont8)
				Endif
				
				If TOTDESC[1][2] <= 9.99
					_oPrint:Say(_Cont+1130, 2158,TRANSFORM(TOTDESC[1][2],cPict1), _oFont8)
				Endif
				If TOTDESC[1][2] <= 99.99 .and. TOTDESC[1][2] > 9.99
					_oPrint:Say(_Cont+1130, 2150,TRANSFORM(TOTDESC[1][2],cPict1), _oFont8)
				Endif
				If TOTDESC[1][2] <= 999.99 .and. TOTDESC[1][2] > 99.99
					_oPrint:Say(_Cont+1130, 2140,TRANSFORM(TOTDESC[1][2],cPict1), _oFont8)
				Endif
				If TOTDESC[1][2] <= 9999.99 .and. TOTDESC[1][2] > 999.99
					_oPrint:Say(_Cont+1130, 2130,TRANSFORM(TOTDESC[1][2],cPict1), _oFont8)
				Endif
				
				If (TOTVENC[1][2]-TOTDESC[1][2]) <= 9.99
					_oPrint:Say(_Cont+1205, 2158,TRANSFORM((TOTVENC[1][2]-TOTDESC[1][2]),cPict1), _oFont8)
				Endif
				If (TOTVENC[1][2]-TOTDESC[1][2]) <= 99.99 .and. (TOTVENC[1][2]-TOTDESC[1][2]) > 9.99
					_oPrint:Say(_Cont+1205, 2150,TRANSFORM((TOTVENC[1][2]-TOTDESC[1][2]),cPict1), _oFont8)
				Endif
				If (TOTVENC[1][2]-TOTDESC[1][2]) <= 999.99 .and. (TOTVENC[1][2]-TOTDESC[1][2]) > 99.99
					_oPrint:Say(_Cont+1205, 2140,TRANSFORM((TOTVENC[1][2]-TOTDESC[1][2]),cPict1), _oFont8)
				Endif
				If (TOTVENC[1][2]-TOTDESC[1][2]) <= 9999.99 .and. (TOTVENC[1][2]-TOTDESC[1][2]) > 999.99
					_oPrint:Say(_Cont+1205, 2130,TRANSFORM((TOTVENC[1][2]-TOTDESC[1][2]),cPict1), _oFont8)
				Endif
				
				_oPrint:Box(_Cont+1280, 0100, _Cont+1380, 2300)
				_oPrint:Say(_Cont+1295, 0150, "Sal�rio-Base"    , _oFont8)
				_oPrint:Say(_Cont+1295, 0500, "Sal. Contr. INSS", _oFont8)
				_oPrint:Say(_Cont+1295, 0800, "Base C�lc. FGTS" , _oFont8)
				_oPrint:Say(_Cont+1295, 1305, "F.G.T.S. do M�s" , _oFont8)
				_oPrint:Say(_Cont+1295, 1600, "Base C�lc. IRRF" , _oFont8)
				_oPrint:Say(_Cont+1295, 2000, "Faixa IRRF"      , _oFont8)
				
				If !Empty( cAliasMov )
					nValSal := 0
					nValSal := fBuscaSal(dDataRef)
					If nValSal ==0
						nValSal := aFunc[_I][10]
					EndIf
				Else
					nValSal := aFunc[_I][10]
				EndIf
				_oPrint:Say(_Cont+1325, 0150, Transform(nValSal,cPict2) , _oFont8)
				
				If Esc = 1  // Bases de Adiantamento
					If cBaseAux = "S" .And. aImpos[1][1] # 0
						_oPrint:Say(_Cont+1325, 1600, TRANSFORM(aImpos[1][1],cPict1) , _oFont8)
					Endif
				ElseIf Esc = 2 .Or. Esc = 4  // Bases de Folha e 13o. 2o.PaRD.
					If cBaseAux = "S"
						_oPrint:Say(_Cont+1325, 0500,Transform(aImpos[1][2],cPict1) , _oFont8)
						If aImpos[1][3] # 0
							_oPrint:Say(_Cont+1325, 0800, TRANSFORM(aImpos[1][3],cPict1) , _oFont8)
						Endif
						If aImpos[1][4] # 0
							_oPrint:Say(_Cont+1325, 1300,TRANSFORM(aImpos[1][4],cPict2) , _oFont8)
						Endif
						If aImpos[1][1] # 0
							_oPrint:Say(_Cont+1325, 1600,TRANSFORM(aImpos[1][1],cPict1) , _oFont8)
						Endif
						_oPrint:Say(_Cont+1325, 2000, Transform(aImpos[1][5],cPict1) , _oFont8)
					Endif
				ElseIf Esc = 3 // Bases de FGTS e FGTS Depositado da 1� PaRDela
					If cBaseAux = "S"
						If aImpos[1][3] # 0
							_oPrint:Say(_Cont+1325, 0800,TRANSFORM(aImpos[1][3],cPict1), _oFont8)
						Endif
						If aImpos[1][4] # 0
							_oPrint:Say(_Cont+1325, 1300, TRANSFORM(aImpos[1][4],cPict2) , _oFont8)
						Endif
					Endif
				Endif

				_oPrint:Box(_Cont+1390, 0100, _Cont+1600, 2300)
				_oPrint:Say(_Cont+1395, 0150, "DECLARO TER RECEBIDO A IMPORT�NCIA LIQUIDA DISCRIMINADA NESTE RECIBO.", _oFont8 )
				_oPrint:Say(_Cont+1520, 0150, " ________/________/________  "                                        , _oFont10)
				_oPrint:Say(_Cont+1520, 0950, " ____________________________________________________________"        , _oFont10)
				_oPrint:Say(_Cont+1560, 0150, "                    DATA                   "                          , _oFont10)
				_oPrint:Say(_Cont+1560, 1150, " ASSINATURA DO FUNCION�RIO                              "             , _oFont10)

			Endif
		    _lmesmo	:= .F.

			If z == 1
				For i := 100 to 2200 step 50
					_oPrint:Line(_Cont+1650, i, _Cont+1650, i + 30)  
				Next i
				_Cont := 1700
			Endif

   		nContr := 0

		Next

		_oPrint:EndPage()     // Finaliza a p�gina
		_Cont  := 0
		_nctaz := 20

	Next

Next

_oPrint:Preview()     // Visualiza antes de imprimir

Return Nil


/*---------------------------------------------------------------------------*/


Static Function llanca(_codmat,_codcc)

Local cNroHoras   := &("{ || If(SRD->RD_QTDSEM > 0, SRD->RD_QTDSEM, SRD->RD_HORAS) }")

nAteLim  := nBaseFgts := nFgts := nBaseIr := nBaseIrFe := 0.00
_TOTVENC := 0
_TOTDESC := 0
Esc      := mv_par02

dbSelectArea("SRA")                            
dbSetOrder(1)
dbgotop()
dbSeek(xFilial("SRA")+_codmat)

If Esc == 1 .OR. Esc == 2  // adto ou folha
		dbSelectArea("SRD")
		dbSetOrder(1)
		If dbSeek(xFilial("SRA")+_codmat)
			While !Eof() .And. SRD->RD_FILIAL+SRD->RD_MAT == SRA->RA_FILIAL+SRA->RA_MAT
				IF AllTrim(cAnoMesRef) == SRD->RD_PERIODO // Valida��o Periodo n�o pode ser o MV_PAR01 
				If (Esc == 1) .And. (SRD->RD_Pd == aCodFol[7,1])      // Desconto de Adto
					fSomaPd("P",aCodFol[6,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Elseif (Esc == 1) .And. (SRD->RD_Pd == aCodFol[12,1])
					fSomaPd("D",aCodFol[9,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTDESC+=SRD->RD_VALOR
				Elseif (Esc == 1) .And. (SRD->RD_Pd == aCodFol[8,1])
					fSomaPd("P",aCodFol[8,1],Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Else
					If PosSrv( SRD->RD_Pd , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							If cPaisLoc == "PAR" .and. Eval(cNroHoras) == 30
								LocGHabRea(Ctod("01/"+SubStr(DTOC(dDataRef),4)), Ctod(StrZero(F_ULTDIA(dDataRef),2)+"/"+Strzero(Month(dDataRef),2)+"/"+right(str(Year(dDataRef)),2)),@nHoras)
							Else
								nHoras := Eval(cNroHoras)
							Endif
							fSomaPd("P",SRD->RD_PD,nHoras,SRD->RD_VALOR,SRD->RD_MAT)
							_TOTVENC+=SRD->RD_Valor
						Endif
					Elseif SRV->RV_TIPOCOD == "2"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							fSomaPd("D",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
							_TOTDESC+=SRD->RD_Valor
						Endif
					Elseif SRV->RV_TIPOCOD == "3"
						If (Esc # 1) .Or. (Esc == 1 .And. SRV->RV_ADIANTA == "S")
							fSomaPd("B",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
						Endif
					Endif
				Endif
				If ESC = 1
					If SRD->RD_PD == aCodFol[10,1]
						nBaseIr := SRD->RD_VALOR
					Endif
				ElseIf SRD->RD_PD == aCodFol[13,1]
					nAteLim += SRD->RD_VALOR
				Elseif SRD->RD_PD$ aCodFol[108,1]+'*'+aCodFol[17,1]
					nBaseFgts += SRD->RD_VALOR
				Elseif SRD->RD_PD$ aCodFol[109,1]+'*'+aCodFol[18,1]
					nFgts += SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[15,1]
					nBaseIr += SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[16,1]
					nBaseIrFe += SRD->RD_VALOR
				Endif
				ENDIF //CAIQUE
				dbSelectArea("SRD")
				dbSkip()
			Enddo
		Endif
		
Elseif Esc == 3
		//��������������������������������������������������������������Ŀ
		//� Busca os codigos de pensao definidos no cadastro beneficiario�
		//����������������������������������������������������������������
		fBusCadBenef(@aCodBenef, "131",{aCodfol[172,1]})
		dbSelectArea("SRD")
		dbSetOrder(1)
		If dbSeek(xFilial("SRA")+_codmat)
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_MAT == SRD->RD_FILIAL + SRD->RD_MAT
				If SRD->RD_PD == aCodFol[22,1]
					fSomaPd("P",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTVENC+=SRD->RD_Valor
				Elseif Ascan(aCodBenef, { |x| x[1] == SRD->RD_PD }) > 0
					fSomaPd("D",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
					_TOTDESC+=SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[108,1] .Or. SRD->RD_PD == aCodFol[109,1] .Or. SRD->RD_PD == aCodFol[173,1]
					fSomaPd("B",SRD->RD_PD,Eval(cNroHoras),SRD->RD_VALOR,SRD->RD_MAT)
				Endif
				
				If SRD->RD_PD == aCodFol[108,1]
					nBaseFgts := SRD->RD_VALOR
				Elseif SRD->RD_PD == aCodFol[109,1]
					nFgts     := SRD->RD_VALOR
				Endif
				dbSelectArea("SRD")
				dbSkip()
			Enddo
		Endif
Elseif Esc == 4
		dbSelectArea("SRI")
		dbSetOrder(2)
		If dbSeek(xFilial("SRA")+_codcc+_codmat)
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_CC + SRA->RA_MAT == SRI->RI_FILIAL + SRI->RI_CC + SRI->RI_MAT
				If PosSrv( SRI->RI_PD , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
					fSomaPd("P",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
					_TOTVENC = _TOTVENC + SRI->RI_VALOR
				Elseif SRV->RV_TIPOCOD == "2"
					fSomaPd("D",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
					_TOTDESC = _TOTDESC + SRI->RI_VALOR
				Elseif SRV->RV_TIPOCOD == "3"
					fSomaPd("B",SRI->RI_PD,SRI->RI_HORAS,SRI->RI_VALOR,SRI->RI_MAT)
				Endif
				
				If SRI->RI_PD == aCodFol[19,1]
					nAteLim += SRI->RI_VALOR
				Elseif SRI->RI_PD$ aCodFol[108,1]
					nBaseFgts += SRI->RI_VALOR
				Elseif SRI->RI_PD$ aCodFol[109,1]
					nFgts += SRI->RI_VALOR
				Elseif SRI->RI_PD == aCodFol[27,1]
					nBaseIr += SRI->RI_VALOR
				Endif
				dbSkip()
			Enddo
		Endif
Elseif Esc == 5
		dbSelectArea("SR1")
		dbSetOrder(1)
		If dbSeek(xFilial("SRA")+_codmat)
			While !Eof() .And. SRA->RA_FILIAL + SRA->RA_MAT ==	SR1->R1_FILIAL + SR1->R1_MAT
				If PosSrv( SR1->R1_PD , SRA->RA_FILIAL , "RV_TIPOCOD" ) == "1"
					fSomaPd("P",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
					_TOTVENC = _TOTVENC + SR1->R1_VALOR
				Elseif SRV->RV_TIPOCOD == "2"
					fSomaPd("D",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
					_TOTDESC = _TOTDESC + SR1->R1_VALOR
				Elseif SRV->RV_TIPOCOD == "3"
					fSomaPd("B",SR1->R1_PD,SR1->R1_HORAS,SR1->R1_VALOR,SR1->R1_MAT)
				Endif
				dbskip()
			Enddo
		Endif
Endif
	
dbSelectArea("SRA")  

//If _TOTVENC = 0 .And. _TOTDESC = 0
//		dbSkip()
//		Loop
//Endif
	
aAdd(TOTVENC,{_n, _TOTVENC})
aAdd(TOTDESC,{_n, _TOTDESC})
	
aAdd(aImpos,{nBaseIr,;
            nAteLim,;
        	nBaseFgts,;
        	nFgts,;
        	nBaseIrFe})


Return



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    �fSomaPd   � Autor � R.H. - Mauro          � Data � 24.09.95 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Somar as Verbas no Array                                   ���
�������������������������������������������������������������������������Ĵ��
���Sintaxe   � fSomaPd(Tipo,Verba,Horas,Valor)                            ���
�������������������������������������������������������������������������Ĵ��
���Parametros�                                                            ���
�������������������������������������������������������������������������Ĵ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������*/
Static Function fSomaPd(cTipo,cPd,nHoras,nValor,cMat)

Local Desc_paga

Desc_paga := DescPd(cPd,Sra->Ra_Filial)  // mostra como pagto

If cTipo # 'B'
	//--Array para Recibo Pre-Impresso
	nPos := Ascan(aLanca,{ |X| X[2] = cPd })
	If nPos == 0
		Aadd(aLanca,{cTipo,cPd,Desc_Paga,nHoras,nValor,cMat,_n})
	Else
		aLanca[nPos,4] += nHoras
		aLanca[nPos,5] += nValor
	Endif
Endif

/*//--Array para o Recibo Pre-Impresso
If cTipo = 'P'
	cArray := "aProve"
Elseif cTipo = 'D'
	cArray := "aDesco"
Elseif cTipo = 'B'
	cArray := "aBases"
Endif

nPos := Ascan(&cArray,{ |X| X[1] = cPd })
If nPos == 0
	Aadd(&cArray,_n,{cPd+" "+Desc_Paga,nHoras,nValor })
Else
	&cArray[_n,nPos,2] += nHoras
	&cArray[_n,nPos,3] += nValor
Endif  
  */
Return

*-------------------------------------------------------
Static Function Transforma(dData) //Transforma as datas no formato DD/MM/AAAA
*-------------------------------------------------------
Return(StrZero(Day(dData),2) +"/"+ StrZero(Month(dData),2) +"/"+ Right(Str(Year(dData)),4))


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �fInicia   �Autor  �Natie               � Data �  04/12/01   ���
�������������������������������������������������������������������������͹��
���Desc.     �Inicializa parametros para impressao                        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP5                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function  fInicia(cString,nTipoRel)

aDriver := LEDriver()

If LastKey() = 27 .Or. nLastKey = 27
	Return  .F.
Endif

SetDefault(aReturn,cString)

If LastKey() = 27 .OR. nLastKey = 27
	Return .F.
Endif

Return .T.

/*Static Function fValidSX1()

aPergs := {}

Aadd(aPergs,{"Data de Referencia     ?", "", "","mv_ch1", "D", 08, 0, 0, "G", "naovazio"  ,"mv_par01", "","", "", "","" ,"", "","","","", "", "","","", "", "","","", "", "","",""})
Aadd(aPergs,{ "Imprimir Recibos      ?", "", "","mv_ch2", "N", 01, 0, 0, "C", ""          ,"mv_par02","Adto.","","","","","Folha","","","","","1a.PaRD.","","","","","2a.PaRD.","","","","","Val.Extras","","","","",""})
Aadd(aPergs,{ "De Filial             ?", "", "","mv_ch3", "C", 02, 0, 0, "G", "naovazio"  ,"mv_par03", "","", "","","","", "","","","", "","","","", "","","","", "XM0", "","",""})
Aadd(aPergs,{ "Ate Filial            ?", "", "","mv_ch4", "C", 02, 0, 0, "G", "naovazio"  ,"mv_par04", "","", "","","","", "","","","", "","","","", "","","","", "XM0", "","",""})
Aadd(aPergs,{ "De Centro de Custo    ?", "", "","mv_ch5", "C", 09, 0, 0, "G", "naovazio"  ,"mv_par05", "","", "","","","", "","","","", "","","","", "","","","", "CTT", "","",""})
Aadd(aPergs,{ "Ate Centro de Custo   ?", "", "","mv_ch6", "C", 09, 0, 0, "G", "naovazio"  ,"mv_par06", "","", "","","","", "","","","", "","","","", "","","","", "CTT", "","",""})
Aadd(aPergs,{ "De Matricula          ?", "", "","mv_ch7", "C", 06, 0, 0, "G", "naovazio"  ,"mv_par07", "","", "","","","", "","","","", "","","","", "","","","", "SRA", "","",""})
Aadd(aPergs,{"Ate Matricula          ?", "", "","mv_ch8", "C", 06, 0, 0, "G", "naovazio"  ,"mv_par08", "","", "","","","", "","","","", "","","","", "","","","", "SRA", "","",""})
Aadd(aPergs,{ "De Nome               ?", "", "","mv_ch9", "C", 30, 0, 0, "G", "naovazio"  ,"mv_par09", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Ate Nome              ?", "", "","mv_chA", "C", 30, 0, 0, "G", "naovazio"  ,"mv_par10", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Mensagem 1            ?", "", "","mv_chB", "C", 02, 0, 0, "G", ""          ,"mv_par11", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Mensagem 2            ?", "", "","mv_chC", "C", 02, 0, 0, "G", ""          ,"mv_par12", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Mensagem 3            ?", "", "","mv_chD", "C", 02, 0, 0, "G", ""          ,"mv_par13", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Mensagem 4            ?", "", "","mv_chE", "C", 62, 0, 0, "G", ""          ,"mv_par14", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Mensagem 5            ?", "", "","mv_chF", "C", 62, 0, 0, "G", ""          ,"mv_par15", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Situacoes a Imp.      ?", "", "","mv_chG", "C", 05, 0, 0, "G", "fSituacao" ,"mv_par16", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "Categorias a Imp.     ?", "", "","mv_chH", "C", 15, 0, 0, "G", "fCategoria","mv_par17", "","", "","","","", "","","","", "","","","", "","","","", "", "","",""})
Aadd(aPergs,{ "imprime Bases         ?", "", "","mv_chI", "C", 01, 0, 0, "C", ""          , "mv_par18", "Sim","Si","Yes","","","Nao","No","No","","","","","","","","","","","","","","","","","",""})
Aadd(aPergs,{ "Imprimir Qtde         ?", "", "","mv_chJ", "C", 01, 0, 0, "C", ""          , "mv_par19", "1-Via","1-Via","1-Via","","","2-Vias","2-Vias","2-Vias","","","","","","","","","","","","","","","","","",""})

AjustaSx1("RGPE02",aPergs)

Return*/