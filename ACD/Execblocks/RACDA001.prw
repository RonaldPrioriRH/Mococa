#include "protheus.ch"
#include "apvt100.ch"
#include "topconn.ch"
#include "RwMake.ch"

#DEFINE NEWLINE CHR(13)+CHR(10)

User function RACDA001()
	Local nQtCx 	//Quantidade de caixa
	Local nQtPorCx  //Quantidade por Caixa
	Local lContinua := .F.

	Local cNum     := PADR("000053",TAMSX3("C2_NUM")[1])
	Local cItem    := PADR("01",TAMSX3("C2_ITEM")[1])
	Local cSequen  := PADR("001",TAMSX3("C2_SEQUEN")[1])
	Local cItemGrd := PADR("",TAMSX3("C2_ITEMGRD")[1])

	Local cCodOrdemP := PADR(cNum+cItem+cSequen+cItemGrd,TAMSX3("CYY_NRORPO")[1])
	Local cCodOrdemF
	Local cEtqta:= space(TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1])+" " //+TAMSX3("C2_ITEMGRD")[1]
	local cPerg:= "RACDA001"
	Local c_PdLt := ""
	Local d_OpPai := CtoD("")
	Local c_Qry := ""
	Local c_SeqMRP := ""
	Local n_RegSC2 := 0
	Local n_QtdTnt := 0
	Local aDifs := {}
	Local c_RegOP := " "
	Local a_Regs := {}

	private cLetraMq :="A"
	private cLoteOp := ""

	Private cCodProFil
	Private cCodProPai
	Private cSilo:="01"

	Private cProdAtu:=""
	Private cLogRACD :=""
	Private lACD := .T.

	if alltrim(cModulo) <> "ACD"
		lACD := .F.
	endif

	//	if lACD
	//		VtClear()
	//		VTAlert("Não aponte, aguarde instruções","Atencao")
	//	else
	//		Alert("Não aponte, aguarde instruções")
	//	endif
	//	Return

	if lACD
		VtClear()
		nLin:=1

		@nLin,00 VtSay "Leia Etiqueta da OP:" //"Apontamento Produção"
		nLin++
		@nLin,00 VtGet cEtqta
		VtRead

		lRet:= .T.

		If VTLastkey() == 27  // Tecla ESC
			lRet := .F.
		EndIf

		if !lRet
			Return
		endif
		cEtqta := substr(cEtqta,1,len(cEtqta)-1)

		cLogRACD+="Etiqueta OP = '"+cEtqta+"'"+ chr(13)+ chr(10)
	else
		ValidPerg(cPerg)
		if !pergunte(cPerg)
			return
		endif

		cEtqta := MV_PAR01
		_cEtqPallet := MV_PAR02
	endif

	cNum:= substr(cEtqta,1,TAMSX3("C2_NUM")[1])
	cItem:= substr(cEtqta,TAMSX3("C2_NUM")[1]+1,TAMSX3("C2_ITEM")[1])
	cSequen := substr(cEtqta,TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+1,TAMSX3("C2_SEQUEN")[1])
	cItemGrd := PADR("",TAMSX3("C2_ITEMGRD")[1])//substr(cEtqta,TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1]+1,TAMSX3("C2_ITEMGRD")[1])	
	cCodOrdemP := PADR(cNum+cItem+cSequen+cItemGrd,TAMSX3("CYY_NRORPO")[1])


	DbSelectarea("SC2")
	SC2->(DbSetOrder(1))
	If SC2->(DbSeek(xFilial("SC2")+cCodOrdemP))
		cCodProPai := SC2->C2_PRODUTO
		nQtTotOp := SC2->C2_QUANT
		nQtApOp := SC2->C2_QUJE
		d_OpPai := SC2->C2_DATPRI
		c_SeqMRP := SC2->C2_SEQMRP
		c_Opcional := SC2->C2_OPC

		cLogRACD+="Produto OP = '" + cCodProPai + "'"+ chr(13)+ chr(10)

		c_Qry := "SELECT G1_COMP "
		c_Qry += "FROM SG1010, SB1010 "
		c_Qry += "WHERE SG1010.D_E_L_E_T_ = ' ' AND SB1010.D_E_L_E_T_ = ' ' "
		c_Qry += "AND G1_FILIAL = '"+ xFilial("SG1") +"' "
		c_Qry += "AND B1_FILIAL = '"+ xFilial("SB1") +"' "
		c_Qry += "AND B1_COD = G1_COMP "
		c_Qry += "AND G1_COD = '" + cCodProPai + "' "
		c_Qry += "AND B1_TIPO = 'PA' "

		PlsQuery(c_Qry, "_Q01")

		If Eof()
			if lACD
				VTAlert("Nao foi encontrado Produto tipo PA no nivel 1 da estrutura do Produto Pai","Falha")
			else
				Alert("Nao foi encontrado Produto tipo PA no nivel 1 da estrutura do Produto Pai")
			endif
			_Q01->(DbCloseArea())
			Return
		Else

			c_PdLt := _Q01->G1_COMP

			Count to n_Reg
			If n_Reg >1
				if lACD
					VTAlert("Foi encontrado mais de 1 Produto tipo PA no nivel 1 da estrutura do Produto Pai","Falha")
				else
					Alert("Foi encontrado mais de 1 Produto tipo PA no nivel 1 da estrutura do Produto Pai")
				endif
				_Q01->(DbCloseArea())
				Return
			Endif
		Endif
		_Q01->(DbCloseArea())


		//Verifica se a OP foi aberta via MRP
		If c_SeqMRP <> ' '

			//Query ajustada para buscar a Op do produto unitário com data de produção inicial mais próxima
			//a data de produção do produto Bandeja
			c_Qry := " SELECT * FROM SC2010 "
			c_Qry += " WHERE D_E_L_E_T_ = ' ' "
			c_Qry += " AND C2_FILIAL = '"+ xFilial("SC2") +"' "
			c_Qry += " AND C2_PRODUTO = '"+ c_PdLt +"' "
			//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
			c_Qry += " AND C2_DATPRI <= '"+DtoS(d_OpPai)+"' "
			c_Qry += " AND C2_SEQMRP = '"+ c_SeqMRP +"'"
			c_Qry += "  AND C2_OPC = '"+Alltrim(c_Opcional)+"' " 
			c_Qry += " ORDER BY C2_FILIAL,C2_DATPRI DESC "

			PlsQuery(c_Qry, "_Q01")

			If Eof()
				_Q01->(DbCloseArea())
			Endif
		EndIf

		//Tratativa para OPs abertas manualmente
		If !(Select("_Q01") > 0)

			if empty(c_SeqMRP)
				c_Qry := "SELECT * FROM SC2010 "
				c_Qry += "WHERE D_E_L_E_T_ = ' ' "
				c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' "
				c_Qry += "AND C2_PRODUTO = '"+ c_PdLt +"' "
				//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
				c_Qry += "AND C2_NUM = '"+ cNum +"'"

				PlsQuery(c_Qry, "_Q01")

				If !Eof()
					n_RegSC2 := _Q01->R_E_C_N_O_
				Else
					_Q01->(DbCloseArea())
					c_Qry := "SELECT * FROM SC2010 "
					c_Qry += "WHERE D_E_L_E_T_ = ' ' "
					c_Qry += "AND C2_FILIAL = '"+ xFilial("SC2") +"' "
					c_Qry += "AND C2_PRODUTO = '"+ c_PdLt +"' "
					//c_Qry += "AND C2_DATPRI = '"+ DtoS(d_OpPai) +"' "
					c_Qry += "AND C2_QUJE < C2_QUANT "

					PlsQuery(c_Qry, "_Q01")

					If ! Eof()
						Count to n_Reg
						If n_Reg = 1
							n_RegSC2 := _Q01->R_E_C_N_O_
						Else
							if lACD
								VTAlert("Não encontrado OP do Produto Unidade associado, (tratativa em desenvolvimento)","Falha")
							else
								Alert("Não encontrado OP do Produto Unidade associado, (tratativa em desenvolvimento)")
							endif
							_Q01->(DbCloseArea())
							Return
						Endif
					Else
						if lACD
							VTAlert("Não encontrado OP do Produto Unidade","Falha")
						else
							Alert("Não encontrado OP do Produto Unidade")
						endif
						_Q01->(DbCloseArea())
						Return
					Endif
				Endif
			else
				if lACD
					VTAlert("MRP:"+Alltrim(c_SeqMRP)+" - Não encontrado OP do Produto Unidade","Falha")
				else
					Alert("MRP:"+Alltrim(c_SeqMRP)+" - Não encontrado OP do Produto Unidade")
				endif
				_Q01->(DbCloseArea())
				Return
			endif
		Else
			n_RegSC2 := _Q01->R_E_C_N_O_
		Endif
		_Q01->(DbCloseArea())

		DbSelectarea("SC2")
		DbGoTo(n_RegSC2)
		//SC2->(DbOrderNickName("C2PDLT"))
		//If SC2->(DbSeek(xFilial("SC2") + c_PdLt + DtoS(d_OpPai)))
		cCodOrdemF := PADR(SC2->(C2_NUM+C2_ITEM+C2_SEQUEN+C2_ITEMGRD),TAMSX3("CYY_NRORPO")[1])
		cCodProFil := SC2->C2_PRODUTO
		cLogRACD+="Produto Filho = '"+cCodProFil+"'"+ chr(13)+ chr(10)
		dbSelectarea("SB5")
		SB5->(dbSetOrder(1))
		if SB5->(dbSeek(xFilial("SB5")+cCodProPai))
			dbselectarea("SB1")
			SB1->(DbSetOrder(1))
			if SB1->(DbSeek(xFilial("SB1")+cCodProPai))
				DbSelectarea("SG1")
				SG1->(DbSetOrder(1))
				if SG1->(DbSeek(xFilial("SG1")+cCodProPai+cCodProFil))
					nQtCx 	 := SB5->B5_QEL
					nQtCxBkp := nQtCx
					nQtPorCx := SG1->G1_QUANT / iif(SB1->B1_QB > 0,SB1->B1_QB,1)  //SB5->B5_EAN144

					cLogRACD+="Quantidade de Caixa = '" + cvaltochar(nQtCx)+"'"+ chr(13)+ chr(10)
					cLogRACD+="Quantidade do Produto Filho Por Caixa = '" + cvaltochar(nQtPorCx)+"'"+ chr(13)+ chr(10)

					if nQtCx > 0
						if nQtPorCx > 0
							while .T.
								nQtCx := nQtCxBkp
								nQtCx:= strzero(nQtCx,3)//Transform(nQtCx, "@E 999" )

								if lACD
									VtClear()
									nLin:=1
									_cEtqPallet := space(U_DecEtq() + 1) //14+TamSx3("D3_LOTECTL")[1]+5

									@nLin,00 VtSay "OP: "+cCodOrdemP //"Apontamento Produção"
									nLin++
									@nLin,00 VtSay "Quantidade: " VtGet nQtCx //Picture "@E 999"

									nLin++
									@nLin,00 VtSay "Leia Etiq Pallet: "
									nLin++
									@nLin,00 VtGet _cEtqPallet

									nLin++
									@nLin,00 VtSay "Qt. Total: " + cvaltochar(nQtTotOP)
									nLin++
									@nLin,00 VtSay "Qt. Apontada: " + cvaltochar(nQtApOp)
									nLin++
									@nLin,00 VtSay "Saldo: " + cvaltochar(nQtTotOP - nQtApOp)

									VTKeyBoard( chr(13))

									VtRead

									If VTLastkey() == 27  // Tecla ESC
										exit
									EndIf

									VtClear()
								endif
								cLogRACD+="Etiqueta Pallet = '"+_cEtqPallet+"'"+ chr(13)+ chr(10)


								//Implementado verificação de incosistência de apontamentos entre produto Acabado e 
								//produto unitário.
								//O número de apontamento de produtos acabados tem que coincidir com o número de apontamentos
								//de produtos filho.


								/*

								cLoteEtq := Substr(_cEtqPallet,9,11)
								aDfis := {}
								cQuery :=" SELECT D3_LOTECTL,COUNT(*) AS APONTAMENTOS FROM "+RetSqlName("SD3")
								cQuery += " WHERE D3_FILIAL='"+FwxFilial("SD3")+"' AND D3_COD = '"+cCodProPai+"' AND D3_LOTECTL = '"+cLoteEtq+"' AND D_E_L_E_T_=' ' AND D3_ESTORNO=' ' AND D3_CF ='PR0' "
								cQuery += " GROUP BY D3_LOTECTL "

								if Select("QCHKAPTO") > 0
								QChkAPto->(DbCloseArea())
								endif


								TcQUery cQuery new alias "QCHKAPTO"
								nQtdAptPai := QChkApto->Apontamentos 	

								While !QChkApto->(Eof())
								aadd(aDifs,{QchkAPto->D3_LOTECTL,nQtdAptPai,0})
								DbsKip()
								Enddo



								cQuery :=" SELECT D3_LOTECTL,COUNT(*) AS APONTAMENTOS FROM "+RetSqlName("SD3")
								cQuery += " WHERE D3_FILIAL='"+FwxFilial("SD3")+"' AND D3_COD = '"+c_PdLt+"' AND D3_LOTECTL = '"+cLoteEtq+"' AND D_E_L_E_T_=' ' AND D3_ESTORNO=' ' AND D3_CF ='PR0' "
								cQuery += " GROUP BY D3_LOTECTL "

								if Select("QCHKAPTO") > 0
								QChkAPto->(DbCloseArea())
								endif

								TcQUery cQuery new alias "QCHKAPTO"

								While !QChkApto->(Eof())
								nQtdAptFil := QChkApto->Apontamentos
								if (nPosApto := Ascan(aDifs,{|x|Alltrim(x[1]) == QChkApto->D3_LOTECTL }) ) > 0
								aDifs[nPosApto,3] := QChkApto->Apontamentos
								else
								aadd(aDifs,{QchkAPto->D3_LOTECTL,0,nQtdAptFil})
								endif	
								DbsKip()
								Enddo
								QChkAPto->(DbCloseArea())

								For nZ :=1 to Len(aDifs)

								if aDifs[nz,2] <> aDifs[nz,3]
								if lAcd
								VTAlert("Divergencia apontamentos !"+chr(13)+chr(10)+;
								Alltrim(cCodProPai)+": "+Alltrim(Str(aDifs[nZ,2]))+chr(13)+chr(10)+;
								Alltrim(c_PdLt)+": "+Alltrim(Str(aDifs[nZ,3])),"Falha")				
								else
								ApMsgSTop("Divergencia apontamentos !"+chr(13)+chr(10)+;
								Alltrim(cCodProPai)+": "+Alltrim(Str(aDifs[nZ,2]))+chr(13)+chr(10)+;
								Alltrim(c_PdLt)+": "+Alltrim(Str(aDifs[nZ,3])),"Falha")				
								endif		
								ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +" Divergencia apontamentos  --> "+Alltrim(cCodProPai)+": "+Alltrim(Str(aDifs[nZ,2]))+" <---> "+Alltrim(c_PdLt)+": "+Alltrim(Str(aDifs[nZ,3])) )
								return	
								endif

								Next NZ
								*/

								if VldEtq(_cEtqPallet)

									While ! LockByName("RACDA001"+cCodOrdemP,.T.,.T.)

										n_QtdTnt ++

										If n_QtdTnt > 10
											if !lACD

												if Aviso('Atenção',"10 tentativas foram feitas"+ Chr(13) + Chr(10) + "Deseja continuar?",{"Sim","Não"}) = 1
													n_QtdTnt := 1
												Else
													Return
												Endif
											Endif
										Endif

										if lACD
											VtClear()
											nLin:=1
											@nLin,00 VtSay "Aguarde inicio do Apont ("+ StrZero(n_QtdTnt,2) + ") "
											nLin++
											//@nLin,00 VtSay "Tecle ESC para sair "

											If VTLastkey() == 27  // Tecla ESC
												VtClear()
												Return
											EndIf
										Endif

										Sleep(5000)

									EndDo
									if lACD
										VtClear()
									Endif

									ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio****************************************")

									U_DecEtq(_cEtqPallet,,@cLoteOp,@cLetraMq,,.T.)

									cLogRACD+="LoteOP = '" + cLoteOP+"'"+ chr(13)+ chr(10)
									cLogRACD+="Letra Máquina = '" + cLetraMQ+"'"+ chr(13)+ chr(10)

									nQtCx:= val(nQtCx)

									nLin:=1
									cMqPai:= RetMaqPai(cLetraMq)

									cLogRACD+="Máquina Pai = '" + cMqPai+"'"+ chr(13)+ chr(10)

									if !(empty(cMqPai))
										cMqFilho:= RetMaqFil(cMqPai)
										cLogRACD+="Máquina Filho = '" + cMqFilho+"'"+ chr(13)+ chr(10)

										if !(empty(cMqFilho))
											if lACD
												@nLin,00 VtSay "Aguarde, apontando..."
											endif

											//Aponta Filho
											cProdAtu:=	cCodProFil

											//Selecionando Produtos para fazer Lock na SB2
											//											c_Qry := "SELECT D4_COD, D4_LOCAL "
											//											c_Qry += "FROM " + RetSqlName("SD4") + " "
											//											c_Qry += "WHERE D_E_L_E_T_ = ' ' "
											//											c_Qry += "AND D4_FILIAL = '"+ xFilial("SD4") +"' "
											//											c_Qry += "AND D4_OP = '"+ cCodOrdemF +"' "
											//
											//											PlSQuery(c_Qry,"_Q01")
											//
											//											a_Regs := {}
											//											While ! Eof()
											//												AADD(a_Regs,xFilial("SB2") + _Q01->(D4_COD + D4_LOCAL) )
											//												DbSelectArea("_Q01")
											//												DbSkip()
											//											EndDo
											//
											//											_Q01->(DbCloseArea())
											//
											//											c_RegOP := Posicione("SC2",1,xFilial("SC2") + cCodOrdemF, "C2_PRODUTO + C2_LOCAL")
											//
											//											AADD(a_Regs,xFilial("SB2") + c_RegOP )
											//
											//											n_QtdTnt := 1
											//
											//											While MultLock("SB2",a_Regs,1,.F.,.F.)
											//
											//												if lACD
											//													VtClear()
											//													nLin:=1
											//													@nLin,00 VtSay "Aguarde, Reservando Registros ("+ StrZero(n_QtdTnt,2) + ") "
											//													nLin++
											//
											//												Endif
											//
											//												n_QtdTnt ++
											//
											//												Sleep(3000)
											//											EndDo


											Begin Transaction
												ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio Apontamento Filho****************************************")
												lContinua:= ApontaAtuo(cCodOrdemF,"0000000001",cMqPai,nQtCx*nQtPorCx)
												ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim Apontamento Filho****************************************")

												CNRSQRP := CYV->CYV_NRSQRP
												if !lContinua
													DisarmTransaction()
												endif
												//											end transaction

												if lContinua
													//Aponta Pai
													cProdAtu:=	cCodProPai
													lOkTran := .F.

													//Selecionando Produtos para fazer Lock na SB2
													//													c_Qry := "SELECT D4_COD, D4_LOCAL "
													//													c_Qry += "FROM " + RetSqlName("SD4") + " "
													//													c_Qry += "WHERE D_E_L_E_T_ = ' ' "
													//													c_Qry += "AND D4_FILIAL = '"+ xFilial("SD4") +"' "
													//													c_Qry += "AND D4_OP = '"+ cCodOrdemP +"' "
													//
													//													PlSQuery(c_Qry,"_Q01")
													//
													//													a_Regs := {}
													//													While ! Eof()
													//														AADD(a_Regs,xFilial("SB2") + _Q01->(D4_COD + D4_LOCAL) )
													//														DbSelectArea("_Q01")
													//														DbSkip()
													//													EndDo
													//
													//													_Q01->(DbCloseArea())
													//
													//													c_RegOP := Posicione("SC2",1,xFilial("SC2") + cCodOrdemP, "C2_PRODUTO + C2_LOCAL")
													//
													//													AADD(a_Regs,xFilial("SB2") + c_RegOP )
													//
													//													n_QtdTnt := 1
													//
													//													While MultLock("SB2",a_Regs,1,.F.,.F.)
													//
													//														if lACD
													//															VtClear()
													//															nLin:=1
													//															@nLin,00 VtSay "Aguarde, Reservando Registros ("+ StrZero(n_QtdTnt,2) + ") "
													//															nLin++
													//
													//														Endif
													//
													//														n_QtdTnt ++
													//
													//														Sleep(3000)
													//													EndDo



													//												Begin Transaction
													ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Inicio Apontamento Pai****************************************")
													if ApontaAtuo(cCodOrdemP,"0000000001",cMqFilho,nQtCx)

														nQtApOp += nQtCx

														lOkTran := .T.
													else
														DisarmTransaction()
													endif
													ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim Apontamento Pai****************************************")

													if !lOkTran //Se não deu certo o apontamento do pai, Estorna o apontamento do filho
														ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cCodOrdemP +" | " +"Se não deu certo o apontamento do pai, Estorna o apontamento do filho")
														lOkTran := SFCA313E({{'CYV_NRSQRP',CNRSQRP}})

														If !lOkTran
															ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cCodOrdemP +" | " +" FALHA no Estorna o apontamento do filho")
															DisarmTransaction()
														Endif

													endif
												endif
											End Transaction
										endif
									else
										if lACD
											VTAlert("Nao encontrada maquina com a letra de referencia '"+cLetraMq+"'",AllTrim("Falha"))
										else
											Alert("Nao encontrada maquina com a letra de referencia '"+cLetraMq+"'")
										endif
									endif

									UnLockByName("RACDA001"+cCodOrdemP,.T.,.T.)

								endif

								if !lACD
									exit
								endif
								ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +")" +"Fim*******************************************")
							EndDo
						else
							if lACD
								VTAlert("Produto "+cCodProFil+" com quantidade invalida na estrutura.",AllTrim("Falha"))
							else
								Alert("Produto "+cCodProFil+" com quantidade inválida na estrutura.")
							endif

						endif
					else
						if lACD
							VTAlert("Produto "+cCodProPai+" com quantidade invalida informada no campo Qtd na Estrutura.",AllTrim("Falha"))
						else
							Alert("Produto "+cCodProPai+" com quantidade inválida informada no campo Qtd na Estrutura.")
						endif

					endif
				else
					if lACD
						VTAlert("Produto "+cCodProPai+" e complemento "+cCodProFil+"  nao encontrados na tabela SG1.",AllTrim("Falha"))
					else
						Alert("Produto "+cCodProPai+" e complemento "+cCodProFil+"  nao encontrados na tabela SG1.")
					endif

				endif
			else
				if lACD
					VTAlert("Produto "+cCodProPai+" nao encontrado na tabela SB1.",AllTrim("Falha"))
				else
					Alert("Produto "+cCodProPai+" nao encontrado na tabela SB1.")
				endif

			endif
		else
			if lACD
				VTAlert("Produto "+cCodProPai+" nao encontrado na tabela SB5.",AllTrim("Falha"))
			else
				Alert("Produto "+cCodProPai+" nao encontrado na tabela SB5.")
			endif

		endif
	else
		if lACD
			VTAlert("Ordem de Preducao "+cCodOrdemP+" nao encontrada.",AllTrim("Falha"))
		else
			Alert("Ordem de Preducao "+cCodOrdemP+" nao encontrada.")
		endif

	endif

