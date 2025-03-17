#include "protheus.ch"
#INCLUDE "topconn.ch"
#include "rwmake.ch"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MT120ISC  �Autor  �Tarc�sio Silva Miranda� Data �22/11/2017 ���
�������������������������������������������������������������������������͹��
���Desc.     � C�digo desenvolvido pelo usuario para carregar campos do   ���
���			 � usuario da SC para o PC	  								  ���
�������������������������������������������������������������������������͹��
���Uso       � Desenvilvido para carregar o campo C1_ESTOQUE PARA SC7.	  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MT120ISC()

	Local aArea 	 := GetArea()
	Local aAreaSC1 	 := SC1->(GetArea())
	Local nPosNumSC  := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C7_NUMSC" })
	Local nPosEst	 := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C7_ESTOQUE" })
	Local nPosProd	 := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C7_PRODUTO" }) 
	Local nPosItemSc := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C7_ITEMSC" })
	Local nPosJust   := aScan(aHeader,{ |x| Upper(AllTrim(x[2])) == "C7_XJUST" })
	
	if !empty(AllTrim(Posicione("SC1",2,xFilial("SC7")+aCols[n][nPosProd]+aCols[n][nPosNumSC]+aCols[n][nPosItemSc],"C1_ESTOQUE")))
		aCols[n][nPosEst]  := AllTrim(Posicione("SC1",2,xFilial("SC7")+aCols[n][nPosProd]+aCols[n][nPosNumSC]+aCols[n][nPosItemSc],"C1_ESTOQUE"))
		aCols[n][nPosJust] := AllTrim(Posicione("SC1",2,xFilial("SC7")+aCols[n][nPosProd]+aCols[n][nPosNumSC]+aCols[n][nPosItemSc],"C1_XJUST"))
	else
		aCols[n][nPosEst]  := "2"
		aCols[n][nPosJust] := AllTrim(Posicione("SC1",2,xFilial("SC7")+aCols[n][nPosProd]+aCols[n][nPosNumSC]+aCols[n][nPosItemSc],"C1_XJUST"))
	endif

	RestArea(aAreaSC1)
	RestArea(aArea)

Return()