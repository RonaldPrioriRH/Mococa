#include "protheus.ch"
#include "topconn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  RTPPROCTB  �Autor  �Claudio Ferreira    � Data �  18/07/17   ���
�������������������������������������������������������������������������͹��
���Desc.     �Utilizado para definir o Tipo de acordo com a Filial/CC     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Especifico Mococa                                          ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

//Chamada pelo fun��o RetTp(cTp,cLP,cLPSeq)
 
User Function RTPPROCTB()  
Local cTp := PARAMIXB[1]
Local cLP:=PARAMIXB[2]
//Local cLPSeq:=PARAMIXB[3] 

if cLP$'678/610/630'//Custo/Faturamento/Canc.Fat
                    //BBL /CRE /LCO /LLV
	if SD2->D2_GRUPO$'1001/1002/1003/1004' .and. !AllTrim(SD2->D2_FILIAL)$'0102/0103'
	   cTp :='ME'
   endif	   
endif
if cLP$'650/655'//Compras/Canc.Compras
                    //BBL /CRE /LCO /LLV
	if SD1->D1_GRUPO$'1001/1002/1003/1004' .and. !AllTrim(SD1->D1_FILIAL)$'0102/0103'
	   cTp :='ME'
   endif	   
endif

Return(cTp)