return

Static Function ApontaAtuo(cOrdemProd,cOperacao,cMaquina,nQtdApont)
	Local aCabec := {}
	Local lRet := .T.
	local i
	Local lTemSplit := .T.
	Local cNovoSplit:=""
	Local _cSplit      := ""
	Local nI := 0

	PRIVATE lMsErroAuto := .F.
	Private lAutoErrNoFile 	:= .F.

	If lACD
		lAutoErrNoFile 	:= .T.
	Else
		lAutoErrNoFile 	:= .F.
	Endif

	//se tiver apenas uma máquina, aa função PosiSplit pode dar problema

	dbselectarea("CYY")
	CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)
	if (!CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cMaquina))) .OR. (CYY->CYY_QTAT - CYY->CYY_QTATRP < nQtdApont)
		lTemSplit := .F.
		if CYY->(dbSeek(xFilial("CYY") + cOrdemProd + cOperacao))
			While (!CYY->(EOF())) .AND. (CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT) == xFilial("CYY") + cOrdemProd + cOperacao)
				if CYY->CYY_QTAT - CYY->CYY_QTATRP >= nQtdApont
					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Dividindo Split")

					lTemSplit := SFCA315D(cOrdemProd, cOperacao, CYY->CYY_IDATQO, .F., CYY->CYY_QTAT - (nQtdApont)) // Dividir Split

					ConOut(cOrdemProd, cOperacao, CYY->CYY_IDATQO, .F., CYY->CYY_QTAT - (nQtdApont),'Retorno',lTemSplit)

					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Dividindo Split")
					if lTemSplit
						ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio PosiSplit 01")

						cNovoSplit := PosiSplit(cOrdemProd,cOperacao,space(tamsx3("CYY_CDMQ")[1]),nQtdApont)

						ConOut(cOrdemProd,cOperacao,space(tamsx3("CYY_CDMQ")[1]),nQtdApont,"Retorno",cNovoSplit)

						ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim PosiSplit 01")

						if !empty(cNovoSplit)
							ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Aloca Split")

							lTemSplit := SFCA315A(cOrdemProd, cOperacao, cNovoSplit, .F., cMaquina) //Alocar Slip

							ConOut(cOrdemProd, cOperacao, cNovoSplit, .F., cMaquina,'Retorno',lTemSplit)
							ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Aloca Split")

							//lRet := UnirSplit(cOrdemProd,cOperacao,cMaquina,cNovoSplit)  //SFCA315U

							ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio UnirSplit")
							ConOut(cOrdemProd,cOperacao,cMaquina,cNovoSplit)

							UnirSplit(cOrdemProd,cOperacao,cMaquina,cNovoSplit)  //SFCA315U

							ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim UnirSplit")
						else
							lTemSplit := .F.
						endif
					endif
					if lTemSplit
						exit
					endif

				endif
				CYY->(dBSkip())
			end

			if !lTemSplit
				if lACD
					VTAlert("Nao existe split com saldo Suficiente","Erro")
				else
					Alert("Não existe split com saldo Suficiente")
				endif
				lRet:=.F.
			endif
		else
			if lACD
				VTAlert("Nao existe Split para esta Ordem de Producao.","Erro")
			else
				Alert("Não existe Split para esta Ordem de Produção.")
			endif
			lRet:=.F.
		endif
	endif

	if lRet

		ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio PosiSplit 02")
		ConOut(cOrdemProd,cOperacao,cMaquina,nQtdApont)

		_cSplit := PosiSplit(cOrdemProd,cOperacao,cMaquina,nQtdApont)   //PosiSplit(cOrdemProd,cOperacao,cMaquina,nQtdApont+1) --> Retirado pois dava erro de Não tem Splits disponíveis

		ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim PosiSplit 02")

		if !(empty(_cSplit))
			cCDMQ := cMaquina
			cIDATQO := _cSplit
			cIDAT := cOperacao
			cNRORPO := cOrdemProd
			nQTAPRP := nQtdApont
			cCDOE := CBRETOPE()//Operador logado

			dDtIn:= Date()
			dDtFi := Date()
			aHora := RetHora(cCDMQ)
			cHrIn := aHora[1]//Time()
			cHrFi := aHora[2]//Time()
			cCeTrab      := ""

			if !A314VlOpe(cNRORPO,cIDAT)
				return .F.
			endif

			if ! A314VlSp(cNRORPO,cIDAT,cIDATQO)
				return .F.
			endif

			// Grava Inicio
			//Begin Transaction
			lFinIni      := .F.
			cCDTR:='01'
			cTPTR:= ""
			if !A314VlTr(cCDTR)
				return .F.
			endif

			if !A314VlQt()
				return .F.
			endif

			//Grava informações A314Grava
			ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio A314Grava() - Grava Apontamento na tabela CZH 01")

			lRet := A314Grava() //Grava Apontamento na tabela CZH

			ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim A314Grava() - Grava Apontamento na tabela CZH 01")

			If lRet
				//Grava informações SFC A314Auto
				ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Envia movimentações para o módulo SFC 01")

				lRet := ACDV314(cNRORPO,cIDAT,cIDATQO,cCDMQ) //Envia movimentações para o módulo SFC

				ConOut(cNRORPO,cIDAT,cIDATQO,cCDMQ,'Retorno',lRet)
				ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Envia movimentações para o módulo SFC 01")

				if lRet
					cHrIn := aHora[1]//Time()
					cHrFi := aHora[2]//Time()
					// Grava Apontamento

					lFinIni      := .F.

					cCDTR:='02'
					cTPTR:= ""
					if !A314VlTr(cCDTR)
						return .F.
					endif

					if !A314VlQt()
						return .F.
					endif

					//Grava informações A314Grava
					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio A314Grava() - Grava Apontamento na tabela CZH 02")
					lRet := A314Grava() //Grava Apontamento na tabela CZH
					ConOut('Retorno',lRet)
					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim A314Grava() - Grava Apontamento na tabela CZH 02")

					If lRet
						//Grava informações SFC A314Auto
						ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Envia movimentações para o módulo SFC 02")

						lRet := ACDV314(cNRORPO,cIDAT,cIDATQO,cCDMQ) //Envia movimentações para o módulo SFC

						ConOut(cNRORPO,cIDAT,cIDATQO,cCDMQ,'Retorno',lRet)
						ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Envia movimentações para o módulo SFC 02")
					Endif
				endif
			endif
			If !lRet
				If lACD
					aErroAuto := GetAutoGRLog()

					c_Txt := ""

					For nI := 1 To Len(aErroAuto)
						c_Txt += aErroAuto[nI] + Chr(13) + Chr(10)
					Next

					cMsgErr := "Falha execauto!" + CRLF

					ConOut("ACD - "+ cMsgErr + c_Txt)

					cMsgErr += U_NoChrEsp(c_Txt)

					VtAlert(cMsgErr,alltrim("Falha"))
				Endif
				//DisarmTransaction()
			Endif
			//End Transaction

		else
			if lACD
				VTAlert("Nao existe Slipts disponiveis.","Erro")
			else
				Alert("Nao existe Slipts disponiveis.")
			endif
			lRet:=.F.
		endif
	endif
