/*
	Header : prconst.ch
	Copyright (c) 1997-2003, Microsiga Software SA
	All rights reserved.
*/

#ifndef _PRCONST_CH_
#define _PRCONST_CH_

#DEFINE DIR_DEFAULT     0         // Acesso direto pelo PATH
#DEFINE DIR_SERVER      1         // For�a acesso pelo Server
#DEFINE DIR_CLIENT      2         // For�a acesso pelo Client

#DEFINE PRT_CLIENT      1         // Impress�o no cliente
#DEFINE PRT_NONE                        0                        //
#DEFINE PRT_SERVER      2         // Impress�o no server
#DEFINE PRT_SPOOL       3         // Impress�o via Spooler

//=======  DEFINES PARA FUNCAO cGetFile - INICIO =======//
#DEFINE GETF_ONLYSERVER                   0
#DEFINE GETF_OVERWRITEPROMPT              1
#DEFINE GETF_MULTISELECT                  2
#DEFINE GETF_NOCHANGEDIR                  4
#DEFINE GETF_LOCALFLOPPY                  8
#DEFINE GETF_LOCALHARD                   48 //16 GETF_LOCALHARD + 32 GETF_NETWORKDRIVE
#DEFINE GETF_NETWORKDRIVE                00
#DEFINE GETF_NONETWORKDRIVE              -32
#DEFINE GETF_SHAREAWARE                  64
#DEFINE GETF_RETDIRECTORY               128
//=======  DEFINES PARA FUNCAO cGetFile - FIM =======//

//=======  CONSTANTE PARA SIGAREL.PRW  =========//
#DEFINE CONST_SEMIMPRESS "Nenhuma Impressora Disponivel"
#DEFINE CONST_NOPRINTER  "No printer is available"
#DEFINE CONST_SEMPORTAS  "Nao existem portas disponiveis"
//======= FIM CONSTANTES SIGAREL ==============//

//=======  CONSTANTES DE ALINHAMENTO DE CONTROLES (BOF) ============//

#DEFINE CONTROL_ALIGN_ALLCLIENT    5
#DEFINE CONTROL_ALIGN_BOTTOM       4
#DEFINE CONTROL_ALIGN_CENTER	   6
#DEFINE CONTROL_ALIGN_LEFT         1
#DEFINE CONTROL_ALIGN_NONE         0
#DEFINE CONTROL_ALIGN_RIGHT        2
#DEFINE CONTROL_ALIGN_TOP          3

//=======  CONSTANTES DE ALINHAMENTO DE CONTROLES (EOF) ============//
									 
//AS CONSTANTES COM INICIAL "SW_ " DA FUNCAO SHELLEXECUTE FORAM MOVIDAS PARA O ARQUIVO SHELL.CH

//=======  CONSTANTES DE IDENTIFICA��O DO TIPO DE REMOTE ============//

#DEFINE NO_REMOTE       	-1
#DEFINE REMOTE_DELPHI    	0
#DEFINE REMOTE_QT_WIN32  	1
#DEFINE REMOTE_QT_LINUX  	2
#DEFINE REMOTE_HTML_OLD		3
#DEFINE REMOTE_TELNET  		4
#DEFINE REMOTE_HTML  			5

//=======  CONSTANTES DO GRAFICO ============//

// CONSTANTE DO TIPO DO GRAFICO UTILIZADAS NO FWCHART

//=======  CONSTANTES DO GRAFICO ============//

#DEFINE BARCHART		00
#DEFINE LINECHART		01
#DEFINE PIECHART		02
#DEFINE BARCOMPCHART	03
#DEFINE RADARCHART	04
#DEFINE FUNNELCHART	05
#DEFINE COLUMNCHART	06
#DEFINE NEWPIECHART	07
#DEFINE NEWLINECHART	08

#endif


//=======  CONSTANTES TOTVS COLABORACAO ============//
#DEFINE TOTVS_COLAB_ONDEMAND  3100
#DEFINE TOTVS_COLAB_IV       3101
#DEFINE TOTVS_COLAB_ID       3102

//=======  CONSTANTES INTEGRACAO PAMCARY ============//
#DEFINE TOTVS_PAMCARY  3107

//=======  CONSTANTES INTEGRACAO REPOM ============//
#DEFINE TOTVS_REPOM  3108
