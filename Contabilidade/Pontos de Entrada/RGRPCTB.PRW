#include "protheus.ch"
#include "topconn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGRPCTB   �Autor  �Claudio Ferreira    � Data �  18/07/17   ���
�������������������������������������������������������������������������͹��
���Desc.     �Utilizado para definir o Grupo do ID                        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Especifico Mococa                                          ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

 
User Function RGRPCTB()  
Local cID := PARAMIXB[1]
Local cCodGRP := PARAMIXB[2]  
Local cLP:=PARAMIXB[3]
//Local cLPSeq:=PARAMIXB[4] 

//RetCta(cID,cCodGRP,cLP,cLPSeq) //Parametros recebidos pela funcao RetCta 
 
Local cTipProd:=U_RetTp(SD2->D2_TP)
Local cTipoDoc:="00"
if cLP$'650/655'//Compras/Canc.Compras
  cTipProd:=U_RetTp(SD1->D1_TP)
  if SD1->D1_TIPO="D"
     cTipoDoc:="DV"
  endif   
endif 
if cID$'013/014/015/016/017/018/019/020/021/022/023/030/122/250'
   if cTipProd$ 'PA/PI' 
      cCodGRP := cTipoDoc+'01'
   elseif cTipProd$'ME/MP' 
   	  cCodGRP := cTipoDoc+'02'
   elseif cTipProd$'AI' 
   	  cCodGRP := cTipoDoc+'03'
   endif    
endif

Return(cCodGRP)