Return lRet



//Posiciona no ultimo split da máquina
static function PosiSplit(cOrdem,cOper,cMaq,nQtdApont)
	Local aArea:=GetArea()
	Local aAreaCYY := CYY->(GetArea())
	Local cRet:= ""

	dbselectarea("CYY")
	CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)
	if CYY->(DbSeek(xFilial("CYY") + cOrdem + cOper + cMaq))
		While (!CYY->(EOF())) .AND. (CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ) == xFilial("CYY") + cOrdem + cOper + cMaq)
			if (CYY->CYY_QTAT - CYY->CYY_QTATRP >= nQtdApont)
				cRet := CYY->CYY_IDATQO
			endif
			CYY->(dBSkip())
		end
	endif

	restarea(aAreaCYY)
	restarea(aArea)
return cRet

Static function UnirSplit(cOrdemProd,cOperacao,cMaquina,cSplit1)  //SFCA315U
	Local aArea:=GetArea()
	Local aAreaCYY := CYY->(GetArea())
	Local aRetorno := {}
	Local aErro    := {}
	Local oModelCYY
	Local cNRORPO  // Ordem Split 1
	Local cNRORPO2 // Ordem Split 2
	Local cIDAT     // Operação Split 1
	Local cIDAT2   // Operação Split 2
	Local cIDATQO  // Split 1
	Local cIDATQO2 // Split 2
	Local cTPSTAT  // Estado Split 1
	Local cTPSTAT2 // Estado Split 2
	Local nQTAT    // Qtd Prevista Split 1
	Local nQTAT2   // Qtd Prevista Split 2
	Local nNovaQTD
	Local lRet     := .F.

	dbselectarea("CYY")
	CYY->(DbSetOrder(1)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_IDATQO (Ord Prod + ID Oper SFC + Split)
	if (CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cSplit1)))
		cNRORPO := CYY->CYY_NRORPO
		cIDAT   := CYY->CYY_IDAT
		cIDATQO := CYY->CYY_IDATQO
		cTPSTAT := CYY->CYY_TPSTAT
		nQTAT   := CYY->CYY_QTAT

		CYY->(DbSetOrder(7)) //CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ (Ord Prod + ID Oper SFC + Maquina)
		if (CYY->(DbSeek(xFilial("CYY") + cOrdemProd + cOperacao + cMaquina)))
			while (!(CYY->(EOF()))) .AND. CYY->(CYY_FILIAL+CYY_NRORPO+CYY_IDAT+CYY_CDMQ) == xFilial("CYY") + cOrdemProd + cOperacao + cMaquina
				if alltrim(CYY->CYY_IDATQO) <> alltrim(cIDATQO) .AND. CYY->CYY_TPSTAT <> '5'

					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio Verifica se existe apontamento de produção em aberto para split")
					// Verifica se existe apontamento de produção em aberto para split
					lRet := SFCApAbeSp(CYY->CYY_NRORPO, CYY->CYY_IDAT, CYY->CYY_IDATQO)

					ConOut(CYY->CYY_NRORPO, CYY->CYY_IDAT, CYY->CYY_IDATQO,'Retorno',lRet)
					ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim Verifica se existe apontamento de produção em aberto para split")

					IF !lRet
						Exit
					Endif

					cNRORPO2 := CYY->CYY_NRORPO
					cIDAT2   := CYY->CYY_IDAT
					cIDATQO2 := CYY->CYY_IDATQO
					cTPSTAT2 := CYY->CYY_TPSTAT
					nQTAT2   := CYY->CYY_QTAT
				endif
				CYY->(dBSkip())
			end
		Endif

		if lRet

			if lRet .AND.;
			(cTPSTAT  == '5' .OR.;
			cTPSTAT2 == '5')
				SFCMsgErro('Splits nao podem estar finalizados','SFCA315',2) //
				lRet := .F.
			Endif

			if lRet .AND.;
			cTPSTAT  == '4' .AND.;
			cTPSTAT2 == '4'
				SFCMsgErro('Somente um dos Splits pode estar iniciado','SFCA315',2) //
				lRet := .F.
			Endif

			if lRet
				//Begin Transaction

				dbSelectArea('CYY')
				CYY->(dbSetOrder(1))

				IF cTPSTAT2 == '4'
					CYY->(dbSeek(xFilial('CYY')+cNRORPO2+cIDAT2+cIDATQO2))
				Else
					CYY->(dbSeek(xFilial('CYY')+cNRORPO+cIDAT+cIDATQO))
				Endif

				dbSelectArea('CYI')
				CYI->(dbSetOrder(1))
				CYI->(dbSeek(xFilial('CYI')+CYY->CYY_CDCETR))

				nNovaQTD := CYY->CYY_QTAT + IF(cTPSTAT2=='4',nQTAT,nQTAT2)

				oModelCYY := FWLoadModel('SFCA315')
				oModelCYY:SetOperation(4)
				oModelCYY:Activate()

				ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Inicio SFCA314OPER")
				aRetorno := SFCA314OPER ( CYY->CYY_CDCETR, CYY->CYY_NRORPO, CYY->CYY_IDAT, nNovaQTD, 2, CYY->CYY_CDFE )

				ConOut(CYY->CYY_CDCETR, CYY->CYY_NRORPO, CYY->CYY_IDAT, nNovaQTD, 2, CYY->CYY_CDFE,'Retorno',aRetorno )
				ConOut(DtoC(Date()) +"-" + Time() +"("+ cUserName +") - O.P. "+ cOrdemProd +" | " +"Fim SFCA314OPER")

				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTAT'  , nNovaQTD)
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAMQ', if(CYI->CYI_TPPC == '4',0,aRetorno[1]))
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAOE', if(CYI->CYI_TPPC != '4',0,aRetorno[1]))
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTVMAT', aRetorno[2])
				oModelCYY:SetValue( 'CYYMASTER', 'CYY_QTPAAT', aRetorno[1])

				if oModelCYY:VldData()
					oModelCYY:CommitData()
				Else
					aErro := oModelCYY:GetErrorMessage()
					SFCMsgErro(aErro[6], "SFCA315")
					lRet := .F.
				Endif
				oModelCYY:DeActivate()

				if !lRet
					//DisarmTransaction()
				Endif

				IF cTPSTAT2 == '4'
					CYY->(dbSeek(xFilial('CYY')+cNRORPO+cIDAT+cIDATQO))
				Else
					CYY->(dbSeek(xFilial('CYY')+cNRORPO2+cIDAT2+cIDATQO2))
				Endif

				oModelCYY := FWLoadModel('SFCA315')
				oModelCYY:SetOperation(5)
				oModelCYY:Activate()

				if oModelCYY:VldData()

					oModelCYY:CommitData()
				Else
					aErro := oModelCYY:GetErrorMessage()
					SFCMsgErro(aErro[6], "SFCA315")
					lRet := .F.
				Endif
				oModelCYY:DeActivate()

				if !lRet
					//DisarmTransaction()
				Else
					//_MaqSFC310:= cMaquina
					//SFCA310P(.F.)
				Endif

				//End Transaction
			Endif
		Endif
	endif
	restarea(aAreaCYY)
	restarea(aArea)
return lRet
//return

