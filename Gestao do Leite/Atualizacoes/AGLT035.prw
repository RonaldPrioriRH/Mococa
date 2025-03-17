#INCLUDE "PROTHEUS.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT035  � Autor � TOTVS                 � Data da Criacao  � 18/11/2010                						   ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar o Bloqueio ou desbloqueio dos produtores.                              ���
���          �   												                               				                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Ponto de Entrada MA020ROT.      						                                                        	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               												���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               												���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                							���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        							���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   								���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor         ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        		���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   			�                                  � 					���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function AGLT035(cAlias,nRecSA2,nOpc)

Local oComboBo1
Local cComboBo1 := ""
Local oComboBo2
Local cComboBo2 := ""
Local oComboBo3
Local cComboBo3 := ""
Local lBotao    := .F.
Local cProdutor := SA2->A2_COD
Local cLoja     := SA2->A2_LOJA
Local cNome     := SA2->A2_COD+"-"+SA2->A2_LOJA+"  -  "+ALLTRIM(SA2->A2_NOME)
Local oSay1
Local oSay10
Local oSay11
Local oSay12
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oSay7
Local oSay8
Local oSay9
Local oSButton1
Local oDlg

If !SA2->A2_L_TPFOR $ "C/G/T"
	MsgInfo("Esta op��o s� se aplica a produtores, com c�digo iniciado pela letra C.")
	Return()
EndIf
/*
//Ativo S=Sim; N=Nao
If SA2->A2_L_ATIVO == "N"
	cComboBo1 := "Nao"
Else
	cComboBo1 := "Sim"
EndIf

//Bloqueado? 1=SIM; 2=NAO
If SA2->A2_MSBLQL == "1"
	cComboBo2 := "Sim"
Else
	cComboBo2 := "Nao"
EndIf
*/

//Bloqueado? 1=SIM; 2=NAO
If SA2->A2_MSBLQL == "1"
	cComboBo1 := "Sim"
Else
	cComboBo1 := "Nao"
EndIf

//Posiciona no cadastro de clientes
dbSelectArea("SA1")
dbSetOrder(1)
dbSeek(xFILIAL("SA1")+cProdutor+cLoja)

//Bloqueado? 1=SIM; 2=NAO
If SA1->A1_MSBLQL == "1"
	cComboBo3 := "Sim"
Else
	cComboBo3 := "Nao"
EndIf

DEFINE MSDIALOG oDlg TITLE "Bloqueio de Produtor" FROM 000, 000  TO 415, 450 COLORS 0, 16777215 PIXEL
/*
@ 007, 003 SAY oSay1 PROMPT cNome                                                   SIZE 205, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 025, 003 MSCOMBOBOX oComboBo1 VAR cComboBo1 ITEMS {"Sem Uso","Sem Uso"}           SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 024, 083 SAY oSay2 PROMPT "Campo ATIVO implica na:"                               SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 036, 083 SAY oSay3 PROMPT "- Recpe��o de Leite."                                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 046, 083 SAY oSay4 PROMPT "- Rotina de Emprestimo/Adiantamento."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 056, 083 SAY oSay5 PROMPT "- Relatorio de Saldo Devedor de Produtores."           SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 066, 083 SAY oSay6 PROMPT "- Rela��o de Notas Fiscais emitidas."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 093, 003 MSCOMBOBOX oComboBo2 VAR cComboBo2 ITEMS {"Sim","Nao"}                   SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 094, 083 SAY oSay7 PROMPT "Campo BLOQUEADO no cadastro de FORNECEDOR implica na:" SIZE 170, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 106, 083 SAY oSay8 PROMPT "- Inclus�o de titulos no financeiro."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 117, 083 SAY oSay9 PROMPT "- Inclus�o de movimentos no Gest�o do Leite."          SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 142, 003 MSCOMBOBOX oComboBo3 VAR cComboBo3 ITEMS {"Sim","Nao"}                   SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 143, 083 SAY oSay10 PROMPT "Campo BLOQUEADO no cadastro de CLIENTE implica na:"   SIZE 150, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 155, 083 SAY oSay11 PROMPT "- Venda de produtos na loja de Ra��o."                SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 166, 083 SAY oSay12 PROMPT "- Venda de produtos no Emp�rio."                      SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
*/
@ 007, 003 SAY oSay1 PROMPT cNome                                                   SIZE 205, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 025, 003 MSCOMBOBOX oComboBo1 VAR cComboBo1 ITEMS {"Sim","Nao"}                   SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 024, 083 SAY oSay2 PROMPT "Campo BLOQUEADO no cadastro de FORNECEDOR implica na:" SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 036, 083 SAY oSay3 PROMPT "- Recpe��o de Leite."                                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 046, 083 SAY oSay4 PROMPT "- Rotina de Emprestimo/Adiantamento."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 056, 083 SAY oSay5 PROMPT "- Relatorio de Saldo Devedor de Produtores."           SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 066, 083 SAY oSay6 PROMPT "- Rela��o de Notas Fiscais emitidas."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 076, 083 SAY oSay8 PROMPT "- Inclus�o de titulos no financeiro."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 086, 083 SAY oSay9 PROMPT "- Inclus�o de movimentos no Gest�o do Leite."          SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL

//@ 093, 003 MSCOMBOBOX oComboBo2 VAR cComboBo2 ITEMS {"Sim","Nao"}                   SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
//@ 094, 083 SAY oSay7 PROMPT "Campo BLOQUEADO no cadastro de FORNECEDOR implica na:" SIZE 170, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 106, 083 SAY oSay8 PROMPT "- Inclus�o de titulos no financeiro."                  SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
//@ 117, 083 SAY oSay9 PROMPT "- Inclus�o de movimentos no Gest�o do Leite."          SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 142, 003 MSCOMBOBOX oComboBo3 VAR cComboBo3 ITEMS {"Sim","Nao"}                   SIZE 072, 010 OF oDlg COLORS 0, 16777215 PIXEL
@ 143, 083 SAY oSay10 PROMPT "Campo BLOQUEADO no cadastro de CLIENTE implica na:"   SIZE 150, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 155, 083 SAY oSay11 PROMPT "- Venda de produtos na loja de Ra��o."                SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL
@ 166, 083 SAY oSay12 PROMPT "- Venda de produtos no Emp�rio."                      SIZE 125, 007 OF oDlg COLORS 0, 16777215 PIXEL

DEFINE SBUTTON oSButton1 FROM 191, 179 TYPE 01 OF oDlg ENABLE ACTION (lBotao := .T., Odlg:End())

ACTIVATE MSDIALOG oDlg CENTERED

If lBotao
	dbSelectArea("SA2")
	RecLock("SA2",.F.)
	//SA2->A2_L_ATIVO := If(cComboBo1=="Nao","N","S")
	//SA2->A2_MSBLQL  := If(cComboBo2=="Sim","1","2")//Bloqueado? 1=SIM; 2=NAO
	SA2->A2_MSBLQL  := If(cComboBo1=="Sim","1","2")//Bloqueado? 1=SIM; 2=NAO
	MsUnLock()
	
	//Posiciona no cadastro de clientes
	dbSelectArea("SA1")
	dbSetOrder(1)
	dbSeek(xFILIAL("SA1")+cProdutor+cLoja)
	RecLock("SA1",.F.)
	SA1->A1_MSBLQL  := If(cComboBo3=="Sim","1","2")//Bloqueado? 1=SIM; 2=NAO
	MsUnLock()
EndIf

Return