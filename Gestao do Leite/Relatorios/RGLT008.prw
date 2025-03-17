#INCLUDE "rwmake.ch"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT008  � Autor � Guilherme Fran�a      � Data da Criacao  � 02/08/2016                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relat�rio de Ticket em cupom.                                                                                ���
���          � Fun��o chamada na tela da rece��o de leite para emitir o relatorio de conferencia do ticket apontado.		���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �  PROMILAT                                                           						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                               			                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                			       �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function RGLT008


//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������

Local cDesc1         := "Este programa tem como objetivo imprimir relatorio "
Local cDesc2         := "de acordo com os parametros informados pelo usuario."
Local cDesc3         := "Cupom do Ticket"
Local cPict          := ""
Local titulo       := "Cupom do Ticket"


Local Cabec1       := ""
Local Cabec2       := ""
Local imprime      := .T.
Local aOrd := {}

Local _lTelaImp := .t.		

Private nLin         := 0
Private lEnd         := .F.
Private lAbortPrint  := .F.
Private limite           := 80
Private tamanho          := "P"
Private nomeprog         := "RGLT008" // Coloque aqui o nome do programa para impressao no cabecalho
Private nTipo            := 15
Private aReturn          := { "Zebrado", 1, "Administracao", 1, 2, 1, "", 1}
Private nLastKey        := 0
Private cPerg       := "RGLT008"
Private cbtxt      := Space(10)
Private cbcont     := 00
Private CONTFL     := 01
Private m_pag      := 01
Private wnrel      := "RGLT008" // Coloque aqui o nome do arquivo usado para impressao em disco

Private cString := "ZLD"

Private _cPortcp :=  Alltrim(GetMv("LT_PORTIMP")) //Porta aonde est� instalado a impressora. Ex: LPT1

Private _nLarg := 45

dbSelectArea("ZLD")
dbSetOrder(1)


//pergunte(cPerg,.F.)

//���������������������������������������������������������������������Ŀ
//� Monta a interface padrao com o usuario...                           �
//�����������������������������������������������������������������������

//wnrel := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,.T.,Tamanho,,.F.)
//wnrel := SetPrint(cString,wnrel,cPerg,@Titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,.F.,Tamanho,,.T.,,'EPSON.DRV',.F.,,"LPT1")
If !Empty(_cPortcp)
	If MsgYesNo("Imprimir direto na Impressora "+_cPortcp+"?","Impress�o Ticket")
	
	
		Set( 24, _cPortcp, .F. ) // Set Printer To Lpt1 e a mesma coisa
		PrinterWin(.F.) // Impressao Dos/Windows
		PreparePrint(.F., "", .F., _cPortcp) // Prepara a impressao na porta especificada
		InitPrint(1) // Inicia Cliente/Servidor

		_lTelaImp := .f.		
	EndIf
EndIf

If _lTelaImp
	wnrel := SetPrint(cString,NomeProg,,@titulo,cDesc1,cDesc2,cDesc3,.T.,aOrd,.T.,Tamanho,,.T.)
	If nLastKey == 27
		Return
	Endif
	
	SetDefault(aReturn,cString)
		
	If nLastKey == 27
		Return
	Endif
	nTipo := If(aReturn[4]==1,15,18)
Endif

//���������������������������������������������������������������������Ŀ
//� Processamento. RPTSTATUS monta janela com a regua de processamento. �
//�����������������������������������������������������������������������

RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)
Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �RUNREPORT � Autor � AP6 IDE            � Data �  02/08/16   ���
�������������������������������������������������������������������������͹��
���Descri��o � Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS ���
���          � monta a janela com a regua de processamento.               ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)

Local nOrdem
Local _nSoma := 0
Local _nTotBom := 0
Private _cTexto

MontaTRB()

nLin := 8


//���������������������������������������������������������������������Ŀ
//� SETREGUA -> Indica quantos registros serao processados para a regua �
//�����������������������������������������������������������������������

SetRegua(RecCount())


ImpCabec()


_cTexto:="           T  I  C  K  E  T          " ; imprime()

_cTexto:="      " ; imprime()
_cTexto:="No.: "+TRB->TICKET+"    "+"Emissao: "+DTOC(STOD(TRB->DTLANC))+"  "+TRB->HORA; imprime()

nLin ++

_cTexto:= Replicate("-",_nLarg); imprime()
_cTexto:="Motorista: "+SUBSTR(TRB->NOMMOT,1,25)+"      " 	; imprime()
_cTexto:="Placa    : "+Transform(TRB->PLACA,"@R XXX-9999")+"   "; imprime()
_cTexto:="Rota: "+TRB->ROTA+"  "+SubStr(TRB->NOMROTA,1,25); imprime()
_cTexto:="Volume Carga: "+TransForm(TRB->TOTBOM,"@E 99,999,999")+" Litros"; imprime()
_cTexto:=Replicate("=",_nLarg) ; imprime()
_cTexto:="PRODUTOR "	+PADR("QUANTIDADE",_nLarg); imprime()

_nTotBom := TRB->TOTBOM