Static Function A314Grava()
	Local oModelCYY
	Local aData   := A314ADtIn(cNRORPO,cIDAT,cIDATQO,cCDMQ)
	Local lRet    := .T.
	Local cTpTran := Space(1)

	If cTPTR == "2" .Or. lFinIni   //Finaliza split inicial
		dbSelectArea("CZH")
		dbSetOrder(4)
		If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1"))
			While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1" == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_STTR)
				cTpTran := A314GtTr(CZH->CZH_CDTR,2)
				If cTpTran == "1" .And. Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
					Exit
				Endif
				CZH->(DbSkip())
			End
		EndIf

		Reclock("CZH",.F.)
		CZH->CZH_DTRPED := dDtFi
		CZH->CZH_HRRPED := cHrFi
		CZH->(MsUnLock())
	Endif

	RecLock("CZH",.T.) // Cria Split de Movimentação
	CZH->CZH_FILIAL := xFilial("CZH")
	CZH->CZH_NRORPO := cNRORPO
	CZH->CZH_CDOE   := cCDOE
	CZH->CZH_IDAT   := cIDAT
	CZH->CZH_IDATQO := cIDATQO
	CZH->CZH_CDMQ   := cCDMQ
	CZH->CZH_CDTR   := cCDTR
	CZH->CZH_TPTR   := cTPTR
	CZH->CZH_STTR   := "1" //Pendente de envio ao Chão de Fábrica

	If cTPTR == "1" //Iniciar Produção
		CZH->CZH_DTRPBG := dDtIn
		CZH->CZH_HRRPBG := cHrIn
	Endif

	//Produção
	If cTPTR $ "245"
		CZH->CZH_DTRPBG    := aData[1]
		CZH->CZH_HRRPBG    := aData[2]
		If !GetMV('MV_SFCAPON') .And. cTPTR != "2" .And. !lFinIni
			CZH->CZH_DTRPED := CZH->CZH_DTRPBG
			CZH->CZH_HRRPED := SumTime(CZH->CZH_HRRPBG)
		Else
			CZH->CZH_DTRPED := dDtFi
			CZH->CZH_HRRPED := cHrFi
		Endif
		CZH->CZH_QTAPRP := nQTAPRP
	Endif

	If cTPTR $ "5"
		CZH->CZH_CDRF := cCDRF
	Endif

	CZH->(MsUnLock())
	CZH->(dbCloseArea())

	If cTPTR == "1" .And. lRet //Se transação inicial, alocar máquina para o split
		dbSelectArea("CYY")
		CYY->(dbSetOrder(1))
		CYY->(dbGoTop())
		If CYY->(dbSeek(xFilial("CYY")+cNRORPO+cIDAT+cIDATQO))
			If Empty(CYY_CDMQ)
				oModelCYY := FWLoadModel( "SFCA315" )
				oModelCYY:SetOperation( 4 )
				oModelCYY:Activate()

				oModelCYY:SetValue( "CYYMASTER", "CYY_CDMQ", cCDMQ)
				if oModelCYY:VldData()
					if !oModelCYY:CommitData()
						lRet := .F.
					endif
					oModelCYY:DeActivate()
				else
					lRet := .F.
				endif
			Endif
		Endif
	Endif

Return lRet

static function ACDV314(cOp, cOper, cSplit, cMaq)
return A314Auto(cOp, cOper, cSplit, cMaq)

Static Function A314Auto(cOp, cOper, cSplit, cMaq)
	Local nI
	Local nX
	Local oModel
	Local oModelCY0
	Local oModelCYW
	Local oModelCZ0
	Local nQtdAp := 0
	Local nQtdRf := 0
	Local nQtdRt := 0
	Local nQtdRp := 0
	Local dDtFim
	Local cHrFim
	Local aRefugo    := {}
	Local cTpTran    := Space(1)
	Local aOperador  := {}
	Local aFerrament := {}
	Local lEmpPrev   := If(SuperGetMV("MV_QTDPREV")== "S",.T.,.F.)

	If cTPTR != "2" .And. !lFinIni //Envia informações para o Chão de Fábrica
		Return .T.
	Endif

	If !IsInCallStack("SFCA310")
		Private _IsSFCA318 := .F.
	Endif

	aOperador  := A314CarOE()
	aFerrament := A314CarFR()

	//Posicionar no split para ativar o model
	DbSelectArea("CYY")
	CYY->(DbSetOrder(1))
	If CYY->(!DbSeek(xFilial("CYY")+cOp+cOper+cSplit))
		Return .F.
	Endif

	// Instancia o modelo
	oModel := FWLoadModel( "SFCA314" )
	oModel:SetOperation( 3 ) //incluir apontamento
	If !oModel:Activate()
		if lACD
			VTAlert(AllTrim("Erro")+": "+oModel:GetErrorMessage()[6], oModel:GetErrorMessage()[5])
		else
			Alert(AllTrim("Erro")+": "+oModel:GetErrorMessage()[6], oModel:GetErrorMessage()[5])
		endif
		Return .F.
	EndIf

	oModelCY0 := oModel:GetModel( "CY0DETAIL" )

	DbSelectArea("CZH")
	CZH->(DbSetOrder(4))

	If CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit+"1"))
		While CZH->(!Eof()) .And.;
		CZH->CZH_FILIAL    == xFilial("CZH")   .And. ;
		CZH->CZH_NRORPO    == cOp              .And. ;
		CZH->CZH_IDAT      == cOper            .And. ;
		CZH->CZH_IDATQO    == cSplit           .And. ;
		CZH->CZH_STTR      == "1"

			cTpTran := A314GtTr(CZH->CZH_CDTR,2)
			If cTpTran == "1" //Inicialização
				oModel:SetValue("CYVMASTER","CYV_NRORPO",CZH->CZH_NRORPO)
				oModel:SetValue("CYVMASTER","CYV_IDAT"  ,CZH->CZH_IDAT)
				oModel:SetValue("CYVMASTER","CYV_IDATQO",CZH->CZH_IDATQO)
				oModel:SetValue("CYVMASTER","CYV_CDMQ"  ,CZH->CZH_CDMQ)
				oModel:SetValue("CYVMASTER","CYV_DTRPBG",CZH->CZH_DTRPBG)
				oModel:SetValue("CYVMASTER","CYV_HRRPBG",CZH->CZH_HRRPBG)
				dDtFim := CZH->CZH_DTRPED
				cHrFim := CZH->CZH_HRRPED
				oModel:SetValue("CYVMASTER","CYV_HRRPED",CZH->CZH_HRRPED)
				oModel:SetValue("CYVMASTER","CYV_DTRPED",CZH->CZH_DTRPED)
			Endif

			If cTpTran $ "24" //Aprovada
				nQtdAp += CZH->CZH_QTAPRP
			Endif

			If cTpTran == "5" //Refugo
				nQtdRf += CZH->CZH_QTAPRP

				A314AddRe(aRefugo,1,CZH->CZH_CDRF, CZH->CZH_QTAPRP)
			Endif

			CZH->(DbSkip())
		End
	EndIf

	nQtdRp = nQtdAp + nQtdRf
	If nQtdRp <= 0
		Return .F.
	Endif

	If oModelCY0:Length() == 1
		oModelCY0:GoLine( 1 )
		oModelCY0:DeleteLine()
	Endif

	//Adiciona quantidades refugadas e retrabalhadas, e seus respectivos motivos
	For nI := 1 To Len(aRefugo)
		oModelCY0:AddLine()
		oModelCY0:SetValue("CY0_CDRF",aRefugo[nI][1])
		If aRefugo[nI][2] > 0
			oModelCY0:SetValue("CY0_QTRF",aRefugo[nI][2])
		Endif
	Next

	oModel:SetValue("CYVMASTER","CYV_QTATRP",nQtdRp)
	oModel:SetValue("CYVMASTER","CYV_QTATRF",nQtdRf)
	oModel:SetValue("CYVMASTER","CYV_QTATRT",nQtdRt)
	oModel:SetValue("CYVMASTER","CYV_QTATAP",nQtdAp)
	oModel:SetValue("CYVMASTER","CYV_HRRPED",cHrFim)
	oModel:SetValue("CYVMASTER","CYV_DTRPED",dDtFim)
	oModel:SetValue("CYVMASTER","CYV_CDLOSR", cLoteOp)

	oModelCYW := oModel:GetModel( "CYWDETAIL" )

	For nI := 1 To Len(aOperador)
		If nI > 1
			oModelCYW:AddLine()
		Else
			oModelCYW:GoLine(nI)
		Endif
		If aOperador[nI][1] == '1'
			oModelCYW:SetValue("CYW_CDOE",aOperador[nI][2])
		Else
			oModelCYW:SetValue("CYW_CDGROE",aOperador[nI][2])
		Endif
		oModelCYW:SetValue("CYW_DTBGRP",dDtIn)
		oModelCYW:SetValue("CYW_HRBGRP",cHrIn)
		oModelCYW:SetValue("CYW_DTEDRP",dDtFi)
		oModelCYW:SetValue("CYW_HREDRP",cHrFi)
	Next nI

	oModelCZ0 := oModel:GetModel( "CZ0DETAIL" )

	For nI := 1 To Len(aFerrament)
		If nI > 1
			oModelCZ0:AddLine()
		Else
			oModelCZ0:GoLine(nI)
		Endif
		oModelCZ0:SetValue("CZ0_CDFE",aFerrament[nI])
	Next nI

	oModelCZP := oModel:GetModel( "CZPDETAIL" )

	aProds:= {}
	//Seta o Lote do produto
	For nI :=1 to oModelCZP:Length()
		oModelCZP:GoLine(nI)
		cProdLote := alltrim(oModelCZP:GetValue('CZP_CDMT'))

		if alltrim(cProdLote) == alltrim(cCodProFil) // Produto unitário sendo consumido pela caixa com vários
			oModelCZP:SetValue('CZP_CDLO',cLoteOp)
		else
			DbSelectarea("SB5")
			SB5->(DbSetOrder(1))
			if SB5->(DbSeek(xFilial("SB5")+cProdLote)) .AND. SB5->B5_TIPUNIT == '0' //Produto unitário consumindo granel
				oModelCZP:SetValue('CZP_CDLO',substr(cLoteOp,1,10))
				oModelCZP:SetValue('CZP_CDDP',substr(cLoteOp,9,2))
			else
				if rastro(cProdLote,"L") //Se produto controla rastro
					aLotes := loteapt(oModelCZP:GetValue('CZP_CDMT'),oModelCZP:GetValue('CZP_QTRPPO'))
					if len(aLotes) > 0
						oModelCZP:SetValue('CZP_CDLO',aLotes[1][1])
						oModelCZP:SetValue('CZP_QTRPPO',aLotes[1][2])
						oModelCZP:SetValue('CZP_CDDP',aLotes[1][3])
						For nX := 2 to len(aLotes)
							aadd(aProds,{oModelCZP:GetValue('CZP_CDMT'),aLotes[nX][1],aLotes[nX][2],oModelCZP:GetValue('CZP_CDACPI'),oModelCZP:GetValue('CZP_CDDP')})
						next nX
					endif
				endif
			endif
		endif
	Next nI

	for nI := 1 to len(aProds)
		oModelCZP:AddLine()
		oModelCZP:GoLine(oModelCZP:Length())

		oModelCZP:SetValue('CZP_CDMT',aProds[nI][1])
		oModelCZP:SetValue('CZP_QTRPPO',aProds[nI][3])
		oModelCZP:SetValue('CZP_CDLO',aProds[nI][2])
		oModelCZP:SetValue('CZP_CDACPI',aProds[nI][4])
		oModelCZP:SetValue('CZP_CDDP',aProds[nI][5])
	next

	//Valida se todos os produtos possuem saldo suficiente
	For nI :=1 to oModelCZP:Length()
		oModelCZP:GoLine(nI)
		_cProd  := oModelCZP:GetValue('CZP_CDMT')
		_cLote  := oModelCZP:GetValue('CZP_CDLO')
		_nQtd   := oModelCZP:GetValue('CZP_QTRPPO')
		_cLocal := oModelCZP:GetValue('CZP_CDDP')

		DbSelectarea("SB1")
		SB1->(DbSetOrder(1))
		if SB1->(DbSeek(xFilial("SB1")+_cProd))

			//Verifica se o produto tem SB2 cadastrada
			DbSelectArea("SB2")
			DbSetOrder(1)
			if !DbSeek(FwxFilial("SB2")+_cProd+_cLocal)
				if lACD
					VtClear()
					VTAlert("Local de Estoque "+_cLocal+" não cadastrado para o produto "+_cProd+" !")
				else
					Alert("Local de Estoque "+_cLocal+" não cadastrado para o produto "+_cProd+" !")
				endif
				Return .F.
			endif

			DbSelectArea("SB1")

			if SB1->B1_TIPO <> 'MO' //Não validar quando é mão de obra
				_cDescPrd := alltrim(SB1->B1_DESC)
				if !empty(_cLote) //Se possuir lote, verifico o saldo/validade do lote

					DbSelectarea("SB8")
					SB8->(DbSetOrder(3))
					if SB8->(DbSeek(xFilial("SB8")+_cProd+_cLocal+_cLote))
						_lDataOk := .F.
						while (!SB8->(EOF())) .AND. SB8->(B8_FILIAL+B8_PRODUTO+B8_LOCAL+B8_LOTECTL) == xFilial("SB8")+_cProd+_cLocal+_cLote
							if SB8->B8_DTVALID >= dDataBase
								_lDataOk := .T.
								exit
							endif
							SB8->(DbSkip())
						end

						if _lDataOk
							nSaldo := SB8SALDO(,,,,"SB8",lEmpPrev,,,.T.)
							if nSaldo < _nQtd .OR. (_cProd ==cCodProPai)
								if lACD
									VtClear()
									VTAlert("Produto sem saldo no Lote."+  chr(13)+  chr(10)+"Produto: "+ alltrim(_cProd)+;
									" - " + _cDescPrd + " Lote: "+_cLote+ chr(13)+ chr(10)+;
									"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
									" Saldo: " + cvaltochar(nSaldo)+" Qtd requisitada: " + cvaltochar(_nQtd))
								else
									Alert("Produto sem saldo no Lote."+ chr(13)+ chr(10)+"Produto: "+ alltrim(_cProd)+;
									" - " + _cDescPrd + " Lote: "+_cLote+ chr(13)+ chr(10)+;
									"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
									" Saldo: "+ cvaltochar(nSaldo)+" Qtd requisitada: "+ cvaltochar(_nQtd))
								endif
								Return .F.
							endif
						else
							if lACD
								VtClear()
								VTAlert("Produto "+ alltrim(_cProd)+" - " + _cDescPrd + ;
								" com lote vencido. Lote: "+_cLote+" Armazem: "+_cLocal)
							else
								Alert("Produto "+ alltrim(_cProd)+" - " + _cDescPrd + ;
								" com lote vencido. Lote: "+_cLote+" Armazem: "+_cLocal)
							endif
							Return .F.
						endif
					else
						if lACD
							VtClear()
							VTAlert("Nao foi encontrado registro de saldo por lote para o produto "+ alltrim(_cProd)+;
							" - " + _cDescPrd + " no lote "+_cLote+ " e Armazem: "+_cLocal)
						else
							Alert("Nao foi encontrado registro de saldo por lote para o produto "+ alltrim(_cProd)+;
							" - " + _cDescPrd + " no lote "+_cLote+ " e Armazem: "+_cLocal)
						endif
						Return .F.
					endif
				else
					dbSelectArea("SB2")
					SB2->(dbSetOrder(1))
					if SB2->(DbSeek(xFilial("SB2")+_cProd+_cLocal))
						nSaldo := SaldoSB2()
						if nSaldo < _nQtd
							if lACD
								VtClear()
								VTAlert("Produto sem saldo no armazem informado."+ chr(13)+ chr(10)+;
								"Produto: "+ alltrim(_cProd)+" - " + _cDescPrd + chr(13)+ chr(10)+;
								"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
								" Saldo: "+ cvaltochar(nSaldo)+" Qtd requisitada: " + cvaltochar(_nQtd))
							else
								Alert("Produto sem saldo no armazém informado."+ chr(13)+ chr(10)+;
								"Produto: "+ alltrim(_cProd)+" - " + _cDescPrd + chr(13)+ chr(10)+;
								"Armazem: "+_cLocal+ chr(13)+ chr(10)+;
								" Saldo: "+ cvaltochar(nSaldo)+" Qtd requisitada: " + cvaltochar(_nQtd))
							endif
							Return .F.
						endif
					else
						if lACD
							VtClear()
							VTAlert("Nao foi encontrado registro de saldo para o armazem informado."+ chr(13)+ chr(10)+;
							"Produto "+ alltrim(_cProd)+	" - " + _cDescPrd +  chr(13)+ chr(10)+;
							" Armazem: "+_cLocal)
						else
							Alert("Nao foi encontrado registro de saldo para o armazem informado."+ chr(13)+ chr(10)+;
							"Produto "+ alltrim(_cProd)+	" - " + _cDescPrd +  chr(13)+ chr(10)+;
							" Armazem: "+_cLocal)
						endif
						Return .F.
					endif
				endif
			endif
		else
			if lACD
				VtClear()
				VTAlert("Produto nao encontrado."+ chr(13)+ chr(10)+;
				"Produto "+ alltrim(_cProd))
			else
				Alert("Produto nao encontrado."+ chr(13)+ chr(10)+;
				"Produto "+ alltrim(_cProd))
			endif

			Return .F.
		endif
	next

	// Valida o modelo
	If oModel:VldData()

		If !oModel:CommitData()

			aErro := oModel:GetErrorMessage()
			if lACD
				VtClear()
				VtAlert(aErro[1]+":"+;
				aErro[2]+":"+;
				aErro[3]+":"+;
				aErro[4]+":"+;
				aErro[5],;
				aErro[6]+"/"+aErro[7])
			else
				Alert(aErro[1]+":"+;
				aErro[2]+":"+;
				aErro[3]+":"+;
				aErro[4]+":"+;
				aErro[5],;
				aErro[6]+"/"+aErro[7])
			endif
			Return .F.
		EndIf
	Else

		aErro := oModel:GetErrorMessage()
		if lACD
			VtClear()
			VTAlert(AllTrim("Erro")+": "+oModel:GetErrorMessage()[6], oModel:GetErrorMessage()[5])
		else
			Alert(AllTrim("Erro")+": "+oModel:GetErrorMessage()[6], oModel:GetErrorMessage()[5])
		endif
		Return .F.
	EndIf

	//Atualiza informações de apontamento da tabela temporária CZH,
	//caso seja uma finalização de apontamento
	dbSelectArea("CZH")
	CZH->(dbSetOrder(2))

	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO))
		While CZH->(!Eof()) .And. ;
		CZH->CZH_FILIAL == xFilial("CZH") .And. ;
		CZH->CZH_NRORPO == cNRORPO .And. ;
		CZH->CZH_IDAT == cIDAT .And. ;
		CZH->CZH_IDATQO == cIDATQO

			If CZH->CZH_STTR == "1"
				RecLock("CZH",.F.)
				CZH->CZH_STTR := "2" //Enviado ao Chão de Fábrica
				CZH->(MsUnLock())
			Endif
			CZH->(DbSkip())
		End
	EndIf
Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314ADtIn
Retorna data de início para as transações de "Produção", "Refugo"
e "Pausar com apontamento"

