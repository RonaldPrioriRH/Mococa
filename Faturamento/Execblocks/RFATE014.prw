#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³M460FIM   ºAutor  ³Sangelles           º Data ³  05/06/2013 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Ponto de Entrada para gravar a Forma de Pagamento na SE1   º±±
±±º          ³ e Imprimir Boleto Laser			                          º±±        
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Acelerador Totvs Goias                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±º	Dados Adicionais de Alteracao/Ajustes do Fonte                        º±±  
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºData      ³ Descricao:                                                 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º          ³                                                            º±±
±±º 		 ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  
*/

User Function RFATE014()

	Local aArea	:= GetArea()
	Local aSCV := SCV->( GetArea() )
	Local aSEA := SEA->( GetArea() )
	Local aSE1 := SE1->( GetArea() )
	Local aSF2 := SF2->( GetArea() )
	Local aSD2 := SD2->( GetArea() )
	Local aDAK := DAK->( GetArea() )
	Local aDAI := DAI->( GetArea() )
	Local aDAJ := DAJ->( GetArea() )
	Local aSA1 := SA1->( GetArea() )
	Local aSC5 := SC5->( GetArea() )
	Local aSC6 := SC6->( GetArea() )
	Local aSC9 := SC9->( GetArea() )
	Local aEE7 := EE7->( GetArea() )
	Local aDCF := DCF->( GetArea() )
	Local aDAU := DAU->( GetArea() )
	Local aDA3 := DA3->( GetArea() )
	Local aDA4 := DA4->( GetArea() )
	Local aDB0 := DB0->( GetArea() )
	Local aDA5 := DA5->( GetArea() )
	Local aDA6 := DA6->( GetArea() )
	Local aDA7 := DA7->( GetArea() )
	Local aDA8 := DA8->( GetArea() )
	Local aDA9 := DA9->( GetArea() )
	Local aSB1 := SB1->( GetArea() )
	Local aSB2 := SB1->( GetArea() )
	Local aSB6 := SB1->( GetArea() )
	Local aSED := SB1->( GetArea() )
	Local aSEE := SB1->( GetArea() )
	Local aSA6 := SB1->( GetArea() )
	Local aSX5 := SX5->( GetArea() )
	Local aMVs := { M->MV_PAR01, M->MV_PAR02, M->MV_PAR03, M->MV_PAR04, M->MV_PAR05, M->MV_PAR06,;
	M->MV_PAR07, M->MV_PAR08, M->MV_PAR09, M->MV_PAR10, M->MV_PAR11, M->MV_PAR12,;
	M->MV_PAR13, M->MV_PAR14, M->MV_PAR15, M->MV_PAR16, M->MV_PAR17, M->MV_PAR18,;
	M->MV_PAR19, M->MV_PAR20, M->MV_PAR21, M->MV_PAR22, M->MV_PAR23, M->MV_PAR24,;
	M->MV_PAR25 }
	Local nWorkArea := Select()  
	Default lRoboCarga 	:= .f.  					// Se verdadeiro indica que foi acionado pela rotina de roboda carga

	//Local _aVencto := {}
	//Local _nValTitulos := 0
	//Local _nValTitST   := 0
	//Local _dNovaData  := ''   //calcula a data do vencimento do ICMS
	//Local cEstTilImp  := AllTrim(GetMV("MV_XUFTIST"))
	//Local cPrxTilImp  := AllTrim(GetMV("MV_XPRTIST"))
	//Local  _aDados  := {} 

	//Local cMV_1DUPREF := &(GetMV("MV_1DUPREF") )

	//INFORMAR O PESO E VOLUME NA NOTA APENAS DOS ITENS FATURADOS
	//PEDRO PAULO - TOTVS 13/03/2014
	Local cQuery := ""
	Local cEOL	 := Chr(13) + Chr(10) 
	Local _nVol  := _nPesoB := _nPesoL := 0
	//Local nDescCli  := 0    

	DBSelectArea("SC9")
	SC9->(DBSetOrder(2)) 


	If Select("TQC9") > 0 
		TQC9->(DBCloseArea())
	EndIf
	
	//===Busca Produtos Faturados do pedido posicionado Ajuste EE7-EE8 Pedidos Exportação
	cQuery :=  "SELECT  C9_FILIAL,C9_CLIENTE,C9_LOJA,C9_PEDIDO,C9_PRODUTO,C9_ITEM,C9_QTDLIB,C9_PRCVEN,C5_PEDEXP, EE8_PSBRUN,EE8_PSLQUN FROM  SC9010 "+ cEOL
	cQuery +=  "     "	+ cEOL
	cQuery +=  "    LEFT JOIN SC5010 ON SC5010.D_E_L_E_T_ =' '  "	+ cEOL
	cQuery +=  "                    AND C5_FILIAL = C9_FILIAL "	+ cEOL
	cQuery +=  "                    AND C9_PEDIDO = C5_NUM "	+ cEOL
	cQuery +=  "    "	+ cEOL
	cQuery +=  "    LEFT JOIN EE8010 ON EE8010.D_E_L_E_T_=' ' "	+ cEOL
	cQuery +=  "                    AND EE8_FILIAL = C5_FILIAL "	+ cEOL
	cQuery +=  "                    AND EE8_PEDIDO = C5_PEDEXP "	+ cEOL
	cQuery +=  "                    AND EE8_COD_I = C9_PRODUTO "	+ cEOL
	cQuery +=  "                    AND EE8_FATIT = C9_ITEM "	+ cEOL
	cQuery +=  " "	+ cEOL
	cQuery +=  "    LEFT JOIN SF2010 ON SF2010.D_E_L_E_T_=' ' "	+ cEOL
	cQuery +=  "                    AND C9_FILIAL = F2_FILIAL "	+ cEOL
	cQuery +=  "                    AND C9_NFISCAL = F2_DOC  "	+ cEOL
	cQuery +=  "                    AND C9_SERIENF = F2_SERIE "	+ cEOL
	cQuery +=  "                    AND C9_CLIENTE = F2_CLIENTE "	+ cEOL
	cQuery +=  "                    AND C9_LOJA = F2_LOJA "	+ cEOL
	//cQuery +=  "                    AND C9_FILIAL  = '"+SF2->F2_FILIAL+"'  " + cEOL
	//cQuery +=  "                    AND C9_NFISCAL = '"+SF2->F2_DOC+"'  " + cEOL
	//cQuery +=  "                    AND C9_SERIENF = '"+SF2->F2_SERIE+"'  " + cEOL
	//cQuery +=  "                    AND C9_CLIENTE = '"+SF2->F2_CLIENTE+"'  " + cEOL
	//cQuery +=  "                    AND C9_LOJA = '"+SF2->F2_LOJA+"'  " + cEOL
	cQuery +=  "WHERE SC9010.D_E_L_E_T_ = ' '  "	+ cEOL
	cQuery +=  "	AND C9_FILIAL = '"+SC5->C5_FILIAL+"'  " + cEOL
	cQuery +=  "	AND C9_PEDIDO = '"+SC5->C5_NUM+"'  " + cEOL
	cQuery +=  "	AND C9_BLCRED='10'   "	+ cEOL
	cQuery +=  "	AND C9_BLEST='10'   "	+ cEOL
	cQuery +=  "	AND C9_FILIAL  = '"+SF2->F2_FILIAL+"'  " + cEOL
	cQuery +=  "	AND C9_NFISCAL = '"+SF2->F2_DOC+"'  " + cEOL
	cQuery +=  "	AND C9_SERIENF = '"+SF2->F2_SERIE+"'  " + cEOL
	cQuery +=  "	AND C9_CLIENTE = '"+SF2->F2_CLIENTE+"'  " + cEOL
	cQuery +=  "	AND C9_LOJA = '"+SF2->F2_LOJA+"'  " + cEOL
	cQuery +=  " "	+ cEOL
	cQuery +=  "ORDER BY C9_ITEM,C9_PRODUTO "	+ cEOL		
