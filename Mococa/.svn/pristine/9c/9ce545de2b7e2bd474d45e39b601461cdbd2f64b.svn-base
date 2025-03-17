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
ฑฑบPrograma  ณMGLT051   บ Autor ณ Ramon Teles           บ Data da Criacao  ณ 10/02/2014                				 	    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Gera arquivo de exportacao a ser enviado para a Itambe apos as amortizacoes.						    	    บฑฑ
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
ฑฑบSetor     ณ Gestao Leite                                                                            					    บฑฑ
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

User Function MGLT051()

	Local oDlg
	Local bProcess  := {|oSelf| U_MGLT051A(oSelf)}
	Local oTProces
	
	Private cPerg	:= "MGLT051"
				
	U_xPutSx1Perg()   
	//MV_PAR01 Cliente
	
	Pergunte(cPerg,.F.)
	
	_cTexto := " Este programa ira gerar o arquivo de amortiza็๕es  "+_ENTER
	_cTexto += " aos produtores de Leite da Capal.                  "										   
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg, aInfoCustom) ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	// CRIA TELA DE PROCESSAMENTO PADRAO DO SISTEMA.
	oTProces := tNewProcess():New("MGLT051","Pagamento aos COOPERADOS",bProcess,_cTexto,cPerg)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ Import   บ Autor ณ Ramon Teles        บ Data ณ  10/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescri??o ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a geracao do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function MGLT051A()

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Cria o arquivo texto                                                ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Private _cLocal := Alltrim(MV_PAR01)
	Private _cData:= Strtran(DTOC(dDataBase),"/","")
	
	Private cArqTxt := _cLocal+"\X8"+_cData+".txt" //Nome Arquivo
	
	Private nHdl    := fCreate(cArqTxt)     //Criacao Arquivo
	
	Private cEOL    := "CHR(13)+CHR(10)"    //Quebra Linha
	
	If Empty(cEOL)
		cEOL := CHR(13)+CHR(10)
	Else
		cEOL := Trim(cEOL)
		cEOL := &cEOL
	Endif
	
//	If LastDay(dDataBase) != dDataBase
//		xMagHelpFis("NAO CONFORMIDADE 02 - DATABASE INVALIDA",;
//		"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes!",;
//		"Altere a data do sistema para "+DTOC(LastDay(dDataBase)) ) 
//		Return()
//	EndIf    
	
	If nHdl == -1
		MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser executado! Verifique os parametros.","Ateno!")
		Return
	Endif
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Inicializa a regua de processamento                                 ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Processa({|| RunCont() },"Processando...")

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFun??o    ณ Import   บ Autor ณ Ramon Teles        บ Data ณ  10/02/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescri??o ณ Funcao chamada pelo botao OK na tela inicial de processamenบฑฑ
ฑฑบ          ณ to. Executa a geracao do arquivo texto.                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function RunCont

	Local cLin 		:= ""
	Local _cQuery
	Local _cDados
	Local _cFiltro 	:= ""    
	Local _cFiltro2 := ""
	
	//Variaveis do arquivo
	Local _cMatr //Matr’cula
	Local _cNome //Nome
	Local _cCPF9 //CPF 9 D’gitos
	Local _cCPF2 //CPF 2 Ult D’gitos
	
	Local _nVlrTt	:= 0
	Local _nCont	:= 0
	
	//Informaes Banco/Agncia/Conta Corrente
	Local _cBanco
	Local _cAgencia
	Local _cDigAg
	Local _cCC
	Local _cDigCC
	Local _cCodCF
	
	//Variaveis Query
	Local _cMes     := SubStr(DtoS( dDataBase	),5,2)
	Local _cAno     := SubStr(DtoS( dDataBase	),1,4)
	Local _cVencto  := _cAno+_cMes+mv_par02 //Dia de vencimento dos titulos     
	
	Local _cMaxEmis	:= DTOS(LASTDAY(ADDMES(DDATABASE,-1)))  
	
	MSGINFO("Serใo considerados os tํtulos com emissใo at้ dia " + DTOC(STOD(_cMaxEmis)) + " e vencimento at้ dia " + DTOC(STOD(_cVencto)) + ". ")
	               
	_cFiltro += "%"
	_cFiltro += " AND SA2.A2_C_TPFOR 	= 'P' "  
	_cFiltro += " AND SE2.E2_VENCTO 	<= '"  + _cVencto   + "'"
	_cFiltro += " AND SA2.A2_C_PROD  	LIKE '%04%' "	
	//_cFiltro += " AND E2_FORNECE = 'P00004' " 
	//_cFiltro += " AND SE2.E2_L_FECHA 	= 'S' "   
	_cFiltro += " AND SE2.E2_EMISSAO	<= '" + _cMaxEmis + "' "	   
	_cFiltro += "%"      
	
