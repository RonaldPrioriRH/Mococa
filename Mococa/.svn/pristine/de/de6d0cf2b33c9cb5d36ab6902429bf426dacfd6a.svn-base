#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE  "RWMAKE.CH"
#INCLUDE "XMLXFUN.CH" 
#INCLUDE "APWIZARD.CH"
#INCLUDE "FILEIO.CH"

#INCLUDE "TOTVS.CH"   
#DEFINE _ENTER CHR(13)+CHR(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT044   บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 13/05/2014                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Importa dados referente aos cadastros dos Produtores de Leite.				                                บฑฑ
ฑฑบ		     ณ Realiza a verificacao entre a propriedade do cooperado e a linha cadastrada na Itambe.		                บฑฑ
ฑฑบ          ณ 															                  					                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                                         			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.   					   							                               	     	            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum   															                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          		       	    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Logistica                                                                               					    บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   		                บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				             ณUsuario(Filial+Matricula+Nome)    ณSetor          บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ             บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 		    บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT044()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT044A(oSelf)}
	Local oTProces
	
	Private cPerg	:= "MGLT044"
				
	U_xPutSx1Perg()   
	//MV_PAR01 Arquivo
	
	Pergunte(cPerg,.F.)
	
	_cTexto := "  Este programa ira ler o conte๚do de um arquivo texto, e ira     "+_ENTER
	_cTexto += " validar os cadastros dos cooperados produtores de leite da CAPAL."										   
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT044","Conferencia Cadastro",bProcess,_cTexto,cPerg)

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ OKLETXT  บ Autor ณ Ramon Teles        บ Data ณ  13/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescri??o ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a leitura do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT044A()
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Abertura do arquivo texto                                           ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	Private cArqTxt := Alltrim(MV_PAR01)
	
	Private nHdl    := FT_FUSE(cArqTxt)
	
	If nHdl == -1
	    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser aberto! Verifique os parametros.","Atencao!")
	    Return
	Endif
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Inicializa a regua de processamento                                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	Processa({|| RunCont() },"Lendo Arquivo de Texto...")
	
Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ RUNCONT  บ Autor ณ Ramon Teles        บ Data ณ  13/05/14   บฑฑ
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
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Array Log Inclusao      ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Private _aLogCad	:= {}
	Private _aLog		:= {}   
	Private _aMatri 	:= {}
	Private _aFail	:= {}
		
	/* Estrutura do Arquivo
	1 - 001 a 002 - N1 fixo
	2 - 003 a 005 - Cooperativa
	3 - 006 a 007 - Linha
	4 - 008 a 011 - Matricula
	5 - 012 a 039 - Nome Fornecedor
	6 - 040 a 040 - Sindicato 'S' ou 'N'
	7 - 041 a 044 - Lata Fixo '0'
	8 - 045 a 046 - UF
	9 - 047 a 049 - Municipio
	10 - 050 a 062 - Inscricao Estadual
	11 - 063 a 063 - Pessoa Fisica/Juridica 'F' 'J'
	12 - 064 a 077 - Numero CPF CNPJ
	13 - 078 a 080 - Fixo '0'
	14 - 081 a 081 - FUNRURAL 'S' 'N'
	15 - 082 a 082 - Fixo '0'
	16 - 083 a 085 - Fabrica
	17 - 086 a 099 - Branco
	18 - 100 a 100 - Fixo 'I'
	*/
	
	FT_FGOTOP() 
	
	ProcRegua(FT_FLASTREC())
	
	While !FT_FEOF() 
		IncProc(_nRecno)
		cBuffer := FT_FREADLN()
		If (SubStr(cBuffer,1,2) == "N1") 
			AADD(_aDados,{SubStr(cBuffer,1,2),SubStr(cBuffer,3,3),SubStr(cBuffer,6,2),SubStr(cBuffer,8,4),SubStr(cBuffer,12,28),SubStr(cBuffer,40,1),;
				SubStr(cBuffer,41,4),SubStr(cBuffer,45,2),SubStr(cBuffer,47,3),SubStr(cBuffer,50,13),SubStr(cBuffer,63,1),SubStr(cBuffer,64,14),;
				SubStr(cBuffer,78,3),SubStr(cBuffer,81,1),SubStr(cBuffer,82,1),SubStr(cBuffer,83,3),SubStr(cBuffer,86,14),SubStr(cBuffer,100,1)})
		EndIf
		FT_FSKIP()
		_nRecno++	
	Enddo
	
	BEGIN TRANSACTION
		
	ProcRegua(Len(_aDados))
	
	IF Len(_aDados) > 1
		
		IncProc("Atualizando Cadastro...")
		
		//Limpando a amarracao linha/propriedade
		_lRet := EraseCad()
		
		If !_lRet
		   	DisarmTransaction()
			xMagHelpFis("Verifica Cadastro","Erro no processamento da limpeza da amarracao linha/propriedade.","Favor analisar o erro log.")
	    		Return
		EndIf  
	
		IncProc("Conferencia Cadastro...")
		
		//Percorre o Array que contem os dados do arquivo
		For nX:=1 to Len(_aDados)
			IncProc(nX)
			//Array Auxiliar com os dados da NFE 
			_aReg := _aDados[nX]
			
			//Ajusta Campo CPF/CNPJ
			If _aReg[11] == "F"
				_aReg[12] := SubString(_aReg[12],4,11)
			EndIf 
			   
			_lRet := VerifCad(_aReg)
			
			If !_lRet
			   	DisarmTransaction()
				xMagHelpFis("Verifica Cadastro","Erro no processamento da verificao do cadastro.","Favor analisar o erro log.")
	    			Return
			EndIf  
			
		Next    
		
	Else
		MsgAlert("Nao hแ dados a processar no arquivo informado")
	EndIF            
	    
	End TRANSACTION      
	
	IncProc("Ordenando Logs...")
	//aSort(_aFail,,,{|x,y| x[2] < y[2] })
	
	//aSort(_aMatri,,,{|x,y| x[2] < y[2] })
	
		IncProc("Imprimindo Relatorio...")
		//Imprimi Relatorio
		MGLT044R()

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VerifCad บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 13/05/2014               					    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para a conferencia dos cadastro dos cooperados do leite.                                        บฑฑ
ฑฑบ          ณ                  												                               	            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 														                                			            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                				    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        					    บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU?AO INICIAL                   	                    บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 		    บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function VerifCad(_aItens)
	
	//Local aArea		:= GetArea()
	Local _lRetorno	:= .F.
	
	Local cQry	  
	Local cQry2    
	Local cQry3
	Local _cCodFor
	Local _cCPFCNPJ
	Local _cInscr	
	Local _cLinhaOld	:= ""
	
	/* Estrutura do Array
	1 - 001 a 002 - N1 fixo
	2 - 003 a 005 - Cooperativa
	3 - 006 a 007 - Linha
	4 - 008 a 011 - Matricula
	5 - 012 a 039 - Nome Fornecedor
	6 - 040 a 040 - Sindicato 'S' ou 'N'
	7 - 041 a 044 - Lata Fixo '0'
	8 - 045 a 046 - UF
	9 - 047 a 049 - Municipio
	10 - 050 a 062 - Inscricao Estadual
	11 - 063 a 063 - Pessoa Fisica/Juridica 'F' 'J'
	12 - 064 a 077 - Numero CPF CNPJ
	13 - 078 a 080 - Fixo '0'
	14 - 081 a 081 - FUNRURAL 'S' 'N'
	15 - 082 a 082 - Fixo '0'
	16 - 083 a 085 - Fabrica
	17 - 086 a 099 - Branco
	18 - 100 a 100 - Fixo 'I'
	*/
	
	//Declaracao	
	_cCodFor		:= "P0"+_aItens[4]
	_cCPFCNPJ		:= _aItens[12]
	_cInscr		:= _aItens[10]      
	
	If Select ("TRA") <> 0
		TRA->(dbCloseArea())
	EndIf
	
	cQry := "SELECT SA2.A2_COD FROM "
	cQry += RetSqlName("SA2") + " SA2"
	cQry += " WHERE SA2.D_E_L_E_T_ = ' ' "
	cQry += " AND SA2.A2_FILIAL = '" + xFilial("SA2") 	+ "' "
	cQry += " AND SA2.A2_COD  = '" + _cCodFor + "' "
	
	TCQUERY cQry NEW ALIAS ("TRA")
	dbSelectArea("TRA")  
	("TRA")->(DbGoTop())
		
	If !("TRA")->(Eof())  
	
		_cDados3  := GetNextAlias()  
		
		If Select ("TRB") <> 0
			TRB->(dbCloseArea())
		EndIf
	
		cQry2 := "SELECT SA2.A2_COD FROM "
		cQry2 += RetSqlName("SA2") + " SA2"
		cQry2 += " WHERE SA2.D_E_L_E_T_ = ' ' "
		cQry2 += " AND SA2.A2_FILIAL = '" + xFilial("SA2") 	+ "' "
		cQry2 += " AND SA2.A2_COD  = '" + _cCodFor + "' "
		cQry2 += " AND SA2.A2_CGC  = '" + _cCPFCNPJ + "' " 
		
		TCQUERY cQry2 NEW ALIAS ("TRB")
		DbSelectArea("TRB")
		TRB->(dbGoTop())
			
		If TRB->(!Eof()) 
	
			If Select ("TRC") <> 0
				TRC->(dbCloseArea())
			EndIf
			
			cQry3 := "SELECT SA2.A2_COD,SA2.A2_LOJA,SA2.A2_NOME,SA2.A2_C_LINHA FROM "
			cQry3 += RetSqlName("SA2") + " SA2"
			cQry3 += " WHERE SA2.D_E_L_E_T_ = ' ' "
			cQry3 += " AND SA2.A2_FILIAL = '" + xFilial("SA2") 	+ "' "
			cQry3 += " AND SA2.A2_COD  = '" + _cCodFor + "' " 
			cQry3 += " AND SA2.A2_CGC  = '" + _cCPFCNPJ + "' " 
			cQry3 += " AND SA2.A2_INSCR  = '" + _cInscr + "' " 
			
			cQry3 := changeQuery(cQry3)
			dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQry3),"TRC",.F.,.T.)
			TRC->(dbGoTop())
			
			If TRC->(!Eof())  
			   	
			   	If Empty(("TRC")->A2_C_LINHA)
			   		_cLinhaOld := _aItens[3]
			   	Else
			   		_cLinhaOld := Alltrim(("TRC")->A2_C_LINHA)+"/"+_aItens[3]   	
			   	EndIf
				
				UpdLin(("TRC")->A2_COD ,("TRC")->A2_LOJA,_cLinhaOld  )  
				
				aadd(_aLogCad,{"OK",_cCodFor,("TRC")->A2_LOJA,("TRC")->A2_NOME,_aItens[3],_cCPFCNPJ,_cInscr,"Cooperado Atualizado!"})
		   		aadd(_aMatri,{"OK",_cCodFor,("TRC")->A2_LOJA,("TRC")->A2_NOME,_aItens[3],_cCPFCNPJ,_cInscr,"Cooperado Atualizado!"})
				_lRetorno := .T.	     
								
			Else
			
				aadd(_aLogCad,{"NOK",_cCodFor,"","",_aItens[3],_cCPFCNPJ,_cInscr,"Inscricao Inexistente!"})	
				aadd(_aFail,{"NOK",_cCodFor,"","",_aItens[3],_cCPFCNPJ,_cInscr,"Inscricao Inexistente!"})
				_lRetorno := .T.
			EndIf  
			
		Else
		
			aadd(_aFail,{"NOK",_cCodFor,"",,_aItens[3],_cCPFCNPJ,_cInscr,"CPF Inexistente!"})	
			_lRetorno := .T.
			
		EndIf 
		

	Else
	
		aadd(_aMatri,{"NOK",_cCodFor,"",,_aItens[3],_cCPFCNPJ,_cInscr,"Matricula Inexistente!"})	
		_lRetorno := .T.
		
	EndIf
						

