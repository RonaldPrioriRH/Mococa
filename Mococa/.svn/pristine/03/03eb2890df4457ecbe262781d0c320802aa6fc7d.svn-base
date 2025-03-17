#include 'protheus.ch'
#include 'parmtype.ch'
#include "rwmake.ch"
#include 'topconn.ch'

//--------------------------------------------------------------------------------------------------------
/*/ {Protheus.doc}  RESTR002
Relatorio para Impressão de Etiquetas de Produção - Impressora Zebta
@author Luciano
@version 1.0
@since 06/07/2017
@return Nil
@obs 

@sample
U_RESTR002()
/*/
//--------------------------------------------------------------------------------------------------------

user function RESTR002()
	Local aArea		:= GetArea()
	Local nX		:= 0
	Local n_y		:= 0
	Local nCopias  	:= 1
	Local cLin		:= ""
	Local c_LtrMaq	:= ""
	Local c_Op		:= " "
	Private cPerg	:= "RESTR002"
	Private cPerg2	:= "RESTR00202"
	Private cEOL 	:= Chr(13)+Chr(10)
	Private cArqTemp	:= "C:\etiqueta\ETIQ_PALET.TXT"

	If Alltrim(FunName()) <> 'RESTR002'

		ValidPerg()

		IF !Pergunte(cPerg,.T.)
			Return
		Endif


		c_Op := SC2->C2_NUM+SC2->C2_ITEM+SC2->C2_SEQUEN

		//Posiciona registros
		dbSelectArea("SD4")
		dbSetOrder(1)
		MsSeek(xFilial("SD4")+SC2->C2_NUM+SC2->C2_ITEM+SC2->C2_SEQUEN)

		//Maquina
		dbSelectArea("CYB")
		dbSetOrder(1)
		if MsSeek(xFilial("CYB")+MV_PAR01)
			cMaquina	:= ALLTRIM(CYB->CYB_DSMQ)
			cCentroTrab := CYB->CYB_CDCETR
			c_LtrMaq := SubStr(CYB->CYB_X_LTMQ,1,1)

			if empty(c_LtrMaq)
				MsgInfo("Letra não cadastrada para a máquina informada. Verifique o cadastro da máquina !")
				return
			endif

			//Valida se a máquina informada é do mesmo Centro de Trabalho do Produto da OP
			nRecnoCYB := CYB->(Recno())
			sg2->(DbSetOrder(1))
			if !SG2->(DbSeek(FwxFilial("SG2")+SC2->C2_PRODUTO))
				MsgInfo("O Produto desta ordem de produção não possui roteiro de produção cadastrado !")
				return				
			else			
				if empty(SG2->G2_RECURSO) .or. empty(SG2->G2_CTRAB)
					MsgInfo("Recurso ou Centro de Trabalho não informado no roteiro de produção do produto desta Ordem de Produção !")
					return								
				else
					CYI->(DbSetOrder(1))
					if CYI->(DbSeek(FwxFilial("CYI")+cCentroTrab))   //CYB->(DbSeek(FwxFilial("CYB")+Alltrim(SG2->G2_RECURSO)))
						if Alltrim(CYI->CYI_X_CTEN) <> Alltrim(SG2->G2_CTRAB)
							MsgInfo("A máquina informada nos parâmetros desta rotina não é do mesmo Centro de Trabalho do recurso da Ordem de Produção selecionada !")
							return														
						endif
					else
						MsgInfo("O centro de trablaho informado no roteiro de produção do produto desta ordem de produção não é valido !")
						return													
					endif
				endif
			endif
			CYB->(DbGoTo(nRecnoCYB))
		else
			MsgInfo("Máquina informada não existe !")
			return
		endif

		//Produto
		dbSelectArea("SB1")
		dbSetOrder(1)
		MsSeek(xFilial("SB1")+SC2->C2_PRODUTO)

		cLote		:= mv_par05 + c_LtrMaq 
	Else
		//Maquina será preenchido pelo valid do pergunte
		cMaquina	:= ' '
		VldPrg2()

		IF !Pergunte(cPerg,.T.)
			Return
		Endif	

		c_LtrMaq := Substr(mv_par05,11,1)

		if Empty(cMaquina)
			cQuery := " Select CYB_DSMQ,CYB_CDCETR "
			cQuery += " From "
			cQuery += RetSqlName("CYB")+" "
			cQuery += " where "
			cQuery += " CYB_FILIAL ='"+FwxFilial("CYB")+"' and "
			cQuery += " CYB_X_LTMQ = '"+c_LtrMaq+"' AND D_E_L_E_T_ = ' ' "

			IF Select("QLetra") > 0
				qLetra->(DbCloseArea())
			endif

			TcQuery cQuery new alias "QLetra" 
			if !QLetra->(Eof())
				cMaquina    := QLetra->CYB_DSMQ
				cCentroTrab := QLetra->CYB_CDCETR
			else
				Alert("Máquina informada no Lote não existe !")
				QLetra->(DbCloseArea())
				return (.f.)
			endif
			QLetra->(DbCloseArea())			

		else

			cQuery := " Select CYB_CDCETR "
			cQuery += " From "
			cQuery += RetSqlName("CYB")+" "
			cQuery += " where "
			cQuery += " CYB_FILIAL ='"+FwxFilial("CYB")+"' and "
			cQuery += " CYB_DSMQ = '"+Alltrim(cMaquina)+"' AND D_E_L_E_T_ = ' ' "

			IF Select("QLetra") > 0
				qLetra->(DbCloseArea())
			endif

			TcQuery cQuery new alias "QLetra" 
			if !QLetra->(Eof())
				cCentroTrab := QLetra->CYB_CDCETR
			else
				Alert("Máquina informada no Lote não existe !")
				QLetra->(DbCloseArea())
				return (.f.)
			endif
			QLetra->(DbCloseArea())			
		endif


		nRecnoCYB := CYB->(Recno())
		sg2->(DbSetOrder(1))
		if !SG2->(DbSeek(FwxFilial("SG2")+mv_par01))
			MsgInfo("O Produto informado nos parâmetros desta rotina não possui roteiro de produção cadastrado !")
			return				
		else			
			if empty(SG2->G2_RECURSO) .or. empty(SG2->G2_CTRAB)
				MsgInfo("Recurso ou Centro de Trabalho paramtrizado no roteiro de produção do produto informado nos parametros não é valido  !")
				return								
			else
				CYI->(DbSetOrder(1))
				if CYI->(DbSeek(FwxFilial("CYI")+cCentroTrab))   //CYB->(DbSeek(FwxFilial("CYB")+Alltrim(SG2->G2_RECURSO)))
					if Alltrim(CYI->CYI_X_CTEN) <> Alltrim(SG2->G2_CTRAB)
						MsgInfo("A máquina informada nos parâmetros não é do mesmo Centro de Trabalho da Máquina informada no Lote")
						return														
					endif
				else
					MsgInfo("O centro de trablaho informado no roteiro do produto informado  não é valido !")
					return													
				endif
			endif
		endif
		CYB->(DbGoTo(nRecnoCYB))



		//Produto
		dbSelectArea("SB1")
		dbSetOrder(1)
		MsSeek(xFilial("SB1") + MV_PAR01)

		cLote		:= mv_par05

	Endif

	If !U_VlPrgEtq ('V',c_LtrMaq)
		Return
	Endif

	cProduto	:= ALLTRIM(Substr(SB1->B1_DESC,1,40))
	c_CodPro	:= ALLTRIM(Substr(SB1->B1_COD,1,08))

	cProducao	:= Substr(cLote,3,3)
	cCodBar		:= c_CodPro + cLote

	dFabricacao := DTOC(dDatabase)
	dVencimento := DTOC(DaySum( dDatabase , SB1->B1_PRVALID ) )
	cArqTemp := MV_PAR04

	nCopias := MV_PAR03
	nPalete := MV_PAR02






	nHdl := fCreate(cArqTemp)

	for nX:= 1 to nCopias

		DbSelectArea("Z0D")

		RecLock("Z0D",.T.)
		Z0D->Z0D_FILIAL		:= xFilial("Z0D")
		Z0D->Z0D_PRODUT		:= c_CodPro
		Z0D->Z0D_LOTE		:= cLote
		Z0D->Z0D_PALLET		:= strzero(nPalete,4)
		Z0D->Z0D_USER		:= cUserName
		Z0D->Z0D_DATA		:= Date()
		Z0D->Z0D_HORA		:= Time()
		Z0D->Z0D_ETQ		:= cCodBar + strzero(nPalete,4)
		Z0D->Z0D_OP			:= c_Op

		MsUnLock()

		For n_y := 1 to MV_PAR06
			//Modelo 10x15 - Etiqueta Palete V.2
			cLin := "CT~~CD,~CC^~CT~" + cEOL
			cLin += "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR4,4~SD15^JUS^LRN^CI0^XZ" + cEOL
			cLin += "^XA" + cEOL
			cLin += "^MMT" + cEOL
			cLin += "^PW863" + cEOL
			cLin += "^LL1244" + cEOL
			cLin += "^LS0" + cEOL
			cLin += "^FO620,50^GFA,6456,6456,24,,:U01F8,T01FFC,S01IFE,R01KF,Q01LF,Q0MF8,P0KFC1F8,O0KFE01F8,N0KFE001FC," + cEOL
			cLin += "M07JFEJ0FC,L03JFEK0FE,L07IFEL07E,L0IFEM07F,L0IFN03F,L0FFO03F,K01F8O03F8,K01FCO01F8,L0FCO01F8," + cEOL
			cLin += "L0FCP0FC,L0FEP0FC,L07FK0CJ0FC,L07FJ07CI01FC,L03FI0FFJ07FC,L03F807FEJ0FFC,L01F87FF8I01FF8,L01KFJ07FF," + cEOL
			cLin += "M0JFEJ0FFE,M0JF8I01FF8,M07IFJ07FF8,M07FFEJ0KF,M03FF8I01KF8,M01FFJ07KFC,N0FEJ0LFE,M01F8I01LFE,M01F8I03MF," + cEOL
			cLin += "M01F8O03F,N0FCO03F,:N0FEO01F8,N07EO01F8,:N03FP0FC,::N01F9KFJ0FC,N01LFCJ07E,N01LFK07E,O0KF8K07E,O0KFL03F," + cEOL
			cLin += "O07IFCL03F,O03FFEM0FF,O01FF8L03FF,O03FEM0FFE,O03F8L03FFE,O03FL01IFC,O03FL07IF,O03F8J03IFC,O01F8J0JF," + cEOL
			cLin += "O01F8I03IFE,O01F8I0KF,P0FC003KFC,P0FC01LFE,P0FC07MF8,P0FC1IFC03FFC,P0FEIFCI07FE,P07JFJ01FF,P07IFEK0FF8," + cEOL
			cLin += "P07IF8K03FC,P03IFL01FC,P01FFEM0FE,Q0FFCM0FF,Q03F8M07F,Q03FN03F,I01I06I03FN01F8O01C,I01800CI07EN01F8O066," + cEOL
			cLin += "I03801CI07EN01FCO0C1F8,I03C078I07EI03FCI0FCO0803C,I07C0F8I0FEI0IFI0FCM03D801EM07C," + cEOL
			cLin += "I07C3FJ0FC003IF8007EM0770013L03FE,I07E7FJ0FC003IFC007EM0C10021K03F06,I0JFJ0FC007IFC007EL018E0041J01F006," + cEOL
			cLin += "I0IFEJ0FC007IFE003EL019E03C1J07I04,I0IFEJ0FC00FF07E003EJ0IF8C03818I0EI0C,001F8L0FC00FE07E003E001JF0803818I0CI0C," + cEOL
			cLin += "001F3IF800FC00FE07E003E00KF28310180018I08,001E7IF800FE00FE07E003E07KF3031016001I058," + cEOL
			cLin += "001E7IF800FE007F1FE003E1FFE0063011007003I09,003D7IF800FE007IFE003E7FEI063002003F0300F9," + cEOL
			cLin += "003F7IF8007E003IFC003IFJ063002001FF707F3,003BJF8007E003IF8003FF8J061K01FC1DFE3,003EJFI07F001IFI03FFK03M0F91FFC2," + cEOL
			cLin += "0036JFI03FI07FCI07F8K018804I079BBE06,003EJFI03FO07FM0C01CI03939C0C,002EJFI03F8N07EM06008I01073C1C," + cEOL
			cLin += "001EF80FI03F8N0FCM03M07F7C3,001EF007I01FCN0FCM03M01FE26,003EF007I01FEM01FCM03P03C,J0F3E7J0FFM01F8M070CN031E," + cEOL
			cLin += "J0F1C7J07FM03F8M0F08001K0171,J0F80FJ07F8L07FM01EQ0C08,J0FC1FJ03FEL0FFM03EK04K04C8,J0JFJ01FFK01FE7FF8001FEK02K04E8," + cEOL
			cLin += "J0JFK0FF8J07LFE3FFEK01K0328,J0F007K0IFI01JF83KFEK018J0108,J0F007K03FFE01JFE00KFEP04194,J0F327K01OF8007E3FFCR08C," + cEOL
			cLin += "J0F327L0NFEK03FFCP0904,J0F327L07MFCK07FFC2O0804,J0JFL07MFCJ01IFC708M0204,J0JFL0IFE0IFEJ03IFEF08I022J08," + cEOL
			cLin += "J0FFC7K01FF8I03FFL03FEF0CI021J08,J0FB87K03FEK0FF8L0IF8CI0A080018,J0F913K07F8K07FCL0IF8C003808001," + cEOL
			cLin += "J078338J0FFL01FEL0IFC60038J03,J078378J0FEM0FEL0IFC6003804002,J07C7F8I01FCM0FFL0IFE6001005002,J07IF8I01F8M07FL0JF7001001006," + cEOL
			cLin += "J07FE38I03F8M03F8FF800FEIFK01006,J07C038I03FN03JFE01FF7FF8M04,J038038I03FN01OF7FF8M04,J03CFB8I07EN01OF3FFCM0C," + cEOL
			cLin += "J03CF38I07EO0OF9FFEL038,J03C03CI07EI03FEI0OFCIFL0F,J03E07CI07EI0IFI0OFE7FF8I01F8,J03IFCI0FE001IF8007OFBIFI033028," + cEOL
			cLin += "J03IFCI0FC003IFC007OFEIFC007305,J03FC1CI0FC007IFE007TFDFF30B,J03E01CI0FC007F9FE007WF3E6,J01E08EI0FC007E07E007WF9CC," + cEOL
			cLin += "J01ECCEI0FC007E07F007IF7NFE00C1818,J01E6DEI0FC00FE03F007IF3NFE00C0E3,J01E7FEI0FC00FE03F007IF9MF061040FE," + cEOL
			cLin += "J01IFEI0FE007E03E007IF87LF0C1061E,J01IFEI07E007E07E007IFC3LF083831E,K0IFEI07E007E07E007IFC0JF1C083831E," + cEOL
			cLin += "K0IFEI07E007F07E007IFE01IF80103C11E,K0JFI07E007F0FE007IFE003FF80103C11E,K0JFI07F007F0FE007JFI07F00303E19C," + cEOL
			cLin += "K0FFCFI03KF0IF8KFM0303E09C,K0FFC7I03SFE2M0201E09C,K0F807I03SFCN0201F0BC,K07007I01SFCN0700F1BC,K07IF8001SF8N0F0071B8," + cEOL
			cLin += "K07IF8I07PFC4N03F0071F8,K07IF8I01PF8L03JF0033F8,K07F878I03FFE003JF8K01KF8033F,K079038I07FEJ07IF8K03KFC027F," + cEOL
			cLin += "K079338I0FF8J03IF8K03KFC00FF,K078038I0FFL0IF8K03KFE00FE,K07C078001FEL07FF8K03LF01FE,K07IF8003FCL03FFL01LF01FC," + cEOL
			cLin += "K03IF8003F8L01FEL01LF81FC,K03FE78007FN0FEK01MF83F8,K03FE38007EN07EK03MFC3F8,K03C038007EN07EK07MFC7F,K03C03800FCN03FK07MFEFE," + cEOL
			cLin += "K03IF800FCN03FK07OFE,K03IF800FCI038I03FI0F07OFC,K03IF801FC001FF8001FB83FC3OF8,K03DC7801F8007FFE001KFE3OF," + cEOL
			cLin += "K03983801F800JF001UFE,K039B3801F800JF800FBSFE,J073C03801F801JF800F9SFC,J07BC03801F801FCFF800F8SF8,J07BF0F803F801F81FC00F8SF," + cEOL
			cLin += "J0BBIF803F803F81FC00F87QFE,J0BJF803F801F81FC00F87QF8,J0BJF803F801FC1FC00FC3QF,J0F7IF801F801JF800FE1PFE," + cEOL
			cLin += "I01F7IF801F800JF801FF8PF8,I01D7IF801F800JF801FFEPF,I01D7IF801F8007IF001RFC,I01E7IF801FC001FFE001F9PF,I01E7IFI0FCI07F8001F87NFC," + cEOL
			cLin += "I03E7IFI0FCN03F00MFE,I03EM0FEN03F001LF,I03IF8J07EN07FJ0IFE,I03IF8J07FN07E,I07IFK03F8M0FE,I07E7FK03FCM0FE," + cEOL
			cLin += "I07C3FK01FEL01FC,I0F83EK01FFL03F8,I0E01EL0FF8K07F8,001C00CL07FCK0FF,001I0CL03FFJ01FE,S07FFEI07FC,S0JFC03FFC,R03OF8,R0OFE," + cEOL
			cLin += "Q01OFC,Q03FFC007IF,Q07FEJ0FFE,Q0FF8J03FE,Q0FFL0FF,P01FEL07F8,P01FCL03F8,P03F8L01FC,P07FN0FE,:P0FEN07F,:P0FCN03F,P0FCN03F8," + cEOL
			cLin += "O01F8001FFI01F8,O01F8007FFC001F8,O01F800IFE001F8,O01F800JF001F8,O03F001JF001F8,O03F001FEFF801F8,O03F003F83F801F8," + cEOL
			cLin += "O03F003F81F801F8,O03F003F01F801F8,O07F003F01F801F8,:O0FF803F03F801F8,O0IFC3F03F801F8,O0LF07F003F,N01FCIFE07F003F," + cEOL
			cLin += "N01FC3FFE0FE003F,N01F81FFE0FE007F,N03F80IF8FC007E,N03F807FFCFF007E,N03F803KFC0FE,N07FI0LF8FC,N07FI07MFC,N0FFI03MF8," + cEOL
			cLin += "N0FEJ0MF8,N0FFJ07LF,N0FF8I03FFCIF,N0FFCI01FFE3FC,N07FEJ0IF0F8,N07FEJ03FF8,N03FEJ01FFC,N01FCK0FFE,N01FCK07FF," + cEOL
			cLin += "N01FCK03FF8,N0FF8K01FFC,M07FF8018I07FE,M0IF001CI03FF,L01IF001EI01FF,L01IF003FJ0FF8,L03FFE003F8I07F8,L03F9E007FCI03F8," + cEOL
			cLin += "L03FJ07FFI07F,L07FL01I07F,L07EP07F,L0FEP0FE,:L0FCO01FC,K01FCO01FC,K01F8O01FC,K03F8O03F8,K03FP03F8,K03F8O07F,K03KFL07F," + cEOL
			cLin += "K03NF8007F,K01RFE,:L0RFC,L03QF8,N07OF8,S07IFE,,::::^FS" + cEOL
			cLin += "^BY3.5,3,150^FT65,50^BCR,,Y,N" + cEOL
			cLin += "^FD>:" + cCodBar + strzero(nPalete,4) + "^FS" + cEOL
			cLin += "^BY4,3,150^FT350,54^BCR,,Y,N" + cEOL
			cLin += "^FD>:" + cLote + "^FS" + cEOL
			cLin += "^FT280,350^A0R,25,24^FH\^FDLOTE^FS" + cEOL
			if c_Op <> " "
				cLin += "^BY4,2,150^FT350,870^BCR,,Y,N" + cEOL
				cLin += "^FD>;"+ SC2->C2_NUM +"^FS" + cEOL
				cLin += "^FT280,990^A0R,25,24^FH\^FDO.P.^FS" + cEOL
			Endif
			cLin += "^BY4,3,150^FT640,330^BCR,,Y,N" + cEOL
			cLin += "^FD>;" + c_CodPro + "^FS" + cEOL
			cLin += "^FT550,50^A0R,39,43^FH\^FD" + cProduto + "^FS" + cEOL
			cLin += "^FT750,750^A0R,25,24^FH\^FDProdu\87\C6o^FS" + cEOL
			cLin += "^FT700,750^A0R,40,50^FH\^FD" + cProducao + "^FS" + cEOL
			cLin += "^FT750,860^A0R,25,24^FH\^FDPalete^FS" + cEOL
			cLin += "^FT700,860^A0R,40,50^FH\^FD" + transform(nPalete,"9999") + "^FS" + cEOL
			cLin += "^FT750,950^A0R,25,24^FH\^FDMaquina:^FS" + cEOL
			cLin += "^FT700,950^A0R,28,28^FH\^FD" + Alltrim(cMaquina) + "^FS" + cEOL
			cLin += "^FT650,750^A0R,25,24^FH\^FDDt. Fabrica\87\C6o:^FS" + cEOL
			cLin += "^FT650,910^A0R,28,28^FH\^FD" + dFabricacao + "^FS" + cEOL
			cLin += "^FT620,750^A0R,25,24^FH\^FDDt. Vencimento:^FS" + cEOL
			cLin += "^FT620,910^A0R,28,28^FH\^FD" + dVencimento + "^FS" + cEOL
			cLin += "^FT550,1210^A0N,20,19^FH\^FDImpresso em: "+ DtoC(Z0D->Z0D_DATA) + "-" + Z0D->Z0D_HORA +"^FS" + cEOL
			cLin += "^PQ1,0,1,Y^XZ" + cEOL
			cLin := cLin + cEOL

	MemoWrite( "C:\etiqueta\ETIQUETA.txt", cLin )

			fWrite(nHdl,cLin,Len(cLin))

		Next n_y

		nPalete++
	next nX
	fClose(nHdl)

	RestArea(aArea)
