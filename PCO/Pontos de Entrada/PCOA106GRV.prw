#include "rwmake.ch"  
#Include "SigaWin.ch"

/*
__________________________________________________________________________
�����������������������������������������������������������������������������
��+-----------------------------------------------------------------------+��
���Programa  �PCOA106GRV� Utilizador � Claudio Ferreira  � Data � 12/12/17���
��+----------+------------------------------------------------------------���
���Descri��o � PE ap�s a grava��o da AK2 na importa��o do Or�amento       ���
���          �                                                            ���
���          � Utilizado para tratar o valor importado do XML     		  ���
��+----------+------------------------------------------------------------���
��� Uso      � TOTVS-GO                                                   ���    
��+-----------------------------------------------------------------------+��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function PCOA106GRV()  
nValor:=Paramixb[1] //nValor
nQtdEntid:=Paramixb[2] //nQtdEntid
aParA106:=Paramixb[3] //aParA106

//Define o valor do or�amento pelo informado no XML
AK2->AK2_VALOR := nValor

Return 
