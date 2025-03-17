#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT003  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 26/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Essa rotina importa dados de analise de leite a partir de um arquivo enviado pelo laboratorio e grava na     บฑฑ
ฑฑบ          ณ tabela de analises											                               			    	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function MGLT003

Private cPerg   := "MGLT003"
Private cAnaPro := " " //Codigo Analise do Protheus
Private cAnoMes := "" 
Private aLog   := {}    
Private nAnal   := 0          
Private exist := .F.    


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montagem da tela de processamento.                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
@ 200,1 To 400,380 DIALOG oLeTxt TITLE OemToAnsi("Leitura de Arquivo Texto")
@ 02,10 To 100,190
@ 10,018 Say " Este programa importa os dados da Analise de Qualidade "
@ 18,018 Say " do Leite realizado pelo Laboratorio!"
@ 70,128 BMPBUTTON TYPE 01 ACTION Pergunt()
@ 70,158 BMPBUTTON TYPE 02 ACTION Close(oLetxt)
Activate Dialog oLeTxt Centered

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RunConta บ Autor ณ TOTVS              บ Data ณ  26/02/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Essa solicita preenchimento dos parametros para importacao บฑฑ
ฑฑบ          ณ do arquivo e executa leitura do arquivo apos confirmacao.  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Pergunt

Validperg()
Pergunte(cPerg,.F.)

If Pergunte(cPerg,.T.)
	Processa({|| LeArq() },"Processando...")
EndIf

Return

/*          
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ LeArq    บ Autor ณ TOTVS              บ Data ณ  26/02/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao responsavel por ler arquito texto e retornar uma    บฑฑ
ฑฑบ          ณ matriz.                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function LeArq()

Local cLinha := ""
Local aRet   := {}
Local MV_PAR02 := "000001"
Local apagar := ""  
Local _lArqInvalido := .t.   
Private cArqTxt :=SubStr(MV_PAR01,1,At('.',MV_PAR01))+"log"
Private nHdl    := fCreate(cArqTxt)
Private cEOL    := "CHR(13)+CHR(10)" 

aLog   := {}  

If Empty(cEOL)
    cEOL := CHR(13)+CHR(10)
Else
    cEOL := Trim(cEOL)
    cEOL := &cEOL
Endif

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Abre o arquivo para leitura. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

nHandle := FT_FUSE(MV_PAR01)  

_cArqImp := AllTrim(MV_PAR01)


If nHandle = -1
		xMagHelpFis("Arquivo",;
		"O local ou arquivo informado estใo invแlidos!",;
		"Utilize outro arquivo para importa็ใo da Qualidade.")
	Return
EndIf    



//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Valida se o arquivo tem extensao IMP, ou seja, ja foi importado.      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If UPPER(Substr(MV_PAR01,Len(AllTrim(MV_PAR01))-2,3)) == "IMP"
	xmaghelpfis("Arquivo invอกlido",;
	"O arquivo informado jอก foi importado anteriormente.",;
	"Favor selecionar um arquivo com a extensaoo TXT ")
	
	Return
EndIf

FT_FGOTOP()
nLast := FT_FLastRec()
ProcRegua(nLast)
_nCont := 1
While !FT_FEOF()
	
	IncProc("Processando arquivo texto...linha: " + ALLTRIM(STR(Len(aRet))) + " de " + ALLTRIM(STR(nLast)))

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
	//ณ Le a linha do txt. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
	cLinha := ALLTRIM( FT_FREADLN() )
	AADD(aRet,cLinha)
	FT_FSKIP()
EndDo


AADD(aLog,'Importacao de Analises da Clinica do Leite - ' + DTOS(date()) + ' ' + time()+cEOL+cEOL )
AADD(aLog,'Periodo: Data Inicio -  ' + DTOS(MV_PAR03) + '  Data Final:  ' + DTOS(MV_PAR04)+cEOL+cEOL ) 


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
//ณ Fecha o txt aberto.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
//FT_FUSE()         
FT_FUSE() 


Processa({|| RunConta(aRet) },"Processando...")


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Renomeia Arquivo para identificar que o mesmo ja foi importado.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//FRENAME(MV_PAR01,SubStr(MV_PAR01,1,Len(ALLTRIM(MV_PAR01))-3)+"XXX")

If _lArqInvalido
	If FRENAME(_cArqImp,Substr(_cArqImp,1,Len(_cArqImp)-3)+"IMP") == -1
		MsgAlert("Nใo foi possํvel renomear o arquivo: "+chr(13)+_cArqImp)
	EndIf
EndIf



Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RunConta บ Autor ณ TOTVS              บ Data ณ  26/02/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Essa rotina faz operacao de leitura do arquivo informado   บฑฑ
ฑฑบ          ณ no parametro e chama funcao de gravacao.                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RunConta(aDados)
ProcRegua(Len(aDados)) // Numero de registros a processar
Grava(aDados)
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Grava    บ Autor ณ TOTVS              บ Data ณ  26/02/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Le o array com os dados importados e grava na tabela ZLB.  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Grava(aData)

Local aUTC    := {}
Local cCodFaz := " " //Codigo da fazenda do produtor
Local cAnaArq := " " //Codigo Analise do arquivo
Local cNomAna := " " //Nome do item de analise
Local cData   := " "
Local cSeek   := " " //Indice de busca, exceto a data
Local nMedia  := 0
Local nI      := 0
Local nX      := 0  
Local importar := 0
Local nProps  := 0
Local cRota := "" // Rota Do Produtor  
Local cAtual := .T. //GetMv("LT_ANAUPD")
Local _nPosCod := 0

/*ZL9 - Tipo de Faixa
000001 ---- GORDURA
000002 ---- PROTEINA
000003 ---- CCS
000004 ---- CBT CFU
000005 ---- VOLUME DE LEITE
000006 ---- INCENTIVO A PRODUCAO - OPTANTE ICMS
000007 ---- INCENTIVO A PRODUCAO - NAO OPTANTE ICMS
000008 ---- ICMS ST PRODUTOR PESSOA JURIDICA
000009 ---- MATERIA GORDA
*/
ProcRegua(Len(aData))

