#include "protheus.ch" 

/*/{Protheus.doc} OM200QRY

Filtro dos Pedidos na Montagem da Carga.
Ponto de entrada depois das condições principais de filtro dos pedidos na montagem de carga utilizando Top Connect. 

@author DANILO
@since 18/04/2017
@version P12
@param nenhum
@return nulo
/*/
User Function OM200QRY()

	Local cQuery     := PARAMIXB[1]
	//Local aArrayTipo := PARAMIXB[2]
	//Local aArrayMod  := PARAMIXB[3]
	Local aPergs := {}
	Local aRet := {}
	Local c_FlEst := "    "
	Local c_Carga := "          "
	Local c_Estado := "  "
	Local c_frete :="CIF"
	Local d_DTfat := CtoD('//')
	//Local a_Frete := {"1-CIF","2-FOB"}
	Local cControl := ""
	Public c_x_Carga := " "

	//tratamentos para faturamento triangular
	cQuery := U_ROMSE001(cQuery)

	cControl := SubStr(cQuery,889,6)

	aAdd(aPergs ,{1,"Filial Estoque: "	,c_FlEst,"@!",'.T.',"SM0",'.T.',10,.F.})
    aAdd(aPergs ,{1,"Carga: "			,c_Carga,"@!",'.T.',"",'.T.',10,.F.})    
    aAdd(aPergs ,{1,"Estado: "			,c_Estado,"@!",'.T.',"12",'.T.',2,.F.})    
    //aAdd(aPergs ,{1,"Frete: "			,c_frete,"@!",'.T.',"",'.T.',1,.F.})  
    aAdd(aPergs ,{2,"Frete: "       	,c_frete, {"CIF","FOB"}, 50,'.T.',.F.})         
    aAdd(aPergs ,{1,"Data de Faturamento até:"  ,d_DTfat,"","","","",50,.F.}) // Tipo data

	//Ash Brasil - Por ser chamado duas vezes no fonte, para contornar essa situação 2022/07/28

	/*Retirado do código fonte padrão
	  Com a inclusão do UNION, o ponto de entrada será chamado 2 vezes, para o caso de fazer uso de localização de
	  conteúdo específico na variável (SELECT, WHERE etc)
  	If lOM200QRY
		xRetPE := ExecBlock("OM200QRY",.F.,.F.,{ cQuery , aArrayTipo,aArrayMod })
		cQuery := Iif(ValType(xRetPE)=="C", xRetPE, cQuery)

		xRetPE := ExecBlock("OM200QRY",.F.,.F.,{ cQuerySA1, aArrayTipo,aArrayMod })
		cQuerySA1 := Iif(ValType(xRetPE)=="C", xRetPE, cQuerySA1)
	EndIf
	*/
	if !isincallstack("U_ROBOCWIZ")

		If AllTrim(cControl) == 'SA1010'

			If ! ParamBox(aPergs ,"Parametros ",@aRet)      
				Return cQuery   
			EndIf

			c_FlEst 	:= AllTrim(aRet[1])
			c_Carga 	:= AllTrim(aRet[2])
			c_Estado	:= AllTrim(aRet[3])
			c_Frete		:= AllTrim(aRet[4])
			d_DTfat     := aRet[5]

			
		EndIf

		if Empty(c_Carga)
			//cQuery += " AND C5_XFILEST = '"+ c_FlEst +"' "
			cQuery += " AND C5_XCARGA = ' ' "
			
			If  !Empty(c_Estado)  
				cQuery += " AND A1_EST = '"+ c_Estado +"' "	

			EndIf	
							
			If  !Empty(c_Frete) 
				If c_Frete == "CIF" 
				cQuery += " AND C5_TPFRETE = 'C' "
				ElseIf c_Frete == "FOB"  
				cQuery += " AND C5_TPFRETE = 'F' "
				EndIF		
			EndIf	
			
			If  !Empty(d_DTfat)  
				cQuery += " AND C9_DATENT  <= '"+ dtos(d_DTfat)+"' "	
			EndIf	
			
		Else
			cQuery += " AND C5_XCARGA = '"+ c_Carga +"' "
			c_x_Carga := c_Carga
		Endif
	else
		cQuery := STRTRAN(cquery," AND SC9.C9_CARGA = '      '","")
		cQuery := STRTRAN(cquery," AND SC9.C9_SEQCAR = '  '","")
	endif

	MemoWrite("C:\temp\QUERY_V3.sql",cQuery) // 09/10/19 CIF/FOB como Combo Box
	
Return cQuery