While !TRB->(EOF())
	
	//���������������������������������������������������������������������Ŀ
	//� Verifica o cancelamento pelo usuario...                             �
	//�����������������������������������������������������������������������
	
	If lAbortPrint
		@nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
		Exit
	Endif
	
                       	
	_cTexto:= TRB->PROD+"/"+TRB->LJPROD+" "+SubStr(TRB->NOMPRO,1,23)+" "+TransForm(TRB->QTDPROD,"@E 99,999,999")	; imprime()
	_nSoma += TRB->QTDPROD
	
	TRB->(dbSkip()) // Avanca o ponteiro do registro no arquivo
EndDo

_cTexto:= Replicate("-",_nLarg); imprime()
_cTexto:="TOTAL:" +PADR(TransForm(_nSoma,"@E 999,999,999"),_nLarg); imprime()
_cTexto:=" " ; imprime()
If (_nTotBom - _nSoma) <> 0
	_cTexto:="Diferen�a de Volume: "+PADR(TransForm(_nTotBom - _nSoma,"@E 999,999,999"),_nLarg); imprime()
EndIf
_cTexto:= Replicate("=",_nLarg) ; imprime()

_nSoma := 0
nLin+=8
_cTexto:=" " ; imprime()// Avan�a formulario

SetPrc(0,0)                              // (Zera o Formulario)


//���������������������������������������������������������������������Ŀ
//� Finaliza a execucao do relatorio...                                 �
//�����������������������������������������������������������������������

SET DEVICE TO SCREEN

//���������������������������������������������������������������������Ŀ
//� Se impressao em disco, chama o gerenciador de impressao...          �
//�����������������������������������������������������������������������

If aReturn[5]==1
	dbCommitAll()
	SET PRINTER TO
	OurSpool(wnrel)
Endif

MS_FLUSH()

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MontaTRB  �Autor  �Microsiga           � Data �  08/02/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Seleciona registros do ticket a ser impresso.              ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function MontaTRB()

Local _aArea := ZLD->(GetArea())
Local _cTicket := ZLD->ZLD_TICKET


If Select("TRB")<>0
	TRB->(DbCloseArea())
EndIf

BeginSql alias "TRB"
	SELECT ZLD_TICKET AS TICKET, ZLD_DTLANC AS DTLANC, ZLD_FRETIS AS FRETISTA,
	LD.ZLD_MOTOR AS CODMOT, L0.ZL0_NOME AS NOMMOT, L4.ZL4_PLACA AS PLACA,
	LD.ZLD_RETIRO AS PROD, LD.ZLD_RETILJ AS LJPROD, LD.ZLD_DCRRET AS NOMPRO,
	LD.ZLD_QTDBOM AS QTDPROD,LD.ZLD_TOTBOM AS TOTBOM, LD.ZLD_HORDES AS HORA,
	LD.ZLD_ROTCAB AS ROTA, LD.ZLD_DESCAB AS NOMROTA
	
	FROM %Table:ZLD% LD                                                       	
	JOIN %Table:ZL0% L0 ON L0.ZL0_COD = LD.ZLD_MOTOR AND L0.D_E_L_E_T_ = ' '
	JOIN %Table:ZL4% L4 ON L4.ZL4_COD = LD.ZLD_VEICUL AND L4.D_E_L_E_T_ = ' '
	WHERE LD.ZLD_FILIAL = %Exp:xFilial("ZLD")% AND LD.ZLD_TICKET = %Exp:_cTicket% AND LD.%NotDel%
EndSql

DbSelectArea("TRB")
TRB->(DbGoTop())

RestArea(_aArea)

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ImpCabec  �Autor  �Microsiga           � Data �  02/08/16   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ImpCabec()
/*
_cTexto:="=============================================" ; imprime()
_cTexto:="             P  R  O  M  I  L  A  T          " ; imprime()
_cTexto:="   PROMILAT IND. E COM. DE LATICINIOS LTDA.  " ; imprime()
_cTexto:="   Rua Florentino lopes, 200 -  Proissao-SP  " ; imprime()
_cTexto:="          Fone/Fax: (014) 3541-2410          " ; imprime()
_cTexto:="       E-mail: captacao@promilat.com.br      " ; imprime()
_cTexto:="=============================================" ; imprime()
*/
_cTexto:= Replicate("=",_nLarg) ; imprime()
_cTexto:= PADC(Alltrim(SM0->M0_NOMECOM),_nLarg) ; imprime()
_cTexto:= PADC("CNPJ: "+Transform(SM0->M0_CGC,"@r 99.999.999/9999-99"),_nLarg) ; imprime()
_cTexto:= PADC(Alltrim(SM0->M0_ENDCOB)+" - "+Alltrim(SM0->M0_CIDCOB)+"-"+SM0->M0_ESTCOB,_nLarg) ; imprime()
_cTexto:= PADC("Fone/Fax: "+Alltrim(SM0->M0_TEL),_nLarg) ; imprime()
_cTexto:=Replicate("=",_nLarg) ; imprime()


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �imprime   �Autor  �Microsiga           � Data �  02/08/16   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static function imprime()

@ nLin,000 Psay _cTexto
nLin++
Return
