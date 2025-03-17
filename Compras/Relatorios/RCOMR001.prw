#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "topconn.ch"

User Function RCOMR001()
	Local cEmail := ""
	Local a_IfFor := {}
	Local c_Num := SC7->C7_NUM
	Local lImpar := .T.
	Local n_Total := 0
	Local c_Prod := " "
	Local cHtm := ""

	Private cPerg := "RCOMR001"

	DbSelectArea("SC7")
	DbSetOrder(1)
	DbSeek(xFilial("SC7")+c_Num)

	DbSelectArea("SA2")
	DbSetOrder(1)
	DbSeek(xFilial("SA2") + SC7->C7_FORNECE + SC7->C7_LOJA)

	ValidPerg()

	If !Pergunte(cPerg,.T.,,,,.F.)
		Return
	Endif

	cEmail  := 'jose.vasques@totvs.com.br' 
	//Lower(Alltrim(SuperGetMV("MV_X_ECOMP", .F., " ")))

	U_HTMICOR2(@cHtm)

	U_HTMITAB2(@cHtm,0,2,0)
	U_HtmLinTTit(@cHtm,{'Mococa', 'TOTVS'}, '788EA7', 'FFFFFF', 4)
	U_HtmLinTTit(@cHtm,{'PEDIDO DE COMPRA - Mococa', 'by Totvs Protheus'}, 'CCCCCC', '000000', -5)
	U_HTMFTAB2(@cHtm)
	U_HTMLINE(@cHtm,2)

	cHtm += "Fornecedor, segue pedido de compra aprovado. Confira os dados e em caso de divergencia entre em contato com o Comprador para Resolucao. <br>"
	cHtm += "Ao faturar este pedido, fazer constar em sua nota o numero deste pedido de compra, conforme abaixo.

	U_HTMLINE(@cHtm,2)

	U_HTMITAB2(@cHtm,0,2,0)
	U_HTMLTAB2(@cHtm,{'Pedido de Compra No.:',SC7->C7_NUM}, '000000', 'FFFFFF', -1)
	U_HTMLTAB2(@cHtm,{'Endereco de Entrega e Cobranca:',Alltrim(SM0->M0_ENDENT) +"<BR>CEP: "+ AllTrim(SM0->M0_CEPENT) +"<br>" +;
	AllTrim(SM0->M0_CIDENT) +"-"+ AllTrim(SM0->M0_ESTENT)}, '000000', 'FFFFFF', -1)

	a_IfFor := Posicione("SA2",1,xFilial("SA2")+SC7->(C7_FORNECE+C7_LOJA),"{A2_NOME,A2_CGC,A2_EMAIL}")

	cEmail += IIF(a_IfFor[3] <> ' ',";"+a_IfFor[3],"")

	U_HTMLTAB2(@cHtm,{'Fornecedor:',SC7->(C7_FORNECE+C7_LOJA)+" - "+ a_IfFor[1]}, '000000', 'FFFFFF', -1)
	U_HTMLTAB2(@cHtm,{'CNPJ.:',a_IfFor[2]}, '000000', 'FFFFFF', -1)
	U_HTMLTAB2(@cHtm,{'Cond Pagamento:',SC7->C7_COND+" - "+ Posicione("SE4",1,xFilial("SE4")+SC7->C7_COND,"E4_DESCRI")}, '000000', 'FFFFFF', -1)
	U_HTMLTAB2(@cHtm,{'Contato:',SC7->C7_CONTATO}, '000000', 'FFFFFF', -1)
	U_HTMFTAB2(@cHtm)

	lImpar:= .t.

	U_HTMLINE(@cHtm,2)

	U_HTMITAB2(@cHtm,1,2,0)
	U_HTMLTAB2(@cHtm,{'Cod Fornecedor','Produto', 'Quant', 'U.M.', 'Pr. Unit.', 'Total', 'Entrega'}, '000000', 'FFFFFF', -1)


	DbSelectArea("SC7")
	DbSetOrder(1)
	DbSeek(xFilial("SC7")+c_Num)

	DbSelectArea("SA2")
	DbSetOrder(1)
	If DbSeek(xFilial("SA2") + SC7->C7_FORNECE + SC7->C7_LOJA)
