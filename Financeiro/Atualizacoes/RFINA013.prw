#include "rwmake.ch"   
#include "protheus.ch"                             
#include "topconn.ch"    
#include "fileio.ch"   

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFINA013  บ Autor ณ 					 บ Data ณ  14/12/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณLe o arquivo txt incluindo os registros contidos neste no   บฑฑ
ฑฑบ          ณcadastro de contas a Pagar                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณMococa    		                                          บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function RFINA013()
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Declaracao de Variaveis                                             ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

	Private cPerg	:= "RFINA013"
	Private oLeTxt           

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Montagem da tela de processamento.                                  ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

	Alert("Nova Importa็ใo")

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

	Private cArqTxt := MV_PAR01+":\temp\"+AllTrim(MV_PAR02)+".txt"
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
	Local aAutoSE2		:= {}
	//Local nSalt			:= 0
	//Local cVendedor		:= ""
	Local dxData := GetMv("MV_DATAFIN")
	//Local nJuliam := ""
	//Local lFindSEA := .F.
	//Local cTipo := ""
	Local aErro := {}
	//Local ccTmp := "", ccTmp2 := ""
	//Local lBloq := .F.
	Local lBloqFornec := .F.
	//Local cCod    := ""
	//Local cLoja   := ""
	Local cNome   := "" 
	Local cNReduz := "" 


	Private lMsErroAuto	:= .F.

	PutMv("MV_DATAFIN",stod("20000101") )

	DbSelectArea("SE2")
	SE2->( DbSetOrder(1) )

	FT_FGOTOP()
	ProcRegua(FT_FLASTREC())  

	/*

	01				02				03		04				05				06					07					08						09					10				11				12			13				14					15				16
	NRO.DOCUMENTO; TIPO DOCUMENTO; CNPJ	  ; DATA EMISSAO; DATA VENCIMENTO; VENCIMENTO REAL  ; VALOR ORIGINAL	; VALOR EM MOEDA CORRENTE; VALOR LIQUIDO	; PREFIXO		  ; RETENวีES	; HISTORICO; IDENTIFICADOR; COD.PLANO FINANCEIRO; CENTRO CUSTO	;COD_FILIAL
	4100305922654;BDF			 ;01027058;05032010		; 30112010		 ; 30112010			;00000000000105,99	; 00000000000105,99		 ; 00000000000103,61; ICS			  ; 0,0000000000;          ; 3470285	  ; 10.10.15.50  		; 02.200.210.003;57

	*/

	//FT_FSKIP(11840) // +- onde comeca os titulos apos 01/12/2011

	While !FT_FEOF()

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Retorna a linha corrente                                            ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		cLinha := FT_FREADLN()     
		aDados := StrTokArr(cLinha,";")

		aDados[01] := StrTran( aDados[01], "BRANCO","" )//FILIAL
		aDados[02] := StrTran( aDados[02], "BRANCO","" )//NUM
		aDados[03] := StrTran( aDados[03], "BRANCO","" )//PARCELA
		aDados[04] := StrTran( aDados[04], "BRANCO","" )//TIPO
		aDados[05] := StrTran( aDados[05], "BRANCO","" )//CGC
		aDados[06] := StrTran( aDados[06], "BRANCO","" )//EMISSAO
		aDados[07] := StrTran( aDados[07], "BRANCO","" )//VENCIMENTO
		aDados[08] := StrTran( aDados[08], "BRANCO","" )//VALOR
		aDados[09] := StrTran( aDados[09], "BRANCO","" )//Juros e Multas
		aDados[10] := StrTran( aDados[10], "BRANCO","" )//SALDO
		aDados[11] := StrTran( aDados[11], "BRANCO","" )//NATUREZ
		aDados[12] := StrTran( aDados[12], "BRANCO","" )//CC
		aDados[13] := StrTran( aDados[13], "BRANCO","" )//E2_SDACRES
		aDados[14] := StrTran( aDados[14], "BRANCO","" )//Hist๓rico

	   //aDados[13] := StrTran( aDados[13], "BRANCO","" )//DESCONTO		
		//aDados[14] := StrTran( aDados[14], "BRANCO","" )//VALORDEVOLUCAO
		//aDados[16] := StrTran( aDados[16], "BRANCO","" )//XRECNOWINTHO

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Incrementa a regua                                                  ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

		IncProc(" Incluindo Titulo "+aDados[02]+"/"+aDados[03]+"-"+aDados[04])


		//01 - N๚mero do Titulo - 9 casas
		if len( AllTrim(aDados[02]) ) > 9
			aDados[02] := AllTrim(aDados[02])//PadR(Substr(AllTrim(StrTran(aDados[01],"'","")),1,9), len( SE2->E2_num ) )
		else
			aDados[02] := AllTrim(aDados[02])//PadR(Substr(AllTrim(StrTran(aDados[01],"'","")),1,9), len( SE2->E2_num ) )	
		endif

		//02 - Parcela - 3 casas
		aDados[03] := AllTrim(aDados[03])//PadR(StrTran(aDados[02],"'",""), len( SE2->E2_parcela ) )


		//03 - tipo de documento
		/*If StrTran(aDados[03],"'","") == "01" //.or. StrTran(aDados[1],"'","") == "09"
		cTipo := "NF "
		ElseIf StrTran(aDados[03],"'","") == "02"
		cTipo := "BOL"
		ElseIf StrTran(aDados[03],"'","") == "03"
		cTipo := "CHI"
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
		Else 
		cTipo := "NF" // OUTROS
		Endif*/
		aDados[04] := AllTrim(aDados[04])


		//04 - CPF_CNPJ CLIENTE, 18 CARACTERES
		/*aDados[04] := StrTran(aDados[04],"'","")           
		aDados[04] := StrTran(aDados[04],".","")
		aDados[04] := StrTran(aDados[04],"/","") 
		aDados[04] := StrTran(aDados[04],"-","")*/

		aDados[05] := AllTrim(aDados[05])	


		//07 - DATA EMISSAO
		ccTmp	:= AllTrim(aDados[07]) //Substr(StrTran(aDados[06],"'",""),7,4) + Substr(StrTran(aDados[06],"'",""),4,2) +  Substr(StrTran(aDados[06],"'",""),1,2)	// Dt. Emissao 

		//08- DATA VENCIMENTO
		cTmp2	:= AllTrim(aDados[08]) //Substr(StrTran(aDados[07],"'",""),7,4) + Substr(StrTran(aDados[07],"'",""),4,2) +  Substr(StrTran(aDados[07],"'",""),1,2)	// Dt. Venc.

		aDados[07] := ccTmp
		aDados[08] := cTmp2

		// 08 - VALOR DO TITULO "E2_VALOR"
		aDados[08] := StrTran( aDados[08], "R$","" )
		aDados[08] := StrTran( aDados[08], ".", "" )
		aDados[08] := StrTran( aDados[08], ",", "." )

		if Val(aDados[08]) == 0
			aDados[08] := "0.01" // Para o usuario filtrar e fazer a corre็ใo manualmente
		endif

			
	    //10 - Juros e Multas "E2_ACRESC""
		aDados[09] := StrTran( aDados[09], "R$","" )
		aDados[09] := StrTran( aDados[09], ".", "" )
		aDados[09] := StrTran( aDados[09], ",", "." )

		// 10 - SALDO "E2_SALDO"
		aDados[10] := StrTran( aDados[10], "R$","" )
		aDados[10] := StrTran( aDados[10], ".", "" )
		aDados[10] := StrTran( aDados[10], ",", "." )



		//11 -  C๓digo Natureza
		aDados[11] := AllTrim(aDados[11])//AllTrim(StrTran( aDados[11], "'", "" ))



		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Inclui titulo de acordo com o registro corrente					ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		
		cCodForn := ""
		cLojaFor :=	""
		cCgcForn := ""

		SA2->(DbSetOrder(3))
		if SA2->(DbSeek(xFilial("SA2")+AllTrim(aDados[04])))

			cCodForn := SA2->A2_COD
			cLojaFor :=	SA2->A2_LOJA
			cCgcForn := SA2->A2_CGC

		else 

			AAdd(aErro, "CNPJ: "+cCgcForn+" nao encontrado, titulo: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" nao foi importado!")

		endif 

		SE2->(DbSetOrder(1))

		if !SE2->(DbSeek(aDados[12]+"IMP"+aDados[01]+aDados[02]+"BOL"+cCodForn+cLojaFor))   

			aAutoSE2 	:= {}
			
			AAdd(aAutoSE2, {"E2_filial"   ,AllTrim(aDados[01])  ,NIL})
			AAdd(aAutoSE2, {"E2_PREFIXO"  ,"NRJF"				,NIL})
			AAdd(aAutoSE2, {"E2_NUM"      ,AllTrim(aDados[02])	,NIL})		
			AAdd(aAutoSE2, {"E2_PARCELA"  ,AllTrim(aDados[03])	,NIL})
			AAdd(aAutoSE2, {"E2_TIPO"     ,AllTrim(aDados[04]) ,NIL})	// 03 - CHEQUE = CH, BANCARIA = BOL

			//AAdd(aAutoSE2, {"E2_CCUSTO"      ,"105001" ,NIL})   
			//AAdd(aAutoSE2, {"E2_CONTAD"      ,"1101050033" ,NIL})   

			cCod 	:= ""
			cLoja 	:= ""

			DbSelectArea("SA2")
			SA2->( DbSetOrder(3) )

			If SA2->( DbSeek(xFilial("SA2")+AllTrim(aDados[05])) )
				cCod    := SA2->A2_COD
				cLoja   := SA2->A2_LOJA
				cNome   := SA2->A2_NOME 
				cNReduz := SA2->A2_NREDUZ                                                              

			Endif

			AAdd(aAutoSE2, {"E2_FORNECE"   	,cCod	     		   			,NIL})
			AAdd(aAutoSE2, {"E2_LOJA"      	,cLoja       					,NIL})
			AAdd(aAutoSE2, {"E2_NOMFOR"   	,cNReduz    					,NIL})
			//AAdd(aAutoSE2, {"E2_RAZCLI"   	,cNome      					,NIL})


			//nJuliam 	:= StrZero( ( StoD(aDados[4]) - stod("19971007") ), 4 )
			
			//DATAS devem estar no TXT como AAAAMMDD
			AAdd(aAutoSE2, {"E2_EMISSAO"   	,StoD(aDados[06])	  			,NIL})	// 6	
			AAdd(aAutoSE2, {"E2_VENCTO"    	,StoD(aDados[07])		  		,NIL}) //  7
			AAdd(aAutoSE2, {"E2_VENCORI"   	,StoD(aDados[07])		  		,NIL}) //  7	
			AAdd(aAutoSE2, {"E2_VENCREA"   	,DataValida(StoD(aDados[07]))	,NIL}) //  7


			AAdd(aAutoSE2, {"E2_VALOR"     	,Val(aDados[08])	  			,NIL}) 	// 8
			AAdd(aAutoSE2, {"E2_VLCRUZ"    	,Val(aDados[08])	  			,NIL}) 	// 8
			AAdd(aAutoSE2, {"E2_ACRESC"     ,Val(aDados[09])	      		,NIL}) 	// 8
			AAdd(aAutoSE2, {"E2_SALDO"    	,Val(aDados[10])	  			,NIL})	// 8


			//AAdd(aAutoSE2, {"E2_HIST"    	,"FGTS RESCISORIO RJ"           ,NIL})
			
			//AAdd(aAutoSE2, {"E2_HIST"    	,"CLASSE IV-QUIROGRAFมRIO ME"   ,NIL})
			AAdd(aAutoSE2, {"E2_HIST"		,AllTrim(aDados[14]),         	,NIL})

			AAdd(aAutoSE2, {"E2_STATUS"    	,"A"					  		,NIL})	
			AAdd(aAutoSE2, {"E2_FLUXO"    	,"S"							,NIL}) 
			AAdd(aAutoSE2, {"E2_MULTNAT"   	,"2"							,NIL}) 

			AAdd(aAutoSE2, {"E2_NATUREZ"	,AllTrim(aDados[11]),         	,NIL})

			//AAdd(aAutoSE2, {"E2_CCC"	,"105001"         	,NIL})
			//AAdd(aAutoSE2, {"E2_CCD"	,"105001",         	,NIL})
		
		//	AAdd(aAutoSE2, {"E2_FILIAL"		,AllTrim(aDados[11]),        	,NIL})
			//AAdd(aAutoSE2, {"E2_FILIAL"	,AllTrim(aDados[11]),         	,NIL})
			AAdd(aAutoSE2, {"E2_FILORIG"	,AllTrim(aDados[01]),         	,NIL})
			//AAdd(aAutoSE2, {"E2_XRECNO"	,AllTrim(aDados[16])            	,NIL})
			AAdd(aAutoSE2, {"E2_CCD"	,VAL(aDados[12]),         	        ,NIL})
			//AAdd(aAutoSE2, {"E2_DECRESC"	,Val(aDados[13]),         		,NIL})
			//AAdd(aAutoSE2, {"E2_DECRESC"	,AllTrim(aDados[14]),           ,NIL})
			//AAdd(aAutoSE2, {"E2_NATUREZ"	,AllTrim(aDados[10]),			,NIL}) 
			AAdd(aAutoSE2, {"E2_SDACRES"     ,Val(aDados[13])	      		,NIL}) 	// 8
			

			lBloqFornec := .F.
			if SA2->A2_MSBLQL == "1" // Cadastro Bloqueado durante a importa็ใo tera que ser liberado e depois bloqueado novamente
				lBloqFornec := .T.
				RecLock("SA2")
				SA2->A2_MSBLQL := "2"
				SA2->( DbUnLock() )
			endif

			lMsErroAuto	:= .F.	
			MsExecAuto({|x, y| FINA050(x, y)}, aAutoSE2, 3) //3 = Opcao de inclusao 

			if lBloqFornec // Retorna Status de Bloqueado apos importa็ใo
				RecLock("SA2")
				SA2->A2_MSBLQL := "1"
				SA2->( DbUnLock() )
			endif	


			If lMsErroAuto
				MostraErro()
				AAdd(aErro, "Erro ao Incluir a NF: "+StrTran(aDados[01],"'","")+", parcela: "+StrTran(aDados[02],"'","")+" nao foi importado!")
			Else
				nCont++
			EndIf

		endif

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Leitura da proxima linha do arquivo texto.                          ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

		FT_FSKIP()
		/*
		cLinha := FT_FREADLN()	
		if Empty(cLinha)

		nHdl := FT_FUSE(cArqTxt)
		for nSalt :=1 to nCont

		FT_FSKIP()

		next nSalt

		endif
		*/

	EndDo

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
	Local cArqTxt 	:= MV_PAR01+":\Temp\"+AllTrim(MV_PAR02)+"log_erro_imp_SE2.txt"
	Local nHdl
	Local cNaoImp	:= ""
	Local I

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
