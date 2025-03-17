#include "protheus.ch"

/*
__________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RFATE019   ¦ Autor ¦ Totvs   ¦ Data ¦ 	          25/08/10¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de Entrada na confirmação da seleçao do PC usado para¦¦¦
¦¦¦          ¦ atualizar os campos customizados no Documento de Entrada e ¦¦¦
¦¦¦          ¦ na Pré Nota de Entrada após a importação dos itens do PC.  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ Gravar a descrição do produto na tabela SD1                ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Revisado ¦ Por Jacqueline Cândida                   ¦ Data ¦ 24/09/10 ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RFATE019()
	Local I 
	If SD1->(FieldPos("D1_XDESCRI"))>0
					
		For I = 1 to len(acols)
			nPosDescri:=aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "D1_XDESCRI" })
			nPosCodigo:=aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "D1_COD" })
			Acols[I,nPosDescri]:=SB1->(POSICIONE("SB1",1,xFilial("SB1")+Acols[I,nPosCodigo],"B1_DESC"))
		Next I

	endif

Return (.T.)