Begin Transaction
For nI := 1 To Len(aData)
	
	cBuffer := aData[nI]
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Tratamento para arquivos que nao devem ser lidos na importacao.         ณ
	//ณ Existem arquivos que na formacao do seu nome tem a sigla xnp, estes nao ณ
	//ณ devem ser lidos na importacao, pois nao tem o codigo da fazenda.        ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If SubStr(cBuffer,3,7) == "0000000"
		xMagHelpFis("Arquivo XNP",;
		"Existem arquivos que na forma็ใo do seu nome tem a sigla xnp, estes nใo devem ser lidos na importa็ใo.",;
		"Utilize outro arquivo para importa็ใo da Qualidade.")
		Exit
	EndIf


	_nPosCod := AT("P",cBuffer)
	
	If _nPosCod == 3
		cCodFaz := SubStr(cBuffer,_nPosCod,8)
	ElseIf _nPosCod == 5
		cCodFaz := SubStr(cBuffer,_nPosCod,6)+ "01"		
	Else
		cCodFaz := SubStr(cBuffer,4,7)
	EndIf
		
	If SubStr(cBuffer,8,1) = '-'
		cCodFaz := SubStr(cBuffer,4,4)
		cCodFaz := STR(VAL(cCodFaz))
	EndIf
			
	//cCodFaz := "P"+SubStr(cBuffer,4,5)  //Codigo do produtor, quando eh usuario ou dono de tanque o codigo sera o codigo do tanque    
	//IIf(SubStr(cBuffer,9,1)=' ',cCodFaz+='0'+SubStr(cBuffer,10,1),cCodFaz+=SubStr(cBuffer,9,2))   

    //Verifica se codigo existe na SA2, caso contrario usa A2_XCODANT
    DbSelectArea("SA2")     
	DbSetOrder(1)
	If !DbSeek(xFilial("SA2")+cCodFaz)
	   	DbOrderNickName("CODANT")
		If DbSeek(xFilial("SA2")+Alltrim(cCodFaz))
			cCodFaz := SA2->A2_COD+SA2->A2_LOJA
		EndIf
	EndIf
	
