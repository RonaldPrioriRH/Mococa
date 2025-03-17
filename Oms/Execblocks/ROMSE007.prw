#Include 'Protheus.ch'

/*/{Protheus.doc} ROMSE007

Características dos Campos da Carga. DL200BRW
Após a criação do array com as características dos campos que aparecerão no browse 
de pedidos na montagem de carga. Os campos incluídos no array devem estar também 
incluídos conforme o ponto de entrada DL200TRB.

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

