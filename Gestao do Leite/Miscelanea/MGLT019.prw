#INCLUDE "Protheus.ch"
#INCLUDE "RwMake.ch"
#INCLUDE "TopConn.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT019  � Autor � TOTVS                 � Data da Criacao  � 13/07/2009                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Gera arquivo de compatibilizacao dos cadastros para LQL.                                                     ���
���          �                        									                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gestao do Leite                                                                                              ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                                  �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function MGLT019

Private nArquivo
Private cPerg:="MGLT019"

ValidPerg()
if Pergunte(cPerg,.t.)
	Processa({|| Run() },"Processando...")
Endif

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MGLT019   �Autor  �Microsiga           � Data �  01/05/10   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function Run()

Local oAlias:=GetNextAlias()
Local nreg:=0
Local _cTpFor	:= ""//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

nArquivo  := fCreate(mv_par01)

cQuery := " SELECT * FROM '"+RETSQLNAME("SA2")+"' SA2 "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND A2_L_TPFOR IN ('P','G') " //#LETRAS
//cQuery += " AND A2_C_TPFOR IN " + U_ajusSQL(_cTpFor) + " " //#LETRAS
cQuery += " AND SUBSTRING(A2_L_LI_RO,1,2) = '"+mv_par02+"' "
cQuery += " ORDER BY A2_COD,A2_LOJA "
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery1), oAlias, .T., .F. )

Count to nreg

ProcRegua(nreg)

(oAlias)->(dbgotop())

While (oAlias)->(!eof())
	cLin:=(oAlias)->A2_COD+(oAlias)->A2_LOJA+";"+mv_par03+(oAlias)->A2_L_ANTI+";"+(oAlias)->A2_CGC+";"+char(10)+char(13)
	fWrite(nArquivo,cLin,Len(cLin))
	(oAlias)->(dbskip())
Enddo
(oAlias)->(dbcloseArea())

fClose(nArquivo)

return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MGLT019   �Autor  �Microsiga           � Data �  01/05/10   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}


//Arquivo
aHelpPor := {}
Aadd( aHelpPor, 'Arquivo a ser gerado     ')
U_xPutSx1(cPerg,"01","Arquivo    "," "," ","mv_ch1","C",50,0,0,"G",'',"DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

// Filial
aHelpPor := {}
Aadd( aHelpPor, 'Codigo da Filial no Microsiga')
U_xPutSx1(cPerg,"02","Filial Atual  "," "," ","mv_ch2","C",2,0,0,"G",'',"","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

// Pre-codigo
aHelpPor := {}
Aadd( aHelpPor, 'Codigo da Filial no sistema')
Aadd( aHelpPor, 'antigo. O sistema vai adicionar ')
Aadd( aHelpPor, 'esse codigo antes do codigo antigo')
Aadd( aHelpPor, 'do FEL.')
U_xPutSx1(cPerg,"03","Filial Antiga"," "," ","mv_ch3","C",2,0,0,"G",'',"","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return