return


Static Function ValidPerg()
	Local _sAlias,i,j
	_sAlias := GetArea()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)
	aRegs:={}

	AADD(aRegs,{cPerg,"01","Máquina           ?","","","mv_ch1","C",06,00,00,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","CYB",""})
	AADD(aRegs,{cPerg,"02","Palete Inicial    ?","","","mv_ch2","N",03,00,00,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"03","Quantidade        ?","","","mv_ch3","N",03,00,00,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"04","Porta de impressão?","","","mv_ch4","C",04,00,00,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"05","Lote              ?","","","mv_ch5","C",10,00,00,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"06","Nro Copias        ?","","","mv_ch6","N",01,00,00,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","",""})


	For i:=1 to Len(aRegs)
		//Retirado Sangelles 22/03/2022 ->If !dbSeek(cPerg+aRegs[i,2])
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		//cQry := " SELECT * FROM " 				  + cPulaLinha
		//cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry := " SELECT * FROM SX1010 SX1 " + cPulaLinha
		cQry += " WHERE " 	
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+ "' "	+ cPulaLinha
		//cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next j

			MsUnlock()
			dbCommit()
		endIf
	Next i

	RestArea(_sAlias)
Return

Static Function VldPrg2()
	Local _sAlias,i,j
	_sAlias := GetArea()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg2,10)
	aRegs:={}

	AADD(aRegs,{cPerg,"01","Produto           ?","","","mv_ch1","C",08,00,00,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SB1",""})
	AADD(aRegs,{cPerg,"02","Palete Inicial    ?","","","mv_ch2","N",03,00,00,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"03","Quantidade        ?","","","mv_ch3","N",03,00,00,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"04","Porta de impressão?","","","mv_ch4","C",04,00,00,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"05","Lote              ?","","","mv_ch5","C",11,00,00,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","",""})
	AADD(aRegs,{cPerg,"06","Nro Copias        ?","","","mv_ch6","N",01,00,00,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","",""})

	For i:=1 to Len(aRegs)
		//Retirado Sangelles 22/03/2022 ->If !dbSeek(cPerg+aRegs[i,2])
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		//cQry := " SELECT * FROM " 				  + cPulaLinha
		//cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry := " SELECT * FROM SX1010 SX1 " + cPulaLinha
		cQry += " WHERE " 	
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		//cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next j

			MsUnlock()
			dbCommit()
		endIf
	Next i

	RestArea(_sAlias)
Return

User Function VlPrgEtq (c_Tp,c_LtrMaq)
	Local c_Qry := ""
	Local n_Op := 0
	Local c_Txt := ""
	Local c_Prod := ""
	Local c_Lote := ""
	//Local c_Maq  := ""

	if Alltrim(FunName()) <> 'RESTR002' // Chamada pela Impressão de OP


		c_Prod	:= SC2->C2_PRODUTO
		c_Lote	:= MV_PAR05

	else

		c_Prod	:= MV_PAR01
		c_Lote	:= Substr(MV_PAR05,1,10)
	endif


	if valtype(c_LtrMaq) == "U"
		if Alltrim(FunName()) <> 'RESTR002'
			dbSelectArea("CYB")
			dbSetOrder(1)
			if MsSeek(xFilial("CYB")+MV_PAR01)
				c_LtrMaq := SubStr(CYB->CYB_X_LTMQ,1,1)
				if empty(c_LtrMaq)
					MsgInfo("Letra não cadastrada para a máquina informada. Verifique o cadastro da máquina !")
					return(.t.)
				endif
			else
				MsgInfo("Máquina informada não existe !")
				//return(.t.)
			endif

		else
			c_LtrMaq := Substr(mv_par05,11,1)
			cQuery := " Select CYB_DSMQ "
			cQuery += " From "
			cQuery += RetSqlName("CYB")+" "
			cQuery += " where "
			cQuery += " CYB_FILIAL ='"+FwxFilial("CYB")+"' and "
			cQuery += " CYB_X_LTMQ = '"+c_LtrMaq+"' AND D_E_L_E_T_ = ' ' "

			IF Select("QLetra") > 0
				qLetra->(DbCloseArea())
			endif

			TcQuery cQuery new alias "QLetra" 
			if !QLetra->(Eof())
				cMaquina := QLetra->CYB_DSMQ
			else
				Alert("Máquina informada no Lote não existe !")
				QLetra->(DbCloseArea())
				return (.f.)
			endif
			QLetra->(DbCloseArea())			



		endif

	endif





	c_Qry := "SELECT MAX(Z0D_PALLET) AS M "
	c_Qry += " FROM "+RetSqlName("Z0D")+" "
	c_Qry += " WHERE D_E_L_E_T_ = ' ' "
	c_Qry += " AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
	c_Qry += " AND Z0D_PRODUT = '"+ c_Prod +"' "
	//c_Qry += "AND SUBSTR(Z0D_LOTE,1,10) = '"+ c_Lote +"' "
	c_Qry += " AND SUBSTR(Z0D_LOTE,1,11) = '"+ c_Lote+c_LtrMaq+"' "
	//c_Qry += "AND Z0D_PALLET BETWEEN '"+ StrZero(M->MV_PAR02,4) +"' AND '"+ StrZero(M->MV_PAR02 + M->MV_PAR03 -1,4) +"'"

	PlsQuery(c_Qry, "_Q01")
	If c_Tp = 'P'
		If !Eof() .AND. _Q01->M <> ' '
			n_Op := Aviso("Atenção","Numero do Palete inicial já impresso. Ultimo Nro de Palete impresso foi: " + _Q01->M + cEOL + "Deseja ajustar?",{"Sim","Não"})

			If n_Op = 1
				M->MV_PAR02 := Val(_Q01->M) + 1
			Endif
		Endif
	Else
		If !Eof()
			_Q01->(DbCloseArea())

			c_Qry := "SELECT Z0D_ETQ, COUNT(1) AS Q "
			c_Qry += "FROM Z0D010 "
			c_Qry += "WHERE D_E_L_E_T_ = ' ' "
			c_Qry += "AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
			c_Qry += "AND Z0D_PRODUT = '"+ c_Prod +"' "
			c_Qry += "AND SUBSTR(Z0D_LOTE,1,11) = '"+ c_Lote+c_LtrMaq +"' "
			c_Qry += "AND Z0D_PALLET BETWEEN '"+ StrZero(M->MV_PAR02,4) +"' AND '"+ StrZero(M->MV_PAR02 + M->MV_PAR03 -1,4) +"' "
			c_Qry += "GROUP BY Z0D_ETQ "
			c_Qry += "ORDER BY Z0D_ETQ"

			PlsQuery(c_Qry, "_Q01")
			If ! Eof()
				c_Txt := ""
				While ! Eof()

					c_Txt += _Q01->Z0D_ETQ + " --> Impressa " + StrZero(_Q01->Q,2) + " x" + cEOL
					DbSelectArea("_Q01")
					DbSkip()
				EndDo
				n_Op := Aviso("Atenção","Será reimpressa Etiquetas abaixo. " + cEOL + "Deseja continuar?"+ cEOL + c_Txt,{"Sim","Não"})

				If n_Op = 2
					Return .F.
				Endif
			Endif
		Endif
	Endif

	_Q01->(DbCloseArea())
Return .T.


User function SldZ0D(c_Etq)
	Local a_Area := GetArea()
	Local n_Ret := 0
	Local c_Qry := ""

	c_Qry := "SELECT * FROM Z0D010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' "
	c_Qry += "AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
	c_Qry += "AND Z0D_ETQ = '"+ c_Etq +"' "
	c_Qry += "ORDER BY Z0D_DATA, Z0D_HORA "

	PlSQuery(c_Qry,"_SZ0D")

	If ! Eof()
		n_Ret := _SZ0D->Z0D_QTD
	Endif

	_SZ0D->(DbCloseArea()) 
	RestArea(a_Area)
Return n_Ret

User function VerZ0D(c_Etq)
	Local a_Area := GetArea()
	Local l_Ret := .T.
	Local c_Qry := ""
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 

	U_DecEtq(c_Etq, @c_Prd, @c_Lt, ,@c_Plt)

	c_Qry := "SELECT * FROM Z0D010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' "
	c_Qry += "AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
	c_Qry += "AND Z0D_ETQ = '"+ c_Etq +"' "
	c_Qry += "ORDER BY Z0D_DATA, Z0D_HORA "

	PlSQuery(c_Qry,"_SZ0D")

	If ! Eof()
		If _SZ0D->Z0D_BLQCQ = '1'
			l_Ret := .F.
		Endif
	Else
		DbSelectArea("Z0D")

		RecLock("Z0D",.T.)
		Z0D->Z0D_FILIAL		:= xFilial("Z0D")
		Z0D->Z0D_PRODUT		:= c_Prd
		Z0D->Z0D_LOTE		:= c_Lt
		Z0D->Z0D_PALLET		:= c_Plt
		Z0D->Z0D_USER		:= cUserName
		Z0D->Z0D_DATA		:= Date()
		Z0D->Z0D_HORA		:= Time()
		Z0D->Z0D_ETQ		:= c_Etq


		MsUnLock()
	Endif

	_SZ0D->(DbCloseArea()) 
	RestArea(a_Area)
Return l_Ret

User function BlqZ0D(c_Etq)
	Local a_Area := GetArea()
	Local l_Ret := .F.
	Local c_Qry := ""

	c_Qry := "SELECT R_E_C_N_O_ AS RECZ0D FROM Z0D010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' "
	c_Qry += "AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
	c_Qry += "AND Z0D_ETQ = '"+ c_Etq +"' "
	c_Qry += "ORDER BY Z0D_DATA, Z0D_HORA "

	PlSQuery(c_Qry,"_SZ0D")

	If ! Eof()

		DbSelectArea("Z0D")
		DbGoTo(_SZ0D->RECZ0D)
		RecLock("Z0D",.F.)

		Z0D->Z0D_BLQCQ	:= Iif(Z0D->Z0D_BLQCQ = '1','2','1')
		Z0D->Z0D_BLDT	:= Date()
		Z0D->Z0D_BLHR	:= Time()
		Z0D->Z0D_BLUSE	:= cUserName

		MsUnLock()
		l_Ret := .T.
	Endif

	_SZ0D->(DbCloseArea()) 
	RestArea(a_Area)
Return l_Ret

User function QtdZ0D(c_Etq, n_Qtd)
	Local a_Area := GetArea()
	Local l_Ret := .F.
	Local c_Qry := ""
	Local c_Prd := ""
	Local c_Lt := ""
	Local c_Plt := "" 
	Local n_QB5 := 0

	U_DecEtq(c_Etq, @c_Prd, @c_Lt, ,@c_Plt)

	n_QB5 := Posicione("SB5", 1, xFilial("SB5") + c_Prd, "B5_QEL")

	if n_Qtd > n_QB5 
		VtClear()
		VTAlert("Quantidade informada não pode ser maior que 1 palete (" + StrZero(n_QB5,3) + ")","Falha")
		Return .F.
	Endif

	c_Qry := "SELECT R_E_C_N_O_ AS RECZ0D FROM Z0D010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' "
	c_Qry += "AND Z0D_FILIAL = '"+ xFilial("Z0D") +"' "
	c_Qry += "AND Z0D_ETQ = '"+ c_Etq +"' "
	c_Qry += "ORDER BY Z0D_DATA, Z0D_HORA "

	PlSQuery(c_Qry,"_SZ0D")

	If ! Eof()
		DbSelectArea("Z0D")
		DbGoTo(_SZ0D->RECZ0D)
		RecLock("Z0D",.F.)

		Z0D->Z0D_QTD := n_Qtd

		MsUnLock()
		l_Ret := .T.
	Endif

	_SZ0D->(DbCloseArea()) 
	RestArea(a_Area)
Return l_Ret

//User Function ASX3Z0D()
//
//	RPCCLEARENV()
//	RPCSetType(3)
//	RPCSetEnv("01","0101","","","","",{})
//
//	
//	X31UpdTable("Z0D")
//	If __GetX31Error()
//		MsgAlert("Ocorreu um erro na atualização da tabela (" + "Z0D" + ") : " + CHR(13) + CHR(10) + __GetX31Trace(),"tESTE")
//		
//	Endif 
//Return
