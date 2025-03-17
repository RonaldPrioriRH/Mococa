#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE  "RWMAKE.CH"
#INCLUDE "XMLXFUN.CH" 
#INCLUDE "APWIZARD.CH"
#INCLUDE "FILEIO.CH"
#INCLUDE "TBICONN.CH" 
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWADAPTEREAI.CH"

#INCLUDE "TOTVS.CH"   
#DEFINE _ENTER CHR(13)+CHR(10)

Static lFWCodFil := FindFunction("FWCodFil")
Static __aAliasInDic                        
Static aBkpHeader := {}   
Static aCposSN1 := {} 
Static lN1Staus	 
Static lN1Especie 
Static lN1NFItem  
Static lN1Prod    
Static lN1Orig        
Static lN1CstPis 
Static lN1AliPis  
Static lN1CstCof  
Static lN1AliCof  

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT048   บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 05/02/2014                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Importa dados das notas referentes aos valores a serem pagos aos produtores de Leite.					    บฑฑ
ฑฑบ			 ณ														                                   					    บฑฑ
ฑฑบ          ณ 															                               					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                                         			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.   					   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum   															                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Logistica                                                                               					    บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   					    บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				             ณUsuario(Filial+Matricula+Nome)    ณSetor          บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ             บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT048()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT048A(oSelf)}
	Local oTProces
	
	Private cPerg	:= "MGLT048"
	
	DbSelectArea("SX3")
	DbSetOrder(2)
	DbSeek("D1_VALFUN")
	IF ALLTRIM(SX3->X3_VALID) <> "U_MGLT48V()" 
		RECLOCK("SX3")
			SX3->X3_VALID	:= "U_MGLT48V()"
		MsUnLock()
		ALERT("Renicie o Protheus para atualiza็ใo dos campos!")
		RETURN
	ENDIF
				
	U_xPutSx1Perg()   
	//MV_PAR01 Arquivo
	
	Pergunte(cPerg,.F.)
	
	_cTexto := "  Este programa ira ler o conte๚do de um arquivo texto, conforme"+_ENTER
	_cTexto += " os parametros definidos pelo usuario, e assim realizar a 	    "+_ENTER
	_cTexto += " importa็ใo das notas fiscais eletr๔nicas referentes aos        "+_ENTER
	_cTexto += " produtores de Leite da Capal.                                  "										   
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT048","Importa็ใo NFE",bProcess,_cTexto,cPerg)

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ OKLETXT  บ Autor ณ Ramon Teles        บ Data ณ  05/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescri??o ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a leitura do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT048A()
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Abertura do arquivo texto                                           ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	Private cArqTxt := Alltrim(MV_PAR01)
	
	Private nHdl    := FT_FUSE(cArqTxt)
	
	If nHdl == -1
	    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser aberto! Verifique os parametros.","Atencao!")
	    Return
	Endif                
	
	_cPCNFE	:= GETMV("MV_PCNFE")
	
	IF _cPCNFE
		dbSelectArea("SX6")               
		GETMV("MV_PCNFE") 
		RecLock("SX6",.F.)
			SX6->X6_CONTEUD :=	"F"
		MsUnLock()
	ENDIF
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Inicializa a regua de processamento                                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	Processa({|| RunCont() },"Lendo Arquivo de Texto...")    
	
	IF _cPCNFE
		dbSelectArea("SX6")               
		GETMV("MV_PCNFE") 
		RecLock("SX6",.F.)
			SX6->X6_CONTEUD :=	"T"
		MsUnLock()
	ENDIF
	
Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ RUNCONT  บ Autor ณ Ramon Teles        บ Data ณ  05/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescri??o ณ Funcao auxiliar chamada pela Import.  A funcao Import      บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Import			                                          บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunCont()

	Local _nRecno	:= 1
	Local _aReg		:= {}
	Local _aDados	:= {}
	Local _cMix		
	Local _dDtArq
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Array Log Inclusao      ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Private _aDados		:= {}   
	Private _aClone		:= {}
	
	Private _aLogNF		:= {}
	Private _aFail		:= {}
	Private _cTpNF	  	:= "SPED"//AllTrim(GetMv("LT_ESPECIE"))//Armazena a especie das notas fiscais dos produtores
	Private _cCondPgt 	:= AllTrim(GETMV("LT_CODPGTO"))
	Private _cSerie		:= "001"//PADR(AllTrim(GETMV("LT_SERIE")),TamSx3("F1_PREFIXO")[1]) // Serie da NF
	Private _cPrefixo  	:= _cSerie
	Private _cCodPr		:= Alltrim(GetMv("LT_PRTRIBU")) //Codigo Produto
	Private _cTes		:= Posicione("SB1",1,xFilial("SB1")+_cCodPr,"B1_TE")  
	Private _cParcSE2 	:= Space(TamSx3("E2_PARCELA")[1])
	Private _cNatureza	:= Alltrim(GETMV("LT_NATGLT"))
	Private _cSeek		:= DTOS(dDataBase)
		
	/* Estrutura do Arquivo
	1.COOPERATIVA DA NFE	1	3
	2.LINHA (PROPRIEDADE) 	4	5
	3.MATRICULA			6	9
	4.CNPJ/CPF			10	23
	5.INSCRICAO DE P.R.	24	36
	6.CFOP				37	40
	7.DATA DE EMISSAO		41	48
	8.VALOR TOTAL DA NF	49	59
	9.VLR BASE DE CALCULO	60	70                  	
	10.VALOR DO ICMS		71	81
	11.VLR INCENT PROD. LT 	82	92
	12.QTDE LITROS LEITE	93	100
	13.NฺMERO DA NF		101	106
	14.VOL LEITE TRIBUTADO	107	114
	15.TIPO DE PESSOA		115	115
	16.VR INSS RAT SENAR	116	126
	17.VLR CARRETO		127	137
	18.VLR PIS/COFINS		138	148
	19.VLR LIQUIDO DA NF	149	159
	*/
	
	FT_FGOTOP() 
	
	ProcRegua(FT_FLASTREC())
	
	While !FT_FEOF() 
		IncProc(_nRecno)
		cBuffer := FT_FREADLN()
			AADD(_aDados,{	SubStr(cBuffer,1,3),; 		//1-COOPERATIVA DA NFE
							SubStr(cBuffer,4,2),; 		//2-LINHA
							"P0"+SubStr(cBuffer,6,4),;	//3-MATRICULA
							SubStr(cBuffer,10,14),; 	//4-CNPJ
							SubStr(cBuffer,24,13),; 	//5-INSCRICAO DE PR
							SubStr(cBuffer,37,4),; 		//6-CFOP
							SubStr(cBuffer,41,8),; 		//7-DATA EMISSAO
							SubStr(cBuffer,49,11),; 	//8-VALOR TOTAL DA NF
							SubStr(cBuffer,60,11),; 	//9-VALOR DA BASE DE CALCULO
							SubStr(cBuffer,71,11),; 	//10-VALOR DO ICMS - UTILIZAR ESTE CAMPO DEFINIR SE E DIFERIDO OU TRIBUTADO - COM VALOR TRIBUTADO (TES001) OU VALOR ZERADO DIFERIDO
							SubStr(cBuffer,82,11),; 	//11-VALOR INCENTIVO PROD. LEITEIRA
							SubStr(cBuffer,93,8),; 		//12-QTDE LITROS DE LEITE
							SubStr(cBuffer,101,6),; 	//13-NUMERO DA NOTA FISCAL
							SubStr(cBuffer,107,8),; 	//14-VOLUME LEITE TRIBUTADO
							SubStr(cBuffer,115,1),; 	//15-TIPO DE PESSOA
							SubStr(cBuffer,116,11),; 	//16-VLR INSS RAT SENAR
							SubStr(cBuffer,127,11),; 	//17-VLR CARRETO
							SubStr(cBuffer,138,11),; 	//18-VLR PIS/CONFINS
							SubStr(cBuffer,149,11)}) 	//19-VLR LIQUIDO DA NF
		FT_FSKIP()
		_nRecno++	
	Enddo
	
	_dDtArq := SubStr( _aDados[1][7],5,4) + SubStr( _aDados[1][7],3,2) + SubStr( _aDados[1][7],1,2)
	
	If LastDay( STOD(_dDtArq)  ) != dDataBase
		xMagHelpFis("NAO CONFORMIDADE 01 - DATABASE INVALIDA",;
		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
		"A Data deve ser alterada para "+DTOC(LastDay(STOD(_dDtArq)))+" , para poder continuar a importacao das NFs!" ) 
		Return
	EndIf 
	         
	_aClone := ACLONE(_aDados)
	
	BEGIN TRANSACTION    
	
	ProcRegua(Len(_aDados))
	IF Len(_aDados) > 1
		
		IncProc("Gerando Nota Fiscal...")
		
		//Percorre o Array que contem os dados do arquivo
		For _nLin:=1 to Len(_aDados)
			IncProc(_nLin)
			//Array Auxiliar com os dados da NFE 
			_aReg := _aDados[_nLin]
			
			//Ajusta Campo CPF/CNPJ
			If _aReg[15] == "F"
				_aReg[4] := SubString(_aReg[4],4,11)
			EndIf 
			   
			_lRet := GeraNFE(_aReg)
			
			If !_lRet
			   	DisarmTransaction()
				xMagHelpFis("GERA NFE","Erro no processamento da inclusใo da Nota Fiscal.","A inclusใo da Nota Fiscal nใo serแ executada.")
	    			Return
			EndIf  
			
		Next
		
	Else
		MsgAlert("Nao hแ dados a processar no arquivo informado")
	EndIF 
	    
	/*If _lRet
   		_cMix 	:= GrvMix(_aLogNF)
 	EndIf*/
 	
 	If Len(_aFail) > 0
		//Imprimi Relatorio
		MGLT048R()
	EndIf
	
	End TRANSACTION

	MsgAlert("Notas Importadas!")//_aLogNF
	
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GeraNFE  บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 30/01/2014               						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para importar as NFE dos pagamentos dos produtores de Leite.                                    บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 														                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   						บฑฑ
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

