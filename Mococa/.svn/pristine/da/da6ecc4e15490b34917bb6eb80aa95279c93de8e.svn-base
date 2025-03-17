#include "rwmake.ch"   
#include "protheus.ch"                             
#include "topconn.ch"    
#include "fileio.ch"   

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFINA012  บ Autor ณ 				     บ Data ณ  14/12/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณLe o arquivo txt incluindo os registros contidos neste no   บฑฑ
ฑฑบ          ณcadastro de contas a receber                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณMococa.			                                          บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function RFINA012()
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declaracao de Variaveis                                             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Private cPerg	:= "RFINA012"
Private oLeTxt           

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montagem da tela de processamento.                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Alert("Nova Importa็ใo do a receber - tt ")

AjustaSX1()
Pergunte(cPerg,.T.)

@ 200,1 TO 380,380 DIALOG oLeTxt TITLE OemToAnsi("Leitura de Arquivo Texto")
@ 1,1 TO 4,23
@ 2,1 Say " Este programa ira ler o conteudo de um arquivo texto, conforme"
@ 3,1 Say " os parametros definidos pelo usuario, com os registros do arquivo"
@ 4,1 Say "                                                                "

@ 70,128 BMPBUTTON TYPE 01 ACTION OkLeTxt()
@ 70,158 BMPBUTTON TYPE 02 ACTION Close(oLeTxt)
@ 70,100 BMPBUTTON TYPE 05 ACTION Pergunte(cPerg, .T.)

Activate Dialog oLeTxt Centered

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ OKLETXT  บ Autor ณ Maiki Perin        บ Data ณ  19/10/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a leitura do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function OkLeTxt()
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Abertura do arquivo texto                                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Private cArqTxt := MV_PAR01+":\temp2\"+AllTrim(MV_PAR02)+".txt"
Private nHdl 	:= FT_FUSE(cArqTxt)
Private cEOL    := "CHR(13)+CHR(10)"

If Empty(cEOL)
    cEOL := CHR(13)+CHR(10)
Else
    cEOL := Trim(cEOL)
    cEOL := &cEOL
Endif

If nHdl == -1
    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser aberto! Verifique os parametros.","Atencao!")
    Return
Endif

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa a regua de processamento                                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Processa({|| RunCont() },"Processando a Importa็ใo ...")

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ RUNCONT  บ Autor ณ Maiki Perin        บ Data ณ  19/10/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao auxiliar chamada pela PROCESSA.  A funcao PROCESSA  บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunCont()
Local cLinha
Local aDados 		:= {}
Local cCod			:= ""
Local cLoja			:= ""
Local nCont			:= 0  
Local aAutoSE1		:= {}
//Local nSalt			:= 0
//Local cVendedor		:= ""
Local dxData := GetMv("MV_DATAFIN")
//Local nJuliam := ""
//Local lFindSEA := .F.
Local cTipo := ""
Local aErro := {}
//Local ccTmp := "", ccTmp2 := ""
Local lBloqCli := .F.
Local lBloqVend := .F.

Private lMsErroAuto	:= .F.

PutMv("MV_DATAFIN",stod("20000101") )

DbSelectArea("SE1")
SE1->( DbSetOrder(1) )

FT_FGOTOP()
ProcRegua(FT_FLASTREC())  

/*

01				02				03		04				05				06					07					08						09					10				11				12			13				14					15				16
NRO.DOCUMENTO; TIPO DOCUMENTO; CNPJ	  ; DATA EMISSAO; DATA VENCIMENTO; VENCIMENTO REAL  ; VALOR ORIGINAL	; VALOR EM MOEDA CORRENTE; VALOR LIQUIDO	; PREFIXO		  ; RETENวีES	; HISTORICO; IDENTIFICADOR; COD.PLANO FINANCEIRO; CENTRO CUSTO	;COD_FILIAL
4100305922654;BDF			 ;01027058;05032010		; 30112010		 ; 30112010			;00000000000105,99	; 00000000000105,99		 ; 00000000000103,61; ICS			  ; 0,0000000000;          ; 3470285	  ; 10.10.15.50  		; 02.200.210.003;57

*/

//FT_FSKIP(11840) // +- onde comeca os titulos apos 01/12/2011

