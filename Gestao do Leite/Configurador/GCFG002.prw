#include "protheus.ch"
#include "topconn.ch"
#include "rwmake.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GCFG002  � Autor � TOTVS                 � Data da Criacao  � 14/07/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Codificacao de cadastro de fornecedores					   							                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gerar o campo A1_COD de forma automatica, como base no campo A1_L_TPFOR.                                     ���
���			 � Gatilho = A1_L_TPFOR SEQ: 001						                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum.                                                                                                      ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � _cRetorno = Retorna codigo para cadastro de fornecedores.           						                    ���
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
User Function GCFG002()

	Local _aArea    := GetArea()
	Local _cCodCli  := ""

	If M->A1_L_TPCLI == 'P'
		xMagHelpFis("Validacao- GLT","O tipo P=Produtor, so deve ser incluido pelo cadastro de Fornecedores, ";
		+"para preenchimento dos dados do modulo Gest�o do Leite!","O campo ser� alterado para C=Cliente")
		M->A1_L_TPCLI := 'C'	
	EndIf

	If Select("QRY") <> 0
		QRY->(DbCloseArea())
	EndIf

	BeginSql alias "QRY"
		SELECT MAX(A1_COD) AS CODIGO
		FROM %Table:SA1% A1
		WHERE A1.A1_FILIAL = %xFilial:SA1% 
		AND A1.A1_L_TPCLI = %Exp:M->A1_L_TPCLI% 
		AND A1.%NotDel% 
	EndSql

	dbSelectArea("QRY")
	dbGotop() 

	If QRY->(!Eof())  .and. !Empty(QRY->CODIGO)
		_cCodCli := M->A1_L_TPCLI + StrZero(Val(SubStr(QRY->CODIGO,2,5))+1,5)
	//	_cCodCli := Soma1(QRY->CODIGO)
	Else
		_cCodCli :=	M->A1_L_TPCLI + "00001"
	EndIf


	dbSelectArea("QRY")
	QRY->(DbCloseArea())

	//�����������������������������������������������������������������������������������Ĉ
	//� Tratamento para evitar que dois usuarios cadastrem o mesmo codigo ao mesmo tempo. �
	//�����������������������������������������������������������������������������������Ĉ
	While !MayIUseCode("A1_COD"+xFilial("SA1")+_cCodCli)  //verifica se esta na memoria, sendo usado
		_cCodCli := M->A1_L_TPCLI + StrZero(Val(SubStr(_cCodCli,2,5))+1,5)
		//_cCodCli := Soma1(_cCodCli)				   // busca o proximo numero disponivel
	EndDo

	M->A1_LOJA   := "01"
	RestArea(_aArea)

	If FWIsInCallStack("u_postClientes")
		Return cCCliPost
	Else
		Return(_cCodCli)
	Endif


Return(_cCodCli)
