#include 'protheus.ch'
#include 'parmtype.ch'
#Include 'Fwmvcdef.CH'
#INCLUDE 'TOPCONN.CH'


User Function ValPalet() 

Local lRet  := .F.
Local aArea := GetArea() 
//Local oModel:= FWModelActive()
Local cOP   := Alltrim(FWFldGet('CYV_NRORPO'))
Local cMaq  := Alltrim(FWFldGet('CYV_CDMQ'))
//Local dDTRep:= FWFldGet('CYV_DTRP')
Local cFicha:= Alltrim(FWFldGet('CYV_XFICHA')) 
Local cPalet:= Alltrim(FWFldGet('CYV_XPALET'))
//Local cLote := Alltrim(FWFldGet('CYV_XLOTE'))
//Local cUni := Posicione("SB1",1,xFilial("SB1")+FWFldGet('CYV_CDACRP'),"B1_UM")
Local cQry	:= " "
 
Private cEol := chr(13)+chr(10) 

	cQry := " SELECT COUNT(CYV_FILIAL||TRIM(CYV_CDMQ)||TRIM(CYV_DTRP)||TRIM(CYV_NRORPO)||TRIM(CYV_XFICHA)||CYV_XLOTE||CYV_XPALET) AS QTDOP FROM "+RetSqlName("CYV")+" CYV 	" +cEOL
	cQry += " WHERE CYV.D_E_L_E_T_ <> '*' 				" +cEOL
	cQry += "   AND CYV_FILIAL = '"+xFilial("CYV")+"'	" +cEOL
	cQry += "   AND CYV_CDMQ  = '"+cMaq+"' 				" +cEOL
	cQry += "   AND TRIM(CYV_NRORPO) = '"+cOP+"' 				" +cEOL
	//cQry += "   AND CYV_DTRP = '"+ dtos(dDTRep)+"' 	" +cEOL
	//cQry += "   AND CYV_XFICHA = '"+cFicha+"' 				" +cEOL
	cQry += "   AND CYV_XFICHA = '"+StrZero(Val(cFicha),6)+"' 				" +cEOL  
	cQry += "   AND CYV_XPALET = '"+StrZero(Val(cPalet),4)+"' 				" +cEOL   
	//cQry += "   AND CYV_XLOTE  = '"+cLote+"' 				" +cEOL 
	cQry += "   AND CYV_DTEO = ' '  				" +cEOL
	cQry += " ORDER BY R_E_C_N_O_ " +cEOL
	 // parei aqui !!!
	MemoWrite("C:\temp\CYV_Palet.sql",cQry)

	If Select("TRBCYV") > 0
		TRBCYV->(dbCloseArea())
	EndIf
	
	TCQuery cQry New Alias "TRBCYV"
	
	DbSelectArea("TRBCYV")
	DbGotop()
	
			If TRBCYV->(!Eof()) 		
				While TRBCYV->(!Eof())
					 
					 If (TRBCYV->QTDOP) = 1
					 //Help(,, 'Ordem de Produção' ,, 'Já exista Ficha:' +cFicha+ ' ,Palete:' +cPalet+ ' e Lote :	'+cLote+ ' cadastrado para este Apontamento !', 1,0) 
					 Help(,, 'Ordem de Produção' ,, 'Já existe a Ficha:' +cFicha+ ' e Palete:' +cPalet+ ' cadastrados para este Apontamento ' + cOP +  ' !', 1,0) 
					 lRet := .F. 
					 			 
					 Else
					 
					 lRet := .T. 
					 
					 EndIF
					 
					TRBCYV->(DbSkip())
				Enddo
			Endif

			TRBCYV->(dbCloseArea())	

RestArea(aArea) 
Return (lRet)
	