/*	
	cQuery := " SELECT C9_FILIAL,C9_CLIENTE,C9_LOJA,C9_PEDIDO,C9_PRODUTO,C9_ITEM,C9_QTDLIB,C9_PRCVEN FROM " + cEOL
	cQuery += " "+RetSqlName("SC9")+" SC9" + cEOL
	cQuery += "	WHERE SC9.C9_FILIAL='"+xFilial("SC9")+"'" + cEOL
	cQuery += "		AND SC9.C9_PEDIDO='"+SC5->C5_NUM+"' AND " + cEOL
	cQuery += "		SC9.C9_BLCRED='10' AND " + cEOL
	cQuery += "		SC9.C9_BLEST='10' AND " + cEOL
	cQuery += "		SC9.C9_NFISCAL = '"+SF2->F2_DOC+"' AND " + cEOL
	cQuery += "		SC9.C9_SERIENF = '"+SF2->F2_SERIE+"' AND " + cEOL
	cQuery += "		SC9.C9_CLIENTE = '"+SF2->F2_CLIENTE+"' AND " + cEOL
	cQuery += "		SC9.C9_LOJA = '"+SF2->F2_LOJA+"' AND " + cEOL
	cQuery += "		SC9.D_E_L_E_T_ <> '*' " + cEOL   
	cQuery += " ORDER BY C9_ITEM,C9_PRODUTO " + cEOL
*/
	//MemoWrite("C:\teste\EXPORTACAO_SC9.sql",cQuery) //10/04/19
	
	cQuery := ChangeQuery(cQuery)
	dbUseArea(.T., "TOPCONN", tcGenQry(,, cQuery), "TQC9", .F., .T.)

	TQC9->(DBGotop())

	//Varre arquivo temporario gerando volume, peso bruto e liquidos dos produtos faturados		
	While TQC9->(!EOF())
		If SB1->(dbseek(xFilial("SB1")+TQC9->C9_PRODUTO))
			//Não é pedido Exportação 
			If Empty(TQC9->C5_PEDEXP)	
				//Contornar  o Erro ao Salvar volumes com qts maior que 1 milhão C9_QTDLIB != F2_VOLUME1 não está gravando SDH corretamente
				If TQC9->C9_QTDLIB > 999999
					_nVol += 0
				Else
					_nVol += TQC9->C9_QTDLIB//Soma volume 
				EndIf
				_nPesoB += TQC9->C9_QTDLIB*SB1->B1_PESBRU //soma o peso bruto total
				_nPesoL += TQC9->C9_QTDLIB*SB1->B1_PESO   //soma o peso liquido total 
			Else
				//Pega os pesos da Exportação para cálcular
				_nVol   += TQC9->C9_QTDLIB//Soma volume 
				_nPesoB += TQC9->C9_QTDLIB * TQC9->EE8_PSBRUN //soma o peso bruto total
				_nPesoL += TQC9->C9_QTDLIB * TQC9->EE8_PSLQUN    //soma o peso liquido total 
			EndIf  
		EndIf
		TQC9->(DBSkip())
	EndDo 

	TQC9->(DBCloseArea())
	
	//Grava na SF2 o peso e volume calculado
	IF RecLock("SF2",.F.)
		SF2->F2_VOLUME1 := _nVol
		SF2->F2_PBRUTO  := _nPesoB
		SF2->F2_PLIQUI  := _nPesoL
		SF2->(MsUnlock())
	EndIf						

	//Grava SCV conforme campo C5_XFORPG
	If FieldPos("C5_XFORPG") > 0
		GravaSCV()
	Endif                                   

	//INFORMAR O NÚMERO DA CARGA NO FINANCEIRO
	If FieldPos("E1_XNUMCAR") > 0
		SE1->(DbSetOrder(1))
		SE1->(DbSeek( xFilial("SF2")+SF2->(F2_SERIE+F2_DOC)))

		Do While xFilial("SF2")+SF2->(F2_SERIE+F2_DOC) == xFilial("SE1")+SE1->(E1_SERIE+E1_NUM)
			RecLock("SE1",.F.)
			SE1->E1_XNUMCAR := SF2->F2_CARGA
			SE1->(MsUnLock())
			SE1->(dbSkip())
		EndDo
	Endif
	//FIM CARGA FINANCEIRO

	//U_AFINP001()  //chamada do Acelerador Totvs (Fonte exclusivo TOTVS Goiás)   

	RestArea(aSEA)
	RestArea(aSCV )
	RestArea(aSE1 )
	RestArea(aSF2 )
	RestArea(aSD2 )
	RestArea(aDAK )
	RestArea(aDAI )
	RestArea(aDAJ )
	RestArea(aSA1 )
	RestArea(aSC5 )
	RestArea(aSC6 )
	RestArea(aSC9 )
	RestArea(aEE7 )
	RestArea(aDCF )
	RestArea(aDAU )
	RestArea(aDA3 )
	RestArea(aDA4 )
	RestArea(aDB0 )
	RestArea(aDA5 )
	RestArea(aDA6 )
	RestArea(aDA7 )
	RestArea(aDA8 )
	RestArea(aDA9 )
	RestArea(aSB1 )
	RestArea(aSB2 )
	RestArea(aSB6 )
	RestArea(aSED )
	RestArea(aSEE )
	RestArea(aSA6 )
	RestArea(aSX5 )

	MV_PAR01 := aMVs[01]
	MV_PAR02 := aMVs[02]
	MV_PAR03 := aMVs[03]
	MV_PAR04 := aMVs[04]
	MV_PAR05 := aMVs[05]
	MV_PAR06 := aMVs[06]
	MV_PAR07 := aMVs[07]
	MV_PAR08 := aMVs[08]
	MV_PAR09 := aMVs[09]
	MV_PAR10 := aMVs[10]
	MV_PAR11 := aMVs[11]
	MV_PAR12 := aMVs[12]
	MV_PAR13 := aMVs[13]
	MV_PAR14 := aMVs[14]
	MV_PAR15 := aMVs[15]
	MV_PAR16 := aMVs[16]
	MV_PAR17 := aMVs[17]
	MV_PAR18 := aMVs[18]
	MV_PAR19 := aMVs[19]
	MV_PAR20 := aMVs[20]
	MV_PAR21 := aMVs[21]
	MV_PAR22 := aMVs[22]
	MV_PAR23 := aMVs[23]
	MV_PAR24 := aMVs[24]
	MV_PAR25 := aMVs[25]

	SELECT(nWorkArea)
	RestArea(aArea)
	