Return _lRetorno

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEraseCad  บAutor  ณMicrosiga           บ Data ณ  22/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina limpa campo A2_C_LINHA		                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function UpdLin(_cCod,_cLj,_cLinha)

	Local aArea		:= GetArea()
	Local _cQuery
	Local lSqlOk 	:= .T.

	_cQuery := " UPDATE " + RetSqlName("SA2") + " "
	_cQuery += " SET A2_C_LINHA = '"+_cLinha+" ' "
	_cQuery += " WHERE A2_COD = '"+_cCod+"' "
	_cQuery += " AND A2_LOJA = '"+_cLj+"' "
	
	lSqlOk := !(TCSqlExec(_cQuery) < 0)
		
	If !lSqlOk
		xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
		TcSqlError(),;
		"Verifique a Sintaxe da Query de UPDATE. Fonte UPDLIN.")
	EndIf

	RestArea(aArea)

Return lSqlOk

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEraseCad  บAutor  ณMicrosiga           บ Data ณ  22/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina limpa campo A2_C_LINHA		                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function EraseCad

	Local aArea		:= GetArea()
	Local _cQuery
	Local lSqlOk 	:= .T.

	_cQuery := " UPDATE " + RetSqlName("SA2") + " "
	_cQuery += " SET A2_C_LINHA = ' ' "
	_cQuery += " WHERE A2_C_TPFOR = 'P' "
	
	lSqlOk := !(TCSqlExec(_cQuery) < 0)
		
	If !lSqlOk
		xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
		TcSqlError(),;
		"Verifique a Sintaxe da Query de UPDATE. Fonte EraseCad.")
	EndIf

	RestArea(aArea)

