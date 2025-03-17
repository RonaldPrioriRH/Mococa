#include 'protheus.ch'
#include 'parmtype.ch'


/*/{Protheus.doc} ROMSR002
//Impressão do PickList
@author v
@since 25/10/2017
@version 1.0

@type function
/*/

user function ROMSR002()
	Private cPerg := ""


	cPerg := "ROMSR002"
	U_xPutSx1(cPerg,"01","Pedido de  ?"		  ,"","","mv_ch1","C",6,0,0,"G","","SC5","","","mv_par01","","","","","","","","","","","","","","","","",{"Informe o numero do pedido que está ","configurado para tirar estoque de outra ","filial."},{"",""},{"",""})
	U_xPutSx1(cPerg,"02","Pedido ate ?"		  ,"","","mv_ch2","C",6,0,0,"G","","SC5","","","mv_par02","","","","","","","","","","","","","","","","",{"Informe o numero do pedido que está ","configurado para tirar estoque de outra ","filial."},{"",""},{"",""})
	U_xPutSx1(cPerg,"03","Filial Estoque ?"	  ,"","","mv_ch3","C",4,0,0,"G","","   ","","","mv_par03","","","","","","","","","","","","","","","","",{"Informe a Filial de Estoqueque"      ,"                                        ","       "},{"",""},{"",""})


	if ! Pergunte(cPerg, .T.)
		Return
	endif



	RelTMSPrint()


Return