@param   cOp    Identifica a ordem informada
cOper  Identifica a operação informada
cSplit Identifica o split informado
cMaq   Identifica a máquina informada

@return  aData   Retorna data/hora inicial

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314ADtIn(cOp, cOper, cSplit, cMaq)
	Local aData   := {"",""}
	Local cTpTran := Space(1)

	DbSelectArea("CZH")
	DbSetOrder(4)

	If CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit+"1"))
		While CZH->(!Eof()) .And. ;
		CZH->CZH_FILIAL == xFilial("CZH") .And. ;
		CZH->CZH_NRORPO == cOp .And. ;
		CZH->CZH_IDAT == cOper .And. ;
		CZH->CZH_IDATQO == cSplit .And. ;
		CZH->CZH_STTR == "1"

			cTpTran := A314GtTr(CZH->CZH_CDTR,2)
			If cTpTran == "1" //Se transação for "Iniciar Produção"
				If Empty(aData[1]) .Or.;
				(aData[1] < CZH->CZH_DTRPBG .Or. ;
				(aData[1] == CZH->CZH_DTRPBG .And. aData[2] < CZH->CZH_HRRPBG) )

					aData[1] := CZH->CZH_DTRPBG
					aData[2] := CZH->CZH_HRRPBG
				Endif
			Else
				If Empty(aData[1]) .Or.;
				(aData[1] < CZH->CZH_DTRPED .Or. ;
				(aData[1] == CZH->CZH_DTRPED .And. aData[2] < CZH->CZH_HRRPED) )

					aData[1] := CZH->CZH_DTRPED
					aData[2] := CZH->CZH_HRRPED
				Endif
			Endif

			CZH->(DbSkip())
		End
	EndIf
Return aData

//-------------------------------------------------------------------
/*/{Protheus.doc} A314GtTr
Retorna tipo de transação equivalente ao código de transação passado

@param     cCdTrans Código da transação na CBI

@return  cTpTrans  Retorna tipo de transação. Os tipos sao: 1-Inicio,
2-Pausa c/,3-Pausa s/,4-Producao,5-Perda

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314GtTr(cCdTrans,nTipo)
	Local cTpTrans := Space(1)

	dbSelectArea("CBI")
	CBI->(DbSetOrder(1))
	If ! CBI->(DbSeek(xFilial("CBI")+cCdTrans))
		Return cTpTrans
	EndIf

	If CBI->CBI_TIPO <> "3" //Pausa sem apontamento
		cTpTrans := CBI->CBI_TIPO
	Endif
	If nTipo == 1
		lFinIni := IIf(CBI->CBI_FIMINI == "1",.T.,.F.)
	Endif
Return cTpTrans

//-------------------------------------------------------------------
/*/{Protheus.doc} A314CarOE
Função para tratamento de dados necessários quando o tipo de reporte
do centro de trabalho em que o apontamento está acontecendo é por
operador ou equipe.

@param

@return  aDados   Retorna array com as informações de equipe/operador

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314CarOE()
	Local aDados    := {}
	Local cTpMod    := Space(1)
	Local nSFCOEA   := SuperGetMv("MV_SFCOEA",.F.,1)
	Private cCDOERP := Space(TamSX3("CYC_CDRC")[1])

	dbSelectArea("CYB")
	CYB->(dbSetOrder(1))
	If CYB->(dbSeek(xFilial("CYB")+cCDMQ))
		DbSelectArea("CYI")
		CYI->(DbSetOrder(1))
		If CYI->(dbSeek(xFilial("CYI")+CYB->CYB_CDCETR))
			If CYI->CYI_TPMOD == "1" //Não reporta
				Return aDados
			Endif

			dbSelectArea("CYC")
			CYC->(dbSetOrder(1))
			CYC->(dbSeek(xFilial("CYC")+cCDMQ))

			If CYI->CYI_TPMOD == "2" //Reporta por operador
				cTpMod := "1"
			Endif

			If CYI->CYI_TPMOD == "3" //Reporta por equipe
				cTpMod := "3"
			Endif

		EndIf
	EndIf

	If nSFCOEA == 1 //Primeira equipe/operador cadastrada para a máquina
		If CYC->(dbSeek(xFilial("CYC")+cCDMQ+cTpMod))
			aAdd(aDados,{cTpMod,CYC->CYC_CDRC})
		EndIf
	ElseIf nSFCOEA == 2 //Informa a equipe/operador
		//ABRE TELA PARA INFORMACAO DO OPERADOR OU EQUIPE
		If !A314MonT4(CYI->CYI_TPMOD)
			Return aDados
		Else
			If CYI->CYI_TPMOD == "2"
				aAdd(aDados,{'1',cCDOERP}) //REVER
			Else
				aAdd(aDados,{'3',cCDOERP}) //REVER
			Endif
			Return aDados
		Endif
	ElseIf nSFCOEA == 3 //Todas as esquipes/operadores cadastrados para a máquina.
		If CYC->(dbSeek(xFilial("CYC")+cCDMQ+cTpMod))
			While CYC->( !Eof() ) .And. CYC->(CYC_FILIAL+CYC_CDMQ+CYC_TPRC) == xFilial("CYC")+cCDMQ+cTpMod
				aAdd(aDados,{cTpMod,CYC->CYC_CDRC})
				CYC->(dbSkip())
			End
		EndIf
	EndIf
Return aDados

//-------------------------------------------------------------------
/*/{Protheus.doc} A314CarFR
Função para tratamento de dados necessários quando o tipo de tratamento
de tempo da operação é dependente de ferramenta.

@param

@return  aDados      Retorna array com as informações de ferramenta

@author  Lucas Konrad França
@since   21/01/2016
@version P118
/*/
//-------------------------------------------------------------------
Static Function A314CarFR()
	Local aDados   := {}
	Local nSFCFEA  := SuperGetMv("MV_SFCFEA",.F.,1)

	Private cCdFer := Space(TamSX3("CYC_CDRC")[1])

	dbSelectArea("CY9")
	CY9->(dbSetOrder(1))
	If CY9->(dbSeek(xFilial("CY9")+cNRORPO+cIDAT))
		If CY9->CY9_TPTE == "4" // Operação dependente de ferramenta.
			dbSelectArea("CYC")
			CYC->(dbSetOrder(1))
			If nSFCFEA == 1 //Primeira ferramenta cadastrada para a máquina
				If CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
					aAdd(aDados,CYC->CYC_CDRC)
				EndIf
			ElseIf nSFCFEA == 2 //Informa a ferramenta
				CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
				If !A314MonT7()
					Return aDados
				Else
					aAdd(aDados,cCdFer)
				EndIf
			ElseIf nSFCFEA == 3 //Todas as ferramentas cadastradas para a máquina
				If CYC->(dbSeek(xFilial("CYC")+cCDMQ+"2"))
					While CYC->( !Eof() ) .And. CYC->(CYC_FILIAL+CYC_CDMQ+CYC_TPRC) == xFilial("CYC")+cCDMQ+"2"
						aAdd(aDados,CYC->CYC_CDRC)
						CYC->(dbSkip())
					End
				EndIf
			EndIf
		EndIf
	EndIf

Return aDados

