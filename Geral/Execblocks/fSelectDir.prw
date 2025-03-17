#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณfSelectDirบAutor  ณTarcisio Silva MirandaบDataณ  08/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina de localiza็ใo de salvar em?.			 			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Localizar diret๓rio onde salvar.		    				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function fSelectDir(lGw_Dir_CondPad)

Default lGw_Dir_CondPad := .T.

if Type("cGwDiretorio") <> 'C'
 Public cGwDiretorio := ""
endif
 
cGwDiretorio := cGetFile( '*.*' , 'Escolha um diret๓rio e clique em Salvar') //cGetFile( '*.*' , 'Escolha um diret๓rio e clique em Salvar', 1, 'C:\', .F., nOR( GETF_LOCALHARD, GETF_LOCALFLOPPY, GETF_RETDIRECTORY ),.F., .T. )
 
If Empty( cGwDiretorio )
 MsgInfo( 'Infome um diret๓rio vแlido!','Diret๓rio Invแlido' ) 
Endif
 
cGwDiretorio :=  AllTrim(cGwDiretorio)

&(ReadVar()) := cGwDiretorio

If lGw_Dir_CondPad .And. Len(aCpoRet) >= 1
 aCpoRet[1]   := cGwDiretorio
Endif

Return(.T.) 
//Return( cGwDiretorio )
