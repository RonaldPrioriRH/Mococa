#INCLUDE "topconn.ch"     
#INCLUDE "rwmake.ch"
#INCLUDE "protheus.ch"
/*
___________________________________________________________________________
�����������������������������������������������������������������������������
��+-----------------------------------------------------------------------+��
���Programa  � MA030TOK � Autor � totvs                 � Data � 12/09/11 ���
��+----------+------------------------------------------------------------���
���Descri��o � Ponto de Entrada na validacao da inclusao de fornecedores  ���
���          �                                                            ���
��+----------+------------------------------------------------------------���
��� Uso      � Caso j� exista o CPF/CNPJ realizar o cadastro com o mesmo  ���
���          � c�digo por�m alterar a loja                                ���
��+-----------------------------------------------------------------------+��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function xFATESA2(lAuto)	//Alterado 27/05/2014
Local aCodigos 	:= {}		//Alterado 27/05/2014
Local aArea  	:= GetArea()	//Alterado 27/05/2014

//********************************************************            
//Altera��o �nicio...
//Verifica se j� existe cadastrado o CPF ou CNPJ para colocar proxima loja, colocar esta altera��o nos fontes que forem utilizado para sequenciar c�d. fornecedor.
//*******************************************************

DEFAULT lAuto := .F.

If Inclui
	aCodigos := CodProxLoja(M->A2_CGC)

	//Se encontrou CNPJ/CPF base
	If Len(aCodigos) > 0 .and. !lAuto
		M->A2_COD  := aCodigos[1]
		M->A2_LOJA := aCodigos[2]
	else
		Return ( {aCodigos[01], aCodigos[02]} )
	Endif
//********************************************************            
//Altera��o Fim...
//Verifica se j� existe cadastrado o CPF ou CNPJ para colocar proxima loja, colocar esta altera��o nos fontes que forem utilizado para sequenciar c�d. fornecedor.
//*******************************************************
EndIf

RestArea(aArea)
return(.T.)


Static Function CodProxLoja(cCGC)
Local cQuery 	:= ""
Local aAux 		:= {}
Local cCod      := ""
Local cLoja     := ""     
Local cFilSA2   := xFilial("SA2")

cQuery := "SELECT A2_COD, Ltrim(Rtrim(MAX(A2_LOJA))) AS NSEQUEN "
cQuery += " FROM "+RetSqlName("SA2")
cQuery += " WHERE "
cQuery += " D_E_L_E_T_ = ' ' "
cQuery += " AND A2_FILIAL  =  '"+xFilial("SA2")+"' "
cQuery += " AND A2_CGC LIKE '%"+Substr(cCGC,1,8)+"%' " 
cQuery += " GROUP BY A2_COD "
 
cQuery := Changequery(cQuery)           
 
TCQUERY cQuery NEW ALIAS "QAUX"
DbSelectArea("QAUX") 
QAUX->(DbGoTop())
If QAUX->(!EOF())                   

	cCod  := QAUX->A2_COD
	cLoja := Padl(soma1(QAUX->NSEQUEN), TamSX3("A2_LOJA")[1],'0')	

	DbSelectArea("SA2") 
	SA2->(DbSetOrder(1))	
	while !SA2->(eof()) .AND. SA2->(DbSeek(cFilSA2+cCod+cLoja,.f.))
		cLoja := Padl(soma1(cLoja), TamSX3("A2_LOJA")[1],'0')	
	end
	
	aAux := {QAUX->A2_COD, cLoja} 
Else   
	cCod  := GETSXENUM("SA2","A2_COD")                      
	cLoja := Padl("01", TamSX3("A2_LOJA")[1],'0')	
	aAux  := {cCod, cLoja} 
Endif

QAUX->(DbCloseArea()) 
Return(aAux)


//*************************************************************
//Altera��o �nicio...
// P.E. criado para manipular o codigo automatico customizado
//Colocar esta altera��o nos fontes que forem utilizado para sequenciar c�d. fornecedor.
//*************************************************************

User Function ACMPFOR()
Return u_xFATESA2(.T.)

//*************************************************************
//Altera��o F�m...
//*************************************************************