//	_cFiltro2 += "%"
//	_cFiltro2 += " AND SA2.A2_C_TPFOR = 'P' "  
//	_cFiltro2 += " AND SA2.A2_C_PROD  LIKE '%04%' "
//	_cFiltro2 += " AND SE1.E1_VENCTO <= '"  + _cVencto   + "'" 
//	_cFiltro2 += " AND SE1.E1_TIPO = 'NCC' "
//	_cFiltro2 += "%"
   
	_cDados	:= GetNextAlias()
	
	BeginSql alias _cDados
		SELECT 	A2COD,MIN(LOJA) AS LOJA,SUM(SALDO) AS SALDO,
				SUM(ACRESC) AS ACRESC,SUM(DECRESC) AS DECRESC 
		FROM 
			( 	SELECT 	SE2.E2_FORNECE as A2COD,MIN(E2_LOJA) AS LOJA,SUM(E2_SALDO) AS SALDO,
						SUM(SE2.E2_SDACRES) AS ACRESC,SUM(SE2.E2_DECRESC) AS DECRESC
				FROM SE2010 SE2                                                                                                               
				INNER JOIN SA2010 SA2 ON SA2.A2_COD = SE2.E2_FORNECE AND SA2.A2_LOJA = SE2.E2_LOJA 
				JOIN SED010 SED ON SED.ED_CODIGO = SE2.E2_NATUREZ AND SED.D_E_L_E_T_ = ' ' AND SED.ED_L_CORRE = 'S' "
				WHERE 	SE2.D_E_L_E_T_ =  ' '   
					AND SA2.D_E_L_E_T_ =  ' ' 
					%exp:_cFiltro%
				GROUP BY SE2.E2_FORNECE  
			) RES
		GROUP BY A2COD
		ORDER BY A2COD

	EndSql                  
		 
		//ESTA PARTE DA QUERY FOI RETIRADA, PORQUE NAO ษ CERTO PAGAR O NCC
		/*UNION ALL 
		SELECT SE1.E1_CLIENTE AS A2COD,MIN(E1_LOJA) AS LOJA, SUM(E1_SALDO) AS SALDO,
		SUM(SE1.E1_SDACRES) AS ACRESC,SUM(SE1.E1_DECRESC) AS DECRESC 
		FROM SE1010 SE1 
		INNER JOIN SA2010 SA2 ON SA2.A2_COD = SE1.E1_CLIENTE AND SA2.A2_LOJA = SE1.E1_LOJA 
		WHERE SE1.D_E_L_E_T_ = ' ' 
		AND SA2.D_E_L_E_T_ = ' '   
		%exp:_cFiltro2%
		GROUP BY SE1.E1_CLIENTE
		*/
		
	_aQuery := GETLastQuery()

	dbSelectArea(_cDados)              
	(_cDados)->(dbGoTop())  
	ProcRegua((_cDados)->(RecCount()))

	While (_cDados)->(!EOF())
		
		DbSelectArea("SA2")
		SA2->(DbSetOrder(1))
		SA2->(DbSeek(xFilial("SA2")+(_cDados)->A2COD+(_cDados)->LOJA))
	
		_cMatr := SubStr(SA2->A2_COD,3,4)
		_cNome := SubStr(SA2->A2_NOME,1,28)
		_cCPF9 := SUBSTR(SA2->A2_CGC,1,9)
		_cCPF2 := SUBSTR(SA2->A2_CGC,10,2)
		
		_cBanco 	:= "000"//StrZero(Val(SA2->A2_BANCO),3)
		_cAgencia	:= "0000"//StrZero(Val(SA2->A2_AGENCIA),4)
		_cDigAg 	:= "0"//StrZero(Val(SA2->A2_AGENCIA),1)
		_cCC 		:= "000000000"//StrZero(Val(SA2->A2_NUMCON),9)
		_cDigCC 	:= "0"//StrZero(Val(SA2->A2_NUMCON),1)
		_cCodCF 	:= "033"
		
		_nVlr 	:= (_cDados)->SALDO+(_cDados)->ACRESC-(_cDados)->DECRESC  
		_nVlrTt += _nVlr		
	
		IF _nVlr > 0 
			
			_nVlr	:= StrZero(Val(Transform(_nVlr,"@R 999999999.99")),14,2)		
			
			cLin := ""
			cLin += "X8"+"198"+_cMatr+"0"+_cNome+_cCPF9+"0000"+_cCPF2
			cLin += _cBanco+_cAgencia+_cDigAg+_cCC+_cDigCC+_cCodCF
			cLin += SubStr(_nVlr,1,11)+SubStr(_nVlr,13,2)
			
			cLin := cLin+cEOL 
			
			If fWrite(nHdl,cLin,Len(cLin)) != Len(cLin)
				If !MsgAlert("Ocorreu um erro na gravacao do arquivo. Continua?","Atencao!")
					Return
				Endif
			EndIf
			
			_nCont++
			
		ENDIF						
		
		(_cDados)->(DbSkip())
	
	EndDo  
	
	_nVlrTt := StrZero(Val(Transform(_nVlrTt,"@R 999999999.99")),16,2)
	
	cLin := ""
	cLin += "X9"+"198"+_cMes+_cAno+StrZero(_nCont++,5)+SubStr(_nVlrTt,1,13)+SubStr(_nVlrTt,15,2)
	
	If fWrite(nHdl,cLin,Len(cLin)) != Len(cLin)
		If !MsgAlert("Ocorreu um erro na gravacao do arquivo. Continua?","Atencao!")
			Return
		Endif
	EndIf
	
	DbCloseArea(_cDados)
	
	fClose(nHdl)
	
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
	Aadd( aHelpPor, 'Local aonde sera gerado o arquivo     ')
	Aadd( aHelpSpa, 'Local aonde sera gerado o arquivo     ')
	Aadd( aHelpEng, 'Local aonde sera gerado o arquivo     ')
	U_xPutSx1(cPerg,"01","Arquivo","Arquivo","Arquivo","mv_ch1","C",99,0,0,"G","","DIR","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Dia de Vencimneto do produtor.')
	Aadd( aHelpPor, 'Este dia sera considerado na data de   ')
	Aadd( aHelpPor, 'vencimento dos titulos buscados para o ')
	Aadd( aHelpPor, 'produtor.                              ')
	Aadd( aHelpSpa, 'Informe o Dia de pagamento do produtor.')
	Aadd( aHelpSpa, 'Este dia sera considerado na data de   ')
	Aadd( aHelpSpa, 'vencimento dos titulos buscados para o ')
	Aadd( aHelpSpa, 'produtor.                              ')
	Aadd( aHelpEng, 'Informe o Dia de pagamento do produtor.')
	Aadd( aHelpEng, 'Este dia sera considerado na data de   ')
	Aadd( aHelpEng, 'vencimento dos titulos buscados para o ')
	Aadd( aHelpEng, 'produtor.                              ')
	U_xPutSx1(cPerg,"02","Dia de Vencimento","Dia de Vencimento","Dia de Vencimento","mv_ch2","C",2,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
Return 