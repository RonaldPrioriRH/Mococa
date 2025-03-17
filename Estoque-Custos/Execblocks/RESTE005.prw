#include 'protheus.ch'
#include 'parmtype.ch'
#include 'rwmake.ch'
#include "topconn.ch"

user function RESTE005()
	local aArea := GetArea()
	local  cPerg 	:= "RESTE005"
	//local oTelaPd
	//local cLinha
	//local aErros
	local cArqCSV := "" 

	ValidPerg(cPerg)

	Pergunte(cPerg, .f.)	

	@ 200,1 TO 385,620 DIALOG oTelaSld TITLE "Geração de Saldos Iniciais"
	@ 02,1 TO 090,312
	@ 10,018 SAY " Este programa gerará registros de Saldos iniciais através da leitura"
	@ 18,018 SAY " de um arquivo csv."
	@ 26,018 SAY " Estrutura do arquivo: PRODUTO;ARMAZEM;QUANTIDADE;ENDEREÇO;LOTE;VALIDADE;VALOR"
	@ 34,018 SAY " A soma da coluna quantidade das linhas de cada lote e/ou endereço corresponderá a quantidade "
	@ 42,018 say " total em estoque a ser lançado. A coluna VALOR deve corresponder ao valor TOTAL geral do "
	@ 50,018 say " estoque e seu valor deve ser repetido nas linhas quando o produto tiver mais de um  "
	@ 58,018 say " lote e/ou endereço."
	@ 70,188 BMPBUTTON TYPE 01 ACTION (Processa({ || ( GeraSaldo(cArqCSV),Close(oTelaSld) ) } ), "Carregando Saldos Iniciais ...")
	@ 70,218 BMPBUTTON TYPE 02 ACTION Close(oTelaSld)
	@ 70,248 BMPBUTTON TYPE 05 ACTION SelecArq(@cArqCSV)
	ACTIVATE DIALOG oTelaSld CENTERED


	restArea(aArea)
return



