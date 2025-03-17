#INCLUDE "rwmake.ch"
#Include "Protheus.ch"
#include "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMACTBM06  บAutor  ณTarcํsio Silva      บ Data ณ  02/02/18   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณLimpa fleg da generico geral.				  				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa                                                     บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function MACTBM06(_cTpLipFlg)

	//Local 	aArea 		:= GetArea()
	Local	cQry        := ""
	Local 	cEol        := chr(13)+chr(10)
	Local 	dDataDe		:= StoD("")
	Local	dDataAte	:= StoD("")
	Local	cFilDe		:= ""
	Local 	cFilAte		:= ""

	////////////////////////////////////////////////////////////////////////
	///Outras Variaveis
	////////////////////////////////////////////////////////////////////////
	Private cLocFile    := ""
	Private cPerg       := "MACTBM06"
	Default _cTpLipFlg := ""

	////////////////////////////////////////////////////////////////////////
	///Cria as perguntas no SX1
	////////////////////////////////////////////////////////////////////////

	if !RetCodUsr()$GetMv("MV_XCTBFIN",,"000287")
		MsgAlert("Usuแrio sem premissใo!","Aten็ใo")
		return()
	endif

	ValPer01()

	if !Pergunte(cPerg,.t.)
		return
	endif

	dDataDe	    := dTos(mv_par01)
	dDataAte	:= dTos(mv_par02)
	cFilDe		:= mv_par03
	cFilAte		:= mv_par04


	if _cTpLipFlg$"SE1"


		cQry:=" SELECT SE1010.R_E_C_N_O_ AS CHAVE, E1_LA 				" +cEOL
		cQry+=" FROM "+ RetSqlName("SE1")+"  							" +cEOL 
		cQry+=" WHERE D_E_L_E_T_ <> '*'									" +cEOL
		cQry+=" AND E1_EMISSAO BETWEEN '"+dDataDe+"' AND '"+dDataAte+"' " +cEOL
		cQry+=" AND E1_FILIAL  BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  	" +cEOL	


		MemoWrite("C:\temp\MACTBM06.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		While !TRB->(Eof())

			SE1->(DbGoto(TRB->CHAVE))

			SE1->(RecLock("SE1",.F.))
			SE1->E1_LA := ""
			SE1->(MsUnlock())

			TRB->(DbSkip())

		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})


	elseif _cTpLipFlg$"SE2"

		cQry:=" SELECT SE2010.R_E_C_N_O_ AS CHAVE, E2_LA 				" +cEOL
		cQry+=" FROM "+ RetSqlName("SE2")+"  							" +cEOL 
		cQry+=" WHERE D_E_L_E_T_ <> '*'									" +cEOL
		cQry+=" AND E2_EMISSAO BETWEEN '"+dDataDe+"' AND '"+dDataAte+"' " +cEOL
		cQry+=" AND E2_FILIAL  BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  	" +cEOL	


		MemoWrite("C:\temp\MACTBM06.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		While !TRB->(Eof())

			SE2->(DbGoto(TRB->CHAVE))

			SE2->(RecLock("SE2",.F.))
			SE2->E2_LA := ""
			SE2->(MsUnlock())

			TRB->(DbSkip())

		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})

	elseif _cTpLipFlg$"SE5"

		cQry:=" SELECT SE5010.R_E_C_N_O_ AS CHAVE, E5_LA 				" +cEOL
		cQry+=" FROM "+ RetSqlName("SE5")+"  							" +cEOL 
		cQry+=" WHERE D_E_L_E_T_ <> '*'									" +cEOL
		cQry+=" AND E5_DATA BETWEEN '"+dDataDe+"' AND '"+dDataAte+"' 	" +cEOL
		cQry+=" AND E5_FILIAL  BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  	" +cEOL	


		MemoWrite("C:\temp\MACTBM06.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		While !TRB->(Eof()) 

			SE5->(DbGoto(TRB->CHAVE))

			SE5->(RecLock("SE5",.F.))
			SE5->E5_LA := ""
			SE5->(MsUnlock())

			TRB->(DbSkip())

		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})

	elseif _cTpLipFlg$"SF1"

		cQry:=" SELECT SF1010.R_E_C_N_O_ AS CHAVE, F1_DTLANC 			" +cEOL
		cQry+=" FROM "+ RetSqlName("SF1")+"  							" +cEOL 
		cQry+=" WHERE D_E_L_E_T_ <> '*'									" +cEOL
		cQry+=" AND F1_DTDIGIT BETWEEN '"+dDataDe+"' AND '"+dDataAte+"' " +cEOL
		cQry+=" AND F1_FILIAL  BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  	" +cEOL	


		MemoWrite("C:\temp\MACTBM06.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		While !TRB->(Eof())

			SF1->(DbGoto(TRB->CHAVE))

			SF1->(RecLock("SF1",.F.))
			SF1->F1_DTLANC := cTod("  /  /   ")
			SF1->(MsUnlock())

			TRB->(DbSkip())

		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})

	elseif _cTpLipFlg$"SF2"

		cQry:=" SELECT SF2010.R_E_C_N_O_ AS CHAVE, F2_DTLANC				" +cEOL
		cQry+=" FROM "+ RetSqlName("SF2")+"  								" +cEOL 
		cQry+=" WHERE D_E_L_E_T_ <> '*'										" +cEOL
		cQry+=" AND F2_EMISSAO BETWEEN '"+dDataDe+"' AND '"+dDataAte+"' 	" +cEOL
		cQry+=" AND F2_FILIAL  BETWEEN '"+cFilDe+"' AND '"+cFilAte+"'  		" +cEOL	


		MemoWrite("C:\temp\MACTBM06.sql",cQry)

		cQry := ChangeQuery(cQry)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery cQry New Alias "TRB"

		dbSelectArea("TRB")
		TRB->(dbGoTop())

		While !TRB->(Eof())

			SF2->(DbGoto(TRB->CHAVE))

			SF2->(RecLock("SF2",.F.))
			SF2->F2_DTLANC := cTod("  /  /   ")
			SF2->(MsUnlock())

			TRB->(DbSkip())

		enddo

		Aviso("Aviso","Processado com sucesso!",{"Ok"})

	endif

return()

/*??????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????
???Programa   ? ValPerg()  ? Autor ? Diego Bueno               ? Data ?20/03/2014???
????????????????????????????????????????????????????????????????????????????????J??
???Descricao  ? Cria perguntas no SX1	                                         ???
????????????????????????????????????????????????????????????????????????????????J??
???Observacao ?                                                                  ???
???           ?                                                                  ???
???????????????????????????????????????????????????????????????????????????????????
????????????????????????????????????????????????????????????????????????????????????
??????????????????????????????????????????????????????????????????????????????????*/

Static Function ValPer01()

	_sAlias	:=	Alias()

	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg 	:=	PADR(cPerg,10)

	U_xPutSx1(cPerg,"01","Emissใo De ?","."     	,"."       ,"mv_CH1","D",08,0,0,"G","","","","","MV_PAR01","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"02","Emissใo At้ ?","."     	,"."       ,"mv_CH2","D",08,0,0,"G","","","","","MV_PAR02","","","","","","","","","","","","","","","","")

	U_xPutSx1(cPerg,"03","Filial De ?","."     ,"." ,"mv_CH3","C",04,0,0,"G","","SM0","","","MV_PAR03","","","","","","","","","","","","","","","","")
	U_xPutSx1(cPerg,"04","Filial At้ ?","."     ,".","mv_CH4","C",04,0,0,"G","","SM0","","","MV_PAR04","","","","","","","","","","","","","","","","")

	dbSelectArea(_sAlias)

Return()
