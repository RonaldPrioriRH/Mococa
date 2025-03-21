#INCLUDE "protheus.ch"
#INCLUDE "topconn.ch"
#INCLUDE "TOTVS.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GCFG001  � Autor � TOTVS                 � Data da Criacao  � 14/07/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Codificacao de cadastro de fornecedores					   							                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gerar o campo A2_COD de forma automatica, como base no campo A2_L_TPFOR.                                     ���
���			 � Gatilho = A2_L_TPFOR SEQ: 001						                                   						���
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
User Function GCFG001()

Local _aArea    := GetArea()
Local _cCodFor  := ""


If Select("QRY") <> 0
	QRY->(DbCloseArea())
EndIf

BeginSql alias "QRY"
	SELECT MAX(A2_COD) AS CODIGO
	FROM %Table:SA2% A2
	WHERE A2.A2_FILIAL = %xFilial:SA2% 
	AND A2.A2_L_TPFOR = %Exp:M->A2_L_TPFOR% 
	AND A2.%NotDel% 
EndSql
                          

dbSelectArea("QRY")
dbGotop()

If QRY->(!Eof()) .and. !Empty(QRY->CODIGO)
	_cCodFor := M->A2_L_TPFOR + StrZero(Val(SubStr(QRY->CODIGO,2,5))+1,5)
//	_cCodFor := Soma1(QRY->CODIGO)  // Utilizando esta fun��o, o c�digo fica alfanumerico
Else
	_cCodFor :=	M->A2_L_TPFOR+"00001"
EndIf


//�����������������������������������������������������������������������������������Ĉ
//� Tratamento para evitar que dois usuarios cadastrem o mesmo codigo ao mesmo tempo. �
//�����������������������������������������������������������������������������������Ĉ
While !MayIUseCode("A2_COD"+xFilial("SA2")+_cCodFor)  //verifica se esta na memoria, sendo usado
	_cCodFor := M->A2_L_TPFOR + StrZero(Val(SubStr(_cCodFor,2,5))+1,5)				   // busca o proximo numero disponivel
//	_cCodFor := Soma1(_cCodFor)
EndDo

M->A2_LOJA   := "01"
//If SubStr(_cCodFor,1,1) $ "PT"
//	M->A2_L_TANQ := _cCodFor
//EndIf

dbSelectArea("QRY")
QRY->(dbCloseArea())

RestArea(_aArea)
Return(_cCodFor)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �GCFGCPF   �Autor  �Microsiga           � Data �  07/28/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function GCFGCPF(xcTab)

Local _aArea    := GetArea()
//Local _nReg :=  0
Local _cCodFor  := "" 
Local _cCodLj   := ""
Local _cFiltro	:= ""



DEFAULT xcTab := "SA2"

If Select("QRY2") <> 0
	QRY2->(DbCloseArea())
EndIf

If xcTab == 'SA1'
	If Len(Alltrim(M->A1_CGC)) > 11
		_cFiltro := "% SUBSTRING(A1.A1_CGC,1,8) = '"+SubStr(Alltrim(M->A1_CGC),1,8)+"'  %"
	Else
		_cFiltro := "% A1.A1_CGC = '"+Alltrim(M->A1_CGC)+"'  %"	
	EndIf
	
	BeginSql alias "QRY2"
		SELECT MAX(A1_COD) AS CODIGO, MAX(A1_LOJA) AS LOJA
		FROM %Table:SA1% A1
		WHERE A1.A1_FILIAL = %xFilial:SA1% 
		AND A1.A1_L_TPCLI = %Exp:M->A1_L_TPCLI%
		AND %Exp:_cFiltro% 
		AND A1.%NotDel% 
	EndSql
	
	//memowrite("c:\query1.sql",GetLastQuery()[2]) 
Else
	If Len(Alltrim(M->A2_CGC)) > 11
		_cFiltro := "% SUBSTRING(A2.A2_CGC,1,8) = '"+SubStr(Alltrim(M->A2_CGC),1,8)+"'  %"
	Else
		_cFiltro := "% A2.A2_CGC = '"+Alltrim(M->A2_CGC)+"'  %"	
	EndIf

	BeginSql alias "QRY2"
		SELECT MAX(A2_COD) AS CODIGO, MAX(A2_LOJA) AS LOJA
		FROM %Table:SA2% A2
		WHERE A2.A2_FILIAL = %xFilial:SA2% 
		AND A2.A2_L_TPFOR = %Exp:M->A2_L_TPFOR%
		AND %Exp:_cFiltro%
		AND A2.%NotDel% 
	EndSql
	
	//memowrite("c:\query2.sql",GetLastQuery()[2]) 
EndIf	
	

dbSelectArea("QRY2")
qry2->(dbGotop())

If !QRY2->(Eof()) .and. !Empty(qry2->codigo)
	_cCodFor:= qry2->codigo
	_cCodLj := Soma1(qry2->LOJA)
	
	

	MsgInfo("O c�digo ser� alterado para o j� existente para este CPF/CNPJ, e a loja ser� incrementada.","Valida��o C�digo Sequencial")
	
	//Ajuste C�digo da Loja - A1_LOJA Caracter e A2_LOJA N�merico	
	If xcTab == 'SA1'
		//A1_LOJA � do tipo Caracter
		M->A1_COD	:= _cCodFor
		M->A1_LOJA  := _cCodLj

	Else
		//A2_loja � do tipo N�merico
		M->A2_COD	:= _cCodFor
		M->A2_LOJA  := strzero(val(_cCodLj),2)  
	EndIf
	
EndIf

dbSelectArea("QRY2")
QRY2->(dbCloseArea())


RestArea(_aArea)
Return .T.


