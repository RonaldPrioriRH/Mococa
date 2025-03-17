#include "protheus.ch"
#DEFINE CRLF CHR(13)+CHR(10)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ RFATE025		 ºAutor  ³ Totvs GO    	 º Data ³  26/11/2013 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Ponto de Entrada para Msg NF-e                             º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ CREME MEL                                                 º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function RFATE025()

	Local aProd			:= PARAMIXB[1]
	Local cMensCli		:= PARAMIXB[2]
	Local cMensFis		:= PARAMIXB[3]
	Local aDest			:= PARAMIXB[4]
	Local aNota   		:= PARAMIXB[5]
	Local aInfoItem		:= PARAMIXB[6]
	Local aDupl			:= PARAMIXB[7]
	Local aTransp		:= PARAMIXB[8]
	Local aEntrega		:= PARAMIXB[9]
	Local aRetirada		:= PARAMIXB[10]
	Local aVeiculo		:= PARAMIXB[11]
	Local aReboque		:= PARAMIXB[12]
	Local aNfVincRur	:= {}
	Local aEspVol		:= {}
	Local cTipo         := ""
	Local aNfVinc		:= PARAMIXB[15] //Ticket 3482240 (Error log NF4.0 - Array out of bounds - Homologação)
	
	
	

	Local aAreaSC5		:= SC5->(GetArea())
	Local aAreaSC6  	:= SC6->(GetArea())

	Local aRetorno		:= {}
	//Local cMsg 			:= ""
	Local cNomeVend 	:= ""
	//Local cTexto        := ""
	//Local cMenAtivo     := ""
	Local n_I			:= 0

	if len(PARAMIXB)>=13
		aNfVincRur := PARAMIXB[13]
	endif
	if len(PARAMIXB)>=14
		aEspVol := PARAMIXB[14]
	endif

	if Len(aNota)>=4
		cTipo := aNota[4]
	endif

	//Retirada do Codigo de Barra para produtos que não são PA pois estão com diveregencia
	For n_I := 1 to Len(aProd)
		DbSelectArea("SB1")
		DbSetOrder(1)
		DbSeek(xFilial("SB1") + aProd[n_I,2])

		If SB1->B1_TIPO <> "PA"
			aProd[n_I,3] := "" 
		Endif
	Next

	//If Len(aNota)>=4 .AND. (aNota[4] == "1") //cTipo == "1"
	If Len(aNota)>=4 .AND. cTipo == "1" //cTipo == "1"
		//If (aNota[4] == "1") //cTipo == "1"   

		// -------------------------------------
		// Dados da Carga, Caminhão e Motorista
		// -------------------------------------
		SD2->(dbSetOrder(3))
		SD2->(MsSeek(xFilial("SD2")+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA))
		dbSelectArea("SC5")
		dbSetOrder(1)
		SC5->(MsSeek(xFilial("SC5")+SD2->D2_PEDIDO))

		if SF2->F2_TIPO='N' //Somente NFe normal Claudio 12.02.14
			cNomeVend := Posicione("SA3",1,xFilial("SA3")+SF2->F2_VEND1,"A3_NOME")

			cDD := Posicione("SA3",1,xFilial("SA3")+SF2->F2_VEND1,"A3_DDDTEL")
			cFone := Posicione("SA3",1,xFilial("SA3")+SF2->F2_VEND1,"A3_TEL")

			If !EMPTY(SF2->F2_VEND1) .AND. !ALLTRIM(SF2->F2_VEND1) $ cMensCli
				If Len(cMensCli) > 0 .And. SubStr(cMensCli, Len(cMensCli), 1) <> " "
					cMensCli += " / "
				EndIf
				cMensCli += "VENDEDOR: " + ALLTRIM(SF2->F2_VEND1) + " - " + ALLTRIM(cNomeVend) + "("+cDD+") "+cFone
			EndIf

			/*
			If !EMPTY(SC5->C5_NUM) .AND. !ALLTRIM(SC5->C5_NUM) $ cMensCli
			If Len(cMensCli) > 0 .And. SubStr(cMensCli, Len(cMensCli), 1) <> " "
			cMensCli += " / "
			EndIf
			EndIf
			*/

			cMensCli += " / "
			cMensCli += "COD CLIENTE: " + SC5->C5_CLIENTE + " - " + SC5->C5_LOJACLI
			cMensCli += " / "
			cMensCli += "PEDIDO: " + SC5->C5_NUM
			cMensCli += " / "
			cMensCli += "TAB PRECO: " + SC5->C5_TABELA

			If !EMPTY(SF2->F2_CARGA).AND. !AllTrim(SF2->F2_CARGA)  $ cMensCli
				If Len(cMensCli) > 0 .And. SubStr(cMensCli, Len(cMensCli), 1) <> " "
					cMensCli += " / "
				EndIf
				cMensCli += "CARGA: " + SF2->F2_CARGA

				dbselectarea("DAK")
				DAK->( dbsetorder(1) )

				If alltrim(posicione("DAK",1,xFilial("DAK")+SF2->F2_CARGA,"DAK_MOTORI")) <> ""
					cMensCli += " / "
					cMensCli += "MOTORISTA: " + ALLTRIM(DAK_MOTORI) +" - " +AllTrim(posicione("DA4",1,xFilial("DA4")+DAK->DAK_MOTORI,"DA4_NOME"))
				EndIf

				If alltrim(posicione("DAK",1,xFilial("DAK")+SF2->F2_CARGA,"DAK_CAMINH")) <> ""
					cMensCli += " / "
					cMensCli += "CAMINHAO: " + AllTrim(posicione("DA3",1,xFilial("DA3")+DAK->DAK_CAMINH,"DA3_PLACA")) + " - " + AllTrim(posicione("DA3",1,xFilial("DA3")+DAK->DAK_CAMINH,"DA3_DESC"))
				EndIf

			EndIf
			cMensCli += " / "
			cMensCli += "N FANTASIA: " + Posicione("SA1",1,xFilial("SA1")+SF2->F2_CLIENTE+SF2->F2_LOJA,"A1_NREDUZ")
			cMensCli += " / "
			cMensCli += " F.PGTO:"+RetField("SCV",1,xFilial("SCV")+SC5->C5_NUM,"CV_FORMAPG")
			
			If ! Empty(SF2->F2_XCONTAI)
				cMensCli += " / "
				cMensCli += "Nro Container: " + SF2->F2_XCONTAI 
			Endif
							
			If ! Empty(SF2->F2_XLACRE)
				cMensCli += " / "
				cMensCli += "Nro Lacre: " + SF2->F2_XLACRE
			Endif
			
			If ! Empty(SF2->F2_XDADOS)
				cMensCli += " / "
				cMensCli += "Dados do Veiculo: " + SF2->F2_XDADOS
			Endif
			
			If ! Empty(SF2->F2_XARMAZ)
				cMensCli += " / "
				cMensCli += "End. Armazem Logística: " + SF2->F2_XARMAZ
			Endif
			
		Endif

		If SC5->(FieldPos("C5_XOBSNF")) > 0
			cMensCli += " / "
			cMensCli += SC5->C5_XOBSNF
		endif
		
		/*
		Posição 07 no nfesefaz, não estava sendo usado para nada 
		Alterado para levar Data ENTRADA/SAIDA diferente a da Emissão NF
		*/
		//aadd(aNota, IIF(Empty(SF2->F2_DTENTR),SF2->F2_EMISSAO,SC5->F2_DTENTR))
		aadd(aNota, IIF(Empty(SC5->C5_XDTDIF),SF2->F2_EMISSAO,SC5->C5_XDTDIF))

	Endif

	RestArea(aAreaSC5)
	RestArea(aAreaSC6)

	aadd(aRetorno,aProd)    //1
	aadd(aRetorno,cMensCli) //2
	aadd(aRetorno,cMensFis) //3
	aadd(aRetorno,aDest)    //4
	aadd(aRetorno,aNota)    //5
	aadd(aRetorno,aInfoItem)//6
	aadd(aRetorno,aDupl)    //7
	aadd(aRetorno,aTransp)  //8
	aadd(aRetorno,aEntrega) //9
	aadd(aRetorno,aRetirada)//10
	aadd(aRetorno,aVeiculo) //11
	aadd(aRetorno,aReboque) //12

	if len(PARAMIXB)>=13
		aadd(aRetorno,aNfVincRur) //13
	endif
	if len(PARAMIXB)>=14
		aadd(aRetorno,aEspVol) //14
	endif
	
	aadd(aRetorno,aNfVinc) //15
RETURN aRetorno
