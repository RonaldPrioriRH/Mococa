#include "rwmake.ch"  
#Include "SigaWin.ch"

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ MT240TOK  ¦ Utilizador ¦ Claudio Ferreira ¦ Data ¦ 04/06/12¦¦¦
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

user function mt240tok()
	local _lok:=.t.
	Local cProd    := M->D3_COD
	Local cApropri := Posicione("SB1",1,fWxFilial("SB1")+cProd,"B1_APROPRI")
	Local lTestaCC := .f.

	If (FunName()  <> 'MGLT22SKD' .And.  FunName()  <> 'MGLTSKD22')
		If M->D3_EMISSAO  > dDataBase
				msginfo("Não é permitido Realizar Movimentação com data futura!", "Atenção")
				_lok  := .F.
		EndIf
	EndIf

return(_lok)

//	Return .t. // PONTA DE ENTRADA DESATIVADO POIS ESTA GERANDO ERRO NA RECEPCAO DO LEITE.

	if SF5->(FieldPos("F5_XCCOBRI")) > 0
		ltestaCC := !(Posicione("SF5",1,FwxFilial("SF5")+M->D3_TM,"F5_XCCOBRI") == "N")
	endif

	if lTestaCC .and. !cApropri=="I"
		if empty(m->d3_op) .or. 'OS'$m->d3_op
			if empty(m->d3_cc)
				_lok:=.f.
				alert("Para este tipo de movimento o centro de custo deve ser informado!")
			endif
		endif
	endif

return(_lok)
