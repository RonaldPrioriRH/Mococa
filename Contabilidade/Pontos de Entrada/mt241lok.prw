#include "protheus.ch"
#include "rwmake.ch"  
#Include "SigaWin.ch"

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ MT241LOK  ¦ Utilizador ¦ Claudio Ferreira ¦ Data ¦ 12/11/15¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de Entrada na confirmação do mov interno             ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦¦          ¦ 															  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦    
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

#include "rwmake.ch"


user function MT241LOK()
	local _lok:=.t.
	Local nPosOP := aScan(aHeader,{|x| AllTrim(x[2])=="D3_OP"})
	Local lDeleted := GdDeleted()  
	Local nPosProd := GdFieldPos("D3_COD")
	Local cProd    := aCols[n,nPosProd]
	Local cApropri := Posicione("SB1",1,fWxFilial("SB1")+cProd,"B1_APROPRI")
	Local lTestaCC := .f.
	//Local nPosLCtl   := GdFieldPos("D3_LOTECTL")
	//Local nPosD3COD  := GdFieldPos("D3_COD")

	if SF5->(fieldpos("F5_XCCOBRI"))  > 0
		ltesteaCC := !(Posicione("SF5",1,FwxFilial("SF5")+cTM,"F5_XCCOBRI") == "N")
	endif

	if lTestaCC
		if ( empty(aCols[n,nPosOP]) .or. 'OS'$aCols[n,nPosOP])  .and. ( !lDeleted .or. cApropri<>"I") 
			if empty(cCc)
				_lok:=.f.
				msginfo("Para este tipo de movimento o centro de custo deve ser informado!")
			endif
		endif
	endif

       If (FunName()  <> 'MGLT22SKD' .And.  FunName()  <> 'MGLTSKD22') 
			If DA241DATA  > dDataBase
				msginfo("Não é permitido Realizar Movimentação com data futura!", "Atenção")
				_lok  := .F.
			Endif
		EndIf

return(_lok)



