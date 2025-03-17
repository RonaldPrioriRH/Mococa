#include 'protheus.ch'
#include 'parmtype.ch'

user function RACDA015()
	LOCAL cFiltro   := ""
	LOCAL aCores  := {{ 'Z0D->Z0D_BLQCQ<>"1"' , 'BR_VERDE' },;     //APontado com Sucesso
	{ 'Z0D->Z0D_BLQCQ="1"' , 'BR_VERMELHO' }}    //Apontado com erro

	

	PRIVATE cAlias   := 'Z0D'
	//PRIVATE _cCpo  := "PA1_FILIAL/PA1_PRODUT/PA1_DESC"

	PRIVATE cCadastro := "Etiquetas Impressas"
	PRIVATE aRotina     := {}

	AADD(aRotina, { "Buscar", "AxPesqui", 0, 1 })
	//	AADD(aRotina, { "Apont. Manual", "U_ApontMan()"  , 0, 4 })
	//	AADD(aRotina, { "Suspender", "U_SuspenOP()"  , 0, 4 })
	AADD(aRotina, { "Visualizar", "AxVisual"  , 0, 2 })
	//AADD(aRotina, { "Modificar"     , "AxAltera"  , 0, 4 })

	dbSelectArea("Z0D")
	dbSetOrder(1)





	mBrowse( ,,,,"Z0D",,,,,,aCores,,,,,,,,cFiltro)
return