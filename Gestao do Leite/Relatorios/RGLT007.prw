#INCLUDE "TOTVS.CH"
/*/
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#include "report.ch"
#INCLUDE "TOTVS.CH"
#include "rwmake.ch"
#INCLUDE "RPTDEF.CH"

�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT007  � Autor � Guilherme Fran�a      � Data da Criacao  � 05/08/2014                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relat�rio de conv�nios. Emitido na tela de lan�amento do conv�nio j� filtrando o fornecedor posicionado.     ���
���          �                   												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Cliente, Data de Emissao, Forma de Ordenacao  			                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Financeiro                                                                           						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                			       �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

User Function RGLT007()

Private _cPerg := "RGLT007"
Private _aArea := GetArea()
Private _cFornece := ZLL->ZLL_CONVEN //Codigo do fornecedor do convenio

//����������������������������������������������������������������������Ŀ
//� Ajusta pergunta de parametros                                        �
//������������������������������������������������������������������������
AjustaSX1(_cPerg)

Pergunte(_cPerg,.F.) //Preenche os parametros para sugest�o.
MV_PAR01 := ZLL->ZLL_DATA
MV_PAR02 := ZLL->ZLL_DATA

Pergunte(_cPerg,.T.)

//����������������������������������������������������������������������Ŀ
//� Funcao que retorna o report montado com as configuraoes do relatorio �
//������������������������������������������������������������������������
oReport := ReportDef(_cPerg)
oReport:PrintDialog()

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT007   �Autor  �Microsiga           � Data �  08/05/14   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao que retorna o report montado com as configuraoes     ���
���          �do relatorio                                                ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ReportDef()

Private oReport


oReport := TReport():NEW("RGLT007" ,"Relatorio de Conv�nios" ,_cPerg,{|oReport|PrintReport(oReport)} ,"")

oReport:nLineHeight	:= 50            // Define a altura da linha.
oReport:lParamPage		:= .F.
//oReport:lHeaderVisible 	:= .F.
//oReport:lFooterVisible 	:= .F.
oReport:SetPortrait(.T.)
oReport:GetOrientation(1)
oReport:SetTotalInLine(.F.)


Return oReport

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT007   �Autor  �Microsiga           � Data �  08/05/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao que executa impressao do relatorio                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function PrintReport(oReport)

Local _cFiltro := ""
Local _cCodConv := ""
Local _nTaxa := 0 // Taxa descontada do conveniado
Local _nTotConv := 0 //Total a receber do convenio
Local _nTotPagar := 0
Local _nTotOri := 0 
Local _nTotFim := 0 
Local _nTotTax := 0 
Private _cAlias := GetNextAlias()
Private oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
Private oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
Private oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Private oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)


_cFiltro := "% AND ZLL_DATA BETWEEN '"+DTOS(MV_PAR01)+"' AND '"+DTOS(MV_PAR02)+"' "
_cFiltro += " AND ZLL_CONVEN = '"+_cFornece+"' "
_cFiltro += " ORDER BY ZLL_COD, ZLL_SEQ%"

BeginSql Alias _cAlias

	SELECT ZLL_COD AS CODIGO,
		   ZLL_SEQ AS SEQ,
	       ZLL_CONVEN AS FORNECE,
	       ZLL_LJCONV AS LJFORN,
		   ZLL_DATA AS EMISSAO,
		   ZLL_VENCON AS VENCTO,
		   ZLL_OBSERV AS OBS,
		   ZLL_EVENTO AS EVENTO,
		   ZLL_TXADM AS TAXA,
		   ZLL_RETIRO AS RETIRO,
		   ZLL_RETILJ AS LOJA,
		   A2_NOME AS NOME,
		   ZLL_VALOR AS VALOR,
		   ZLL_PARCEL AS PARCELA,
		   ZLL_VLRPAR AS VLRPAR,
		   ZLL_VLRTOT AS TOTAL
	FROM  %table:ZLL% ZLL,  %table:SA2% A2
	WHERE ZLL.%NotDel%
	AND A2.%NotDel%
	AND ZLL.ZLL_RETIRO = A2.A2_COD
	AND ZLL.ZLL_RETILJ = A2.A2_LOJA
	%Exp:_cFiltro%

EndSql

If (_cAlias)->(Eof())
	Alert("N�o existem dados para este conveniado no periodo informado!")
	Return
EndIf

While !(_cAlias)->(Eof()) .and. ((_cAlias)->FORNECE == _cFornece)
	PrintCabec(1)
	_cCodConv := (_cAlias)->CODIGO
	While!(_cAlias)->(Eof()) .and. (_cCodConv == (_cAlias)->CODIGO)

		If oReport:Row() >= oReport:PageHeight() - 80
			oReport:EndPage()
			oReport:StartPage()
			PrintCabec(2)
		EndIf
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,(_cAlias)->SEQ	,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.04,(_cAlias)->RETIRO		,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13,(_cAlias)->NOME		,oFont12)	
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.44,Transform((_cAlias)->VALOR,"@E 9,999,999.99") ,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.59,StrZero((_cAlias)->PARCELA,2)		,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68,Transform((_cAlias)->VLRPAR,"@E 999,999.99")		,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80,Transform((_cAlias)->TOTAL,"@E 9,999,999.99")	,oFont12)
		oReport:SkipLine(1)
		_nTotConv += (_cAlias)->VALOR
		_nTotPagar += (_cAlias)->TOTAL
		_nTaxa :=  (_cAlias)->TAXA

		(_cAlias)->(DbSkip())	
	EndDo
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Total Lan�amento: "+_cCodConv,oFont12)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.41,"R$"+Transform(_nTotConv,"@E 99,999,999.99") ,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.79,"R$"+Transform(_nTotPagar,"@E 9,999,999.99")	,oFont12)
/*	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Taxa Adm: R$"+Transform(_nTaxa,"@E 99,999.99"),oFont12)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.30,"Valor a pagar ao conveniado: R$"+Transform(_nTotConv-_nTaxa,"@E 99,999,999.99") ,oFont12N)		
*/
	oReport:SkipLine(1)
	oReport:ThinLine()
	oReport:SkipLine(2)

	_nTotOri += _nTotConv 
	_nTotFim += _nTotPagar
	_nTotTax += _nTaxa 

	_nTotConv := 0
	_nTotPagar := 0
	_nTaxa := 0

