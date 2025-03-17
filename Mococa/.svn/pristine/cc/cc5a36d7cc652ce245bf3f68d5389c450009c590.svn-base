// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : MA330TRB.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 08/12/2017 | perez             | Gerado com auxílio do Assistente de Código do TDS.
// -----------+-------------------+---------------------------------------------------------

#include "protheus.ch"

user function MA330TRB()
	Local aArea := {}, _i
	//Local cIndx := FwTemporaryTable(NIL,.f.)
	//Local lShowRegua:= Iif( !lBat .and. !IsBlind(), .t. , .f. ) 
	
	//Alert("passei por aqui")
      If a330ParamZX[14] == 2 // só roda se for o calculo for mensal
	  	Return
	EndIf
	aAdd(aArea,GetArea())

	dbSelectArea("TRB")
	aAdd(aArea,GetArea())

	dbGoTop()
	While !EOF() 

		//Entrada de Trasnferências entre Filiais
		If TRB_FILTRA <>'  '  .and. TRB_ALIAS =='SD1' //.and. TRB_ORDEM =='300'  .and. TRB_NIVEL =='99w' .and. TRB_TES < '499' //AJUSTAR
		RecLock("TRB",.F.)
			TRB_ORDEM := '300'
			TRB_NIVEL := '  '
			TRB_NIVSD3 := '  '
			
		//Mov Internos Valorizados e Produção
		ELSEif TRB_ORDEM =='300' .and. (TRB_CF $ 'RE6/DE6/RE7/DE7/PR0/ER0') .and. TRB_ALIAS =='SD3'
			RecLock("TRB",.F.)
		 		TRB_ORDEM := '300'
		 		TRB_NIVEL :='99'
		 		TRB_NIVSD3 := '1'
		 		
	    // Mov Internos Não Valorizados e Consumo das ordens
	    ELSEif TRB_ORDEM =='300' .and. TRB_ALIAS =='SD3' .and. (TRB_CF $ 'DE1/RE1/DE2/RE2/DE3/RE3/DE4/RE4/DE0/RE0') //CAIQUE COLOQUEI UM ALLTRIM 
			  	RecLock("TRB",.F.)
			  	TRB_ORDEM := '300'
			  	TRB_NIVEL :='99w'
			  	TRB_NIVSD3 := '5'
			  	
	      // Saída de Transferências entre Filiais 
	    ELSEIF TRB_FILTRA <>' ' .and. TRB_ALIAS =='SD2' .and. TRB_TES >'500'     //ALLTRIM(TRB_NIVEL) =='w' .and. TRB_ORDEM =='300'  //AJUSTAR
		RecLock("TRB",.F.)
			TRB_ORDEM := '300'
			TRB_NIVEL := ' w '
			//TRB_NIVSD3 := '  '
			     
			MSUnlock()
		Endif
		
		TRB->(dbskip())
	EndDo
	
	For _i := Len(aArea) to 1 step -1
		RestArea(aArea[_i])
	Next
return
