#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �fSelectDir�Autor  �Tarcisio Silva Miranda�Data�  08/01/2018 ���
�������������������������������������������������������������������������͹��
���Desc.     � Rotina de localiza��o de salvar em?.			 			  ���
�������������������������������������������������������������������������͹��
���Uso       � Localizar diret�rio onde salvar.		    				  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function fSelectDir(lGw_Dir_CondPad)

Default lGw_Dir_CondPad := .T.

if Type("cGwDiretorio") <> 'C'
 Public cGwDiretorio := ""
endif
 
cGwDiretorio := cGetFile( '*.*' , 'Escolha um diret�rio e clique em Salvar') //cGetFile( '*.*' , 'Escolha um diret�rio e clique em Salvar', 1, 'C:\', .F., nOR( GETF_LOCALHARD, GETF_LOCALFLOPPY, GETF_RETDIRECTORY ),.F., .T. )
 
If Empty( cGwDiretorio )
 MsgInfo( 'Infome um diret�rio v�lido!','Diret�rio Inv�lido' ) 
Endif
 
cGwDiretorio :=  AllTrim(cGwDiretorio)

&(ReadVar()) := cGwDiretorio

If lGw_Dir_CondPad .And. Len(aCpoRet) >= 1
 aCpoRet[1]   := cGwDiretorio
Endif

Return(.T.) 
//Return( cGwDiretorio )