Static Function GeraSaldo(cArqCSV)
	local nHandle
	local nQuantidade
	local cEndereco
	local cLote
	//local lEndereco
	//local lLote
	local nZ
	local aVetor
	Local nY 
	Local nX
	private cProdB9
	private lmsErroAuto

	if empty(cArqCSV)
		ApMsgStop("É necessário informar um arquivo para importação e geração de saldos iniciais!")
		return
	elseif !file(cArqCSV)
		ApMsgStop("Arquivo "+cArqCSV+" não encontrado!")
		return
	endif

	nHandle := FT_FUse(cArqCSV)
	nLinhasArq := FT_FLastRec()
	nLinhasArq := nLinhasArq * 3
	ProcRegua(nLinhasArq)

	if nHandle < 0
		ApMsgStop("Houve um erro na abertura do arquivo "+cArqCSV+". A rotinafoi abortada! ")
		return
	endif

	FT_FGoTOP()

	/*Estrutura fixa do arquivo CSV:
	PRODUTO;ARMAZEM;QUANTIDADE;ENDEREÇO;LOTE;VALIDADE;VALOR*/

	aErros := {}
	sb1->(DbSetOrder(1))

	aSaldosB9 := {} //Saldos Inicias
	aValorB9  := {} //Saldos gerais do produto
	aSaldosBJ := {} //Saldos Iniciais Por Lote
	aSaldosBK := {} //Saldos Iniciais Por Endereço
	nLinArq := 0
	
	While !FT_FEof()
	
		IncProc("Realizando Leitura do arquivo csv ...")

		cLinha := FT_FReadLn()
		aLinha := StrTokArr2( cLinha , ";",.t. )
		nLinArq++
		FT_FSkip()

		if Alltrim(Upper(aLinha[1])) <>'PRODUTO'

			cProdB9 	:= Criavar("B1_COD",.f.)
			cArmazem 	:= Criavar("B1_LOCPAD",.f.)
			nQuantidade := 0
			cEndereco   := Criavar("BE_LOCALIZ",.f.)
			cLote       := Criavar("B8_LOTECTL",.f.) 
			dVldLote    := Criavar("B8_DTVALID",.f.)
			nValorB9    := 0

			For nZ := 1 to Len(aLinha)
				Do Case
					Case nZ == 1
					cProdB9 	:= Padr(aLinha[1], TamSx3("B1_COD")[1])
					Case nZ == 2
					cArmazem 	:= Padr(aLinha[2], TamSx3("B1_LOCPAD")[1])
					Case nZ == 3 
					nQuantidade := Val(aLinha[3])
					Case nZ == 4
					cEndereco   := Padr(aLinha[4], TamSx3("BE_LOCALIZ")[1])
					Case nZ  = 5
					cLote	    := Padr(aLinha[5], TamSx3("B7_LOTECTL")[1])
					Case nZ == 6 
					dVldLote    := ctod(aLinha[6])
					Case nZ == 7    
					nValorB9    := Val(aLinha[7])
				EndCase		
			Next nZ
			
			sb1->(Dbsetorder(1))
			nnr->(DbSetOrder(1))
			
			if empty(cProdB9) .or. !sb1->(dbSeek(FwxFilial("SB1")+cProdB9))
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O produto informado nesta linha não está cadastrado ("+alltrim(cProdB9)+")! ")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" --> O produto informado nesta linha não está cadastrado ("+alltrim(cProdB9)+")! "})			
			elseif	empty(cArmazem) .or. !nnr->(DbSeek(FwxFilial("NNR")+cArmazem))
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O armazém informado nesta linha não está cadastrado ("+alltrim(cArmazem)+")! ")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O armazém informado nesta linha não está cadastrado ("+alltrim(cArmazem)+")! "})			
			elseif nValorB9 <= 0
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"A coluna referente ao valor do produto é inválida ("+alltrim(str(nValorB9))+")! ")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"A coluna referente ao valor do produto é inválida ("+alltrim(str(nValorB9))+")! "})	
			elseif nQuantidade <=0
			//	ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"A coluna referente a quantidade do produto é inválida ("+alltrim(str(nQuantidade))+")! ")
		//		Final("Operação abortada!")
                aadd(aErros,{"Erro na linha "+" -->"+"A coluna referente a quantidade do produto é inválida ("+alltrim(str(nQuantidade))+")! "})						 		
			endif
			lRastro := Rastro(cProdB9,"L")
			lLocaliz :=  Localiza(cProdB9)
			
			
			
			
			//Alimenta Saldos Iniciais por Armazém
			nPosB9 := Ascan(aSaldosB9,{ |x| x[1] == cProdB9 .and. x[2] == cArmazem }) 
			if  nPosB9 == 0
				aadd(aSaldoSB9,{cProdB9,cArmazem,nQuantidade,nValorB9})
			else
				aSaldoSb9[nPosB9,3] += nQuantidade
			endif
			
			//Alimenta valor geral do produto
			nPosVlrB9 := Ascan(aValorB9,{ |x| x[1] == cProdB9  }) 
			if  nPosVlrB9 == 0
				aadd(aValorB9,{cProdB9,nQuantidade,nValorB9})
			else
				aValorB9[nPosVlrB9,2] += nQuantidade
			endif


			if lRastro .and. !Empty(cLote) .and. ( !empty(dVldLote) .and. dVldLote>=dDataBase)
				//Alimenta Saldos Inicias Por Lote
				nPosBJ := Ascan(aSaldosBJ,{ |x| x[1] == cProdB9 .and. x[2] == cArmazem .and. x[3] == cLote }) 
				if  nPosBJ == 0
					aadd(aSaldoSBJ,{cProdB9,cArmazem,cLote,nQuantidade,dVldLote})
				else
					aSaldoSBJ[nPosBJ,4] += nQuantidade
				endif
			elseif ( lRastro .and. Empty(cLote) ) 
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O produto está configurado para controlar rastreabilidade mas não foi informado lote nesta linha!")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O produto ("+Alltrim(cProdB9)+") está configurado para controlar rastreabilidade mas não foi informado lote nesta linha!"})
			elseif (!lRastro .and. !empty(cLote))