Static Function GeraNFE(_aItens)
	
	Local aArea	  		:= GetArea()
	Local _lRetorno		:= .T.
	
	//Variaveis NF
	Local _aCab    		:= {}
	Local _aItensNF  	:= {}
	Local _cItem		:= "0001"	 
	Local _cTipo		:= "N"
	
	Local _cNFOri	:= ""
	Local _cSerOri 	:= ""
	
	Local _cNroNota 	:= 0
	
	Local _cRetNFOri	:= {}
	
	Local _nVlrSen		:= 0
	
	Private lMsErroAuto:= .F.
	Private lMsHelpAuto:= .T.	

	_cNroNota 		:= "000"+_aItens[13]         
	
		
	//Setando as variaveis	
	_cCodFor		:= _aItens[3]
	_cLoja			:= GetLjLin(_cCodFor,_aItens[2]) 	
	
	If !Empty(_cLoja)
	
		_dData		:= STOD(SubString(_aItens[7],5,4)+SubString(_aItens[7],3,2)+SubString(_aItens[7],1,2))
		_nQuant		:= Val(_aItens[12])   
		
		_nPreco	   	:= Val(SubStr(_aItens[8],1,9)+"."+SubStr(_aItens[8],10,2)) - Val(SubStr(_aItens[11],1,9)+"."+SubStr(_aItens[11],10,2))
		_nBsICMS	:= Val(SubStr(_aItens[9],1,9)+"."+SubStr(_aItens[9],10,2))
		_nVlrICM	:= Val(SubStr(_aItens[10],1,9)+"."+SubStr(_aItens[10],10,2))  
		
		_nIncProd	:= Val(SubStr(_aItens[11],1,9)+"."+SubStr(_aItens[11],10,2))    
		
		_nVlrSen	:= Val(SubStr(_aItens[16],1,9)+"."+SubStr(_aItens[16],10,2))
		
		DBSELECTAREA("SA2")
		DBSETORDER(1)
		IF DBSEEK(XFILIAL("SA2") + _cCodFor + _cLoja)    
			//A2_INCLTMG - 1=Sim; 2=Nao
			IF (SA2->A2_INCLTMG == "1" .OR. EMPTY(SA2->A2_INCLTMG)) .AND. _nVlrICM == 0
				RECLOCK("SA2",.F.)
					SA2->A2_INCLTMG := "2"
				MsUnLock()
			ELSEIF (SA2->A2_INCLTMG == "2" .OR. EMPTY(SA2->A2_INCLTMG)) .AND. _nVlrICM > 0
				RECLOCK("SA2",.F.)
					SA2->A2_INCLTMG := "1"
				MsUnLock()			
			ENDIF
		ENDIF
		
		// CAMPO A2_INCLTMG - FAZER RECLOCK QUANDO NO CAMPOS 1=SIM / S=NAO
		// VERIFICAR SE TEM INCENTIVO, E COMPARA COM O CAMPO, SE TIVER DIVERGENTE ALTERA O CAMPO, POR RECLOCK
		
		//Nota Complementar 
		If _nQuant == 0
			_nQuant := 0
			_cTipo 	:= "C"
			_nPrUn	:= _nPreco    

			//VERIFICA SE E DIFERIDO OU TRIBUTADO			
			IF _nVlrICM > 0
				_cTes	:= "002"
			ELSE
				_cTes	:= "004"
			ENDIF
			
			_cRetNFOri := SearchNF(_aItens[3],_aItens[2])
			
			If Empty(_cRetNFOri)
				xMagHelpFix("NF Origem",;
				"A NF Origem do Produtor nao foi encontrada no arquivo importado!",;
				"Verifique se realmente existe NF Normal para o cooperado "+_aItens[3]+" na linha "+_aItens[2]+"!")
				Return .F.
			EndIf
			
			_cNFOri 	:= _cRetNFOri
			_cSerOri 	:= _cSerie
			
		Else //Nota Normal
			_nPrUn		:= _nPreco / _nQuant    
			
			//VERIFICA SE E DIFERIDO OU TRIBUTADO
			IF _nVlrICM > 0			
				_cTes	:= "001"		
			ELSE
				_cTes	:= "003"		
			ENDIF
		EndIf
		

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Cabecalho da Nota Fiscal( SigaAuto). ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู 
		_aCab :={;
		{"F1_TIPO"    	,_cTipo			,NIL},;	// Tipo da Nota = Normal
		{"F1_FORMUL"	,"N"		    ,NIL},;	// Formulario Proprio = Sim.
		{"F1_DOC"		,_cNroNota      ,NIL},;	// Numero do Documento.      
		{"F1_SERIE"		,_cSerie 	   	,NIL},;	// Serie do Documento.
		{"F1_PREFIXO"	,_cPrefixo 	    ,NIL},;	// Prefixo do Documento.
		{"F1_EMISSAO"	,_dData		    ,NIL},;	// Data de Emissao.
		{"F1_DESPESA"	,0			    ,NIL},;	// Despesa
		{"F1_FORNECE"	,_cCodFor	 	,NIL},;	// Codigo do Fornecedor.
		{"F1_LOJA"		,_cLoja 	  	,NIL},;	// Loja do Fornecedor.
		{"F1_ESPECIE"	,_cTpNF    	    ,NIL},;	// Especie do Documento.
		{"F1_COND" 		,_cCondPgt      ,NIL},;	// Condicao de Pagamento.  
		{"F1_SEGURO"	,0	    	    ,NIL},;	// Seguro
		{"F1_FRETE"		,0	    	    ,NIL},;	// Frete   
		{"F1_PESOL"		,0	            ,NIL},;	// Peso Liquido
		{"E2_NATUREZ"	,_cNatureza     ,NIL}}  // Natureza 		
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Itens da Nota Fiscal( SigaAuto).     ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู   
		
		If _cTipo == "C"
			_aItens := {}
			aAdd(_aItens,{"D1_ITEM"    	,_cItem			,NIL})	// Sequencia Item Pedido
			aAdd(_aItens,{"D1_COD"		,_cCodPr		,NIL})	// Codigo do Produto   
			aAdd(_aItens,{"D1_VUNIT"	,_nPrUn			,NIL})	// Valor Unitario
			aAdd(_aItens,{"D1_TOTAL"	,_nPreco		,NIL})	// Valor Total
			aAdd(_aItens,{"D1_TES"		,_cTes    		,NIL})	// Tipo de Entrada - TES
			aAdd(_aItens,{"D1_LOCAL"	,Posicione("SB1",1,XFILIAL("SB1")+_cCodPr,"B1_LOCPAD")	  ,NIL})	// Armazem Padrao do Produto
			aAdd(_aItens,{"D1_SEGURO"	,0				,NIL})	// Seguro
			aAdd(_aItens,{"D1_VALFRE"	,0				,NIL})	// Frete
			aAdd(_aItens,{"D1_DESPESA"	,0				,NIL})  // Despesa   
			aAdd(_aItens,{"D1_NFORI"	,_cNFOri		,NIL})  // NF Origem
			aAdd(_aItens,{"D1_SERIORI"	,_cSerOri		,NIL})  // Serie NF Origem
			aAdd(_aItens,{"D1_BASEICM"	,_nBsICMS		,NIL})  // Base ICMS   
			aAdd(_aItens,{"D1_VALICM"	,_nVlrICM		,NIL})  // Valor ICMS	  
			aAdd(_aItens,{"D1_VLINCMG"	,_nIncProd		,NIL})  // Valor Incentivo a Produ็ใo
			aAdd(_aItens,{"D1_VALFUN"	,_nVlrSen		,NIL})  // Valor dos Impostos INSS RAT SENAR 
			aAdd(_aItens,{"D1_L_SEEK"	,_cSeek			,NIL})	// Seek NF (Ano+Mes - 201401)   			
						  
		Else   
			_aItens := {}
			aAdd(_aItens,{"D1_ITEM"    	,_cItem			,NIL})	// Sequencia Item Pedido
			aAdd(_aItens,{"D1_COD"		,_cCodPr		,NIL})	// Codigo do Produto 
			aAdd(_aItens,{"D1_QUANT"	,_nQuant		,NIL})	// Quantidade   
			aAdd(_aItens,{"D1_VUNIT"	,_nPrUn			,NIL})	// Valor Unitario
			aAdd(_aItens,{"D1_TOTAL"	,_nPreco		,NIL})	// Valor Total
			aAdd(_aItens,{"D1_TES"		,_cTes    		,NIL})	// Tipo de Entrada - TES
			aAdd(_aItens,{"D1_LOCAL"	,Posicione("SB1",1,XFILIAL("SB1")+_cCodPr,"B1_LOCPAD")	  ,NIL})	// Armazem Padrao do Produto
			aAdd(_aItens,{"D1_SEGURO"	,0				,NIL})	// Seguro
			aAdd(_aItens,{"D1_VALFRE"	,0				,NIL})	// Frete
			aAdd(_aItens,{"D1_DESPESA"	,0				,NIL})// Despesa
			//aAdd(_aItens,{"D1_C_EMBAL"	,"S"			,NIL})
			//aAdd(_aItens,{"D1_C_QTDEM"	,0				,NIL})
			//aAdd(_aItens,{"D1_C_QTDCA"	,0				,NIL})
			//aAdd(_aItens,{"D1_C_PESEM"	,0				,NIL})
			//aAdd(_aItens,{"D1_C_PESBR"	,0				,NIL})
			aAdd(_aItens,{"D1_BASEICM"	,_nBsICMS		,NIL})// Base ICMS
			aAdd(_aItens,{"D1_VALICM"	,_nVlrICM		,NIL})// Valor ICMS		
			aAdd(_aItens,{"D1_VLINCMG"	,_nIncProd		,NIL})// Valor Incentivo a Produ็ใo  
			aAdd(_aItens,{"D1_VALFUN"	,_nVlrSen		,NIL})  // Valor dos Impostos INSS RAT SENAR - _nVlrSen
			aAdd(_aItens,{"D1_L_SEEK"	,_cSeek			,NIL})// Seek NF (Ano+Mes - 201401)  
								
		EndIF   
		
		_aItens	:= FWVetByDic(_aItens, 'SD1')  
		
		aAdd(_aItensNF,_aItens)			
		
		_aAreaSF1	:= SF1->(GETAREA())
		
		DBSELECTAREA("SF1")
		DBSETORDER(1)
		IF DBSEEK(XFILIAL("SF1")+_cNroNota+_cSerie+_cCodFor+_cLoja+_cTipo)
			//aadd(_aLogNF,{_cCodFor,_cLoja,_cNroNota,_cSerie,_dData,_nQuant,_nPreco,"NOK"})	
			aadd(_aFail,{_cCodFor,_cNroNota,_cSerie,"OUT",_aItens[2],"NOTA FISCAL JA IMPORATADA"})
			RETURN .T.
		ENDIF
		
		RESTAREA(_aAreaSF1)
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ SigaAuto de Geracao da Nota.      ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู	
		Pergunte("MTA103",.F.)//Chama os parametros da rotina para nao gerar erro
		MATA103(_aCab,_aItensNF,3)	
		//MSExecAuto({|x,y| MATA103(x,y)},_aCab,_aItensNF)
	
		If lMsErroAuto
			xMagHelpFis("SigaAuto - Mata410","Nใo foi possivel executar o SigaAuto de Importa็ใo Nota de Entrada.",;
						"Produtor :"+_cCodFor+" - "+_cLoja)
			MostraErro()
			aadd(_aLogNF,{_cCodFor,_cLoja,_cNroNota,_cSerie,_dData,_nQuant,_nPreco,"NOK"})	
			_lRetorno 	:= .F.
			RollBackSx8()
		Else
						
			//Grava as Notas no array 
			aadd(_aLogNF,{_cCodFor,_cLoja,_cNroNota,_cSerie,_dData,_nQuant,_nPreco,"OK"})	
			_lRetorno := .T.
			
			DbSelectArea("SE2")
			SE2->(DbSetOrder(1))
			If SE2->(dbSeek(xFilial("SE2") + _cPrefixo + _cNroNota + _cParcSE2 + "NF " +_cCodFor + _cLoja))
				RecLock("SE2",.F.)
				SE2->E2_HIST	:= "NOTA DE PRODUTOR"  
				SE2->E2_L_FECHA	:= "S"
				MsUnlock()
			Else
				xMagHelpFix("Titulo",;
				"A NF do Produtor nao gerou o titulo no Financeiro!",;
				"Verifique se a TES gera Duplicata ou se a s้rie da Nota foi informada no parโmetro LT_SERIE ou se a Parcela tem tamanho maior que 1 ou se a condi็ใo de pagamento informada no parโmetro LT_CODPGTO existe!")
				_lRetorno := .F.
			EndIf  
			
		ENDIF
	
	Else
		aadd(_aFail,{_cCodFor,_cNroNota,_cSerie,"OUT",_aItens[2],"Cooperado nao encontrado"})
	EndIf
	
	RestArea(aArea)

