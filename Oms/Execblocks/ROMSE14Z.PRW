#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICODE.CH"
#INCLUDE "TBICONN.CH"         
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOTVS.CH"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � ROMSE14Z � Autor � JJ Consulting      � Data �  05/09/19   ���
�������������������������������������������������������������������������͹��
���Descricao � Libera��o automatica dos pedidos gerados pela OMS          ���
���          �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
/*User Function ROMSE14Z()
Local aArea 	:= GetArea()
Local _cQuery	:= " "

_cQuery  := " SELECT DAI_FILIAL as FILIAL,DAI_PEDIDO as PEDIDO, DAI_CLIENT as CLIENTE, DAI_LOJA as LOJA, " 
_cQuery  := " C6_PRODUTO as PRODUTO, C6_QTDVEN as QTDE, SC6.R_E_C_N_O as R_E_C_N_O_ "
//_cQuery  += " C6_PRODUTO as PRODUTO, C6_QTDVEN as QTDE, DAI.R_E_C_N_O_ as R_E_C_N_O_ "
_cQuery  += " FROM DAI010 DAI"
_cQuery  += " INNER JOIN SC6010 SC6 ON SC6.C6_FILIAL = DAI_FILIAL AND SC6.C6_NUM = DAI_PEDIDO "    
_cQuery  += " AND SC6.C6_CLI = DAI_CLIENT AND SC6.C6_LOJA = DAI_LOJA AND SC6.D_E_L_E_T_ = ' ' "
_cQuery  += " INNER JOIN SC9010 SC9 ON C9_FILIAL = DAI_FILIAL AND C9_PEDIDO = DAI_PEDIDO "
_cQuery  += " AND SC9.C9_CLIENTE = DAI_CLIENT AND SC9.C9_LOJA = DAI_LOJA AND SC9.D_E_L_E_T_ = ' ' AND SC9.C9_BLEST = '02' AND SC9.C9_ITEM = SC6.C6_ITEM "
_cQuery  += " WHERE DAI.DAI_FILIAL = '"+xFilial("DAI")+"' AND DAI.DAI_COD = '" + DAK->DAK_COD + "' AND DAI.D_E_L_E_T_ = ' ' "  

MemoWrite("C:\teste\ROMSE14Z_V1.sql",_cQuery) //06/09/2019 Caique

if Select("TRBDAI") > 0
	TRBDAI->(DbCloseArea())
endif

TCQuery _cQuery New Alias "TRBDAI"

DbSelectArea("TRBDAI")
DbGotop()
IF TRBDAI->(EOF())
	TRBDAI->(DbCloseArea())
	
		MSGBOX("N�o existem registros para processar")
	
	Return
ENDIF*/

/*WHILE !TRBDAI->(EOF())

	DbSelectArea("SC6")
	DbGoto(TRBDAI->R_E_C_N_O_)              

   
   //������������������������������������������������������������������������Ŀ
   //�Libera por Item de Pedido                                               �
   //��������������������������������������������������������������������������
	
	Begin Transaction    
	
    
    �������������������������������������������������������������������������Ŀ��
    ���Funcao    �MaLibDoFat� Autor �Eduardo Riera          � Data �09.03.99 ���
    �������������������������������������������������������������������������Ĵ��
    ���Descri+.o �Liberacao dos Itens de Pedido de Venda                      ���
    �������������������������������������������������������������������������Ĵ��
    ���Retorno   �ExpN1: Quantidade Liberada                                  ���
    �������������������������������������������������������������������������Ĵ��
    ���Transacao �Nao possui controle de Transacao a rotina chamadora deve    ���
    ���          �controlar a Transacao e os Locks                            ���
    �������������������������������������������������������������������������Ĵ��
    ���Parametros�ExpN1: Registro do SC6                                      ���
    ���          �ExpN2: Quantidade a Liberar                                 ���
    ���          �ExpL3: Bloqueio de Credito                                  ���
    ���          �ExpL4: Bloqueio de Estoque                                  ���
    ���          �ExpL5: Avaliacao de Credito                                 ���
    ���          �ExpL6: Avaliacao de Estoque                                 ���
    ���          �ExpL7: Permite Liberacao Parcial                            ���
    ���          �ExpL8: Tranfere Locais automaticamente                      ���
    ���          �ExpA9: Empenhos ( Caso seja informado nao efetua a gravacao ���
    ���          �       apenas avalia ).                                     ���
    ���          �ExpbA: CodBlock a ser avaliado na gravacao do SC9           ���
    ���          �ExpAB: Array com Empenhos previamente escolhidos            ���
    ���          �       (impede selecao dos empenhos pelas rotinas)          ���
    ���          �ExpLC: Indica se apenas esta trocando lotes do SC9          ���
    ���          �ExpND: Valor a ser adicionado ao limite de credito          ���
    ���          �ExpNE: Quantidade a Liberar - segunda UM                    ���
    �������������������������������������������������������������������������Ĵ��
    

	MaLibDoFat(TRBDAI->R_E_C_N_O_,TRBDAI->QTDE,.F.,.T.,.F.,.F.,.T.)
	End Transaction    
	 

    //������������������������������������������������������������������������Ŀ
    //�Libera registro 						                                   �
    //��������������������������������������������������������������������������
	

     //������������������������������������������������������������������������Ŀ
     //�Atualiza o Flag do Pedido de Venda                                      �
     //��������������������������������������������������������������������������
	Begin Transaction
	
	SC6->(MaLiberOk({TRBDAI->PEDIDO},.F.))
	
	End Transaction     
	
	TRBDAI->(DbSkip())	
ENDDO

SC6->DbCloseArea()
RestArea(aArea)
Return*/
