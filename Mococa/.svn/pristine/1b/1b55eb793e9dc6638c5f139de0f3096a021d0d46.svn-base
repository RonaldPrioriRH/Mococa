#include 'protheus.ch'
#include 'parmtype.ch'

user function RACDR001(c_EtqFrac)
	Local cLocImp := GetMv("MV_XIMPFRA")
	Local n_Linha := 0
	Local c_Etq := ""
	Local c_Qry := ""

	//c_EtqFrac := "FRAC000002"

//	RPCCLEARENV()
//	RPCSetType(3)
//	RPCSetEnv("01","0103","","","","",{})
//	c_EtqFrac := "FRAC000001"
	
	
	cLocImp := AllTrim(GetMv("MV_XIMPFRA"))


	c_Qry := "SELECT Z0B_PRODUT, Z0B_LOTE, Z0B_PALLET, B1_DESC, Z0B_QTD "
	c_Qry += "FROM Z0B010 Z0B, SB1010 SB1 "
	c_Qry += "WHERE Z0B.D_E_L_E_T_ = ' ' AND SB1.D_E_L_E_T_ = ' ' "
	c_Qry += "AND Z0B_FILIAL = '"+ xFilial("Z0B") +"' "
	c_Qry += "AND B1_FILIAL = '"+ xFilial("SB1") +"' "
	c_Qry += "AND B1_COD = Z0B.Z0B_PRODUT "
	c_Qry += "AND Z0B_CODIGO = '"+ c_EtqFrac +"'"
	c_Qry += "AND Z0B_STATUS <> '4' "

	PlSQuery(c_Qry,"_Q01")

	If !Eof()

		If ! CB5SetImp(cLocImp)  
			MsgAlert("Local de Impressão " + cLocImp + " nao Encontrado!(MV_XIMPFRA)") //"Local de Impressão "###" nao Encontrado!"
			_Q01->(DbCloseArea())
			Return .f.
		Endif

		//MSCBLOADGRF("SIGA.GRF")
		MSCBBEGIN(1,6)
		MSCBSAY(05,5,"PALETE FRACIONADO","N","A","032,035")
		MSCBSAYBAR(32,13,c_EtqFrac,"N",'MB07',15,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)

		n_Linha := 35

		While ! Eof()
			c_Etq := AllTrim(_Q01->Z0B_PRODUT)
			c_Etq += _Q01->Z0B_LOTE
			c_Etq += StrZero(Val(_Q01->Z0B_PALLET),4)


			MSCBSAY(5,n_Linha,_Q01->B1_DESC,"N","A","020,015")
			MSCBSAY(82,n_Linha,"Qtd: " + AllTrim(Str(_Q01->Z0B_QTD)),"N","A","030,020")
			n_Linha += 5
			MSCBSAYBAR(15,n_Linha,c_Etq,"N",'MB07',10,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)
			n_Linha += 15

			DbSkip()
		EndDo

		_Q01->(DbCloseArea())

		//MSCBBOX(30,05,76,05)
		//MSCBBOX(02,12.7,76,12.7)
		//MSCBBOX(02,21,76,21)
		//MSCBBOX(30,01,30,12.7,3)
		//MSCBGRAFIC(2,3,"SIGA")
		//MSCBSAY(33,02,'CAIXA',"N","0","025,035")
		//MSCBSAY(33,06,"CODIGO","N","A","012,008")
		//MSCBSAY(33,08, AllTrim(SB1->B1_COD), "N", "0", "032,035")

		///MSCBSAY(05,17,SB1->B1_DESC,"N", "0", "020,030")

		//MSCBInfoEti("Produto Granel","30X100")
		MSCBEND()

		MSCBCLOSEPRINTER()
	Endif     
Return