//Begin Transaction

	While !FT_FEOF()
	    
	    //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	    //ณ Retorna a linha corrente                                            ณ
	    //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		cLinha := FT_FREADLN()     
		aDados := StrTokArr(cLinha,";")
		                          
	
		aDados[01] := StrTran( aDados[01], "BRANCO","" )//NUMERO 
		aDados[02] := StrTran( aDados[02], "BRANCO","" )//PARCELA
		aDados[03] := StrTran( aDados[03], "BRANCO","" )//TIPO
		aDados[04] := StrTran( aDados[04], "BRANCO","" )//NUMBORDERO
		aDados[05] := StrTran( aDados[05], "BRANCO","" )//CGC
		aDados[06] := StrTran( aDados[06], "BRANCO","" )//CLIENTE
		aDados[07] := StrTran( aDados[07], "BRANCO","" )//EMISSAO
		aDados[08] := StrTran( aDados[08], "BRANCO","" )//VENCIMENTO
		aDados[09] := StrTran( aDados[09], "BRANCO","" )//VALOR
		aDados[10] := StrTran( aDados[10], "BRANCO","" )//SALDO
		aDados[11] := StrTran( aDados[11], "BRANCO","" )//PORTADOR
		aDados[12] := StrTran( aDados[12], "BRANCO","" )//CODCLI
		aDados[13] := StrTran( aDados[13], "BRANCO","" )//COMISSAO
		aDados[14] := StrTran( aDados[14], "BRANCO","" )//NATUREZA
		aDados[15] := StrTran( aDados[15], "BRANCO","" )//AGENCIA
		aDados[16] := StrTran( aDados[16], "BRANCO","" )//CONTA
		aDados[17] := StrTran( aDados[17], "BRANCO","" )//CODVENDEDOR
		aDados[18] := StrTran( aDados[18], "BRANCO","" )//FILIAL
		aDados[19] := StrTran( aDados[19], "BRANCO","" )//FILORIG
		aDados[20] := StrTran( aDados[20], "BRANCO","" )//CODCOB
		aDados[21] := StrTran( aDados[21], "BRANCO","" )//IDCNAB
		aDados[22] := StrTran( aDados[22], "BRANCO","" )//VALORDESC
		aDados[23] := StrTran( aDados[23], "BRANCO","" )//PREFIXO
		//aDados[24] := StrTran( aDados[24], "BRANCO","" )
		
	    //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	    //ณ Incrementa a regua                                                  ณ
	    //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	    IncProc(" Incluindo Titulo "+aDados[01]+"/"+aDados[02]+"-"+aDados[03])
	
	
	    //01 - N๚mero do Titulo - 9 casas
		if len( AllTrim(aDados[01]) ) > 9
			aDados[01] := AllTrim(aDados[01])//PadR(Substr(AllTrim(StrTran(aDados[01],"'","")),1,9), len( se1->e1_num ) )
		else
			aDados[01] := AllTrim(aDados[01])//PadR(Substr(AllTrim(StrTran(aDados[01],"'","")),1,9), len( se1->e1_num ) )	
		endif
		
		//02 - Parcela - 3 casas
		aDados[02] := AllTrim(aDados[02])//PadR(StrTran(aDados[02],"'",""), len( se1->e1_parcela ) )
		
		
		 //03 - tipo de documento
		/*If StrTran(aDados[03],"'","") == "01" //.or. StrTran(aDados[1],"'","") == "09"
			cTipo := "NF "
		ElseIf StrTran(aDados[03],"'","") == "02"
			cTipo := "BOL"
		ElseIf StrTran(aDados[03],"'","") == "03"
			cTipo := "CH "
		ElseIf StrTran(aDados[03],"'","") == "04"
			cTipo:= "NCC" //NOTA DE CREDITO CLIENTE (RECEBER)
		ElseIf StrTran(aDados[03],"'","") == "05"
			cTipo := "RA"  //RECEBIMENTO ANTECIPADO (RECEBER)
		ElseIf StrTran(aDados[03],"'","") == "06"
			cTipo := "NDF" //NOTA DE DEPITO DO FORNECEDOR (PAGAR)
		ElseIf StrTran(aDados[03],"'","") == "07"
			cTipo := "PA" //PAGAMENTO ANTECIPADO (PAGAR)
		ElseIf StrTran(aDados[03],"'","") == "08"
			cTipo := "PR " //TITULO PROVISORIO
		ElseIf StrTran(aDados[03],"'","") == "09"
			cTipo := "CAR" //TITULO PROVISORIO
		ElseIf StrTran(aDados[03],"'","") == "10"
			cTipo := "BND" //TITULO PROVISORIO
		ElseIf StrTran(aDados[03],"'","") == "11"
			cTipo := "NTE" //TITULO PROVISORIO
	 	Else 
	 		cTipo := "OUT" // OUTROS
		Endif*/
		cTipo := AllTrim(aDados[03])
	
	    //04 - Nosso n๚mero,     
	    aDados[04] := AllTrim(aDados[04]) //PadR(StrTran(aDados[04],"'",""), len( se1->e1_numbco) )
		                                                   
		
		                                                                        
		//05 - CPF_CNPJ CLIENTE, 18 CARACTERES
		/*aDados[05] := StrTran(aDados[05],"'","")           
		aDados[05] := StrTran(aDados[05],".","")
		aDados[05] := StrTran(aDados[05],"/","") 
		aDados[05] := StrTran(aDados[05],"-","")*/
		aDados[05] := AllTrim(aDados[05])	
		
		         
		//06 - Nome do Cliente 40 caracteres
		aDados[06] := AllTrim(aDados[06])//PadR(StrTran(aDados[06],"'",""), 40 )	
		
		
		 //07 - DATA EMISSAO
	    ccTmp	:= AllTrim(aDados[07])  //substr(StrTran(aDados[07],"'",""),7,4)+substr(StrTran(aDados[07],"'",""),4,2)+substr(StrTran(aDados[07],"'",""),1,2)
	    
	    //08 - DATA VENCIMENTO
		cTmp2	:= AllTrim(aDados[08])//substr(StrTran(aDados[08],"'",""),7,4)+substr(StrTran(aDados[08],"'",""),4,2)+substr(StrTran(aDados[08],"'",""),1,2) 	// Dt. Venc.
	    
		aDados[07] := ccTmp   
		
		if StoD(cTmp2) >= StoD(ccTmp) //if data vencimento maior
			aDados[08] := cTmp2
	    else
	       aDados[08] := ccTmp //se for menor, vai ser a propria emissao
	    endif   	
	    
	    
		// 09 - VALOR DO TITULO "E1_VALOR"
		aDados[09] := StrTran( aDados[09], "R$","" )
		aDados[09] := StrTran( aDados[09], ".", "" )
		aDados[09] := StrTran( aDados[09], ",", "." )
	
		if Val(aDados[09]) == 0
			aDados[09] := "0.01" // Para o usuario filtrar e fazer a corre็ใo manualmente
		endif
		
		
		// 10 - SALDO "E1_SALDO"
	    aDados[10] := StrTran( aDados[10], "R$","" )
		aDados[10] := StrTran( aDados[10], ".", "" )
		aDados[10] := StrTran( aDados[10], ",", "." )
	
	    
	              
	    //11 - CODIGO DO PORTARDOR 3 CARACTES
		aDados[11] := AllTrim(aDados[11])//AllTrim(StrTran(aDados[11],"'",""))
	    
	    //12 - VENDEDOR - E1_VEND1
		aDados[12] := AllTrim(aDados[12])//Substr( AllTrim(StrTran(aDados[12],"'","")),1,6)
	    
	    //13 -  Comissใo / E1_COMIS1
	   	aDados[13] := StrTran( aDados[13], "R$","" )
		aDados[13] := StrTran( aDados[13], ".", "" )
		aDados[13] := StrTran( aDados[13], ",", "." )
	
	                            
	    //14 -  C๓digo Natureza
	   	aDados[14] := AllTrim(aDados[14])//AllTrim(StrTran( aDados[14], "'", "" ))
		                                   
		
		//15 -  CAgencia Depositaria (Bordero)
	   	aDados[15] := AllTrim(aDados[15])//AllTrim(StrTran( aDados[15], "'", "" )) 
	   	                                        
	   	//16 -  Numero da Conta Dep. (Bordero)
	   	aDados[16] := AllTrim(aDados[16])//AllTrim(StrTran( aDados[16], "'", "" )) 
	   	
		
	    //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	    //ณ Inclui titulo de acordo com o registro corrente					ณ
	    //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	    //E1_FILIAL,E1_CLIENTE,E1_LOJA,E1_PREFIXO,E1_NUM,E1_PARCELA,E1_TIPO	    
	    
	    cCodClie := ""
		cLojaCli :=	""
		cCgcClie := ""

		SA1->(DbSetOrder(3))
		if SA1->(DbSeek(xFilial("SA1")+AllTrim(aDados[04])))

			cCodClie := SA1->A1_COD
			cLojaCli :=	SA1->A1_LOJA
			cCgcClie := SA1->A1_CGC

		else 

			AAdd(aErro, "CNPJ: "+cCgcClie+" nao encontrado, titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" nao foi importado!")

		endif 	    
	    
		
	//	E1_FILIAL+E1_CLIENTE+E1_LOJA+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO
	SE1->(DbSetOrder(2))
	
	if !SE1->( DbSeek( aDados[19]+cCodClie+cLojaCli+"IMP"+aDados[01]+aDados[02]+"BOL" ) )
		
		//if !SE1->( DbSeek( aDados[19]+"IMP"+aDados[01]+aDados[02]+"BOL" ) )
	
			aAutoSE1 	:= {}
	
			AAdd(aAutoSE1, {"E1_NUM"        ,AllTrim(aDados[01])			,NIL})		
			AAdd(aAutoSE1, {"E1_PARCELA"   ,AllTrim(aDados[02])	,NIL})
			
			//de acordo com o Luis Camilo gravar E1_TIPO = NF e E1_X_FORMPG = O TIPO CH, R$, CC, CD, ETC.
			//AAdd(aAutoSE1, {"E1_X_FORPG"  ,cTipo	 	   		,NIL})	// 03 - CHEQUE = CH, BANCARIA = BOL
	        AAdd(aAutoSE1, {"E1_NUMBCO"   ,AllTrim(aDados[04])		,NIL})	// NOSSO NUMERO	
			
			cCod 	:= ""
			cLoja 	:= ""
	
	  		DbSelectArea("SA1")
			SA1->(DbSetOrder(3))
			SA1->(Dbgotop())
			
			If SA1->(DbSeek(xFilial("SA1")+alltrim(aDados[05]))) 

				cCod    := SA1->A1_COD
				cLoja   := SA1->A1_LOJA
				cNome   := SA1->A1_NOME 
				cNReduz := SA1->A1_NREDUZ  
			//Alert("Achou "+alltrim(aDados[05])) 
				
			Else
			//Alert("Nao achou "+alltrim(aDados[05])) 
			
			    cCod    := "999999999"
				cLoja   := "99"
				cNome   := ""
			    cNReduz := ""  
				// Altera็ใo 15/02/2012
				//De acordo com o Jesus nใo deverแ importar o Fornecedor, eles irใo digitar;  
			    
			    //if Empty(aDados[05])
					AAdd(aErro, "CNPJ: "+aDados[05]+" nao encontrado, titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" nao foi importado!")
			///	else
			 /*		RecLock("SA1",.T.)
	                    SA1->A1_FILIAL  := xFilial("SA1")
					    SA1->A1_NOME	:= AllTrim(aDados[06])
					    SA1->A1_NREDUZ  := Substr(AllTrim(aDados[06]),1,20)
			    	    SA1->A1_PESSOA	:= iif( len(aDados[05])==11,"F","J" )
						SA1->A1_TELEX	:= "99999999999"	// Marca para saber se registro foi importado
						SA1->A1_COMPLEM	:= "CLIENTE IMPORTADO"	// Marca para saber se registro foi importado
						
						SA1->A1_CGC		:= AllTrim( aDados[05])
						SA1->A1_COD		:= Substr(aDados[05],1,6)
						SA1->A1_LOJA	:= '0001'
						                             
						cCod := Substr(aDados[05],1,6)
				        cLoja := '0001'
				        cNome   := AllTrim(aDados[06])
				        cNReduz := Substr(AllTrim(aDados[06]),1,20)
	
					SA1->( DbUnLock() )
	   			    AAdd(aErro, "Foi importado o Cliente:"+cCod+" com o CNPJ: "+ccTmp+", titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" !")
	
				endif
			*/	
			    FT_FSKIP()
			   	Loop
			Endif
	
			AAdd(aAutoSE1, {"E1_CLIENTE"   	,cCod	     		   			,NIL})
			AAdd(aAutoSE1, {"E1_LOJA"      	,cLoja       					,NIL})
			//AAdd(aAutoSE1, {"E1_NOMCLIE"   	,cNReduz    					,NIL})
			//AAdd(aAutoSE1, {"E1_RAZCLI"   	,cNome      					,NIL})
	
	
	        // validar se existe vendedor, se nใo irแ incluir o vendedor
			/*DbSelectArea("SA3")
	
			if !SA3->( DbSeek( xFilial("SA3")+AllTrim(aDados[12])) )
				RecLock("SA3",.T.)
	                    
	                    SA3->A3_FILIAL	:= xFilial("SA3")
					    SA3->A3_COD	    := aDados[12]
					    SA3->A3_NOME    := 'VENDEDOR IMPORTACAO'
			    	    SA3->A3_NREDUZ 	:= 'VENDEDOR IMPORT'
						                             
					SA3->( DbUnLock() )
					AAdd(aErro, "Foi importado o Vendedor:"+aDados[12]+", titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" !")
	
	   	    endif
	
			SA3->( DbCloseArea() )*/
	
		  
			AAdd(aAutoSE1, {"E1_EMISSAO"   	,StoD(aDados[07])	  			,NIL})	// 4	
			AAdd(aAutoSE1, {"E1_VENCTO"    	,StoD(aDados[08])		  		,NIL}) //  7
			AAdd(aAutoSE1, {"E1_VENCORI"   	,StoD(aDados[08])		  		,NIL}) //  7	
			AAdd(aAutoSE1, {"E1_VENCREA"   	,DataValida(StoD(aDados[08]))	,NIL}) //  7
			AAdd(aAutoSE1, {"E1_VALOR"     	,Val(aDados[09])	  			,NIL}) 	// 8
			AAdd(aAutoSE1, {"E1_VLCRUZ"    	,Val(aDados[09])	  			,NIL}) 	// 8
			AAdd(aAutoSE1, {"E1_SALDO"    	,Val(aDados[10])	  			,NIL})	// 8
	                       
	     
			
		    
	        //AAdd(aAutoSE1, {"E1_HIST"    	,"Tit. Imp."                	,NIL})
			AAdd(aAutoSE1, {"E1_HIST"    	,AllTrim(aDados[20])           	,NIL})
			AAdd(aAutoSE1, {"E1_STATUS"    	,"A"					  		,NIL})	
			AAdd(aAutoSE1, {"E1_FLUXO"    	,"S"							,NIL}) 
			AAdd(aAutoSE1, {"E1_MULTNAT"   	,"2"							,NIL}) 
			
			
			if !EMPTY(AllTrim(aDados[16]))
				AAdd(aAutoSE1, {"E1_NUMCON"   	,AllTrim(aDados[16])			,NIL}) 
			endif
			
			if !EMPTY(AllTrim(aDados[15]))
				AAdd(aAutoSE1, {"E1_AGEDEP"   	,AllTrim(aDados[15])			,NIL})
			endif 
			
			if !EMPTY(AllTrim(aDados[11]))
				AAdd(aAutoSE1, {"E1_PORTADO"   	,AllTrim(aDados[11])			,NIL}) 
			endif
			
			
			AAdd(aAutoSE1, {"E1_FILIAL"   	,AllTrim(aDados[19])					,NIL}) 
			
			//AAdd(aAutoSE1, {"E1_FILIAL"   	,AllTrim(aDados[18])			,NIL}) 
			AAdd(aAutoSE1, {"E1_FILORIG"   	,AllTrim(aDados[19])			,NIL}) 
			//AAdd(aAutoSE1, {"E1_SITUACA"   	,AllTrim(aDados[20])			,NIL}) 
			AAdd(aAutoSE1, {"E1_VEND1"      ,aDados[17]						,NIL})
			AAdd(aAutoSE1, {"E1_COMIS1"     ,Val(aDados[13])				,NIL})
			AAdd(aAutoSE1, {"E1_NATUREZ"	,AllTrim(aDados[14])			,NIL}) 
			AAdd(aAutoSE1, {"E1_IDCNAB"		,AllTrim(aDados[21])			,NIL}) 
			//AAdd(aAutoSE1, {"E1_DECRESC"	,AllTrim(aDados[22])			,NIL}) 
			AAdd(aAutoSE1, {"E1_PREFIXO"    ,AllTrim(aDados[23])			,NIL})
			AAdd(aAutoSE1, {"E1_TIPO"       ,AllTrim(aDados[03])	 	   	,NIL})	// 03 - CHEQUE = CH, BANCARIA = BOL
			//AAdd(aAutoSE1, {"E1_ACRESC"     ,AllTrim(aDados[24])	 	   	,NIL})	// 03 - CHEQUE = CH, BANCARIA = BOL
			
			lBloqVend := .F.
			/*if SA3->A3_MSBLQL == "1" // Cadastro Bloqueado durante a importa็ใo tera que ser liberado e depois bloqueado novamente
				lBloqVend := .T.
				RecLock("SA3")
					SA3->A3_MSBLQL := "2"
				SA3->( DbUnLock() )
			endif*/
	
		
		   
			lBloqCli := .F.
			/*if SA1->A1_MSBLQL == "1" // Cadastro Bloqueado durante a importa็ใo tera que ser liberado e depois bloqueado novamente
				lBloqCli := .T.
				RecLock("SA1")
					SA1->A1_MSBLQL := "2"
				SA1->( DbUnLock() )
			endif*/
	
			lMsErroAuto	:= .F.
			MsExecAuto({|x, y| FINA040(x, y)}, aAutoSE1, 3) //3 = Opcao de inclusao
	
	
			/*if lBloqCli // Retorna Status de Bloqueado apos importa็ใo
				RecLock("SA1")
					SA1->A1_MSBLQL := "1"
				SA1->( DbUnLock() )
			endif*/
			
			/*if lBloqVend // Retorna Status de Bloqueado apos importa็ใo
				RecLock("SA3")
					SA3->A3_MSBLQL := "1"
				SA3->( DbUnLock() )
			endif*/
	
				
			If lMsErroAuto
				//MostraErro()
				AAdd(aErro, "Erro MSExec: "+StrTran(aDados[11],"'","")+" nao encontrado, titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" nao foi importado!")
			
			Else
				++nCont
			EndIf
	
		endif
	
	    //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	    //ณ Leitura da proxima linha do arquivo texto.                          ณ
	    //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	    
	    FT_FSKIP()
	    
	EndDo

//End Transaction
FT_FUSE()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ O arquivo texto deve ser fechado, bem como o dialogo criado na fun- ณ
//ณ cao anterior.                                                       ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

fClose(nHdl)
Close(oLeTxt) 
PutMv("MV_DATAFIN",dxData )

Alert("Foram incluidos "+cValToChar(nCont)+" titulos.")

If Len(aErro) > 0
	CriaLog(aErro)
Endif

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ AjustaSX1บ Autor ณ Maiki Perin        บ Data ณ  19/10/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Monta as perguntas										  บฑฑ
ฑฑบ          ณ 												              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal	                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function AjustaSX1()

Local aHelpPor	:= {}
Local aHelpEng	:= {}
Local aHelpSpa	:= {}
  
u_xPutSx1(cPerg, "01","Unidade","Unidade","Unidade","mv_ch1","C",01,0,0,"G","","","","",;
	"mv_par01"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
u_xPutSx1(cPerg, "02","Nome Arq.","Nome Arq.","Nome Arq.","mv_ch2","C",50,0,0,"G","","","","",;
	"mv_par02"," ","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ CriaLog  บ Autor ณ Maiki Perin        บ Data ณ  31/12/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Cria o arquivo de log no mesmo diretorio do arquivo de     บฑฑ
ฑฑบ          ณ fonte de dados								              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal	                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function CriaLog(aPar)
Local cArqTxt 	:= MV_PAR01+":\Temp2\"+AllTrim(MV_PAR02)+"log_erro_imp_se1.txt"
Local nHdl
Local cNaoImp	:= ""
Local I := 0
                             
nHdl :=FCreate(cArqTxt, FC_NORMAL) // Cria o arquivo

If nHdl == -1
    MsgAlert("O arquivo de log nao pode ser criado! Verifique os parametros.","Atencao!")
    Return
Else
	For I:=1 to Len(aPar)
		cNaoImp := aPar[I] + Chr(13)+Chr(10)
		FSeek(nHdl, 0, FS_END) // Posiciona no fim do arquivo
		FWrite(nHdl, cNaoImp) // Insere o texto no arquivo
	Next I
Endif

//FSeek(nHdl, 0, FS_END) // Posiciona no fim do arquivo
//FWrite(nHdl, cNaoImp) // Insere o texto no arquivo
FClose(nHdl) // Fecha arquivo

Return()