Return _lRetorno

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ GetLjLin บ Autor ณ Ramon Teles        บ Data ณ 3/05/14     บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Retorna loja a qual a linha participa.					  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function GetLjLin(_cCODSA2,_cLinha)

	Local _aArea	:= GetArea()
	Local _cLoja 
	Local _cQuery

	_cQuery := " SELECT A2_COD,A2_LOJA,A2_L_LI_RO,A2_NOME " 
	_cQuery += " FROM "+RetSqlName("SA2")+" SA2  	"
	_cQuery += " WHERE " + RetSqlCond("SA2") + " 	"
	_cQuery += " AND SA2.A2_COD = '"+_cCODSA2+"' 	"
	_cQuery += " AND SA2.A2_C_LINHA LIKE '%"+_cLinha+"%' 	"  
	_cQuery += " AND SA2.A2_MSBLQL = '2' "
		
	If Select ("TRL") <> 0
		TRL->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"TRA",.F.,.T.)
	
	TRA->(dbGoTop())
	
	If TRA->(!Eof())			

		_cLoja	:= TRA->A2_LOJA  
		 
	EndIf
	
	TRA->(dbCloseArea())
	
	RestArea(_aArea)

Return _cLoja


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ GetLjLin บ Autor ณ Ramon Teles        บ Data ณ 3/05/14     บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Retorna o Serie/NRO da Nota Fisca de origem.				  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function SearchNF(_cMatr,_cLinha)

	Local _cNFOri := ""
	
	For i := 1 to Len(_aClone)
	
		If _cMatr ==  _aClone[i,3]   .and.  _cLinha == _aClone[i,2] .and. Val(_aClone[i,12]) <> 0
			Return _aClone[i,13]+"   "
		EndIf
	
	Next
	