//-------------------------------------------------------------------
/*/{Protheus.doc} A314AddRe
Adiciona Refugo/Retrabalho no array enviado, comparando os motivos
já utilizados para agrupá-los se necessário.

@param     aDadRe Identifica o array onde o item será adicionado
cCdRf  Identifica o código do refugo/retrabalho
nQtRf  Identifica a quantidade do refugo/retrabalho

@return  aDadRe   Retorna array com a informação adicionada

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314AddRe(aDadRe, nTipo, cCdRf, nQtRf)
	Local nI     := 0
	Local lAchou := .F.

	For nI := 1 To Len(aDadRe)
		If aDadRe[nI][1] == cCdRf
			If nTipo == 1
				aDadRe[nI][2] += nQtRf
				aDadRe[nI][3] += 0
			Else
				aDadRe[nI][2] += 0
				aDadRe[nI][3] += nQtRf
			Endif
			lAchou := .T.
			Exit
		Endif
	Next

	If !lAchou
		If nTipo == 1
			aAdd(aDadRe,{cCdRf,nQtRf,0})
		Else
			aAdd(aDadRe,{cCdRf,0,nQtRf})
		Endif
	Endif
Return aDadRe

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlTr
Valida a transação informada

@param

@return  lRet   Retorna se é possível realizar a transação
informada

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlTr()
	dDtIn := Date()
	dDtFi := Date()
	cHrIn := aHora[1]//Time()
	cHrFi := aHora[2]//Time()

	cTPTR := A314GtTr(cCDTR,1)
	If Empty(cTPTR)
		if lACD
			CBAlert("Transacao da producao nao cadastrada ou invalida.","Erro",.T.,3000,2,.t.) //"Transação da produção não cadastrada ou inválida."
		else
			Alert("Transação da produção não cadastrada ou inválida.")
		endif
		Return .f.
	Endif

	If cTPTR $ "1" .And. A314VlIn()
		Return .T.
	Endif
	If cTPTR $ "245" .And. A314VlAp()
		Return .T.
	Endif
Return .F.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlSp
Retorna se split é válido para apontamento

@param   cOp    Identifica a ordem de produção informada
cOper  Identifica a operação informada
cSplit Identifica o split informado

@return  lRet   Retorna se valor informado é válido

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
static Function A314VlSp(cOp,cOper,cSplit)
	Local lRet := .T.
	Local nQt  := (1/100)

	dbSelectArea("CYY")
	CYY->(dbSetOrder(1))
	CYY->(dbGoTop())
	If CYY->(dbSeek(xFilial("CYY")+cOp+cOper+cSplit))
		//Verifica se o status está finalizado(5) ou suspenso(6)
		If CYY->CYY_TPSTAT $ "56"
			if lACD
				VTAlert("Split ja finalizado ou suspenso.", "Erro") //"Split já finalizado ou suspenso."
			else
				Alert("Split já finalizado ou suspenso.")
			endif
			lRet := .F.
		Else
			//Verifica se possui uma máquina alocada ao slit e grava o código da mesma
			cCDMQ := CYY->CYY_CDMQ
			If Empty(cCDMQ)
				lAlocado := .F.
			Else
				lAlocado := .T.
			Endif
		Endif
	Else
		if lACD
			VTAlert("Split inexistente", "Erro") //"Split inexistente"
		else
			Alert("Split inexistente")
		endif
		lRet := .F.
	Endif

	If lRet
		//Valida operador - transação já iniciada por outro operador
		DbSelectArea("CZH")
		DbSetOrder(2)
		CZH->(dbSeek(xFilial("CZH")+cOp+cOper+cSplit))
		While CZH->(!Eof()) .And. CZH->CZH_NRORPO == cOp .And.;
		CZH->CZH_IDAT == cOper .And. CZH->CZH_IDATQO == cSplit
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				//Inserido AllTrim para remover os espaços desnecessários
				If AllTrim(CZH->CZH_CDOE) != AllTrim(cCDOE)
					lRet := .F.
					if lACD
						VTAlert("Split ja iniciado por outro operador.", "Erro") //"Split já iniciado por outro operador."
					else
						Alert("Split já iniciado por outro operador.")
					endif
					Exit
				Endif
			Endif
			CZH->(DbSkip())
		End
		CZH->(DbCloseArea())
	Endif

	If lRet
		//Valida se é possível apontar algo no split informado
		If !A314VlQtR(nQt)
			lRet := .F.
		Endif
	Endif

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlQt
Valida campo quantidade reportada

@param

@return  lRet   Retorna se todos os dados foram informados
corretamente e/ou se houve cancelamento

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlQt()
	Local lRet := .T.
	Local nQtdAp := 0
	Local nQtdRf := 0
	Local nQtdRp := 0
	Local cTpTran

	//Cálculo de quantidade total reportada até o momento
	DbSelectArea("CZH")
	CZH->(DbSetOrder(4))
	CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+"1"))

	While CZH->(!Eof()) .And.;
	CZH->CZH_FILIAL  == xFilial("CZH")   .And. ;
	CZH->CZH_NRORPO  == cNRORPO          .And. ;
	CZH->CZH_IDAT    == cIDAT            .And. ;
	CZH->CZH_IDATQO  == cIDATQO          .And. ;
	CZH->CZH_STTR    == "1"

		cTpTran := A314GtTr(CZH->CZH_CDTR,2)
		If cTpTran $ "24" //Aprovada
			nQtdAp += CZH->CZH_QTAPRP
		Endif

		If cTpTran $ "5" //Refugo
			nQtdRf += CZH->CZH_QTAPRP
		Endif

		CZH->(dbSkip())
	End

	nQtdRp := nQtdAp + nQtdRf + nQTAPRP

	If !A314VlQtR(nQtdRp)
		Return .F.
	Endif

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlOpe
Retorna se a operação é válida para apontamento

@param      cOp        Identifica a ordem informada
cOper      Identifica a operação informada

@return  lRet   Retorna se valor informado é válido

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlOpe(cOp, cOper)
	Local lRet := .T.

	If Empty(cOper)
		if lACD
			VTAlert("Operacao invalida", "Erro") //"Operacao invalida"
		else
			Alert("Operacao invalida")
		endif
		Return .F.
	EndIf

	DbSelectArea("CY9")
	CY9->(dbSetOrder(1))
	If !(CY9->(dbSeek(xFilial("CY9")+cOp+cOper)))
		if lACD
			VTAlert("Operacao nao existente para a ordem informada.", "Erro") //"Operação não existente para a ordem informada."
		else
			Alert("Operação não existente para a ordem informada.")
		endif
		lRet := .F.
	Endif
	//Atribui o centro de trabalho a variavel private para ser filtrada na seleção de máquina
	cCeTrab := CY9->(CY9_CDCETR)

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlQtR
Validação da quantidade informada

@param   nQtTotal   Quantidade total reportada

@return  lRet       Retorna se motivo será enviado para consulta padrão

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlQtR(nQtTotal)
	Local lRet := .T.

	dbSelectArea("CYQ")
	CYQ->(dbSetOrder(1))
	CYQ->(dbGoTop())
	CYQ->(dbSeek(xFilial("CYQ")+cNRORPO))

	If (CYQ->CYQ_TPRPOR == "2" .OR. CYQ->CYQ_TPRPOR == "3") // Reporte por Operação ou Ponto de Controle
		// Verificar se a operação anterior é externa, pois se for, não deverá ser verificada
		dbSelectArea("CY9")
		CY9->(dbSetOrder(1))
		CY9->(dbGoTop())
		CY9->(dbSeek(xFilial("CY9")+cNRORPO+CYD->CYD_IDATPV))

		If CY9->CY9_TPAT == "1"
			nQtdMax := SFCA314QRP(cNRORPO,cIDAT,cIDATQO,0,.T.,1,Date(),Time(),.F.,1)
		Else
			nQtdMax := nQtTotal
		Endif
		Pergunte('MTA680',.F.)
		If MV_PAR07 != 3
			If nQtdMax == 0 .AND. nQtTotal > 0
				if lACD
					VtAlert("Operacao anterior ainda nao foi reportada ou quantidade desejada nao disponível para reporte na data informada. " + NEWLINE +; //"Operação anterior ainda não foi reportada ou quantidade desejada não disponível para reporte na data informada. "
					"Ordem: "+": " + cNRORPO + NEWLINE +;
					" Operacao: "+": " + cIDAT + NEWLINE +;
					" Split: "+": " + cIDATQO, "SFCA314") //"Ordem: "###" Operação: "###" Split: "
				else
					Alert("Operação anterior ainda não foi reportada ou quantidade desejada não disponível para reporte na data informada. " + NEWLINE +; //"Operação anterior ainda não foi reportada ou quantidade desejada não disponível para reporte na data informada. "
					"Ordem: "+": " + cNRORPO + NEWLINE +;
					" Operação: "+": " + cIDAT + NEWLINE +;
					" Split: "+": " + cIDATQO)
				endif
				lRet := .F.
			Else
				If nQtdMax < nQtTotal
					if lACD
						VtAlert("Quantidade maior que a quantidade da operacao anterior" + NEWLINE +; //"Quantidade maior que a quantidade da operação anterior"
						"Ordem"+": " + cNRORPO + NEWLINE +;
						"Operacao"+": " + cIDAT + NEWLINE +;
						"Split "+": " + cIDATQO + NEWLINE +;
						"Quantidade"+": " + STR(nQtdMax), "SFCA314") //"Ordem: "###" Operação: "###" Split: "
					else
						Alert("Quantidade maior que a quantidade da operação anterior" + NEWLINE +; //"Quantidade maior que a quantidade da operação anterior"
						"Ordem"+": " + cNRORPO + NEWLINE +;
						"Operação"+": " + cIDAT + NEWLINE +;
						"Split "+": " + cIDATQO + NEWLINE +;
						"Quantidade"+": " + STR(nQtdMax))
					endif
					lRet := .F.
				Endif
			EndIf
		Endif
	Endif
Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlIn
Valida a possibilidade de inicialização do apontamento do split

@param

@return    lRet   Retorna se é possível inicializar o
apontamento do split

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlIn()
	Local cTpTran
	Local cMsg := ''
	//Verifica se o apontamento do split já foi iniciado
	DbSelectArea("CZH")
	DbSetOrder(2)
	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ+"1"))
		While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ+"1" == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_CDMQ+CZH_STTR)
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				cTpTran := A314GtTr(CZH->CZH_CDTR,2)
				If cTpTran == cTPTR
					if lACD
						VTAlert("Apontamento ja iniciado", "Atencao") //"Apontamento ja iniciado" / "Atencao"
					else
						Alert("Apontamento ja iniciado")
					endif
					Return .F.
				Endif
			Endif
			CZH->(DbSkip())
		End
	EndIf
	CZH->(DbCloseArea())

	//Verifica se a máquina informada já possui um apontamento iniciado
	DbSelectArea("CZH")
	DbSetOrder(3)
	If CZH->(dbSeek(xFilial("CZH")+cCDMQ))
		While CZH->(!Eof()) .And. xFilial("CZH")+cCDMQ == CZH->(CZH_FILIAL+CZH_CDMQ)
			If Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED) .And. CZH->CZH_STTR != "2"
				cTpTran := A314GtTr(CZH->CZH_CDTR,2)
				If cTpTran == cTPTR
					cMsg := "Maquina ja possui apontamento iniciado" + ; //"Maquina ja possui apontamento iniciado"
					chr(13) +  chr(10) + ;
					"OP: " + AllTrim(CZH->CZH_NRORPO) + ; // "OP: "
					CHR(13) + CHR(10) + ;
					"Operacao " + ": " + AllTrim(CZH->CZH_IDAT) // "Operação: "
					if lACD
						VTAlert(cMsg, "Atencao")
					else
						Alert(cMsg)
					endif
					Return .F.
				Endif
			Endif
			CZH->(DbSkip())
		End
	EndIf
	CZH->(DbCloseArea())

Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} A314VlAp
Valida a possibilidade de apontamento do split

@param

@return  lRet   Retorna se é possível fazer o
apontamento do split

@author  Monique Madeira Pereira
@since   01/09/2013
@version P12
/*/
//-------------------------------------------------------------------
Static Function A314VlAp()
	Local lRet := .F.
	Local cTpTran := Space(1)

	//Verifica se o apontamento do split já foi iniciado
	DbSelectArea("CZH")
	DbSetOrder(2)
	If CZH->(dbSeek(xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ))
		While CZH->(!Eof()) .And. xFilial("CZH")+cNRORPO+cIDAT+cIDATQO+cCDMQ == CZH->(CZH_FILIAL+CZH_NRORPO+CZH_IDAT+CZH_IDATQO+CZH_CDMQ)
			cTpTran := A314GtTr(CZH->CZH_CDTR,2)
			If cTpTran == "1" .And. Empty(CZH->CZH_DTRPED) .And. Empty(CZH->CZH_HRRPED)
				lRet    := .T.
				dDtIn   := CZH->CZH_DTRPBG
				cHrIn   := CZH->CZH_HRRPBG
				Exit
			Endif
			CZH->(DbSkip())
		End
	EndIf

	If !lRet
		if lACD
			VTAlert("Atencao", "Atencao")
		else
			Alert("Atencao")
		endif
		Return lRet
	Endif
