#INCLUDE "rwmake.ch"
#include "PROTHEUS.CH"
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � FA050CT � Autor � Claudio Ferreira   � Data �  06/05/14    ���
����������r3���������������������������������������������������������������͹��
���Descricao � Ponto de Entrada para excluir se for cancelado o rateio(PCO)���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � PCO                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function FA050CT()  

if IsInCallStack("FINA080") .or. IsInCallStack("GPEM670") .or. SE2->E2_MULTNAT <> "1"  .or. SuperGetMV("MV_PCOINTE",.F.,'1') <> '1'
  Return 
endif

  cGlbName  := "TPL_PCORAT"
  cGlbValue := GetGlbValue(cGlbName)
  If Trim(cGlbValue) <> "" .and. Len(aColsSev)=0
    mv_par04:=2 //Desativa CTB On-line 

	//�����������������������������������������������������������Ŀ
	//� Chama a integracao com o SIGAPCO antes de apagar o titulo �
	//�������������������������������������������������������������
	PcoDetLan("000002","01","FINA050",.T.)
	DbSelectArea("SE2")
	RecLock("SE2",.F.,.T.)
	dbDelete()
	DbGoBottom()
	DbSkip()
	Aviso('Aten��o!','(PCO) O lan�amento n�o ser� efetivado devido o Rateio ter sido cancelado ',{'Ok'})
    // Limpa vari�vel
    ClearGlbValue(cGlbName)
  Endif  
Return 