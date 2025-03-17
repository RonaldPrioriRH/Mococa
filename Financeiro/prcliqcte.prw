#INCLUDE "topconn.ch"
#INCLUDE "protheus.ch"
 // https://tdn.totvs.com/pages/releaseview.action?pageId=514431886
 // ExecAuto rotina automatica de liquidação a pagar (FINA565)

User Function prcliqcte()
	Local _aPerg 		:= {}
	Private cPerg    	:= Padr("PRCLIQCTES",10) 
	Private cDoFor, cAteFor, dDaEmis, dAteEmis, cDaFil, cAteFil, cNaturez
	Private aSelFil  	:= {}
	dbSelectArea("SF1")
	dbSetOrder(1)

	aAdd(_aPerg,{"Da filial?","C",4,0,"SM0",,''})
	aAdd(_aPerg,{"Ate filial?","C",4,0,"SM0",,''})
	aAdd(_aPerg,{"Do transportadora?","C",6,0,"SA2",,''})
	aAdd(_aPerg,{"Ate a transportadora?","C",6,0,"SA2",,''})
	aAdd(_aPerg,{"Da data de emissao?","D",8,0,"",,''})
	aAdd(_aPerg,{"Ate data de emissao?","D",8,0,"",,''})
	aAdd(_aPerg,{"Naturezas?","C",60,0,"",,''}) 
	
	CriaSx1(cPerg,_aPerg)

	If Pergunte(cPerg,.t.)
		cDaFil	:= mv_par01
		cAteFil	:= mv_par02
		cDoFor	:= mv_par03
		cAteFor	:= mv_par04
		dDaEmis	:= mv_par05
		dAteEmis:= mv_par06
		cNaturez:= mv_par07  
		If empty(cNaturez)
			Alert('Obrigatorio o preenchimento das naturezas')
			return
		Endif

		cNaturez := FormatIn(Upper(AllTrim(cNaturez)),";")

		aadd(aSelFil,{'0104'})
		aadd(aSelFil,{'0105'})
		aadd(aSelFil,{'0106'})

		u_liquidapg(.f.)    // Gera liquidação de acordo com parametros selecionados

	Endif

Return

Static Function CriaSx1(_cGRP,_aPar)
	Local _I := 0
	Local _cSeq := "00"
	Local _cVrvl := "0"
	Local _lRec := .F.
	Local _cGSC := "G"
	_cGrp := Pad(_cGRP,Len(SX1->X1_GRUPO))
	SX1->(dbSetOrder(1))
	//Primeiro Cria ou Altera os registros
	For _I := 1 To Len(_aPar)
		_cSeq := Soma1(_cSeq)
		_cVrvl := Soma1(_cVrvl)
		_cGSC := "G"
		_lRec := !SX1->(dbSeek(_cGrp+_cSeq))
		RecLock("SX1",_lRec)
		SX1->X1_GRUPO		:= _cGrp
		SX1->X1_ORDEM		:= _cSeq
		SX1->X1_PERGUNT	:= _aPar[_I,01]
		SX1->X1_TIPO		:= _aPar[_I,02]
		SX1->X1_TAMANHO	:= _aPar[_I,03]
		SX1->X1_DECIMAL	:= _aPar[_I,04]
		SX1->X1_F3			:= _aPar[_I,05]
		If Len(_aPar[_I]) >= 6 .AND. _aPar[_I,6] <> Nil
			SX1->X1_DEF01		:= _aPar[_I,06,1]
			SX1->X1_DEF02		:= _aPar[_I,06,2]
			SX1->X1_DEF03		:= _aPar[_I,06,3]
			SX1->X1_DEF04		:= _aPar[_I,06,4]
			SX1->X1_DEF05		:= _aPar[_I,06,5]
			_cGSC := "C"
		Else
			SX1->X1_DEF01		:= ""
			SX1->X1_DEF02		:= ""
			SX1->X1_DEF03		:= ""
			SX1->X1_DEF04		:= ""
			SX1->X1_DEF05		:= ""
		EndIf
		If Len(_aPar[_I]) >= 7
			SX1->X1_VALID	:= _aPar[_I,07]
		EndIf
		SX1->X1_VAR01		:= ("MV_PAR"+_cSeq)
		SX1->X1_GSC		:= _cGSC
		SX1->X1_VARIAVL	:= ("MV_CH"+_cVrvl)
		SX1->(MsUnLock())
	Next _I

	SX1->(dbGoTop())
	If SX1->(dbSeek(_cGrp+"01"))
		While !SX1->(EOF()) .AND. SX1->X1_GRUPO == _cGrp
			If SX1->X1_ORDEM > _cSeq
				RecLock("SX1",_lRec)
				SX1->(dbDelete())
				SX1->(MsUnLock())
			EndIf
			SX1->(dbSkip())
		EndDo
	EndIf
Return