EndDo

If oReport:Row() >= oReport:PageHeight() - 85
	oReport:EndPage()
	oReport:StartPage()
EndIf
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Resumo dos Lan�amentos:",oFont12N)	
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor Lan�ado: " ,oFont12)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24,"R$"+Transform(_nTotOri,"@E 9,999,999.99") ,oFont12N)
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor a cobrar do Associado:"	,oFont12)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24,"R$"+Transform(_nTotFim,"@E 9,999,999.99")	,oFont12N)
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor da taxa Adm:" ,oFont12)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24,"R$"+Transform(_nTotTax,"@E 9,999,999.99") ,oFont12N)
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor l�quido do Conveniado:" ,oFont12)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.24,"R$"+Transform(_nTotFim-_nTotTax,"@E 9,999,999.99") ,oFont12N)
oReport:SkipLine(1)

_nTotOri := 0
_nTotFim := 0
_nTotTax := 0


oReport:EndPage()

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PrintCabec�Autor  �Microsiga           � Data �  08/05/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Imprime o cabe�alho do relatorio.                          ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function PrintCabec(_nOpc)

Local _cNomFor := Posicione("SA2",1,xFilial("SA2")+_cFornece+(_cAlias)->LJFORN,"A2_NOME")

If _nOpc == 1
	oReport:StartPage()
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Conveniado: "	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13	, _cFornece +" "+ _cNomFor	,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "C�digo Lcto:  "  		,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13	, (_cAlias)->CODIGO 		,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25	, "Dt.Lan�amento: " ,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.37	, DTOC(STOD((_cAlias)->EMISSAO))  ,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.52	, "Vencimento: ",oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62	, DTOC(STOD((_cAlias)->VENCTO))	,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Observa��o: "	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13	, (_cAlias)->OBS	,oFont12N)

	
	oReport:SkipLine(1)
	oReport:ThinLine()
	oReport:SkipLine(1)
	PrintCabec(2)
EndIf

If _nOpc == 2
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Seq."			,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.04,"Matr�cula"		,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.13,"Associado"		,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.44,"Vlr.Original"	,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.56,"Qtd.Parcela"		,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.67,"Vlr.Parcela"		,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.82,"Vlr.Total"		,oFont12N)
	oReport:SkipLine(1)
EndIf


Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AjustaSX1 �Autor  �Microsiga           � Data �  08/05/14   ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria��o das perguntas                                      ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AjustaSX1()


//Filtro de data de emiss�o
aHelpPor := {}
aAdd(aHelpPor, "Informe a emissao inicial a ser filtrada" )                //tipo  //tamanho
U_xPutSx1(_cPerg,"01","Da Emissao ?  ","","","mv_ch1","D",8,0,0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {}
aAdd(aHelpPor, "Informe a emissao final a ser filtrada" )                //tipo  //tamanho
U_xPutSx1(_cPerg,"02","At� Emissao ?  ","","","mv_ch2","D",8,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})


Return
