#INCLUDE "REPORT.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �RGLT044   � Autor � Jeovane            	� Data da Criacao  � 24/08/2010                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relatorio de Saldo Devedor de Produtores  ----    Depois do fechamento                               	    ���
���          � 															                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Tem por objetivo: 																							���
���			 �					*Imprimir o a relacao de saldos devedores dos fornecedores de leite                         ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.                                                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                 	                                                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Leite                                                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function RGLT044

Local nSldAux   := 0

Private oReport
Private oSA2
Private QRYSA2
Private aOrd    := {"Nome","Codigo"}
Private cPerg   := PADR("RGLT044",10)
Private cMes    := ""
Private cAno    := ""
Private cVencto := ""
Private dBaixa  := dDataBase //Compatibilizacao com a funcao padrao fa080Juros
Private cGrpCnv := Trim(GETMV("LT_GRPCNV"))

ValidPerg()
If !Pergunte(cPerg,.T.)
	Return
EndIf

DEFINE REPORT oReport NAME "RGLT044" TITLE "Saldos Devedores - Fechamento" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)    

//Posiciona na ZLE para buscar o periodo do mix
dbSelectArea("ZLE")
dbSetOrder(1)
dbSeek(xFilial("ZLE")+MV_PAR01)

//Acha a data de vencimento
cMes    := SubStr(DTOS( ZLE->ZLE_DTFIM ),5,2)
cAno    := SubStr(DTOS( ZLE->ZLE_DTFIM ),1,4)
cVencto := cAno+cMes+MV_PAR07 //Dia de vencimento dos titulos

//�������������������������������������������������Ŀ
//�Define secoes para primeira ordem - Fornecedores �
//���������������������������������������������������
DEFINE SECTION oSA2 OF oReport TITLE "Dados" TABLES "SA2"  ORDERS aOrd
DEFINE CELL NAME "A2_COD"  OF oSA2 ALIAS "SA2"
DEFINE CELL NAME "A2_LOJA" OF oSA2 ALIAS "SA2"
DEFINE CELL NAME "A2_NOME" OF oSA2 ALIAS "SA2"
DEFINE CELL NAME "SALDO"   OF oSA2 ALIAS "SA2" BLOCK {|| nSldAux } TITLE "Saldo" PICTURE "@E 999,999,999.99"  SIZE 18

oSA2:Cell("SALDO"):SetHeaderAlign("RIGHT")                        
oSumSaldo := TRFunction():New(oSA2:Cell("SALDO"),NIL,"SUM",NIL)  
oSA2:SetTotalInLine(.F.)                                         
oSumSaldo:SetEndSection(.F.)

oSA2:SetLineCondition({|| nSldAux:=U_GetSldPro(QRYSA2->A2_COD,QRYSA2->A2_LOJA,cMes,cAno,MV_PAR07,cGrpCnv,MV_PAR02,MV_PAR01), nSldAux < 0})

oReport:nFontBody   := 10
oReport:nLineHeight	:= 50 // Define a altura da linha.
oReport:PrintDialog()

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT044   �Autor  �Microsiga           � Data �  09/09/10   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao responsavel por gerar relatorio                     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function PrintReport(oReport)

Local cFiltro := "%"
Local nOrdem  := oSa2:GetOrder()

cFiltro += " AND SA2.A2_COD BETWEEN  '" + MV_PAR03 + "' AND '" + MV_PAR04 + "' "
cFiltro += " AND SA2.A2_LOJA BETWEEN '" + MV_PAR05 + "' AND '" + MV_PAR06 + "' "

If MV_PAR08 == 1 //Ativos ou Nao Bloqueados
	cFiltro += " AND SA2.A2_MSBLQL = '2' "
ElseIf MV_PAR08 == 2//Inativos ou Bloqueados
	cFiltro += " AND SA2.A2_MSBLQL = '1' "
EndIf

If nOrdem == 1
	cOrdem := "% SA2.A2_NOME %"
Else
	cOrdem := "% SA2.A2_COD,SA2.A2_LOJA %"
EndIf

cFiltro += "%"

BEGIN REPORT QUERY oSA2
BeginSql alias "QRYSA2"
	SELECT
	SA2.A2_NOME,SA2.A2_COD,SA2.A2_LOJA
	FROM
	%table:SA2% SA2
	WHERE
	SA2.%notDel% AND SA2.A2_FILIAL = %xFilial:SA2%
	AND SA2.A2_L_TPFOR = 'P' 
	%exp:cFiltro%
	ORDER BY
	%exp:cOrdem%
EndSql
END REPORT QUERY oSA2

oSA2:Print(.T.)

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �ValidPerg � Autor � Jeovane               � Data da Criacao  � 24/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao �Funcao usada para validar se pergunta RGLT004 existe no dicionario de dados, caso nao existe cria as perguntas���
���          � usadas neste relatorio   										                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � RGLT004                         						                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Mix
aHelpPor := {}
Aadd( aHelpPor, 'Codigo do Mix a ser considerado     ')
U_xPutSx1(cPerg,"01","Do Mix"," "," ","mv_ch1","C",6,0,0,"G","","ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Setor   "," "," ","mv_ch2","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Produtor inicial que deseja filtrar     ')
U_xPutSx1(cPerg,"03","Do Produtor"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L9","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Produtor final que deseja filtrar     ')
U_xPutSx1(cPerg,"04","Ate Produtor"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L9","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a Loja do Produtor inicial que deseja filtrar     ')
U_xPutSx1(cPerg,"05","Da Loja"," "," ","mv_ch5","C",2,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a Loja do Fretista final que deseja filtrar     ')
U_xPutSx1(cPerg,"06","Ate Loja"," "," ","mv_ch5","C",2,0,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Dia de pagamento
aHelpPor := {}
Aadd( aHelpPor, 'Informe o dia de pagamento do leite ')
Aadd( aHelpPor, 'para busca dos d�bitos financeiros ')
U_xPutSx1(cPerg,"07","Dia de Pagamento"," "," ","mv_ch7","C",2,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo Produtores - Ativos/Inativos/Ambos
aHelpPor := {}
Aadd( aHelpPor, 'Informe os produtores que deseja filtrar')
U_xPutSx1(cPerg,"08","Status"," "," ","mv_ch8","C",1,0,0,"C","","","","","MV_PAR08","Ativos","","","","Inativos","","","Ambos","Ambos","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return