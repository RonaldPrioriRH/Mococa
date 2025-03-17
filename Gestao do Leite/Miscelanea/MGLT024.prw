#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
/*
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT024  � Autor � TOTVS                 � Data da Criacao  � 25/03/2010                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina para ajuste da recepcao de leite, para evitar que o fretista tenha desconto por falta de leite qdo na ���
���			 � verdade o usuario nao lancou o volume do veiculo.					                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Ajuste para nao cobrar falta de leite do fretista.                                 						    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � TOTVS - Microsiga											                             					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/00  �                                         		   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
User Function MGLT024

//���������������������������������������������������������������������Ŀ
//� Declaracao de Variaveis                                             �
//�����������������������������������������������������������������������
Private oGera
Private cString := "ZLD"
Private cPerg   := "MGLT024   "

AjustaSX1()
Pergunte(cPerg,.T.)

dbSelectArea("ZLD")
dbSetOrder(1)

//���������������������������������������������������������������������Ŀ
//� Montagem da tela de processamento.                                  �
//�����������������������������������������������������������������������
@ 200,1 TO 380,380 DIALOG oGera TITLE OemToAnsi("Ajuste da Recepcao")
@ 02,10 TO 080,190
@ 10,018 Say " Este programa ira ler a tabela ZLD de recepcao de leite e     "
@ 18,018 Say " fazer a gravacao do campo ZLD_TOTBOM que armazena a quantidade"
@ 26,018 Say " de leite do caminhao, isso eh necessario porque o mesmo ficou "
@ 34,018 Say " zerado nas movimentacoes, gerando valor negativo no MIX.      "

@ 70,098 BMPBUTTON TYPE 05 ACTION Pergunte(cPerg,.F.)
@ 70,128 BMPBUTTON TYPE 01 ACTION OkGera()
@ 70,158 BMPBUTTON TYPE 02 ACTION Close(oGera)

Activate Dialog oGera Centered

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � OkGera   � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao chamada pelo botao OK na tela inicial de processamen���
���          � to. Executa a geracao do arquivo texto.                    ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function OkGera

//���������������������������������������������������������������������Ŀ
//� Inicializa a regua de processamento                                 �
//�����������������������������������������������������������������������
Processa({|| RunCont() },"Processando...")

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � RunCont  � Autor � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao auxiliar chamada pela PROCESSA.  A funcao PROCESSA  ���
���          � monta a janela com a regua de processamento.               ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function RunCont

Local nCont     := 1
Local dPriDia   := CTOD("01/"+MV_PAR01+"/"+MV_PAR02)//Data do primeiro dia do mes.
Local dUltDia   := LastDay(dPriDia)//Data do ultimo dia do mes.

cQuery := "SELECT ZLD_FILIAL,ZLD_FRETIS,ZLD_LJFRET,ZLD_SETOR,ZLD_TICKET,MAX(ZLD_DTCOLE) AS DTCOLETA,MAX(ZLD_TOTBOM) AS VOLUME,SUM(ZLD_QTDBOM) AS COLETA "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(dPriDia) + "' AND '" + dtos(dUltDia) + "' "
cQuery += " AND ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQuery += " GROUP BY ZLD_FILIAL,ZLD_FRETIS,ZLD_LJFRET,ZLD_SETOR,ZLD_TICKET"
cQuery += " ORDER BY ZLD_FILIAL,ZLD_TICKET"
TCQUERY cQuery NEW ALIAS ("TMP01")
dbSelectArea("TMP01")
Count To nReg

dbSelectArea("TMP01")
dbGoTop()

ProcRegua(nReg) // Numero de registros a processar

While TMP01->(!Eof())
	
	//���������������������������������������������������������������������Ŀ
	//� Incrementa a regua.                                                 �
	//�����������������������������������������������������������������������
	IncProc("Processando registro "+Alltrim(Str(nCont))+" de "+Alltrim(Str(nReg)))
	
	_cUpdate := "UPDATE " + RetSqlName("ZLD")
	_cUpdate += " SET ZLD_TOTBOM = "+ALLTRIM(STR(TMP01->COLETA))+" "
	_cUpdate += " WHERE D_E_L_E_T_ = ' '"
	_cUpdate += " AND ZLD_FILIAL    = '" + xFilial("ZLD") + "'"
	_cUpdate += " AND ZLD_TICKET    = '" + TMP01->ZLD_TICKET + "'"
	lSqlOk := !(TCSqlExec(_cUpdate) < 0)
	
	If !lSqlOk
		xMagHelpFis("NAO CONFORMIDADE 06 - UPDATE ACERTO",;
		TcSqlError(),;
		"N�o Conformidade ao executar o Update de alteracao do volume do veiculo! "+;
		"N�o confirme esta mensagem e informe ao Suporte T�cnico.")
	EndIf
	
	nCont++
	TMP01->(dbSkip())
EndDo

dbCloseArea("TMP01")
Close(oGera)
Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � AjustaSX1� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o mes que se deseja importar.  ')
Aadd( aHelpSpa, 'Informe o mes que se deseja importar.  ')
Aadd( aHelpEng, 'Informe o mes que se deseja importar.  ')
U_xPutSx1(cPerg,"01","Mes ?","Mes ?","Mes ?","mv_ch1","C",2,0,0,"G",'',"","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o ano que se deseja importar.  ')
Aadd( aHelpSpa, 'Informe o ano que se deseja importar.  ')
Aadd( aHelpEng, 'Informe o ano que se deseja importar.  ')
U_xPutSx1(cPerg,"02","Ano ?","Ano ?","Ano ?","mv_ch2","C",4,0,0,"G",'',"","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return