//123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//00000264 120131011001000009000Clํnica do Leite - SP         9999           20131007909
//000100111820150617001001653000Clํnica do Leite - SP         9999           2015061318
	//cData   := SubStr(cBuffer,11,8) //Data Analise
	cData   := SubStr(cBuffer,76,8) //Data Analise
	cAnaArq := SubStr(cBuffer,19,3) //Codigo da Analise
	cRota := Substr(cBuffer,84,4)// Rota Do Produtor
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Armazena o mes e ano para posteriormente fazer verificacao de desclassificacao. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If Empty(cAnoMes)
		cAnoMes := ALLTRIM(SubStr(cBuffer,11,6))
	EndIf
	
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Tratamento para usuarios de Tanque.                                     ณ
	//ณ No sistema novo nao sera importado analise para usuario de tanque, pois ณ
	//ณ o mesmo utilize a analise do dono do tanque.                            ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณNa nova regra definida no dia 30/09/2010 quando o usuario for usuario de ณ
	//ณtanque comunitario, dono ou apenas usuario                               ณ
	//ณo codigo enviado para clinica sera o codigo do tanque                    ณ
	//ณPart:					                                                ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	/*
	If SubStr(cCodFaz,1,1) == "T"
	dbSelectArea("SZI")
	dbSetOrder(1)
	dbSeek(xFILIAL("SZI")+cCodFaz)
	cCodFaz := SZI->ZI_FAZENDA
	EndIf
	*/	
	/*------------------------------
	001: CBT
	002: CCS
	003: Gordura
	005: Proteina
	--------------------------------*/
	//001=CBT;002=CCS;003=Gordura;004=ESD;005=Proteina;006=Crioscopia;007=Lactose;009=EST;099=Ureia
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Transforma CodAnalise para padrao Protheus e busca valor da analise. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If cAnaArq = "001" // CBT
		cAnaPro  := ALLTRIM(GetMv("LT_ANACBT "))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
//		nVlrAna  := Val(SubStr(cBuffer,22,9))
		nMedia   := nVlrAna
		cNomAna  := "CBT"
	ElseIf cAnaArq = "002" // CCS
		cAnaPro  := ALLTRIM(GetMv("LT_ANACCS "))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
