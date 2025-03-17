#include 'protheus.ch'
#include 'parmtype.ch'

User Function DL200TR2()
	Public n_X_Ind := 0 
	nIndice++
	
	n_X_Ind := nIndice
	
	PARAMIXB[1]:AddIndex(AllTrim(STR(n_X_Ind)), {"PED_CARGA","PED_PEDIDO"} )
	
	nIndice++
Return



//user function DL200TR2()
////	Local c_Name := ParamIXB[1]:GetRealName()
//	Local a_Area := GetArea()
//
//	//add pois não estava dando tempo de apagar a tabela fisicamente no banco
//	//sleep(2000)  //2 segundos
//
//	
//	ParamIXB[1]:Delete()
//	
//	ParamIXB[1]:AddIndex("09", {"PED_CARGA","PED_PEDIDO"} )
//
//	ParamIXB[1]:Create()
//
//
//	RestArea(a_Area)
//return


//User Function DL200TR2() 
//	Local nX:=0
//	Local cAlias := "TRBPED"
//	Local cArqTRB := ParamIXB[1]
//	IndRegua( "TRBPED" ,cArqTRB ,"PED_CARGA","PED_PEDIDO", "D")
//
//	DbSelectArea("TRBPED")
//	dbClearIndex()
//	For nX:= 1 to Len(PARAMIXB)-1 
//		If !empty(PARAMIXB[nX])
//			dbSetIndex (PARAMIXB[nX]+OrdBagExt())
//		EndIf
//	Next nX
//	DbSetIndex( cArqTRB+OrdBagExt() )
//Return