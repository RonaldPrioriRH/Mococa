#include "protheus.ch"
#include "topconn.ch"
#include "rwmake.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GCFG004  � Autor � TOTVS                 � Data da Criacao  � 05/06/2013               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Atualiza versao da linha/rota							   							                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gerar o campo ZLY_VERSAO de forma automatica, como base no campo ZLY_ROTA.                                   ���
���			 � Gatilho = ZLY_ROTA	 SEQ: 003						                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.                                                                                                      ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � _cRetorno = Retorna codigo para linha/rota				          						                    ���
���          �                                                                                                              ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �                                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                    				   			���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���			 �			|                              					   �                                  �   	        ���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/


User Function GCFG004(par)

	Local _aArea    := GetArea()
	Local _cQuery   := ""
	Local _cVersao  := ""
	
	if par == 1 //CONS. PADRAO
	
		_cQuery := " SELECT MAX(ZLY_VERSAO) AS VERSAO"
		_cQuery += " FROM " + RetSqlName("ZLY")
		_cQuery += " WHERE ZLY_ROTA = '" + ZLW->ZLW_COD + "' AND D_E_L_E_T_ = ' ' "
	
	else //GATILHO
		
		_cQuery := " SELECT MAX(ZLY_VERSAO) AS VERSAO"
		_cQuery += " FROM " + RetSqlName("ZLY")
		_cQuery += " WHERE ZLY_ROTA = '" + M->ZLY_ROTA + "'  AND D_E_L_E_T_ = ' ' "
	
	endif
	
	_cQuery    := ChangeQuery( _cQuery )
	dbUseArea( .T., "TOPCONN", TcGenQry(,,_cQuery), "QRY" , .F., .T. )
	
	dbSelectArea("QRY")
	dbGotop()
	
	_cVersao := QRY->VERSAO 
	
	dbSelectArea("QRY")
	dbCloseArea("QRY")
	
	If !Empty(_cVersao)
		_cVersao := StrZero(Val(_cVersao)+1,3)
		//_cVersao := "010"
	Else 
		_cVersao := "001"	
	EndIf

	//�����������������������������������������������������������������������������������Ĉ
	//� Tratamento para evitar que dois usuarios cadastrem o mesmo codigo ao mesmo tempo. �
	//�����������������������������������������������������������������������������������Ĉ
	While !MayIUseCode("ZLY_VERSAO"+xFilial("ZLY")+_cVersao)  //verifica se esta na memoria, sendo usado
		_cVersao := StrZero(Val(SubStr(_cVersao,2,5))+1,3)				   // busca o proximo numero disponivel
	EndDo
	
	RestArea(_aArea)
Return(_cVersao)