Return lRet

static function RetHora(cMaq)
	Local aHora:= {'00:01:00','00:02:00'}
	Local cQuery := ''
	Local nHora
	Local cHora

	cQuery:="select COALESCE(MAX(CZH_HRRPED),'00:01:00') HORA from "+RetSqlName("CZH")+" CZH where CZH_FILIAL = '"+xFilial("CZH")+"' and CZH_CDMQ='"+cMaq+"' and CZH_DTRPBG='"+DTOS(date())+"' and CZH.D_E_L_E_T_= ' ' "

	if Select("QCZH")>0
		QCZH->(dbCloseArea())
	endif

	TcQUery cQUery new alias "QCZH"

	if !QCZH->(EOF())
		nHora := SomaHoras(QCZH->HORA,'00:01:00')
		cHora:= strzero(int(nHora),2)+":"+strzero((nHora-int(nhora))*100,2)+":00"
		aHora:={QCZH->HORA,cHora}
	endif
	QCZH->(dbCloseArea())

return aHora

//Retorna o Lote que será utilizado no apontamento.
static function loteapt(cProdSld,nQtd)
	Local aArea:= GetARea()
	Local aRet := {}
	Local cQry := ""
	Local nSaldo := 0
	Local lEmpPrev   := If(SuperGetMV("MV_QTDPREV")== "S",.T.,.F.)

	cQuery:="SELECT B8_LOTECTL, SB8.R_E_C_N_O_ RECSB8,B8_LOCAL from "+RetSqlName("SB8")+" SB8 "
	cQuery+="where B8_FILIAL = '"+xFilial("SB8")+"' AND B8_PRODUTO = '"+cProdSld+"' and SB8.D_E_L_E_T_=' ' and B8_LOTECTL<> ' ' "
	//cQuery+="AND B8_LOCAL = '"+cSilo+"' "
	cQuery += " AND B8_DTVALID >= "+DTOS(dDataBase)+""
	cQuery+="ORDER BY substr(B8_LOTECTL,1,8),B8_DATA desc "

	if select("QSB8") >0
		QSB8->(DbCLoseArea())
	endif

	TcQuery cQuery new alias "QSB8"

	While !QSB8->(EOF())
		dbselectarea("SB8")
		SB8->(DbGoto(QSB8->RECSB8))
		nSaldo := SB8SALDO(,,,,"SB8",lEmpPrev,,,.T.)

		if nSaldo > 0
			if nSaldo >= nQtd
				aadd(aRet,{QSB8->B8_LOTECTL,nQtd,QSB8->B8_LOCAL})
				exit
			else
				aadd(aRet,{QSB8->B8_LOTECTL,nSaldo,QSB8->B8_LOCAL})
			endif
		endif

		QSB8->(DbSkip())
	end

	QSB8->(DbCLoseArea())

	RestArea(aArea)
return aRet



static Function SFCXTEMPOS (cCDTN, cNRTN, nOper, cMaq, dIni, dFim, cHoraIni, cHoraFim, lCalc, cProgram )
	Local dData
	Local cHoraIniCalc := '00:00:00'
	Local aArea        := GetArea()
	Local aAreaCYI     := CYI->( GetArea() )
	Local aAreaCYB     := CYB->( GetArea() )
	Local aAreaCYZ     := CYZ->( GetArea() )
	Local nDia		   := 0
	Local nSegUtil     := 0
	Local nSegExtra    := 0
	Local nHoraAnt     := 0
	Local aRetorno     := {}
	Local a2Retorno    := {}
	Local cQuery       := ''
	Local lOk		   := .T.
	Local nRecNumb     := 0
	Local cTmp
	Local cHora
	Local cCDCL		   := ''
	Local dIniVal      := CTOD('01/01/2000')
	Local dFimVal      := CTOD('01/01/2100')

	cCDCL := SFCCalendario(cMaq)

	if nOper == 3 .OR.;
	(nOper == 4 .AND. Empty(cCDTN))

		aRetorno := SFCA314GTU(,,cMaq,dIni)
		cCDTN    := aRetorno[1]
		dIniVal  := aRetorno[2]
		dFimVal  := aRetorno[3]

		IF Empty(cCDTN)
			if IsInCallStack( 'SFCA314PRE' ) .OR. IsInCallStack( 'SFCA311CalculaTempos' ) .OR. IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317CMM' )
				SFCMsgErro('Nao encontrado Modelo Turno para a Maquina informada',cProgram,if(IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317' ),1,2)) //'Não encontrado Modelo Turno para a Máquina informada'
			Endif
			lOk := .F.
		Endif
	Endif

	if dIni > dFim .OR.;
	(dIni == dFim .AND. cHoraIni >= cHoraFim)

		Return {cCDTN,'00000',0,0,lOk}
	Endif

	if lOk
		for dData := dIni to dFim

			dbSelectArea('CYR')
			CYR->(dbSetOrder(2))
			CYR->(dbGoTop())
			IF CYR->(DbSeek(xFilial('CYR')+cCDTN+ alltrIM(STR(DOW(dData)))))
				cHoraIniCalc := CYR->CYR_HRBG
				cNRTN		 := CYR->CYR_NRTN
				nRecNumb     := CYR->(RecNo())
			Endif

			While CYR->(!EOF()) .AND. CYR->CYR_CDTN == cCDTN .AND. CYR->CYR_NRDYWK == ALLTRIM(STR(DOW(dData)))
				IF CYR->CYR_TPTE == '1' .AND. cHoraIni >= cHoraIniCalc .AND.;
				CYR->CYR_HRBG <= cHoraIni .AND. CYR->CYR_HRED >= cHoraIni

					cNRTN        := CYR->CYR_NRTN
					cHoraIniCalc := CYR->CYR_HRBG
					nRecNumb     := CYR->(RecNo())
				Endif

				CYR->(dbSkip())
			End

			if !Empty(cNRTN)
				dbSelectArea('CYR')
				CYR->(dbSetOrder(2))
				CYR->(dbGoTop())
				IF CYR->(DbSeek(xFilial('CYR')+cCDTN+ alltrIM(STR(DOW(dData)))+cHoraIniCalc))
					nRecNumb := CYR->(Recno())
				Endif

				Exit
			Endif
		Next

		IF Empty(cNRTN) .OR. nRecNumb == 0
			if IsInCallStack( 'SFCA310' ) .OR. IsInCallStack( 'SFCA311CalculaTempos' ) .OR. IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317CMM' )
				SFCMsgErro('Nao encontrado Turno para a Maquina informada',cProgram,if(IsInCallStack( 'SFCA311POS' ) .OR. IsInCallStack( 'SFCA317' ) .OR. IsInCallStack( 'SFCA320' ),1,2)) //'Não encontrado Turno para a Máquina informada'
			Endif
			lOk   := .F.
		Endif

		if nRecNumb != 0 .AND. lOk
			cQuery := ""
			cQuery += "SELECT * FROM " + RetSQLName( 'CYR' ) + " CYR WHERE "
			cQuery += "		R_E_C_N_O_ = " + STR(nRecNumb)

			cTmp := GetNextAlias()

			dbUseArea( .T., 'TOPCONN', TcGenQry(,,cQuery), cTmp, .T., .F. )
		Endif
	Endif

	if lOk

		// Somente calculo hora útil e extra quando a data final for determinada
		if dFim <> CTOD('31/12/9999')

			nDia := DOW(dIni) // Dia da semana

			if cHoraIni < (cTmp)->CYR_HRBG
				if dIni == dFim
					IF cHoraFim < (cTmp)->CYR_HRBG
						nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,cHoraFim))
						cHora     := cHoraFim

						Return {cCDTN,'00000',0,nSegExtra,lOk}
					Else
						nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,(cTmp)->CYR_HRBG))
						cHora     := (cTmp)->CYR_HRBG // Atualiza hora referência com valor que deve-se iniciar os cálculos
					Endif
				Else
					nSegExtra := SFCXHourToSeg(ELAPTIME(cHoraIni,(cTmp)->CYR_HRBG))
					cHora     := (cTmp)->CYR_HRBG
				Endif
			Else
				cHora := cHoraIni
			Endif

			(cTmp)->(dbCloseArea())

			for dData := dData to dFim // Vai dia a dia calcular o tempo util e extra

				if dFimVal < dData
					if dData != dFim
						nSegExtra += 86400
					Else
						nSegExtra += SFCXHourToSeg(cHoraFim)
					Endif
				Else

					// verifica se o dia é útil no calendário
					CYZ->(dbSetOrder(1))
					CYZ->(dbGoTop())
					IF CYZ->(DbSeek(xFilial('CYZ')+cCDCL+DTOS(dData))) .AND. CYZ->CYZ_TPDY == '1'

						// Busca todos os turnos úteis para o dia da semana
						cQuery := ""
						cQuery += "SELECT * FROM " + RetSQLName( 'CYR' ) + " CYR WHERE "
						cQuery += "		CYR_FILIAL = '" + xFilial('CYR') + "' AND "
						cQuery += "		CYR_CDTN   = '" + cCDTN + "' AND "
						cQuery += "		CYR_NRDYWK = '" + ALLTRIM(STR(nDia)) + "' AND "
						cQuery += "		CYR_TPTE   = '1' AND "
						cQuery += "     D_E_L_E_T_ = ' ' ORDER BY CYR_HRBG"

						cTmp := GetNextAlias()

						dbUseArea( .T., 'TOPCONN', TcGenQry(,,cQuery), cTmp, .T., .F. )

						While (cTmp)->(!EOF())

							// Se a chegar na data de término, deverá ficar de olho nos horários
							if dData == dFim
								IF cHora == '00:00:00' .AND. (cTmp)->CYR_HRBG > cHora
									if cHoraFim <= (cTmp)->CYR_HRBG
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
										nSegExtra += nHoraAnt
										nHoraAnt  := 0
										cHora := cHoraFim

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif

										Exit
									Else
										if lCalc // e aqui? same
											nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
										Endif
										cHora := (cTmp)->CYR_HRBG

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif
								Endif

								if (cTmp)->CYR_HRED >= cHoraFim
									if (cTmp)->CYR_HRBG >= cHoraFim
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
										cHora     := cHoraFim
									Else
										if cHora < (cTmp)->CYR_HRBG
											IF lCalc
												nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
											Endif
											cHora := (cTmp)->CYR_HRBG
										Endif

										aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,cHoraFim,nSegUtil,nSegExtra)

										nSegUtil  := aRetorno[1]
										nSegExtra := aRetorno[2]
										cHora     := (cTmp)->CYR_HRED

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif

									Exit
								Else
									if cHora < (cTmp)->CYR_HRED
										if cHora < (cTmp)->CYR_HRBG
											IF lCalc
												nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
											Endif

											cHora := (cTmp)->CYR_HRBG
										Endif

										aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,(cTmp)->CYR_HRED,nSegUtil,nSegExtra)
										nSegUtil  := aRetorno[1]
										nSegExtra := aRetorno[2]
										cHora     := (cTmp)->CYR_HRED

										IF cNRTN != (cTmp)->CYR_NRTN
											cNRTN := '00000'
										Endif
									Endif
								Endif
							Else
								// Tratamento para primeiro turno encontrado para o dia
								// Se o turno começar depois de 00:00:00
								// deve considerar esse tempo como extra
								if cHora == '00:00:00' .AND. (cTmp)->CYR_HRBG > cHora
									if lCalc
										nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,(cTmp)->CYR_HRBG))
									Endif

									cHora := (cTmp)->CYR_HRBG
								Endif

								if cHora < (cTmp)->CYR_HRED
									if cHora < (cTmp)->CYR_HRBG
										cHora := (cTmp)->CYR_HRBG
									Endif

									aRetorno  := SFCA311VTP(cCDTN,ALLTRIM(STR(DOW(dData))),cHora,(cTmp)->CYR_HRED,nSegUtil,nSegExtra)

									nSegUtil  := aRetorno[1]
									nSegExtra := aRetorno[2]
									cHora     := (cTmp)->CYR_HRED

									IF cNRTN != (cTmp)->CYR_NRTN
										cNRTN := '00000'
									Endif
								Endif
							Endif

							(cTmp)->(dbSkip())
						End

						(cTmp)->(dbCloseArea())
					Endif

					// Caso no último dia tenham acabado os turnos e ainda falte chegar até o fim, conta como extra
					if dData == dFim
						if cHora < cHoraFim
							nSegExtra += SFCXHourToSeg(ELAPTIME(cHora,cHoraFim))
						Endif

						Exit
					Else
						nHoraAnt := SFCXHourToSeg(ELAPTIME(cHora,'24:00:00'))
						cHora := '00:00:00'
					Endif

					// Troca o dia da Semana
					nDia := DOW(dData) + 1

					// Se 8, quer dizer que começou a semana de novo
					if nDia == 8
						nDia := 1
					Endif
				Endif
			next

			RestArea( aAreaCYZ )
		Endif
	Endif

	RestArea(aArea)
	RestArea(aAreaCYI)
	RestArea(aAreaCYB)

	nSegUtil := ROUND(nSegUtil,0)
	nSegExtra := ROUND(nSegExtra,0)

	AADD(a2Retorno,cCDTN)
	AADD(a2Retorno,cNRTN)
	AADD(a2Retorno,nSegUtil)
	AADD(a2Retorno,nSegExtra)
	AADD(a2Retorno,lOk)