User Function CBrEnd()
	Local cLocImp := "COO"
	Local n_Linha := 5
	Local c_Qry := ""
	Local cTipoEtq
	Local aRet 	 := {}
	Local aPergs := {}
	

	//	RPCCLEARENV()
	//	RPCSetType(3)
	//	RPCSetEnv("01","0103","","","","",{})

	If !Pergunte("AII020",.T.)
		Return
	Endif

	cLocImp := MV_PAR05


	If ! CB5SetImp(cLocImp)  
		MsgAlert("Local de Impressão " + cLocImp + " nao Encontrado!") //"Local de Impressão "###" nao Encontrado!"
		_Q01->(DbCloseArea())
		Return .f.
	Endif

	c_Qry := "SELECT * FROM SBE010 "
	c_Qry += "WHERE D_E_L_E_T_ = ' ' " 
	c_Qry += "AND BE_FILIAL = '"+ xFilial("SBE") +"' "
	c_Qry += "AND BE_LOCAL BETWEEN '"+ MV_PAR01 +"' AND '"+ MV_PAR02 +"' "
	c_Qry += "AND BE_LOCALIZ BETWEEN '"+ MV_PAR03 +"' AND '"+ MV_PAR04 +"' "
	c_Qry += "ORDER BY BE_LOCAL, BE_LOCALIZ"


	PlSQuery(c_Qry,"_Q01")


	aPergs:= {}
	aRet := {} 
	aAdd( aPergs ,{2,"Modelo da Etiqueta: ","Logistica", {"Logistica", "Almoxarifado"}, 50,'.T.',.T.})  
	 
	If ! ParamBox(aPergs ,"Parametros ",@aRet)    		     
		Return 
	EndIf    
	
	
	cTipoEtq := Alltrim(aRet[1])

	While ! Eof()

		MSCBBEGIN(1,6)
		n_Linha := 5

		if cTipoEtq == "Logistica" // Etiqueta para Logistica
			MSCBSAY(10,5,_Q01->(BE_LOCAL + "-" + BE_LOCALIZ),"N","A","032,035")
			n_Linha += 10
			MSCBSAYBAR(10,n_Linha,_Q01->(BE_LOCAL + BE_LOCALIZ),"N",'MB07',15,.F.,.T.,.F.,,3,3,.F.,.F.,"1",.T.)
		elseif cTipoEtq == "Almoxarifado" //Etiqueta para almoxarifado
			MSCBSAY(10,5,_Q01->(BE_LOCAL + "-" + BE_LOCALIZ),"N","A","018,026")
			n_Linha += 4
			MSCBSAYBAR(10,n_Linha,_Q01->(BE_LOCAL + BE_LOCALIZ),"N",'MB07',12,.F.,.T.,.F.,,2.2,3,.F.,.F.,"1",.T.)	
		endif	
		//			n_Linha += 35
		//		MSCBSAYBAR(10,n_Linha,_Q01->(BE_LOCAL + BE_LOCALIZ),"N",'MB07',15,.F.,.T.,.F.,,2,3,.F.,.F.,"1",.T.)
		//			n_Linha += 35
		//		MSCBSAYBAR(10,n_Linha,_Q01->(BE_LOCAL + BE_LOCALIZ),"N",'MB07',15,.F.,.T.,.F.,,2,2,.F.,.F.,"1",.T.)
		//	n_Linha += 35
		//	MSCBSAYBAR(32,n_Linha,'000032',"N",'MB07',15,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)
		//	n_Linha += 35
		//	MSCBSAYBAR(32,n_Linha,'000039',"N",'MB07',15,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)
		//	n_Linha += 25
		//	MSCBSAYBAR(32,n_Linha,'R01-B-05',"N",'MB07',15,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)
		//	n_Linha += 25
		//	MSCBSAYBAR(32,n_Linha,'A PR.01 AN.03',"N",'MB07',15,.F.,.T.,.F.,,2,1,.F.,.F.,"1",.T.)



		MSCBEND()
		DBSelectArea("_Q01")
		DbSkip()
	EndDo

	MSCBCLOSEPRINTER()
	_Q01->(DbCloseArea())
Return