Return

/* Prencher a forma de pagamento do pedido de venda na tabela SCV  */

Static Function GravaSCV() //Grava Forma de Pagamento
	Local cPed     := SC5->C5_NUM
	Local cFormaPG := SC5->C5_XFORPG, cChave := ""
	Local nCont    := 0
	Local _nForm   := .T.

	SX5->( dbSetOrder(1) )
	SCV->( DbSetOrder(1) )                                                                                                                             //CV_FILIAL+CV_PEDIDO+CV_FORMAPG

	if SCV->(DbSeek(xFilial("SCV")+cPed))

		cChave := SCV->(CV_FILIAL+CV_PEDIDO)             //Verifica se realmente foi gravado a forma de Pagamento.
		_nForm := .F.

		while cChave == SCV->(CV_FILIAL+CV_PEDIDO)

			if SX5->( dbSeek(xFilial()+"24"+cFormaPG) )

				RecLock("SCV",.F.)

				// SCV->CV_FILIAL  := xFilial("SCV") //Se existir a forma de pagamento altera para a forma de pagamento correta.
				// SCV->CV_PEDIDO  := cPed
				// SCV->CV_RATFOR  := 100

				SCV->CV_FORMAPG := AllTrim(SX5->X5_CHAVE)
				SCV->CV_DESCFOR := AllTrim(SX5->X5_DESCRI)

				SCV->(MsUnLock())

			endif

			nCont++
			SCV->( DbSkip() )

		enddo

	endif //Caso não exista Forma de pagamento Grava a Forma Correta.

	If _nForm

		SX5->( dbSetOrder(1) )
		if SX5->( dbSeek( xFilial("SX5")+"24"+cFormaPG) )

			RecLock("SCV",.T.)

			SCV->CV_FILIAL  := xFilial("SCV")
			SCV->CV_PEDIDO  := cPed
			SCV->CV_FORMAPG := AllTrim(SX5->X5_CHAVE)
			SCV->CV_DESCFOR := AllTrim(SX5->X5_DESCRI)
			SCV->CV_RATFOR  := 100

			SCV->( MsUnLock() )

		endif

	endIf


Return .T.
