#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE007

Caracter�sticas dos Campos da Carga. DL200BRW
Ap�s a cria��o do array com as caracter�sticas dos campos que aparecer�o no browse 
de pedidos na montagem de carga. Os campos inclu�dos no array devem estar tamb�m 
inclu�dos conforme o ponto de entrada DL200TRB.

@author DANILO
@since 18/04/2017
@version P12
@param nenhum            
@return nulo
/*/
User Function ROMSE007(aCpoBrw)

	aAdd(aCpoBrw,{"PED_FILEST",,"Fil.Estoque"})
	aAdd(aCpoBrw,{"PED_FILINT",,"Fil.Interm."})
	aAdd(aCpoBrw,{"PED_SGAC"  ,,"Ped.SGAC"  })
	aAdd(aCpoBrw,{"PRV_FAT"   ,,"Prev.Fat"})

Return

