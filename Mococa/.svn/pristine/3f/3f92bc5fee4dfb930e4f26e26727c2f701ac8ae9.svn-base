#include 'protheus.ch'
#include 'parmtype.ch'

user function RACDA013()
	LOCAL cFiltro   := ""
	LOCAL aCores  := {{ 'Z0G->Z0G_STATUS=="1"' , 'BR_BRANCO'  },;    // Aguardando apontamento
	{ 'Z0G->Z0G_STATUS=="0"' , 'BR_VERDE' },;     //APontado com Sucesso
	{ 'Z0G->Z0G_STATUS=="2"' , 'BR_VERMELHO' }}    //Apontado com erro

	//	/{ 'Z0G->Z0G_SUSPEN=="S"' , 'BR_PRETO'  },;    // Suspensa (Job não lê)

	PRIVATE cAlias   := 'Z0G'
	//PRIVATE _cCpo  := "PA1_FILIAL/PA1_PRODUT/PA1_DESC"

	PRIVATE cCadastro := "Monitor de Envio C.Q. [Job]"
	PRIVATE aRotina     := {}

	AADD(aRotina, { "Buscar", "AxPesqui", 0, 1 })
	//	AADD(aRotina, { "Apont. Manual", "U_ApontMan()"  , 0, 4 })
	//	AADD(aRotina, { "Suspender", "U_SuspenOP()"  , 0, 4 })
	AADD(aRotina, { "Visualizar", "AxVisual"  , 0, 2 })
	//AADD(aRotina, { "Modificar"     , "AxAltera"  , 0, 4 })

	dbSelectArea("Z0G")
	dbSetOrder(1)





	mBrowse( ,,,,"Z0G",,,,,,aCores,,,,,,,,cFiltro)
return