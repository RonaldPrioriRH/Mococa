#include "topconn.ch"
/*/
�������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������
���������������������������������������������������������������������������������ͻ��
���Programa  �  RetSaldo   � Nadre Rodrigues			 � Data �  21/11/2017 ���
���������������������������������������������������������������������������������͹��
���Descricao � Retorna o Saldo do t�tulo posicionado.							  ���
���������������������������������������������������������������������������������͹��
���Uso       � CNAB		                                                          ���
���������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������
/*/
User Function RetSaldo()

	Local nRet	:= 0
	Local nTotAbImp := 0
	Local cRet	:= ""

	//comentado por Danilo, pois nao trazia abatimentos de VBC
	//nRet := SomaAbat(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,"R",SE1->E1_MOEDA,dDataBase,SE1->E1_CLIENTE,SE1->E1_LOJA)

	//essa fun�ao � a mesma utilizada na rotina de baixas a receber.
	nRet := SumAbatRec(SE1->E1_PREFIXO,SE1->E1_NUM,SE1->E1_PARCELA,SE1->E1_MOEDA,"S",dDataBase,@nTotAbImp)
	nRet -= nTotAbImp

	cRet :=AllTrim(Transform(nRet,"@E 999.999,99"))
	cRet:=STRTRAN(cRet,".","")
	cRet:=STRTRAN(cRet,",","")
	cRet:=LTRIM(cRet)
	cRet := StrZero(nRet*100,13)


Return cRet