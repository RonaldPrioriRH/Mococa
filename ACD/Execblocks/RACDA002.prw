#Include 'Protheus.ch'
#Include 'Topconn.ch'
#include "apvt100.ch"
//Separação MOCOCA

User Function RACDA002()
	Local nLin:=1
	Local cEndereco
	Local cArmazem
	Local cEtq



	while .T.
		If ! U_VerDtFl(.F.)
			Return
		Endif

		cEndereco := space(TamSx3("Z0A_ENDERE")[1] + 1)
		cArmazem := space(TamSx3("Z0A_LOCAL")[1])
		cEtq	 := Space(U_DecEtq() + 1)//space(tamsx3("Z0A_PRODUT")[1] + tamsx3("Z0A_LOTE")[1] + tamsx3("Z0A_PALLET")[1] + 1)
		
//		cEndereco	:= 'A PR.01 AN.01'
//		cArmazem	:= '09'
//		cEtq		:= '100300261801500209C0002'
		
		VtClear()
		nLin:=1
		@nLin,00 VtSay "Separacao "
		nLin++
		nLin++
		@nLin,00 VtSay "Armazem: "
		@nLin,10 VtGet cArmazem
		nLin++
		@nLin,00 VtSay "Endereco: "
		@nLin,10 VtGet cEndereco
		nLin++
		@nLin,00 VtSay "Etiqueta: "
		@nLin,10 VtGet cEtq
		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			return
		EndIf

		GravaZ0A(cEndereco,cArmazem,cEtq)
	end
return