//				ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O produto não controla rastreabilidade mas foi informado lote nesta linha!")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O produto ("+Alltrim(cProdB9)+") não controla rastreabilidade mas foi informado lote nesta linha!"})			
			elseif lRastro .and. ( empty(dVldLote) .or. dVldLote < dDataBase )	
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O vencimento do lote informado não é valido ("+dtoc(dVldLote)+")! ")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O vencimento do lote informado não é valido ("+dtoc(dVldLote)+")! "})					
			endif	

			if lLocaliz .and. !Empty(cEndereco)
				//Alimenta saldos Iniciais por Lote e Endereço
				sbe->(DbSetOrder(1))
				if !sbe->(DbSeek(FwxFilial("SBE")+cArmazem+cEndereco))
					//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O endereço informado: "+cEndereco+" não está cadastrado no armazém "+cArmazem+"!")
					//Final("Operação abortada!")
					aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O endereço informado: "+cEndereco+" não está cadastrado no armazém "+cArmazem+"!"})
				else				
					nPosBK := Ascan(aSaldosBK,{ |x| x[1] == cProdB9 .and. x[2] == cArmazem .and. x[3] == cLote .and. x[4] == cEndereco}) 
					if  nPosBK== 0
							aadd(aSaldoSBK,{cProdB9,cArmazem,cLote,cEndereco,nQuantidade})
						else
							aSaldoSBK[nPosBK,5] += nQuantidade
					endif
				endif	
			elseif (lLocaliz .and. Empty(cEndereco) ) 
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O produto está configurado para controlar endereçamento mas o endereço não foi informado nesta linha !")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O produto ("+Alltrim(cProdB9)+") está configurado para controlar endereçamento mas o endereço não foi informado nesta linha !"})
			elseif (!lLocaliz .and. !Empty(cEndereco) )
				//ApMsgStop("Erro na linha "+Alltrim(Str(nLinArq))+chr(13)+chr(10)+"O produto não controla endereçamento mas foi informado endereço nesta linha !")
				//Final("Operação abortada!")
				aadd(aErros,{"Erro na linha "+Alltrim(Str(nLinArq))+" -->"+"O produto ("+Alltrim(cProdB9)+") não controla endereçamento mas foi informado endereço nesta linha !"})			
			endif	

		Endif


	Enddo


	if len(aErros) > 0
		nHdlErro :=  FCREATE("/system/erros_saldo_"+alltrim(cUserName)+".log",0)
		if nHdlErro == -1
			ApMsgStop("Erro ao criar o arquivo de log erros_saldo_"+alltrim(cUserName)+".log")
			Final("Operação abortada!")
		else
			For nZ :=1 to len(aErros)
				FWrite(nHdlErro, aErros[nZ,1]+chr(13)+chr(10))
			next nZ
			ApMsgStop("Foram encontrados erros na validação da estrutura do arquivo."+chr(13)+chr(10)+;
					  "Consulte o arquivo /system/erros_saldo_"+alltrim(cUserName)+".log")
			Final("Operação Abortada!")		  
		endif
	else			
		if !ApMsgYesNo("Não foram encontrados erros de estrutura. Deseja iniciar a importação ?","Importação")
			return
		endif				
	endif
	


	For nZ :=1 to Len(aSaldoSB9)
		cProdB9   := aSaldoSb9[nZ,1]
		cArmazem  := aSaldoSb9[nZ,2]
		nQtdB9    := aSaldoSb9[nZ,3]
		nVlrB9	  := aSaldoSb9[nZ,4]		
		nPosVlrB9 := Ascan(aValorB9,{ |x| x[1] == cProdB9  })
		if nPosVlrB9 == 0
			Final("Erro ao buscar valor total do Produto !")
		endif  
		nQTdTotal := aValorB9[nPosVlrB9,2]
		nPercArm  := nQtdB9/nQTdTotal
		nVlrArm   := nVlrB9 * nPercArm 
		nCusMed   := nVlrArm / nQtdB9
		lRastro	  := Rastro(cProdB9,"L")
		lLocaliz  := Localiza(cProdB9)
		
		IncProc("Gravando as informações de Saldos Iniciais  ...")
		
		
		//Verifica se já existe saldo inicial lançado para o produto
		DbSelectArea("SB9")
		DbSetOrder(1)
		if DbSeek(FwxFilial("SB9")+cProdB9+cArmazem)			
			Loop
		endif


		//Chama ExecAuto da SB9
		//array aLotesIni foi preenchido pelo ponto de entrada MT220TOK para gerar o saldos por
		//lote

		lMsErroAuto := .F.

		aVetor :={;
		{"B9_FILIAL" ,FwxFilial("SB9")	        ,Nil},;
		{"B9_COD"    ,cProdB9					,Nil},;
		{"B9_LOCAL"  ,cArmazem			        ,Nil},;					
		{"B9_DATA"	 ,ctod("//")	            ,Nil},;					
		{"B9_QINI" 	 ,nQtdB9 		            ,Nil},;										
		{"B9_VINI1"	 ,nVlrArm 		            ,Nil},;
		{"B9_CM1"	 ,nCusMed 		            ,Nil}}


		Begin Transaction

			MSExecAuto({|x,y| Mata220(x,y)},aVetor)

			if lMsErroAuto
				MostraErro()
				DisarmTransaction()
				Final("Falha na inclusão do Saldo Inicial (SB9)")
			endif

			//Realiza a Distribuição dos Lotes
			if lRastro

				aLotesIni := {}

				for nY :=1 to Len(aSaldoSBJ)

					if aSaldoSBJ[ny,1] == cProdB9 .and. aSaldoSBJ[nY,2] == cArmazem
						aAdd(aLotesIni, {	cProdB9,; 	// Código do Produto
						cArmazem,; 		// Local
						dDataBase,; 	// Data base
						aSaldoSBJ[nY,4],; 	// Quantidade
						0,; 	// Quantidade seg. UM
						aSaldoSBJ[nY,3],; 	// Numero do lote (LOTECTL)
						"",; 	// Sub-lote (NUMLOTE)
						aSaldoSBJ[nY,5	],; 	// Dt. Validade
						0				,; // Potencia
						.F.}) 			// Controle interno
					endif
				Next nY	


				lMsErroAuto := .f.
				A220AtuSD5(cProdB9, cArmazem)

				if lMsErroAuto
					MostraErro()
					DisarmTransaction()
					Final("Falha na geração de Saldos de Lote (SB8)")
				endif

			endif

			//Realiza o Endereçamento
			if lLocaliz
				For nX :=1 to Len(aSaldoSBK)
					cProdBK   := aSaldoSBK[nX,1]
					cLocalBK  := aSaldoSBK[nX,2]
					cLoteCtl  := aSaldoSBK[nX,3]
					cEndereco := aSaldoSBK[nX,4]
					nQtdEnd   := aSaldoSBK[nX,5]
					
					if cProdBK == cProdB9 .and. cLocalBK == cArmazem 
						cQuery := " Select R_E_C_N_O_ AS RECNODA "
						cQuery += " from "
						cQuery += RetSqlName("SDA")
						cQuery += " where "
						cQuery += " DA_FILIAL = '"+FwxFilial("SDA")+"' AND "
						cQuery += " DA_PRODUTO = '"+cProdB9+"' AND "
						cQuery += " DA_LOCAL = '"+cArmazem+"' AND "
						if lRastro
							cQuery += " DA_LOTECTL = '"+cLoteCtl+"' AND "
						endif	
						cQuery += " D_E_L_E_T_ =' ' "
						if Select("QSDA") > 0
							QSDA->(DbCloseArea())
						endif
						TcQuery cQuery new alias "QSDA"
						if Eof()
							DisarmTransaction()
							Final("Falha no lançamento de Saldos por Endereço (SBK). Não encontrado SDA correspondente !")
						endif
						dbSelectArea("SDA")
						DbGoTo(QSDA->RECNODA)

						cOrigSDA := if(lRastro,"SD5","SB9")


						aCEnd := {  {"DA_FILIAL" , FwxFilial("SDA")         	, nil},;
									{"DA_PRODUTO", cProdB9			    		, nil},;
									{"DA_LOCAL"  , cArmazem					  	, nil},;
									{"DA_DOC"    , SDA->DA_DOC  				, nil},;
									{"DA_LOTECTL", if(lRastro,cLoteCtl,"")		, nil},;
									{"DA_ORIGEM" , cOrigSDA						, nil},;
									{"DA_NUMSEQ" , SDA->DA_NUMSEQ			 	, nil}}

						//itens
						cQuery := " Select MAX(DB_ITEM) MAXITEMDB "
						cQuery += " From "
						cQuery += RetSqlName("SDB")
						cQuery += " Where "
						cQuery += " DB_FILIAL = '"+FwxFilial("SDB")+"' AND "
						cQuery += " DB_PRODUTO = '"+cProdB9+"' AND "
						cQuery += " DB_LOCALIZ = '"+cEndereco+"' AND "
						if lRastro
							cQuery += " DB_LOTECTL ='"+cLoteCtl+"' AND "
						endif
						cQUery += " D_E_L_E_T_ = ' ' "
						if Select("QSDB") > 0
							QSDB->(DbCloseArea())
						endif
						TcQUery cQuery new alias "QSDB"
						if QSDB->(Eof())
							cItemDB := StrZero(1,TamSx3("DB_ITEM")[1])
						else
							cItemDB := soma1(QSDB->MaxItemDB)
						endif
						QSDB->(DbCloseArea())
						aIEnd := {}
						aAdd(aIEnd, {   {"DB_FILIAL" , FwxFilial("SDA")         , nil},;
										{"DB_ITEM"   , cItemDB			        , nil},;
										{"DB_ESTORNO", " "						, nil},;
										{"DB_LOCALIZ", cEndereco		        , nil},;
										{"DB_DATA"   , dDataBase		     	, nil},;
										{"DB_QUANT"  , nQtdEnd 					, nil}})

						lMsErroAuto := .F.
						MsExecAuto({|x, y, z| MATA265(x, y, z)}, aCEnd, aIEnd, 3)

						IF lMsErroAuto
							MostraErro()
							DisarmTransaction()
							Final("Falha no lançamento de saldo por endereço (SDB) !")
						EndIf
					Endif

				next nX


			endif




		end Transaction



	Next nZ

	ApMsgInfo("Processo Terminado !")

Return






Static Function ValidPerg(cPerg)
	Local aRegs := {}
	Local i,j

	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)

	aAdd(aRegs,{cPerg,"01","Arquivo CSV     ?","","","mv_ch1" ,"C", 99,0,0,"C","","mv_par01"  ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})

	For i:=1 to Len(aRegs)
		//Retirado Sangelles 22/03/2022 ->If !dbSeek(cPerg+aRegs[i,2])
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		cQry := " SELECT * FROM " 				  + cPulaLinha
		cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry += " WHERE " 						  + cPulaLinha
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next
			MsUnlock()
		Endif
	Next
return



Static Function SelecArq(cArqCSV)
	cArqCSV := cGetFile( "Arquivo CSV (*.csv) | *.csv", "Selecione o arquivo csv com os dados de Saldo Inicial",,'',.T., GETF_LOCALHARD+GETF_RETDIRECTORY)
return