Return a2Retorno

//Retorna a maquina de acordo com o centro de trabalho e a Letra inforamda na etiqeuta
static function RetMaqPai(cLetra)
	Local cRet := ""
	Local cCentro:= PADR(cCentro,TAMSX3("CYB_CDCETR")[1])

	DbSelectarea("CYB")
	CYB->(DbSetOrder(1))
	if CYB->(DbSeek(xFilial("CYB")))
		while (!CYB->(EOF())) .AND. CYB->CYB_FILIAL == xFilial("CYB")
			if alltrim(CYB->CYB_X_LTMQ) == alltrim(cLetra)
				cRet:= CYB->CYB_CDMQ
				exit
			endif
			CYB->(DbSkip())
		end
	endif
return cRet

static function RetMaqFil(cMaqPai)
	Local cRet := ""

	DbSelectarea("CYB")
	CYB->(DbSetOrder(1))
	if CYB->(DbSeek(xFilial("CYB")+cMaqPai))
		DbSelectarea("CYI")
		CYI->(DbSetOrder(1))
		if CYI->(DbSeek(xFilial("CYI")+CYB->CYB_CDCETR))
			if !(empty(CYI->CYI_X_CTEN))
				DbSelectarea("CYB")
				CYB->(DbSetOrder(2))
				if CYB->(DbSeek(xFilial("CYB")+CYI->CYI_X_CTEN))
					cRet := CYB->CYB_CDMQ
				else
					if lACD
						VTAlert("Nao encontrada maquina com este centro de trabalho: '"+CYI->CYI_CDCETR+"'",AllTrim("Falha"))
					else
						Alert("Nao encontrada maquina com este centro de trabalho: '"+CYI->CYI_CDCETR+"'")
					endif
				endif
			else
				if lACD
					VTAlert("Centro de trabalho da maquina encaixotadora nao informado na maquina "+cMaqPai,AllTrim("Falha"))
				else
					Alert("Centro de trabalho da maquina encaixotadora nao informado na maquina "+cMaqPai)
				endif
			endif
		else
			if lACD
				VTAlert("Nao encontrado centro de trabalho com este codigo: '"+CYB->CYB_CDCETR+"'",AllTrim("Falha"))
			else
				Alert("Nao encontrado centro de trabalho com este codigo: '"+CYB->CYB_CDCETR+"'")
			endif
		endif
	else
		if lACD
			VTAlert("Nao encontrada maquina com este codigo: '"+cLetraMq+"'",AllTrim("Falha"))
		else
			Alert("Nao encontrada maquina com este codigo: '"+cLetraMq+"'")
		endif
	endif
return cRet

Static Function VldEtq(cEtq)
	Local lRet:= .T.
	Local cQuery := ""
	Local n_Plt := 0
	Local n_OP := 0
	Local cFinal:= " "

	if len( Alltrim(cEtq) ) == 23 //14+TamSx3("D3_LOTECTL")[1]+4

		cQuery+="select COUNT(*) QTD from "+RetSqlname("SD3")+" SD3 where "
		cQuery+="D3_FILIAL = '"+xFilial("SD3")+"' AND ltrim(rtrim(D3_X_ETQ)) = '" + alltrim(cEtq)+"' AND D3_ESTORNO <> 'S' and SD3.D_E_L_E_T_= ' ' "

		if select("QSD3E") > 0
			QSD3E->(DbCloseArea())
		endif

		TcQuery cQuery New Alias "QSD3E"

		if QSD3E->QTD > 0
			lRet:= .F.
			if lACD
				VtClear()
				VTAlert("Etiqueta "+cEtq+" ja apontada.",AllTrim("Erro"))
			else
				Alert("Etiqueta "+cEtq+" ja apontada.")
			endif
		endif

		QSD3E->(DbCloseArea())

		If lRet

			n_Plt := Val(SubStr(Alltrim(cEtq),Len(Alltrim(cEtq))-3,4)) -1

			If n_Plt > 0

				//cEtq := SubStr(Alltrim(cEtq),1,Len(Alltrim(cEtq))-5) + StrZero(n_Plt,4)
				cEtq := SubStr(Alltrim(cEtq),1,Len(Alltrim(cEtq))-4) + StrZero(n_Plt,4)

				//Valida a Etiqueta Anterior
				cQuery := "SELECT COUNT(*) QTD "
				cQuery += "FROM "+RetSqlname("SD3")+" SD3 "
				cQuery += "WHERE SD3.D_E_L_E_T_= ' ' "
				cQuery += "AND D3_FILIAL = '"+xFilial("SD3")+"' "
				cQuery += "AND D3_X_ETQ = '" + alltrim(cEtq)+"' "
				cQuery += "AND D3_ESTORNO <> 'S' "

				if select("QSD3E") > 0
					QSD3E->(DbCloseArea())
				endif

				TcQuery cQuery New Alias "QSD3E"

				if QSD3E->QTD = 0

					if lACD

						VtClear()
						nLin:= 1
						cFinal:= " "
						@nLin,00 VtSay "Etiqueta Anterior não apontada."
						nLin++
						@nLin,00 VtSay cEtq
						nLin++
						@nLin,00 VtSay "Continuar ? (S/N)"
						nLin++

						@nLin,00 VtGet cFinal
						VtRead

						If VTLastkey() == 27  // Tecla ESC
							VtClear()
							Return .F.
						EndIf

						cFinal := upper(cFinal)

						if cFinal == "S"
							lRet:= .T.
						Else
							lRet:= .F.
						Endif
						VtClear()
					else
						n_OP := Aviso("Atenção","Etiqueta Anterior "+cEtq+" não apontada. Continuar?",{"Sim","Nao"})

						If n_OP = 1
							lRet:= .T.
						Else
							lRet:= .F.
						Endif
					endif
				endif
				QSD3E->(DbCloseArea())
			Endif

		Endif
	else
		lRet:= .F.
		if lACD
			VtClear()
			VTAlert("Etiqueta " + alltrim(cEtq) + " invalida. Tam "+Str(len(Alltrim(cEtq))),AllTrim("Erro"))
		else
			Alert("Etiqueta " + alltrim(cEtq) + " invalida. Tam "+Str(len(Alltrim(cEtq))))
		endif
	endif
return lRet



Static Function ValidPerg(cPerg)
	Local aRegs := {}
	Local i,j

	dbSelectArea("SX1")
	dbSetOrder(1)
	cPerg := PADR(cPerg,10)

	aAdd(aRegs,{cPerg,"01","OP: ","","","mv_ch1" ,"C", TAMSX3("C2_NUM")[1]+TAMSX3("C2_ITEM")[1]+TAMSX3("C2_SEQUEN")[1],0,0,"C","","mv_par01"  ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
	aAdd(aRegs,{cPerg,"02","Palete: ","","","mv_ch2" ,"C", U_DecEtq(),0,0,"C","","mv_par02"  ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})

	For i:=1 to Len(aRegs)
		If !dbSeek(cPerg+aRegs[i,2])
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

static Function SFCA313E(xRotAuto)
	Local oDlg, oCombo
	Local lRet         := .T.
	Local dDataEstorno := DATE()
	Local cNRORPO  := ''
	Local cIDAT    := ''
	Local cIDATQO  := ''
	Local aArea    := GetArea()
	Local aAreaCYV := CYV->(GetArea())
	Local lAutoExe := xRotAuto != nil

	if Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'}) == 0

		AutoGRLog('É preciso informar a sequencia do apontamento para realizar o estorno. Campos CYV_NRSQRP') //

		if lACD
			VTAlert('É preciso informar a sequencia do apontamento para realizar o estorno. Campos CYV_NRSQRP',AllTrim("Falha"))
		else
			Alert('É preciso informar a sequencia do apontamento para realizar o estorno. Campos CYV_NRSQRP')
		endif
		lMsErroAuto := .T.

		lRet := .F.
	Else
		cNRSQRP := PadR(xRotAuto[Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'})][2],TamSX3('CYV_NRSQRP')[1])

		if Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_DTEO'}) > 0
			dDataEstorno := xRotAuto[Ascan(xRotAuto,{|x|Alltrim(x[1]) == 'CYV_NRSQRP'})][2]
		Endif

		dbSelectArea('CYV')
		CYV->(dbSetOrder(1))
		CYV->(dbSeek(xFilial('CYV')+cNRSQRP))
	Endif

	if CYV->CYV_TPSTRP == '1'

		if lACD
			VTAlert('Somente apontamentos finalizados podem ser estornados',AllTrim("Falha"))
		else
			Alert('Somente apontamentos finalizados podem ser estornados')
		endif
		lRet := .F.
	Endif

	if CYV->CYV_LGRPEO

		if lACD
			VTAlert('Apontamento de Produção já foi estornado no dia ' + DTOC(CYV->CYV_DTEO),AllTrim("Falha"))
		else
			Alert('Apontamento de Produção já foi estornado no dia ' + DTOC(CYV->CYV_DTEO))
		endif
		lRet := .F.
	Endif

	dbSelectArea('CYY')
	CYY->(dbSetOrder(1))
	CYY->(dbSeek(CYV->CYV_FILIAL+CYV->CYV_NRORPO+CYV->CYV_IDAT+CYV->CYV_IDATQO))

	if lRet

		cNRORPO := CYV->CYV_NRORPO
		cIDAT   := CYV->CYV_IDAT
		cIDATQO := CYV->CYV_IDATQO
		cNRSQRP := CYV->CYV_NRSQRP
		nQTATRP := CYV->CYV_QTATRP
		nQTATRF := CYV->CYV_QTATRF

		lRet := SFCA313OK(CYV->CYV_NRSQRP,dDataEstorno,,.T.)
	Endif

	RestArea(aArea)
	RestArea(aAreaCYV)

Return lRet

static Function SFCA313OK(cNRSQRP, dEstorno, lAlteraEst, lRotAut)
	Local lRet := .T.
	Local oModelCYV
	Local cNRORPO   := ''
	Local cIDAT     := ''
	Local oView     := FwViewActive()
	Private lOk     := .T. // Sinaliza se respondeu sim para reabrir operação e splits

	//Begin Transaction

	oModelCYV := FWLoadModel( 'SFCA313' )
	oModelCYV:SetOperation( 4 )

	dbSelectArea('CYV')
	CYV->(dbSetOrder(1))
	CYV->(dbGoTop())
	CYV->(dbSeek(xFilial('CYV')+cNRSQRP))

	cNRORPO := CYV->CYV_NRORPO
	cIDAT   := CYV->CYV_IDAT

	oModelCYV:Activate()

	oModelCYV:SetValue('CYVMASTER','CYV_DTEO'  , dEstorno)
	oModelCYV:SetValue('CYVMASTER','CYV_LGRPEO', .T.)
	oModelCYV:SetValue('CYVMASTER','CYV_CDUSOE', RetCodUsr())

	if oModelCYV:VldData()
		oModelCYV:CommitData()
	Else
		aErro := oModelCYV:GetErrorMessage()
		SFCMsgErro(aErro[6], "SFCA313")
		lRet := .F.
	Endif
	oModelCYV:DeActivate()

	CYV->(dbCloseArea())

	if !lRet
		//DisarmTransaction()

		IF oView != NIL
			oView:Refresh()
		Endif
	Endif

	//End Transaction

Return lRet

User Function VerDtFl(l_Fbrc)

	If dDataBase <> Date()
		VtClear()

		VTAlert("A data de login do coletor nao e a data de hoje" + NEWLINE +;
		"Data Coletor: " + DtoC(dDataBase) + NEWLINE +;
		"Data de Hoje: " + DtoC(Date()) + NEWLINE +;
		"Saia e entre novamente no sistema!","Falha")

		Return .F.
	Endif

	if l_Fbrc

		If ! (cFilAnt $ "0102;0103")
			VtClear()

			VTAlert("Rotina permitida somente para as Filiais: " + NEWLINE +;
			"0102 - Fabrica Mococa " + NEWLINE +;
			"0103 - Fabrica Cerqueira " + NEWLINE +;
			"Coletor esta logado em: " + NEWLINE +;
			cFilAnt + " - " + AllTrim(SM0->M0_FILIAL) + NEWLINE +;
			"Saia e entre novamente no sistema!","Falha")

			Return .F.
		Endif
	Endif

Return .T.