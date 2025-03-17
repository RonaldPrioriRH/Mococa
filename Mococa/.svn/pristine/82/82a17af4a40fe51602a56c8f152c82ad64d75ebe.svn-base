#include 'protheus.ch'
#include 'parmtype.ch'
#include "rwmake.ch"

user function RACDA009()
	LOCAL cFiltro   := ""
	LOCAL aCores  := {	{ 'Z0E->Z0E_ESTORN=="S"' , 'BR_CINZA'  },;
						{ 'Z0E->Z0E_SUSPEN=="S"' , 'BR_AMARELO'  },;    // Suspensa (Job não lê)
						{ 'Z0E->Z0E_STATUS=="1"' , 'BR_BRANCO'  },;    // Aguardando apontamento
						{ 'Z0E->Z0E_STATUS=="0"' , 'BR_VERDE' },;     //APontado com Sucesso
						{ 'Z0E->Z0E_STATUS=="2"' , 'BR_VERMELHO' }}    //Apontado com erro

	PRIVATE cAlias   := 'Z0E'
	//PRIVATE _cCpo  := "PA1_FILIAL/PA1_PRODUT/PA1_DESC"

	PRIVATE cCadastro := "Monitor Apontamentos de Produção [Job]"
	PRIVATE aRotina     := {}

	AADD(aRotina, { "Buscar", "AxPesqui", 0, 1 })
	AADD(aRotina, { "Apont. Manual", "U_ApontMan()"  , 0, 4 })
	AADD(aRotina, { "Alterar", "U_AlteraOP"  , 0, 4 })
	AADD(aRotina, { "Suspender", "U_SuspenOP()"  , 0, 4 })
	AADD(aRotina, { "Visualizar", "AxVisual"  , 0, 2 })
	aAdd(aRotina, { "Legenda"			,"U_A009Leg"	    , 0, 4})
	aAdd(aRotina, { "Estornar"			,"U_A009Est"	    , 0, 4})

	//AADD(aRotina, { "Modificar"     , "AxAltera"  , 0, 4 })

	dbSelectArea("Z0E")
	dbSetOrder(1)





	mBrowse( ,,,,"Z0E",,,,,,aCores,,,,,,,,cFiltro)

return


User Function A009Leg() 

	Local aLegenda := {	{ "BR_CINZA"		, 	"Etiqueta Estornada"},;
						{ "BR_AMARELO"		, 	"Etiqueta Suspensa"},;
						{ 'BR_BRANCO', "Aguardando apontamento"  },;    // Aguardando apontamento
						{ 'BR_VERDE',"Apontado com sucesso" },;     //APontado com Sucesso
						{ 'BR_VERMELHO',"Erro no apontamento" }}    //Apontado com erro

	BrwLegenda(cCadastro,'Legenda',aLegenda)
		
	
return


User Function ApontMan()
	Local aArea := GetArea()
	Local aMsgRet := {}
	Local cString := ""
	Local nZ 

	MsgRun("Aguarde, processando ...","Apontamento",{|| U_JobApon(.t.,@aMsgRet) })


	For nZ := 1 to Len(aMsgRet)
		cString += aMsgRet[nZ]+chr(13)+chr(10)
	Next nZ
	ShowString(cString)
	restarea(aArea)
return



Static Function ShowString(cString)
	LOCAL oDlgMemo
	LOCAL oMemo
	@ 116,090 To 416,707 Dialog oDlgMemo Title "Trace Apontamentos"
	@ 001,005 Get cString   Size 300,120  MEMO                 Object oMemo
	@ 137,10+5*50 Button OemToAnsi("_Fechar")   Size 35,14 Action Close(oDlgMemo)
	Activate Dialog oDlgMemo center
Return nil



User Function SuspenOP()
	LOCAL aArea		 := GetArea()
	LOCAL aAreaZ0E	 := Z0E->(GetArea())
	LOCAL cChave     := Z0E->(Z0E_FILIAL+Z0E_OPP)
	LOCAL cStatSUSP

	if Z0E->Z0E_STATUS == '0'
		ApMsgStop("Não foi possível alterar o status das estiquetas da OP "+cChave+" ! Ela já foi apontada. ")
		return(nil)
	endif

	Begin Transaction
		cStatSUSP := iif(Z0E->Z0E_SUSPEN=="S","","S")
		
		DbSelectArea("Z0E")
		Z0E->(DbSetOrder(2))
		DbSeek(cChave)
		
		
		While !Z0E->(Eof()) .and. Z0E->(Z0E_FILIAL+Z0E_OPP) == cChave
			

			IF Z0E->Z0E_STATUS<>'0'
				if RecLock("Z0E",.f.)
					Z0E->Z0E_SUSPEN := cStatSUSP 
					Z0E->(MsUnLock())
				else
					ApMsgStop("Não foi possível alterar o status das estiquetas da OP "+cChave+" ! Tenta novamente mais tarde. ")
					DisarmTransaction()
					return ( Nil )
				endif
			Endif
			DbSelectArea("Z0E")
			DbSkip()
		Enddo



	End Transaction 


	restarea(aAreaZ0E)
	restarea(aArea)
return(nil)



User Function A009Est
LOCAL aArea := GetArea()
	
	if Z0E->Z0E_STATUS == '0'
		ApMsgStop("Esta etiqueta não pode ser estornada pois já foi efetuado apontamento de produção !")	
	elseif Z0E->Z0E_ESTORN == 'S'
		ApMsgStop("Essa etiqueta já foi estornada anteriormente !")
	elseIf ApMsgYesNo("Atenção !"+chr(13)+chr(10)+;
		"Ao estornar uma etiqueta, esta não será mais apontada!"+chr(13)+chr(10)+;
		"Deseja Continuar ?", "Estorna Etiqueta")
	
		if RecLock("Z0E",.f.)
		
			Z0E->Z0E_ESTORN := "S"
			Z0E->(MsUnLock())
		else
			ApMsgStop("Não foi possível estornar a estiqueta. Tente novamente !")
		endif	
	endif
RestArea(aArea)
return


User Function AlteraOP(cAlias,nReg,nOpc)
LOCAL aArea := GetArea()
Local cUsers := Alltrim(Upper(GetMv("MV_XUSRZ0E")))
if Z0E->Z0E_STATUS == '0'
	ApMsgInfo("Alteração não permitida para etiqueta já apontada !")
	return
endif

if Z0E->Z0E_ESTORN == 'S'
	ApMsgInfo("Alteração não permitida para etiqueta estornada !")
	return
endif

if !(Alltrim(Upper(cUserName)) $ cUsers)
	ApMsgInfo("Você não tem permissão para alterar etiquetas  !")
	return
endif
nOpcA := AxAltera(cAlias,nReg,nOpc,,,,,".T.")
restArea(aArea)
return