//		RecLock("SA2",.F.)
//		SA2->A2_TRANSP := MV_PAR01
//
//		MsUnLock()
	Endif

	DbSelectArea("SC7")

	While c_Num = SC7->C7_NUM

		n_Total += SC7->C7_TOTAL
		c_Prod := Posicione("SA5",1,xFilial("SA5")+SC7->(C7_FORNECE+C7_LOJA+C7_PRODUTO),"A5_CODPRF")

		U_HTMLTAB2(@cHtm, {c_Prod,;
		Posicione("SB1",1,xFilial("SB1")+SC7->C7_PRODUTO,"B1_COD+' - '+B1_DESC"),;
		TransForm(SC7->C7_QUANT,"@E 999,999,999.99"),;
		SC7->C7_UM,;
		TransForm(SC7->C7_PRECO,"@E 999,999,999.99"),;
		TransForm(SC7->C7_TOTAL,"@E 999,999,999.99"),;
		DtoC(SC7->C7_DATPRF)}, IIF(lImpar, 'DDDDDD', 'CCCCCC'), NIL, -2)

		lImpar:= !lImpar

		DbSelectArea("SC7")

		RecLock("SC7",.F.)

		SC7->C7_XTRNSP := MV_PAR01 
		SC7->C7_TPFRETE := IIF(MV_PAR02 = 1,'C',IIF(MV_PAR02 = 2,'F',' '))

		MsUnLock()

		DbSkip()
	EndDo
	U_HTMLTAB2(@cHtm,{'','','','','', TransForm(n_Total,"@E 999,999,999.99"),''}, '000000', 'FFFFFF', -1)

	U_HTMFTAB2(@cHtm)

	U_HTMLINE(@cHtm,1)

	If MV_PAR01 <> ' '
		cHtm += "<b>Utilizar a Transportadora: </b> <br>"
		cHtm += "<b>Tipo do Frete: </b> "+ IIF(MV_PAR02 = 1,'CIF',IIF(MV_PAR02 = 2,'FOB',' ')) +"<br>"
		cHtm += Posicione("SA4",1,xFilial("SA4")+MV_PAR01,"A4_NOME +' - Tel:'+ A4_DDD + ' '+ A4_TEL ")+"<BR>"
		U_HTMLINE(@cHtm,1)
	Endif

	If MV_PAR03 <> ' '
		cHtm += "<b>Observacoes: </b> <br>"
		cHtm += MV_PAR03+"<BR>"
		U_HTMLINE(@cHtm,1)
	Endif

	U_HTMLINE(@cHtm,1)

	U_HTMITAB2(@cHtm,0,2,0)
	U_HtmLinTTit(@cHtm,{'TOTVS'}, 'CCCCCC', '000000', -5)
	U_HTMFTAB2(@cHtm)

	U_HtmFimCorpo(@cHtm)



	cEmail  := "jose.vasques@totvs.com.br"



	If U_EnviarEMail(cEmail,"PEDIDO DE COMPRA - Mococa No.:"+c_Num,cHTM,,,"compras@mococa.com.br")
		Alert("E-Mail enviado com Sucesso")
	Else
		Alert("Falha ao enviar E-Mail")
	Endif


Return

Static Function ValidPerg()
	Local _sAlias,i,j
	_sAlias := GetArea()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)
	aRegs:={}
	// Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05/f3
	AADD(aRegs,{cPerg,"01","Transportadora ","","","mv_ch1","C",06,0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SA4","",;
	"","","",""})
	AADD(aRegs,{cPerg,"02","Tipo de Frete  ","","","mv_ch2","N",01,0,0,"C","","mv_par02","CIF","","","","","FOB","","","","","Nenhum","","","","","","","","","","","","",;
	"","","","","","","","",""})
	AADD(aRegs,{cPerg,"03","Observacao     ","","","mv_ch3","C",99,0,0,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","","","",;
	"","",""})

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
				FieldPut(j,aRegs[i,j])
			Next
			MsUnlock()
			dbCommit()
		Else
			RecLock("SX1",.F.)
			If aRegs[i,2] = '01'
				SX1->X1_CNT01 := SA2->A2_TRANSP
			ElseIf aRegs[i,2] = '02'
				SX1->X1_PRESEL := IIF(SC7->C7_TPFRETE = 'C',1,IIF(SC7->C7_TPFRETE = 'F',2,3))
			Else
				SX1->X1_CNT01 := ' '
			EndIf
			MsUnlock()
			dbCommit()
		EndIf
	Next
	RestArea(_sAlias)
Return