Static function GravaZ0A(cEndereco,cArmazem,cEtq)
	Local cEstorna:= " "
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := ""
	Local n_EstLoc := 0 
	Local c_Txt := "" 
	Local n_Qtd := 0

	cEndereco := PadR(cEndereco,TamSX3("BF_LOCALIZ")[1])
	cArmazem := PadR(cArmazem,TamSX3("BF_LOCAL")[1])

	U_DecEtq(cEtq, @c_Prd, @c_Lt, ,@c_Plt)

	if c_Prd = " "
		VtClear()
		VTAlert("Etiqueta nao Encontrada!!!."+ Chr(13) + Chr(10) + cEtq ,"Falha")
		Return
	Endif

	if ! U_VerZ0D(cEtq)
		VtClear()
		VTAlert("Etiqueta Bloqueada pela Qualidade!!!."+ Chr(13) + Chr(10) + cEtq ,"Falha")
		Return
	Endif

	dbselectarea("Z0A")
	Z0A->(DbSetOrder(1)) //Z0A_FILIAL, Z0A_PRODUT, Z0A_LOTE, Z0A_PALLET

	if (!Z0A->(DbSeek(xFilial("Z0A") + c_Prd + c_Lt + c_Plt)))


		n_EstLoc := CalcEstL(c_Prd, cArmazem, dDataBase + 1, c_Lt, , cEndereco)[1]

		c_Txt := "Prod.=" + Alltrim(c_Prd) + Chr(13) + Chr(10) 
		c_Txt += "Lote =" + Alltrim(c_Lt) + Chr(13) + Chr(10)
		c_Txt += "Armaz=" + Alltrim(cArmazem) + Chr(13) + Chr(10)
		c_Txt += "Ender=" + Alltrim(cEndereco) + Chr(13) + Chr(10)
		c_Txt += "Qtd no Estoque-> " + Alltrim(Str(n_EstLoc)) + Chr(13) + Chr(10)

		//Etiquetas Separadas
		c_Qry := "SELECT SUM(Z0A_QTD) AS QTD "
		c_Qry += "FROM " + RetSqlName("Z0A") +" "
		c_Qry += "WHERE D_E_L_E_T_ = ' ' " 
		c_Qry += "AND Z0A_FILIAL = '" + xFilial("Z0A") + "' "
		c_Qry += "AND Z0A_PRODUT = '"+ c_Prd +"' "
		c_Qry += "AND Z0A_LOTE = '"+ c_Lt +"' "
		c_Qry += "AND Z0A_ENDERE = '"+ cEndereco +"' "
		c_Qry += "AND Z0A_LOCAL = '"+ cArmazem +"' "
		c_Qry += "AND NOT EXISTS ( "
		c_Qry += "SELECT * FROM " + RetSqlName("Z0C") +"  " 
		c_Qry += "WHERE " + RetSqlName("Z0C") +".D_E_L_E_T_ = ' ' " 
		c_Qry += "AND Z0C_FILIAL = Z0A_FILIAL "
		c_Qry += "AND Z0C_PRODUT = Z0A_PRODUT "
		c_Qry += "AND Z0C_LOTE = Z0A_LOTE "
		c_Qry += "AND Z0C_PALLET = Z0A_PALLET)"

		PlsQuery(c_Qry, "_Q01")

		n_EstLoc -= _Q01->QTD

		c_Txt += "Separadas Qtd-> "+ Alltrim(Str(_Q01->QTD)) + Chr(13) + Chr(10)

		_Q01->(DbCloseArea())


		//Etiquetas Carregadas e não faturadas
		c_Qry := "SELECT SUM(Z0C_QTD) AS QTD "
		c_Qry += "FROM " + RetSqlName("Z0A") +" , " + RetSqlName("Z0C") +" , " + RetSqlName("SC5") +" "
		c_Qry += "WHERE " + RetSqlName("Z0A") +".D_E_L_E_T_ = ' ' AND " + RetSqlName("Z0C") +".D_E_L_E_T_ = ' ' AND " + RetSqlName("SC5") +".D_E_L_E_T_ = ' ' "
		c_Qry += "AND Z0C_FILIAL = '" + xFilial("Z0C") + "' "
		c_Qry += "AND Z0A_FILIAL = '" + xFilial("Z0A") + "' "
		c_Qry += "AND C5_FILIAL = '" + xFilial("SC5") + "' "
		c_Qry += "AND Z0C_PEDIDO = C5_NUM "
		c_Qry += "AND C5_NOTA = ' ' "
		c_Qry += "AND Z0C_PRODUT = Z0A_PRODUT "
		c_Qry += "AND Z0C_LOTE = Z0A_LOTE "
		c_Qry += "AND Z0C_PALLET = Z0A_PALLET "
		c_Qry += "AND Z0A_LOCAL = '"+ cArmazem +"' "
		c_Qry += "AND Z0A_ENDERE = '"+ cEndereco +"' "
		c_Qry += "AND Z0A_PRODUT = '"+ c_Prd +"' "
		c_Qry += "AND Z0A_LOTE = '"+ c_Lt +"' "

		PlsQuery(c_Qry, "_Q01")

		n_EstLoc -= _Q01->QTD

		c_Txt += "Carreg e nao Fat. Qtd-> "+ Alltrim(Str(_Q01->QTD)) + Chr(13) + Chr(10)

		_Q01->(DbCloseArea())

		c_Txt += "Qtd Palete-> " + Alltrim(Str(RetQtdSD3(cEtq))) +" "

		n_Qtd := n_EstLoc -  RetQtdSD3(cEtq)

		If n_Qtd < 0
			VtClear()
			VTAlert("Nao existe Saldo disponivel para essse Produto,Lote e Endereco. " +Chr(13) + Chr(10) + c_Txt , "Falha")

			If n_EstLoc > 0
				VtClear()
				VTAlert("Sld da Etiqueta sera o que tem no estoque: " + Alltrim(Str(n_EstLoc)), "Falha")
				n_Qtd := n_EstLoc
			Else
				Return
			Endif
		Else
			n_Qtd := RetQtdSD3(cEtq)
		ENdif

		//		If n_Qtd < 0
		//			VtClear()
		//			VTAlert("Nao existe Saldo disponivel para essse Produto,Lote e Endereco. " + c_Txt, "Falha")
		//			Return
		//		Else

		//		Begin Transaction

		Reclock("Z0A",.T.)
		Replace Z0A_FILIAL with xFilial("Z0A")
		Replace Z0A_ENDERE with cEndereco
		Replace Z0A_LOCAL with cArmazem
		Replace Z0A_PRODUT with c_Prd
		Replace Z0A_LOTE   with c_Lt
		Replace Z0A_PALLET with c_Plt
		Replace Z0A_STATUS with '1'
		Replace Z0A_USUSEP with cUserName
		Replace Z0A_DTSEPA with date()
		Replace Z0A_HRSEPA with time()
		Replace Z0A_QTD with n_Qtd
		MsUnLock()

		//		End Transaction

		DbCommit()
		//		Endif
	else

		VtClear()

		nLin:= 1
		@nLin,00 VtSay "Etiq. Ja Separada! "
		nLin++
		@nLin,00 VtSay "Deseja Estornar "
		nLin++
		@nLin,00 VtSay "A Separacao? (S/N) "
		nLin++
		@nLin,00 VtGet cEstorna
		VtRead

		If VTLastkey() == 27  // Tecla ESC
			VtClear()
			Return
		EndIf
		Begin Transaction
			cEstorna:= Upper(cEstorna)
			if cEstorna == "S"
				VtClear()
				if Z0A->Z0A_STATUS =='2'
					VTAlert("Nao e possivel estornar uma separacao ja expedida.",AllTrim("Falha"))
				else
					DbSelectarea("Z0B")
					Z0B->(DbSetOrder(2))
					if Z0B->(dbSeek(xFilial("Z0B") + c_Prd + c_Lt + c_Plt))
						VTAlert("Nao e possivel estornar uma separacao ja fracionada.",AllTrim("Falha"))
					else
						Reclock("Z0A",.F.)
						Replace Z0A_STATUS with '4'
						MsUnlock()

						Reclock("Z0A",.F.)
						Z0A->(DbDelete())
						MsUnlock()
						VTAlert("Separacao estornada com sucesso.",AllTrim("Sucesso"))
					endif
				endif
			endif
		End Transaction

	endif
	DbCommit()
return


//Retorna a quantidade da SD3 baseada na Etiqueta senão a quantidade do Complemento do Produto
static function RetQtdSD3(cEtq)
	Local nRet := 0
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 

	U_DecEtq(cEtq, @c_Prd, @c_Lt, ,@c_Plt)

	nRet := U_SldZ0D(cEtq)

	If nRet = 0 
		dbselectarea("SD3")
		SD3->(DbOrderNickName("ETIQUETA"))
		IF SD3->(DbSeek(xFilial("SD3")+cEtq))
			nRet := SD3->D3_QUANT
		Else 
			nRet := Posicione("SB5", 1, xFilial("SB5") + c_Prd, "B5_QEL")
		endif	
	Endif	
return nRet