Return _cNFOri




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GrMix    บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 11/02/2014               						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para gerar o MIX referente as NFE dos pagamentos dos produtores de Leite.                       บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 														                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   						บฑฑ
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

Static Function GrvMix(_aItensMix)

	Local aArea	  		:= GetArea()
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Informacoes do Mix -(ZLE)          ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Local _cCodMix 		:= soma1(U_maxCodigo("ZLE_COD"))
	Local _dDt1			:= STOD(SubStr(DTOS(_aItensMix[1][5]),1,6)+"01")
	Local _dDt2			:= LastDay(_aItensMix[1][5],0)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Informacoes do Evento -(ZL8)       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Local cpEvento		:= AllTrim(GETMV("LT_EVELTE"))
	Local cpEveMix		:= POSICIONE("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_MIX")
	Local cpEveDC		:= POSICIONE("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_DEBCRE")
	Local cDescEven 	:= POSICIONE("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_DESCRI")
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Informacoes da Recepcao -(AGLT0031)ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Local cSetor 		:= AllTrim(GETMV("LT_SETMIX")) 
	Local cDesSet 		:= POSICIONE("ZL2",1,xFilial("ZL2")+cSetor,"ZL2_DESCRI")
	Local cpLinha		:= AllTrim(GETMV("LT_LINMIX"))     
	Local cDesLin		:= POSICIONE("ZLY",1,xFilial("ZLY")+cpLinha,"ZLY_DESROT")
	
	Local cFretist 		:= AllTrim(GETMV("LT_FRTMIX")) 
	Local cLjFret		:= "01"
	Local cDesFret		:= POSICIONE("SA2",1,xFilial("SA2")+cFretist+cLjFret,"A2_NOME") 
	
	Local cUser			:= "admin"
	
	DbSelectArea("ZLE")
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Grvando Mix                                                         ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	RecLock("ZLE",.T.)
	ZLE->ZLE_FILIAL := xFilial("ZLE")
	ZLE->ZLE_COD    := _cCodMix
	ZLE->ZLE_VERSAO := "1"
	ZLE->ZLE_DTINI  := _dDt1
	ZLE->ZLE_DTFIM  := _dDt2
	ZLE->ZLE_STATUS := "A"
	MsUnLock()
	
	DbSelectArea("ZLF")
	
	For _nX := 1 to Len(_aItensMix)
	
		If _aItensMix[_nX][8] == "OK"
			
		Reclock("ZLF", .T.)
	
			ZLF->ZLF_FILIAL := xFilial("ZLF")
			ZLF->ZLF_CODZLE := _cCodMix
			ZLF->ZLF_VERSAO := "1"
			
			ZLF->ZLF_SETOR  := cSetor
			ZLF->ZLF_DCRSET := cDesSet 
			
			ZLF->ZLF_LINROT	:= cpLinha
			ZLF->ZLF_DCRLIN := cDesLin
			
			ZLF->ZLF_RETIRO := _aItensMix[_nX][1]
			ZLF->ZLF_RETILJ := _aItensMix[_nX][2]
			ZLF->ZLF_DCRRET  := POSICIONE("SA2",1,xFilial("SA2")+_aItensMix[_nX][1]+_aItensMix[_nX][2],"A2_NOME")
			
			ZLF->ZLF_RETIRO	:= _aItensMix[_nX][1]
			ZLF->ZLF_RETILJ	:= _aItensMix[_nX][2]
			ZLF->ZLF_DCRRET := cDesFret
			
			ZLF->ZLF_EVENTO := cpEvento
			ZLF->ZLF_ENTMIX := cpEveMix
			ZLF->ZLF_DEBCRE := cpEveDC
			ZLF->ZLF_DCREVE := cDescEven
			
			ZLF->ZLF_DTINI  := _dDt1
			ZLF->ZLF_DTFIM  := _dDt2
			
			ZLF->ZLF_QTDBOM := _aItensMix[_nX][6]	//Qtde Litro
			ZLF->ZLF_TOTAL  := _aItensMix[_nX][7]	//Valor Total
			ZLF->ZLF_VLRLTR := (_aItensMix[_nX][7]/_aItensMix[_nX][6]) //Valor Litro
			
			ZLF->ZLF_SEQ	:= u_getSeqZLF(_cCodMix,cpEvento,_aItensMix[_nX][1],_aItensMix[_nX][2])
			
			ZLF->ZLF_ORIGEM := "M" //Origem do Fechamento MIX
			ZLF->ZLF_ACERTO := "N"
			ZLF->ZLF_TP_MIX := "L"
			ZLF->ZLF_TIPO   := "L"
			ZLF->ZLF_STATUS := "P"
			
			ZLF->ZLF_USERGI	 := cUser
			
			ZLF->ZLF_TRIBUT  := "I"
			
			//Nota
			ZLF->ZLF_SE2PRE	 := _aItensMix[_nX][4]
			ZLF->ZLF_SE2NUM  := _aItensMix[_nX][3]
				
		MsUnlock()
		
		EndIf

	Next
	
	RestArea(aArea)