//		nVlrAna  := Val(SubStr(cBuffer,22,9))
		nMedia   := nVlrAna
		cNomAna  := "CCS"
	ElseIf cAnaArq = "003" // Gordura
		cAnaPro  := ALLTRIM(GetMv("LT_ANAGORD"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
		cNomAna  := "Gordura"
	ElseIf cAnaArq = "004" // ESD
		cAnaPro  := ALLTRIM(GetMv("LT_ANAESD"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
		cNomAna  := "ESD"
	ElseIf cAnaArq = "005" // Proteina
		cAnaPro  := ALLTRIM(GetMv("LT_ANAPROT"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
	ElseIf cAnaArq = "006" // Crioscopia
		cAnaPro  := ALLTRIM(GetMv("LT_ANACRIO"))
		nVlrAna  := Val(SubStr(cBuffer,22,9))
		nMedia   := nVlrAna
	ElseIf cAnaArq = "007" // Lactose
		cAnaPro  := ALLTRIM(GetMv("LT_ANALAC"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
		cNomAna  := "Proteina"
	ElseIf cAnaArq = "009" // EST
		cAnaPro  := ALLTRIM(GetMv("LT_ANAEST"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
		cNomAna  := "EST"
	ElseIf cAnaArq = "099" // Ureia
		cAnaPro  := ALLTRIM(GetMv("LT_ANAURE"))
		nVlrAna  := Val(SubStr(cBuffer,22,9)) /1000
		nMedia   := nVlrAna
		cNomAna  := "Ureia"
	Else
		cAnaPro  := "NOFOUND"
		nVlrAna  := 0
		nMedia   := nVlrAna
	EndIf
	
	IncProc("Processando..." + "Fazenda: " + cCodFaz )
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Caso seja uma analise que nao deve ser importada, verifica.          ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If cAnaPro <> "NOFOUND"
		
		// verifica se propriedade rural estแ cadastrada no sistema
		dbSelectArea("SA2")
		dbSetOrder(1)
    	dbSeek(xFILIAL("SA2")+cCodFaz)
		
	
		If SA2->(found())
			dtIni := DTOS(MV_PAR03)
			dtFim := DTOS(MV_PAR04)
		    /*
			If Select("TRZ") > 0
				dbSelectArea("TRZ")
				dbCloseArea("TRZ")
			EndIf
			BeginSql alias "TRZ"
				SELECT ISNULL(MIN(ZLD_DTCOLE),'XXX') DTCOLP 
				FROM %Table:ZLD% ZLD
				WHERE 
				ZLD_RETIRO = %Exp:SubStr(cCodFaz,1,6)%
				AND ZLD_RETILJ =  %Exp:SubStr(cCodFaz,7,2)%
				//cQuery += " AND ZLD_COLANA = 'S' "
				AND ZLD_DTCOLE BETWEEN %Exp:dtIni% AND %Exp:dtFim%
				AND ZLD.%NotDel%
			EndSql

			
//			dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRZ',.F.,.T.)

			
			While TRZ->(!Eof())
				//cData := TRZ->DTCOLP 
				Iif(cData <> 'XXX', importar:=1, importar:=0)
				TRZ->(dbSkip())
			EndDo
			TRZ->(dbCloseArea())
            */
			importar:=1 // adicionado Guilherme 05/06/17 - importar todos
			
			If importar == 0
				/*
				xMagHelpFis("Analise",;
				"A fazenda "+cCodFaz+" nao teve coleta de leite no periodo selecionado",;
				"O laudo nao sera importado.")	
				*/
				AADD(aLog,"A fazenda "+cCodFaz+" nao teve coleta de amostra no periodo selecionado. A analise de "+cNomAna+" nao sera importada!"+"  Rota:  "+StrZero(val(cRota),6)+cEOL)
					
			Else
				dbSelectArea("ZLS")
				dbSetOrder(1)    
				dbSeek(xFILIAL("ZLS")+SA2->A2_L_TANQ)    
				
				//Verifica se ้ usuario dono de tanque comunitario
				If ZLS->ZLS_CLASTQ == 'C'
					aUTC  := GetUTC(SA2->A2_L_TANQ, cData)
				Else
					aUTC := {{SA2->A2_COD+SA2->A2_LOJA}}
				EndIf
	
				For nX:=1 To Len(aUTC)
					
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณ Grava analise do produtor e de cada usuario de tanque do produtor corrente.      ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		
					dbSelectArea("SA2")
					dbSetOrder(1)
					dbSeek(xFILIAL("SA2")+SubStr(aUTC[nX][1],1,6)+SubStr(aUTC[nX][1],7,2))
						
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณ Verifica se esta analise ja foi importada, caso afirmativo, altera os campos.  ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					dbSelectArea("ZLB")
					dbSetOrder(3)//ZLB_FILIAL+ZLB_SETOR+ZLB_RETIRO+ZLB_RETILJ+ZLB_TIPOFX+ZLB_DATA
					cSeek  := xFILIAL("ZLB")
					cSeek  +="000001"
					cSeek  +=SA2->A2_COD
					cSeek  +=SA2->A2_LOJA
					cSeek  +=cAnaPro  
					cSeek  +=cData
					If dbSeek(cSeek)   
						If  cAtual
							RecLock("ZLB",.F.)
							ZLB->ZLB_FILIAL := xFILIAL("ZLB")
							ZLB->ZLB_SETOR  := "000001"
							ZLB->ZLB_DCRSET := POSICIONE("ZL2",1,xFILIAL("ZL2")+"000001","ZL2_DESCRI")
							ZLB->ZLB_DATA   := STOD(cData)
							ZLB->ZLB_RETIRO := SA2->A2_COD
							ZLB->ZLB_RETILJ := SA2->A2_LOJA
							ZLB->ZLB_DCRRET := SA2->A2_NOME
							ZLB->ZLB_TIPOFX := cAnaPro
							ZLB->ZLB_DCRTPF := POSICIONE("ZL9",1,xFILIAL("ZL9")+cAnaPro,"ZL9_DESCRI")
							ZLB->ZLB_VLRANA := nVlrAna
							ZLB->ZLB_FILENT := "01" //U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,STOD(cData))//Filial de entrega da linha do produtor
							ZLB->ZLB_CODLAB := cAnaArq
							
							//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
							//ณ Condicao para determinar a desclassificacao ou nao da analise.        ณ
							//ณ Quando o CBT ou CCS for maior que o valor do parametro desclassifica. ณ
							//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
							/* Comentado pois valores acima geram desconto de qualidade. - Guilherme 08/08/17
							If cAnaPro == ALLTRIM(GetMv("LT_ANACBT ")) .And. nVlrAna > GetMv("LT_VLRCBT ")
								ZLB->ZLB_DESQUA := "S"
							ElseIf cAnaPro == ALLTRIM(GetMv("LT_ANACCS ")) .And. nVlrAna > 	GetMv("LT_VLRCCS ")
						   		ZLB->ZLB_DESQUA := "S"
							Else
								ZLB->ZLB_DESQUA := "N"
							EndIf						
							*/
							MsUnlock()
							nAnal++
						Else
							//AADD(aLog,"Analise de "+cNomAna+" ja existente para esta data na propriedade "+cCodFaz+". Analise nao sera importada!"+"  Rota: "+cRota+cEOL+cEOL)
						    AADD(aLog,"Analise de "+cNomAna+" ja existente para esta data na propriedade "+	SubStr(aUTC[nX][1],1,6)+SubStr(aUTC[nX][1],7,2)+". Analise nao sera importada!"+"  Rota: "+cRota+cEOL+cEOL)
						EndIf
					Else
						RecLock("ZLB",.T.)
						ZLB->ZLB_FILIAL := xFILIAL("ZLB")
						ZLB->ZLB_SETOR  := "000001"
						ZLB->ZLB_DCRSET := POSICIONE("ZL2",1,xFILIAL("ZL2")+"000001","ZL2_DESCRI")
						ZLB->ZLB_DATA   := STOD(cData)
						ZLB->ZLB_RETIRO := SA2->A2_COD
						ZLB->ZLB_RETILJ := SA2->A2_LOJA
						ZLB->ZLB_DCRRET := SA2->A2_NOME
						ZLB->ZLB_TIPOFX := cAnaPro
						ZLB->ZLB_DCRTPF := POSICIONE("ZL9",1,xFILIAL("ZL9")+cAnaPro,"ZL9_DESCRI")
						ZLB->ZLB_VLRANA := nVlrAna
						ZLB->ZLB_FILENT := "01" //U_GetFilEnt(SA2->A2_COD,SA2->A2_LOJA,STOD(cData))//Filial de entrega da linha do produtor
						ZLB->ZLB_CODLAB := cAnaArq
						//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
						//ณ Condicao para determinar a desclassificacao ou nao da analise.        ณ
						//ณ Quando o CBT ou CCS for maior que o valor do parametro desclassifica. ณ
						//ณ ou proteina/gordura for menor que o valor do parametro desclassifica. ณ
						//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
						If cAnaPro == ALLTRIM(GetMv("LT_ANACBT ")) .And. nVlrAna > GetMv("LT_VLRCBT ")
							//	ZLB->ZLB_DESQUA := "S"
						ElseIf cAnaPro == ALLTRIM(GetMv("LT_ANACCS ")) .And. nVlrAna > 	GetMv("LT_VLRCCS ")
							//ZLB->ZLB_DESQUA := "S"
	//					ElseIf cAnaPro == ALLTRIM(GetMv("LT_ANAPROT")) .And. nVlrAna < 	GetMv("LT_VLRPROT")
	//						ZLB->ZLB_DESQUA := "S"
	//					ElseIf cAnaPro == ALLTRIM(GetMv("LT_ANAGORD")) .And. nVlrAna < 	GetMv("LT_VLRGORD")
	//						ZLB->ZLB_DESQUA := "S"
						Else
							ZLB->ZLB_DESQUA := "N"
						EndIf
						ZLB->(MsUnlock())
						nAnal++

					EndIf
				Next nX  
			EndIf
		Else          
			/*
			xMagHelpFis("Fazenda",;
			"A fazenda "+cCodFaz+" nao foi encontrada, consequentemente a analise deste produtor nao sera importada!",;
			"Cadastre o produtor, informando no campo Faz. Antiga o c๓digo desta fazenda.")      
			*/
			AADD(aLog,"A fazenda "+cCodFaz+" nao foi encontrada, consequentemente a analise deste produtor nao sera importada!"+cEOL+cEOL)
		EndIf
	EndIf
Next nI

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Chama funcao para tratamento dos produtores desclassificados.        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//MsgRun("Aguarde.... Verificando produtores desclassificados...",,{||CursorWait(), Desclass(cAnoMes), CursorArrow()})


AADD(aLog,cEOL+cEOL+"--- Fim da Opera็ใo ---"+cEOL)
AADD(aLog,"Resumo da Importa็ใo: "+cEOL)
AADD(aLog,"Finalizado em " + DTOC(date()) + ' ' + time() +cEOL)
AADD(aLog,"Numero de Analises Importadas:" + cvaltochar(nAnal)+cEOL )
AADD(aLog,"Periodo Importado:" + DTOC(MV_PAR03) + " a " + DTOC(MV_PAR04))
// AADD(aLog,"Numero de Propriedades Importadas:" + "" ) 
//AADD(aLog,ValToStr(MV_PAR03))

End Transaction
cLinha:=""
For nY:=1 to Len(aLog) 
    cLinha+=aLog[nY]
Next

If fWrite(nHdl,cLinha,Len(cLinha)) != Len(cLinha)
        If !MsgAlert("Ocorreu um erro na gravacao do arquivo. Continua?","Atencao!")
            Return
        Endif 
       
EndIf

 fClose(nHdl)

If nHdl == -1
    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser executado! Verifique os parametros.","Atencao!")
    Return
Endif


	
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Tela de mensagem de confirmacao de registros processados.            ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE FONT oFont NAME "Tahoma" BOLD
DEFINE MSDIALOG oDlgMsn FROM  00,00 To 160,350 TITLE "Concluido" PIXEL
@005,005 To 55,170
@010,010 say "Operacao Concluida!" PIXEL OF oDlgMsn FONT oFont
@022,010 say "Abra o arquivo para consultar o log do processamento: " PIXEL OF oDlgMsn
@032,010 say Alltrim(cArqTxt) PIXEL OF oDlgMsn
@040,010 say "Total de registros afetados: "+transform(Len(aData),"@E 999,999,999") PIXEL OF oDlgMsn
TButton():New(060,030, ' Ok ', oDlgMsn,{|| close(oDlgMsn) },100,10,,,,.T.)
ACTIVATE MSDIALOG oDlgMsn Centered

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GetUTC   บ Autor ณ TOTVS              บ Data ณ  26/02/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Obtem produtores usuarios de tanque.                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetUTC(cpPrd,dtCole)

Local aRet  := {}
Local aArea := GetArea()
Local _cFiltro := "% A2_L_TANQ = '" + cpPrd + "' AND SUBSTR(ZLD_DTCOLE,1,6) = '" + LEFT(dtCole,6) + "'  %
/*
cQuery := " SELECT A2_COD,A2_LOJA "
cQuery += " FROM "+RetSqlName("SA2")
cQuery += " AS SA2 INNER JOIN "+RetSqlName("ZLD")+" ZLD ON (ZLD_RETIRO = A2_COD AND ZLD_RETILJ = A2_LOJA)"
cQuery += " WHERE SA2.D_E_L_E_T_ = ' ' "
cQuery += " AND A2_L_TANQ = '" + cpPrd + "' "
cQuery += " AND LEFT(ZLD_DTCOLE,6) = '" + LEFT(dtCole,6) + "' "
cQuery += " GROUP BY A2_COD,A2_LOJA "
*/
If Select("TRX") > 0
	dbSelectArea("TRX")
	dbCloseArea("TRX")
EndIf

BeginSql alias "TRX"
	SELECT A2_COD,A2_LOJA
	FROM %Table:SA2% SA2
	INNER JOIN %Table:ZLD% ZLD ON ZLD_RETIRO = A2_COD AND ZLD_RETILJ = A2_LOJA AND ZLD.%NotDel%
	WHERE %Exp:_cFiltro%
	AND SA2.%NotDel%
	GROUP BY A2_COD,A2_LOJA
EndSql


//dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRX',.F.,.T.)

While TRX->(!Eof())
	AADD(aRet,{TRX->A2_COD+TRX->A2_LOJA})
	TRX->(dbSkip())
EndDo

TRX->(dbCloseArea())

RestArea(aArea)
Return(aRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidPergบ Autor ณ TOTVS              บ Data ณ  24/09/08   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar se a pergunta MGLT003 existe no  บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria as perguntas     บฑฑ
ฑฑบ          ณ usadas neste relatorio.   							      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

AADD( aHelpPor, 'Informe o nome do arquivo a ser')
AADD( aHelpPor, 'importado.                 ')
PutSx1(cPerg,"01","Arquivo "," "," ","mv_ch1","C",60,0,0,"G","","U_TXT","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
AADD( aHelpPor, 'Informe o Setor do qual se refere')
AADD( aHelpPor, 'a Analise importada!             ')
PutSx1(cPerg,"02","Setor   "," "," ","mv_ch2","C",6,0,0,"G","","ZL2_01","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
AADD( aHelpPor, 'Informe a data inicial das')
AADD( aHelpPor, 'analises a serem importadas!')
PutSx1(cPerg,"03","Dt Ini"," "," ","mv_ch3","D",8,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
AADD( aHelpPor, 'Informe a data final das')
AADD( aHelpPor, 'analises a serem importadas!')
PutSx1(cPerg,"04","Dt Fim"," "," ","mv_ch4","D",8,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Desclass บ Autor ณ TOTVS              บ Data ณ  09/09/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para desclassificar as analises com problema. บฑฑ
ฑฑบ          ณ Somente as analises de CBT e CCS, tem o campo ZLB_DESQUA   บฑฑ
ฑฑบ          ณ atualizado durante a gravacao, no entanto caso este campo  บฑฑ
ฑฑบ          ณ seja igual a 'S', todas as outras analises tambem devem serบฑฑ
ฑฑบ          ณ atualizadas com 'S' ou seja desclassificadas.              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Desclass(cAnoMes)

Local cQuery := ""
Local cUpdte := ""
Local lSqlOk := .T.
Local cDesql := ""

cQuery := "SELECT ZLB_SETOR, ZLB_RETIRO, ZLB_RETILJ, ZLB_TIPOFX, AVG(ZLB_VLRANA) AS MEDIA "
cQuery += "FROM "+RetSqlName("ZLB")+" "
cQuery += "WHERE D_E_L_E_T_ = ' ' "
cQuery += "AND ZLB_FILIAL = '"+xFILIAL("ZLB")+"' "
cQuery += "AND SUBSTR(ZLB_DATA,1,6) = '"+cAnoMes+"' "           
If GetMv("LT_VLRCBT ") > 0 .and. GetMv("LT_VLRCCS ") > 0
	cQuery += "AND ZLB_TIPOFX IN('"+ALLTRIM(GetMv("LT_ANACBT "))+"','"+ALLTRIM(GetMv("LT_ANACCS "))+"') "
Elseif GetMv("LT_VLRCBT ") > 0 
	cQuery += "AND ZLB_TIPOFX IN('"+ALLTRIM(GetMv("LT_ANACBT "))+"') "
Elseif GetMv("LT_VLRCCS ") > 0
	cQuery += "AND ZLB_TIPOFX IN('"+ALLTRIM(GetMv("LT_ANACCS "))+"') "
Endif
cQuery += "GROUP BY ZLB_SETOR, ZLB_RETIRO, ZLB_RETILJ, ZLB_TIPOFX "
cQuery += "ORDER BY ZLB_SETOR, ZLB_RETIRO, ZLB_RETILJ, ZLB_TIPOFX "

If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )

dbSelectArea("TRB")
dbGoTop()

While !TRB->(Eof())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Condicao para determinar a desclassificacao ou nao da analise.        ณ
	//ณ Quando o CBT ou CCS for maior que o valor do parametro desclassifica. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//	If cAnaPro == ALLTRIM(GetMv("LT_ANACBT ")) .And. TRB->MEDIA > GetMv("LT_VLRCBT ") .And. GetMv("LT_VLRCBT ") > 0
	If ALLTRIM(TRB->ZLB_TIPOFX) == ALLTRIM(GetMv("LT_ANACBT ")) .And. TRB->MEDIA > GetMv("LT_VLRCBT ") .And. GetMv("LT_VLRCBT ") > 0
		cDesql := 'S'
//	ElseIf cAnaPro == ALLTRIM(GetMv("LT_ANACCS ")) .And. TRB->MEDIA > GetMv("LT_VLRCCS ") .And. GetMv("LT_VLRCCS ") > 0
	ElseIf ALLTRIM(TRB->ZLB_TIPOFX) == ALLTRIM(GetMv("LT_ANACCS ")) .And. TRB->MEDIA > GetMv("LT_VLRCCS ") .And. GetMv("LT_VLRCCS ") > 0
		cDesql := 'S'
	Else
		cDesql := 'N'
	EndIf
	
	cUpdte := " UPDATE " + RetSqlName("ZLB")
	cUpdte += " SET ZLB_DESQUA = '"+cDesql+"' "
	cUpdte += " WHERE D_E_L_E_T_ = ' ' "
	cUpdte += " AND ZLB_FILIAL = '"+xFILIAL("ZLB")+"' "
	cUpdte += " AND SUBSTR(ZLB_DATA,1,6) = '"+cAnoMes+"' "
	cUpdte += " AND ZLB_SETOR  = '000001'"
	cUpdte += " AND ZLB_TIPOFX  = '" + TRB->ZLB_TIPOFX + "'"
	cUpdte += " AND ZLB_RETIRO = '" + TRB->ZLB_RETIRO + "'"
	cUpdte += " AND ZLB_RETILJ = '" + TRB->ZLB_RETILJ + "'"
//	cUpdte += " AND ZLB_DESQUA <> 'S' "
	lSqlOk := !(TCSqlExec(cUpdte) < 0)
	
	If !lSqlOk
		xMagHelpFis("UPDATE",;
		TcSqlError(),;
		"Nใo Conformidade ao executar o Update de atualiza็ใo dos produtores com anแlises desclassificadas "+;
		"Nใo confirme esta mensagem e informe ao Suporte T้cnico.")
	EndIf
	
	TRB->(dbSkip())
EndDo
TRB->(dbCloseArea())

Return