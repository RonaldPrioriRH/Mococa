#Include 'Protheus.ch'

/*/{Protheus.doc} OM200MNU
 
Este ponto de entrada pode ser utilizado para inserir novas opções no array aRotina.
@author TOTVS
@since 29/03/2017
@version P12
@param nulo            
@return nulo
/*/

User Function OM200MNU()

	Local aArea := GetArea()
	
	U_ROMSE014()
	
	RestArea(aArea)	

Return

User Function DTEMBRQ()
	Local aPergs := {}
	Local aRet := {}
	Local d_Dt := CtoD('//')
	
	aAdd( aPergs ,{1,"Data: "	,d_Dt,"",'.T.',"",'.T.',50,.F.})
	      

	If ! ParamBox(aPergs ,"Parametros ",@aRet)      
		Return 
	EndIf

	d_Dt := aRet[1]
	
	DbSelectArea("DAK")
	RecLock("DAK",.F.)
	
	DAK->DAK_XDTEMB := d_Dt
	
	MsUnLock()
	
	
	
Return