Return _cCodMix


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT048R บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Relatorio informacoes notas fiscais.						  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function MGLT048R()

	Local oFont10	:= TFont():New("MS Sans Serif",,010,,.F.,,,,,.F.,.F.)
	Local oFont12	:= TFont():New("MS Sans Serif",,012,,.F.,,,,,.F.,.F.)
	Local oFont12N	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.F.,.F.)
	Local oFont12NS	:= TFont():New("MS Sans Serif",,012,,.T.,,,,,.T.,.F.)
	Local oFont14	:= TFont():New("MS Sans Serif",,014,,.F.,,,,,.F.,.F.)
	Local oFont14N	:= TFont():New("MS Sans Serif",,014,,.T.,,,,,.F.,.F.)
	Local oFont14NS	:= TFont():New("MS Sans Serif",,014,,.T.,,,,,.T.,.F.)
	Local oFont16	:= TFont():New("MS Sans Serif",,016,,.F.,,,,,.F.,.F.)
	Local oFont16N	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
	Local oFont16NS	:= TFont():New("MS Sans Serif",,016,,.T.,,,,,.T.,.F.)
	Local _nX 		:= 0
	Local _nLinha	:= 0
	                          
	Private oPrinter
	
	If oPrinter == Nil
		lPreview := .T.
		oPrinter      := FWMSPrinter():New('Relat๓rio Adiantamento',,.F.,,.F.)
		oPrinter:SetPortrait()
	     //oPrinter:Setup()
		oPrinter:SetPaperSize(9)
		oPrinter:SetMargin(60,60,60,60)
	     //oPrinter:cPathPDF :="C:\TEMP\"       
	EndIf
	
	//X e a distancia entre os mesmos componentes nas duas vias
	x:=380
	
	oPrinter:StartPage()
	oPrinter:Box(040,010,800,550)
	
	cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
	//oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
	oPrinter:Say(070,120,cText1,oFont14NS)
	
	oPrinter:Say(100,30,"Cooperado" ,oFont12N)
	oPrinter:Say(100,100,"Linha" ,oFont12N)
	oPrinter:Say(100,150,"Nota Fiscal" ,oFont12N)
	oPrinter:Say(100,300,"Ocorrencia" ,oFont12N)
	
	
	//_aFail,{_cCodFor,_cNroNota,_cSerie,"OUT"}
	For _nY := 1 to Len(_aFail)
	
		
		If _nLinha > 780
			oPrinter:EndPage()
			oPrinter:StartPage()
			oPrinter:Box(040,010,800,550)
			
			cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
			oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
			oPrinter:Say(070,120,cText1,oFont16NS)
			
			oPrinter:Say(100,030,"Cooperado" 	,oFont12N)
			oPrinter:Say(100,100,"Linha" 		,oFont12N)
			oPrinter:Say(100,150,"Nota Fiscal" 	,oFont12N)
			oPrinter:Say(100,300,"Ocorrencia" 	,oFont12N)
			
			_nX := _nY
			_nY++
			
		EndIf
		
		_nLinha := 100+(15*(_nY-_nX))
		
		oPrinter:Say(_nLinha,030,_aFail[_nY,1] ,oFont12N)
		oPrinter:Say(_nLinha,100,_aFail[_nY,5] ,oFont12N)
		oPrinter:Say(_nLinha,150,_aFail[_nY,3]+"-"+_aFail[_nY,2]  ,oFont12N)
		oPrinter:Say(_nLinha,300,_aFail[_nY,6] ,oFont12N)


		
	Next
	
	oPrinter:EndPage()
	
	If lPreview
		oPrinter:Preview()
	EndIf
	
	FreeObj(oPrinter)
	oPrinter := Nil

Return



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณU_xPutSx1Pergบ Autor ณ Ramon Teles           บ Data da Criacao  ณ 31/01/2014                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao auxiliar para criacao das perguntas.																    บฑฑ
ฑฑบ			 ณ														                                   					    บฑฑ
ฑฑบ          ณ 															                               					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Criacao das Perguntas utilizando a funcao padrao U_xPutSx1.             			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.   					   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum   															                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ 			                                                                               					    บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   					    บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ             บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function U_xPutSx1Perg()

	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Arquivo de importa็ใo das Notas       ')
	Aadd( aHelpSpa, 'Arquivo de importa็ใo das Notas       ')
	Aadd( aHelpEng, 'Arquivo de importa็ใo das Notas       ')
	U_xPutSx1(cPerg,"01","Arquivo","Arquivo","Arquivo","mv_ch1","C",99,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	

Return     
	
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT048R บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Relatorio informacoes notas fiscais.						  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

USER FUNCTION MGLT48V()
Local _lRet	:= .T.

IF ALLTRIM(FUNNAME()) <> "MGLT048"
	_lRet	:= MaFisRef("IT_FUNRURAL","MT100",M->D1_VALFUN)
ENDIF

RETURN _lRet