Static Function RelTMSPrint()

	Local nTab := 0
	Local cNumPVBarra := ""

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Variaveis de Tipos de fontes que podem ser utilizadas no relatório   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
	Private oFont6		:= TFONT():New("ARIAL",7,6,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 6 Normal
	Private oFont6N 	:= TFONT():New("ARIAL",7,6,,.T.,,,,.T.,.F.) ///Fonte 6 Negrito
	Private oFont8		:= TFONT():New("ARIAL",9,8,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 8 Normal
	Private oFont8N 	:= TFONT():New("ARIAL",8,8,,.T.,,,,.T.,.F.) ///Fonte 8 Negrito
	Private oFont10 	:= TFONT():New("ARIAL",9,10,.T.,.F.,5,.T.,5,.T.,.F.) ///Fonte 10 Normal
	Private oFont10S	:= TFONT():New("ARIAL",9,10,.T.,.F.,5,.T.,5,.T.,.T.) ///Fonte 10 Sublinhando
	Private oFont10N 	:= TFONT():New("ARIAL",9,10,,.T.,,,,.T.,.F.) ///Fonte 10 Negrito
	Private oFont12		:= TFONT():New("ARIAL",12,12,,.F.,,,,.T.,.F.) ///Fonte 12 Normal
	Private oFont12NS	:= TFONT():New("ARIAL",12,12,,.T.,,,,.T.,.T.) ///Fonte 12 Negrito e Sublinhado
	Private oFont12N	:= TFONT():New("ARIAL",12,12,,.T.,,,,.T.,.F.) ///Fonte 12 Negrito 
	Private oFont14		:= TFONT():New("ARIAL",14,14,,.F.,,,,.T.,.F.) ///Fonte 14 Normal
	Private oFont14NS	:= TFONT():New("ARIAL",14,14,,.T.,,,,.T.,.T.) ///Fonte 14 Negrito e Sublinhado
	Private oFont14N	:= TFONT():New("ARIAL",14,14,,.T.,,,,.T.,.F.) ///Fonte 14 Negrito
	Private oFont16 	:= TFONT():New("ARIAL",16,16,,.F.,,,,.T.,.F.) ///Fonte 16 Normal
	Private oFont16N	:= TFONT():New("ARIAL",16,16,,.T.,,,,.T.,.F.) ///Fonte 16 Negrito
	Private oFont16NS	:= TFONT():New("ARIAL",16,16,,.T.,,,,.T.,.T.) ///Fonte 16 Negrito e Sublinhado
	Private oFont20N	:= TFONT():New("ARIAL",20,20,,.T.,,,,.T.,.F.) ///Fonte 20 Negrito
	Private oFont22N	:= TFONT():New("ARIAL",22,22,,.T.,,,,.T.,.F.) ///Fonte 22 Negrito

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Variveis para impressão                                              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
	Private cStartPath
	Private nLin 		:= 0    
	Private nMargemL    := 50  
	Private nMargemR    := 2400 
	Private nMargemT	:= 50
	Private nMargemB	:= 3350
	Private nCenterPg	:= 1200
	Private oPrint		:= TMSPRINTER():New("")
	Private nPag		:= 0   



	#define DMPAPER_A4 9 //Papel A4
	oPrint:setPaperSize( DMPAPER_A4 )	

	oPrint:SetPortrait()///Define a orientacao da impressao como retrato

	//	Private aTitItens 	:= {"Item"	, "Produto"	, "Descrição"	, "Un."		,"Qtde."		, "Amz."	, "Lote"	, "Endereço"}
	//	Private aColPos 	:= {nMargemL, 220		, 450			, 1200		, 1600			, 1620		, 1720		, 2020		}
	//	Private aColAlign 	:= {0		, 0			, 0				, 0			, 1				, 0			, 0 		, 0			} 

	Private aTitItens 	:= {"Produto"	, "Descrição"	, "Un."		,"Qtde."		, "Peso"}
	Private aColPos 	:= {220		, 450			, 1200		, 1600			, 1620	}
	Private aColAlign 	:= {0			, 0				, 0			, 1				, 0		}



	PrintReport()



	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Pre-visualiza a impressão 				                            ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ	
	oPrint:Preview()

Return

Static Function PrintReport()
	Local c_Qry := ''
	Local c_Num := ""
	Local n_TPdP := 0
	Local n_TZP := 0
	Local n_TSP := 0
	Local n_TPSP := 0

	Local c_ZP := ""
	Local c_SP := ""
	Local c_PSP := ""

	c_Qry :=  "SELECT " 
	c_Qry +=  "(SELECT DA7_PERCUR FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE) AS ZONA, "
	c_Qry +=  "(SELECT DA7_ROTA   FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE) AS SETOR, "
	c_Qry +=  "(SELECT DA7_REF    FROM DA7010 WHERE DA7010.D_E_L_E_T_ = ' ' AND DA7_FILIAL = '"+ xFilial("DA7") +"' AND A1_CEP BETWEEN DA7_CEPDE AND DA7_CEPATE) AS REF, "
	c_Qry +=  "C9_PEDIDO, "
	c_Qry +=  "C9_PRODUTO, "
	c_Qry +=  "SUM(C9_QTDLIB) AS QTD "
	c_Qry +=  "FROM SC5010, SC9010, SA1010 "
	c_Qry +=  "WHERE SC5010.D_E_L_E_T_ = ' ' AND SC9010.D_E_L_E_T_ = ' ' AND SA1010.D_E_L_E_T_ = ' ' " 
	c_Qry +=  "AND C5_FILIAL = '"+ xFilial("SC5") +"' "
	c_Qry +=  "AND C9_FILIAL = '"+ xFilial("SC9") +"' "
	c_Qry +=  "AND A1_FILIAL = '"+ xFilial("SA1") +"' "
	c_Qry +=  "AND C5_NUM = C9_PEDIDO "
	c_Qry +=  "AND A1_COD = C5_CLIENTE "
	c_Qry +=  "AND A1_LOJA = C5_LOJACLI "
	c_Qry +=  "AND C5_TIPO = 'N' "
	c_Qry +=  "AND C5_XFILEST = '"+ MV_PAR03 +"' "
	c_Qry +=  "AND C5_NUM BETWEEN '"+ MV_PAR01 +"' AND '"+ MV_PAR02 +"' "
	c_Qry +=  "AND C9_NFISCAL = ' ' "
	c_Qry +=  "GROUP BY 1,2,3,A1_CEP,C9_PEDIDO,C9_PRODUTO "
	c_Qry +=  "ORDER BY 1,2,3,C9_PEDIDO "


	PlsQuery(c_Qry,"_Q01")

	//Aviso("Query",c_Qry,{"ok"})


	if ! EOF()

		DbSelectArea("DA5")
		DbSetOrder(1)
		DbSeek(xFilial("DA5") + _Q01->ZONA)

		DbSelectArea("DA6")
		DbSetOrder(1)
		DbSeek(xFilial("DA6") + _Q01->ZONA + _Q01->SETOR)

		c_ZP := DA5->DA5_DESC
		c_SP := DA6->DA6_REF
		c_PSP := _Q01->REF

		DbSelectArea("_Q01")
		While ! Eof()
			DbSelectArea("SC5")
			DbSetOrder(1)
			DbSeek(xFilial("SC5") + _Q01->C9_PEDIDO)

			DbSelectArea("DA5")
			DbSetOrder(1)
			DbSeek(xFilial("DA5") + _Q01->ZONA)

			DbSelectArea("DA6")
			DbSetOrder(1)
			DbSeek(xFilial("DA6") + _Q01->ZONA + _Q01->SETOR)

			if c_Num <> _Q01->C9_PEDIDO
				If c_Num <> ""
					oPrint:Say(nLin, aColPos[6], Transform(n_TPdP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
					nLin += 50	
				EndIf

				If c_PSP <> _Q01->REF
					oPrint:Say(nLin, aColPos[3],"Ponto -> " + AllTrim(c_PSP) + " - Total Peso: ", oFont10,,,,)
					oPrint:Say(nLin, aColPos[6],Transform(n_TPSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
					nLin += 50	
					c_PSP := _Q01->REF
					n_TPSP := 0
				EndIf

				If c_SP <> DA6->DA6_REF
					oPrint:Say(nLin, aColPos[3],"Setor -> " + AllTrim(c_SP) + " - Total Peso: ", oFont10,,,,)
					oPrint:Say(nLin, aColPos[6],Transform(n_TSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
					nLin += 50
					c_SP := DA6->DA6_REF	
					n_TSP := 0
				EndIf

				If c_ZP <> DA5->DA5_DESC
					oPrint:Say(nLin, aColPos[3],"Zona -> " + AllTrim(c_ZP) + " - Total Peso: ", oFont10,,,,)
					oPrint:Say(nLin, aColPos[6], Transform(n_TZP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
					nLin += 50
					c_ZP := DA5->DA5_DESC	
					n_TZP := 0
				EndIf

				If c_Num <> ""
					Rod()
				EndIf

				Cabecalho()
				CabItens()
				c_Num := _Q01->C9_PEDIDO
				n_TPdP := 0
			EndIf

			If c_PSP <> _Q01->REF
				oPrint:Say(nLin, aColPos[3],"Ponto -> " + AllTrim(c_PSP) + " - Total Peso: ", oFont10,,,,)
				oPrint:Say(nLin, aColPos[6],Transform(n_TPSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
				nLin += 50	
				c_PSP := _Q01->REF
				n_TPSP := 0
			EndIf

			If c_SP <> DA6->DA6_REF
				oPrint:Say(nLin, aColPos[3],"Setor -> " + AllTrim(c_SP) + " - Total Peso: ", oFont10,,,,)
				oPrint:Say(nLin, aColPos[6],Transform(n_TSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
				nLin += 50
				c_SP := DA6->DA6_REF	
				n_TSP := 0
			EndIf

			If c_ZP <> DA5->DA5_DESC
				oPrint:Say(nLin, aColPos[3],"Zona -> " + AllTrim(c_ZP) + " - Total Peso: ", oFont10,,,,)
				oPrint:Say(nLin, aColPos[6], Transform(n_TZP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
				nLin += 50
				c_ZP := DA5->DA5_DESC	
				n_TZP := 0
			EndIf


			//posicionando tabelas
			SB1->(DbSetOrder(1))
			SB1->( dbSeek(xFilial("SB1") + _Q01->C9_PRODUTO) )



			//Mudando de página
			if nLin >= nMargemB
				Rod()
				Cabecalho()
				CabItens()
			endif

			nCol := 1			
			//oPrint:Say(nLin, aColPos[nCol], _Q01->C9_ITEM, oFont10,,,,aColAlign[nCol++])
			oPrint:Say(nLin, aColPos[nCol], _Q01->C9_PRODUTO, oFont10,,,,aColAlign[nCol++])
			oPrint:Say(nLin, aColPos[nCol], SB1->B1_DESC, oFont10,,,,aColAlign[nCol++])
			oPrint:Say(nLin, aColPos[nCol], SB1->B1_UM, oFont10,,,,aColAlign[nCol++])
			oPrint:Say(nLin, aColPos[nCol], Transform(_Q01->QTD, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,aColAlign[nCol++])
			oPrint:Say(nLin, aColPos[nCol], Transform(_Q01->QTD * SB1->B1_PESO, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,aColAlign[nCol++])

			n_TPdP += _Q01->QTD * SB1->B1_PESO

			n_TZP += _Q01->QTD * SB1->B1_PESO
			n_TSP += _Q01->QTD * SB1->B1_PESO
			n_TPSP += _Q01->QTD * SB1->B1_PESO

			nLin += 50	



			DbSelectArea("_Q01")
			DbSkip()
		Enddo

		//finalizo as seções


	endif
	oPrint:Say(nLin, aColPos[5], Transform(n_TPdP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
	nLin += 50	
	oPrint:Say(nLin, aColPos[2],"Ponto -> " + AllTrim(c_PSP) + " - Total Peso: ", oFont10,,,,)
	oPrint:Say(nLin, aColPos[5],Transform(n_TPSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
	nLin += 50	
	oPrint:Say(nLin, aColPos[2],"Setor -> " + AllTrim(c_SP) + " - Total Peso: ", oFont10,,,,)
	oPrint:Say(nLin, aColPos[5],Transform(n_TSP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
	nLin += 50	
	oPrint:Say(nLin, aColPos[2],"Zona -> " + AllTrim(c_ZP) + " - Total Peso: ", oFont10,,,,)
	oPrint:Say(nLin, aColPos[5], Transform(n_TZP, PesqPict("SC9","C9_QTDLIB")), oFont10,,,,)
	
	Rod()
	
	_Q01->(DBCloseArea())



Return



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o cabeçalho principal 				                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function Cabecalho()

	oPrint:StartPage() // Inicia uma nova pagina

	nLin := nMargemT
	oPrint:Say(nLin, nMargemL, "Picklist de Separação", oFont16N,,,,0)
	nLin += 100
	oPrint:Say(nLin, nMargemL, "Pagina: " + strzero(++nPag,3), oFont10)	
	nLin += 40                           
	oPrint:Say(nLin, nMargemL, DTOC(dDatabase) + " " + TIME(), oFont10)
	nLin += 60
	oPrint:Line(nLin, nMargemL, nLin, nMargemR) 
	nLin += 30

	nTab := 250
	oPrint:Say(nLin, nMargemL, "Nº Pedido : ", oFont12)
	oPrint:Say(nLin, nMargemL + nTab, SC5->C5_NUM , oFont12N)   

	oPrint:Say(nLin, nCenterPg, "Id.Triang.:", oFont12)
	oPrint:Say(nLin, nCenterPg + nTab, SC5->C5_XIDTRI, oFont12N)

	nLin += 35

	nTab := 0
	oPrint:Say(nLin, nMargemL + nTab, "Zona: " + DA5->DA5_DESC, oFont12)

	nTab += 600
	oPrint:Say(nLin, nMargemL + nTab, "Setor: " + DA6->DA6_REF, oFont12)

	nTab += 600
	oPrint:Say(nLin, nMargemL + nTab, "Ponto: " + _Q01->REF, oFont12)



	cNumPVBarra := SC5->C5_NUM
	nLin += 30


	MSBAR('CODE128',2.25,5,cNumPVBarra,oPrint,.F.,,.T.,0.025,0.8,.T.,,,.F.)


	nLin += 100

Return  

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o rodapé principal 				                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function Rod()

	nLin := nMargemB
	oPrint:Line(nLin, nMargemL, nLin, nMargemR)                             
	oPrint:Say(nLin, nMargemL, FWFilialName() , oFont10)      
	oPrint:Say(nLin, nMargemR, DTOC(dDatabase) + " " + TIME(), oFont10,,,,1)

	oPrint:EndPage() //finaliza pagina

Return   

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Monta o cabeçalho dos itens do pedido	                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function CabItens()	
	Local nI := 0

	for nI := 1 to len(aTitItens)
		oPrint:Say(nLin, aColPos[nI], aTitItens[nI], oFont10N,,,,aColAlign[nI])
	next nI

	nLin += 50
	oPrint:Line(nLin, nMargemL, nLin, nMargemR)
	nLin += 30

Return 