Return lSqlOk


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณtelaLog   บAutor  ณMicrosiga           บ Data ณ  13/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Tela para mostrar o log de operacao                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function telaLog(aItens)

	Local oListBox1
	Local nListBox1 := 1
	Local oSButton1
	Static oDlg
	
     DEFINE MSDIALOG oDlg TITLE "Ocorrencias dos Cadastros" FROM 000, 000  TO 800, 800 COLORS 0, 16777215 PIXEL

     DEFINE SBUTTON oSButton1 FROM 204, 069 TYPE 01 OF oDlg ONSTOP "Ok" ENABLE ACTION Close(oDlg)
     @ 008, 006 LISTBOX oListBox1 VAR nListBox1 ITEMS aItens SIZE 185, 191 OF oDlg COLORS 0, 16777215 PIXEL

  ACTIVATE MSDIALOG oDlg CENTERED

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณU_xPutSx1Pergบ Autor ณ Ramon Teles           บ Data da Criacao  ณ 31/01/2014                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao auxiliar para criacao das perguntas.														            บฑฑ
ฑฑบ			 ณ														                                   		                บฑฑ
ฑฑบ          ณ 															                               		                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Criacao das Perguntas utilizando a funcao padrao U_xPutSx1.             			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.   					   							                               			            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum   															                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          				    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ 			                                                                               				        บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function U_xPutSx1Perg()

	aHelpPor := {}
	aHelpEng := {}
	aHelpSpa := {}
	Aadd( aHelpPor, 'Arquivo de importa็ใo dos Cadastros   ')
	Aadd( aHelpSpa, 'Arquivo de importa็ใo dos Cadastros   ')
	Aadd( aHelpEng, 'Arquivo de importa็ใo dos Cadastros   ')
	U_xPutSx1(cPerg,"01","Arquivo","Arquivo","Arquivo","mv_ch1","C",99,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	

Return    

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณ MGLT044R บ Autor ณ Ramon Teles        บ Data ณ  03/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Relatorio informacoes conferencia.						  บฑฑ
ฑฑบ          ณ 											                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function MGLT044R()

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
		oPrinter      := FWMSPrinter():New('Relat๓rio Conferencia Cadastro',,.F.,,.F.)
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
	
	//oPrinter:Say(100,30,"Cadastro Cooperados" ,oFont12N)
	
	For _nY := 1 to Len(_aFail)
	
		
		If _nLinha > 780
			oPrinter:EndPage()
			oPrinter:StartPage()
			oPrinter:Box(040,010,800,550)
			
			cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
			oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
			oPrinter:Say(070,120,cText1,oFont16NS)
			
			//oPrinter:Say(100,30,"Conferencia de cadastro dos Cooperados" ,oFont12N)
			_nX := _nY
			
		EndIf
		
					
			_nLinha := 100+(15*(_nY-_nX))
			//aadd(_aLogCad,{"OK",_cCodFor,(_cDados)->A2_LOJA,(_cDados)->A2_NOME,_aItens[3],_cCPFCNPJ,_cInscr,"Cooperado Atualizado!"})
		
			oPrinter:Say(_nLinha,10, _aFail[_nY][1]          ,oFont10)
			oPrinter:Say(_nLinha,30, _aFail[_nY][2]          ,oFont10)
			oPrinter:Say(_nLinha,80, _aFail[_nY][3]          ,oFont10)
			//oPrinter:Say(_nLinha,110, _aLogCad[_nY][4]          ,oFont10)
			oPrinter:Say(_nLinha,110, _aFail[_nY][5]          ,oFont10)
			oPrinter:Say(_nLinha,150, _aFail[_nY][6]          ,oFont10)
			oPrinter:Say(_nLinha,260, _aFail[_nY][7]          ,oFont10)
			oPrinter:Say(_nLinha,380, _aFail[_nY][8]          ,oFont10)
		
		
	Next     
	
	_nX 		:= 0
	_nLinha	:= 0  
	
	x:=380
	
	oPrinter:StartPage()
	oPrinter:Box(040,010,800,550)
	
	cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
	//oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
	oPrinter:Say(070,120,cText1,oFont14NS)
	
	For _nY := 1 to Len(_aMatri)
	
		
		If _nLinha > 780
			oPrinter:EndPage()
			oPrinter:StartPage()
			oPrinter:Box(040,010,800,550)
			
			cText1 := "COOPERATIVA AGROPECUARIA DE ARAXA - CAPAL"
			oPrinter:SayBitmap(050,020,"\system\LGMID.png",060,033)
			oPrinter:Say(070,120,cText1,oFont16NS)
			
			//oPrinter:Say(100,30,"Conferencia de cadastro dos Cooperados" ,oFont12N)
			_nX := _nY
			
		EndIf
		
					
			_nLinha := 100+(15*(_nY-_nX))
			//aadd(_aLogCad,{"OK",_cCodFor,(_cDados)->A2_LOJA,(_cDados)->A2_NOME,_aItens[3],_cCPFCNPJ,_cInscr,"Cooperado Atualizado!"})
		
			oPrinter:Say(_nLinha,10, _aMatri[_nY][1]          ,oFont10)
			oPrinter:Say(_nLinha,30, _aMatri[_nY][2]          ,oFont10)
			oPrinter:Say(_nLinha,80, _aMatri[_nY][3]          ,oFont10)
			//oPrinter:Say(_nLinha,110, _aLogCad[_nY][4]          ,oFont10)
			oPrinter:Say(_nLinha,110, _aMatri[_nY][5]          ,oFont10)
			oPrinter:Say(_nLinha,150, _aMatri[_nY][6]          ,oFont10)
			oPrinter:Say(_nLinha,260, _aMatri[_nY][7]          ,oFont10)
			oPrinter:Say(_nLinha,380, _aMatri[_nY][8]          ,oFont10)
		
		
	Next    
	
	
	
	oPrinter:EndPage()
	
	If lPreview
		oPrinter:Preview()
	EndIf
	
	FreeObj(oPrinter)
	oPrinter := Nil

Return 
	