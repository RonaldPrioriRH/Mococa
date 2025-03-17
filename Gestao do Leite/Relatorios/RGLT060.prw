#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
#INCLUDE "TOPCONN.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT060     � Autor � Ramon Teles           � Data da Criacao  � 07/08/2013             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relatorio de Fechamento Mensal por Evento.													                ���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gestao do Leite                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/

User Function RGLT060()

	Private cPerg := "RGLT060"
	
	Private oReport
	Private lInverte	:= .F.
	Private cMarca	:= GetMark()

	SetPrvt("oDlg","oSay")
	
	CriaSX1()
	
	Pergunte(cPerg,.T.,'Relat�rio Fechamento Mensal por Evento')
	
	sfPrint()
		
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �sfPrint   � Autor � Ramon Teles           � Data � 07/08/13 ���
�������������������������������������������������������������������������Ĵ��
���Descricao �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      �                                                            ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function sfPrint()

	Local cPerg
	
	oReport := ReportDef(cPerg)
	oReport:PrintDialog()

		
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �ReportDef � Autor � Ramon Teles           � Data � 07/08/13 ���
�������������������������������������������������������������������������Ĵ��
���Descricao �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      �                                                            ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ReportDef(cPerg)

	Private oReport,oSecZ0
	Private aTam := {}
	
	oReport := TReport():New("RGLT060","Resumo Fechamento Mensal por Evento",cPerg,{|oReport|PrintReport(oReport)},"Este relatorio ira imprimir as informa��es mensais do fechamento mensal por evento.")
	
	oReport:nFontBody	:= 8.5	
	oReport:lParamPage	:= .F.
	oReport:lHeaderVisible := .F.
	oReport:lFooterVisible := .F.
	oReport:SetPortrait(.T.)
	oReport:nLineHeight	:= 45
	
Return oReport

/*
�������������������������������������������������������������������������������
�������������������������������������������������������������������������������
���������������������������������������������������������������������������Ŀ��
���Funcao    �PrintReport � Autor � Ramon Teles           � Data � 07/08/13 ���
���������������������������������������������������������������������������Ĵ��
���Descricao � Responsavel por montar o relatorio                           ���
���������������������������������������������������������������������������Ĵ��
��� Uso      �                                                              ���
����������������������������������������������������������������������������ٱ�
�������������������������������������������������������������������������������
�������������������������������������������������������������������������������
*/

Static Function PrintReport()
	
	//Declaracao das Fontes
	Local oFont8 		:= TFont():New("COURIER NEW",08,08,,.F.,,,,.T.,.F.)
	Local oFont8N		:= TFont():New("COURIER NEW",08,08,,.T.,,,,.T.,.F.)
	Local oFont11 		:= TFont():New("COURIER NEW",11,11,,.F.,,,,.T.,.F.)
	Local oFont10N		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.F.)
	Local oFont10NS		:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.T.)
	Local oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
	Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
	Local oFont12NS		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.T.)
	Local oFont14 		:= TFont():New("COURIER NEW",14,14,,.F.,,,,.T.,.F.)
	Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
	Local oFont16 		:= TFont():New("COURIER NEW",16,16,,.F.,,,,.T.,.F.)
	Local oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
	Local oFont16NS		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.T.)
	
	Local nTamMax		:= oReport:PageWidth()- 50 //Tamanho m�ximo da p�gina
	Local nTamMid		:= (oReport:PageWidth()/2) //Metade da p�gina
	Local nWrtMid		:= nTamMid + 10 //Impress�o de dados a partir do meio da p�gina

	Local cQuery := ""
	Local cQuery2 := ""
	
	Local _cEnt 
	Local _cTipo
	
	//Data 
	Local _dIniVcto := SubString(mv_par02,3,4)+SubString(mv_par02,1,2)+"01"
	Local _dFimVcto := SubString(mv_par02,3,4)+SubString(mv_par02,1,2)+"31"
	Local _dDtEmi   := SubString(mv_par02,1,2)+"/"+SubString(mv_par02,3,4)
	
	//Array Valores
	Local _aLati := {}
	Local _aDesc := {}
	Local _aPres := {}
	Local _nDeb  := {}
	
	//Totalizadores
	Local _nTtPres := 0
	Local _nTtDesc := 0
	
	_cTipo := mv_par01
	_cEnt := RetEntid()

	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

	//Criando Cabe�alho
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "Relat�rio Fechamento Mensal por Evento" 		,oFont16N)
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42	, "Resumo Geral"     			,oFont14N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "Tipo de Entidade: " + _cEnt      		,oFont14N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.67	, "Per�odo: " + _dDtEmi	,oFont14N)

	oReport:SkipLine(2)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25	, "Evento"     			,oFont14N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, "a Descontar"     			,oFont14N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.65	, "Presta��es"    			,oFont14N)

	//Debito por Evento
	//_aDesc := ValDesc(_dIniVcto,_dFimVcto,_cTipo)
	
	//Debito Prestacoes Outras Filiais
	//_aPres := ValPres(_dIniVcto,_dFimVcto,_cTipo)
	
	//Debito Mes Anterior
	_nDeb  := ValDeb(_dIniVcto,_cTipo)
	
	oReport:SkipLine(2)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "D�bito M�s Anterior"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_nDeb,"@E 999,999,999.99"))	,oFont11)
	
	//oReport:SkipLine(2)	
	//oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "010101 - Laticinio"	,oFont11)
	oReport:SkipLine(1)	
	
	_aLati := ValLati(_dIniVcto,_dFimVcto,_cTipo)
	
	For _nX:=1 to Len(_aLati)
		oReport:SkipLine(1)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, _aLati[_nX][1] 	,oFont11)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.15	, " - " + SUBSTR(Posicione("ZL8",1,xFilial("ZL8")+_aLati[_nX][1],"ZL8_DESCRI"),1,20),oFont11)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aLati[_nX][2],"@E 999,999,999.99"))	,oFont11)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aLati[_nX][3],"@E 999,999,999.99"))	,oFont11)
		_nTtDesc += _aLati[_nX][2]
		_nTtPres += _aLati[_nX][3]
	Next   
	/*
	oReport:SkipLine(2) 
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "TOTAL"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aDesc[1],"@E 999,999,999.99"))	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aPres[1],"@E 999,999,999.99"))	,oFont11)
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "010201 - Loja Agropecuaria"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aDesc[2],"@E 999,999,999.99"))	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aPres[2],"@E 999,999,999.99"))	,oFont11)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "010301 - Supermercado"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aDesc[3],"@E 999,999,999.99"))	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aPres[3],"@E 999,999,999.99"))	,oFont11)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "010401 - Polo Industrial Fabrica"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aDesc[4],"@E 999,999,999.99"))	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aPres[4],"@E 999,999,999.99"))	,oFont11)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "010402 - Polo Industrial Armaz�m"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aDesc[5],"@E 999,999,999.99"))	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_aPres[5],"@E 999,999,999.99"))	,oFont11)
     */
	//_nTtDesc += _aDesc[1] + _aDesc[2] + _aDesc[3] + _aDesc[4] + _aDesc[5] + _nDeb
    //_nTtPres += _aPres[1] + _aPres[2] + _aPres[3] + _aPres[4] + _aPres[5] 

	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "Total do Movimento Mensal"	,oFont11)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_nTtDesc,"@E 999,999,999.99"))	,oFont11)  
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.60	, cValtoChar(Transform(_nTtPres,"@E 999,999,999.99"))	,oFont11) 
	//oReport:SkipLine(2)
	//oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	, "� Vencer ap�s 31/"+ SUBSTR(mv_par02,1,2) +"/"+ SUBSTR(mv_par02,3,6)  	,oFont11)
	//oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40	, cValtoChar(Transform(_aPres,"@E 999,999,999.99"))	,oFont11) 	
                                                                                                                               

 

	oReport:EndPage()
		
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ValDesc  � Autor � Ramon Teles        � Data �  12/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para retornar o valor total dos debitos			  ���
���          � do mes atual.		                                      ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ValDesc(_dIniVcto,_dFimVcto,_cTipo)

	Local _aArea    := GetArea()
	
	Local _cQuery := ""
	
	Local _aRet := {0,0,0,0,0} 
	
	_cQuery := " SELECT E2_MSFIL AS FIL ,SUM(E2_VALOR+E2_ACRESC-E2_DECRESC) AS VALOR"
	_cQuery += " FROM "+RetSqlName("SE2")+" SE2  "
	_cQuery += " WHERE " + RetSqlCond("SE2") + " "
	If _cTipo == 1
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'C')"
	ElseIf _cTipo == 2	
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'E')"
	ElseIf _cTipo == 3
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'G')"
	EndIf
//	_cQuery += " AND E2_SALDO > 0 "
	_cQuery += " AND E2_L_EVENT <> '' "
	_cQuery += " AND E2_TIPO = 'NDF' "	
	_cQuery += " AND SE2.E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"'"  
	_cQuery += " GROUP BY E2_MSFIL "  
	
	If Select ("MEA") <> 0
		MEA->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"MEA",.F.,.T.)
	
	MEA->(dbGoTop())

	While MEA->(!Eof())
		If MEA->FIL = '010101'//'010101'//
			_aRet[1] := MEA->VALOR
		ElseIf MEA->FIL = '010201'//'02'//'010201'//
			_aRet[2] := MEA->VALOR
		ElseIf MEA->FIL = '010301'//'03'//'010301'//
			_aRet[3] := MEA->VALOR
		ElseIf MEA->FIL = '010401'//'04'//'010401'//
			_aRet[4] := MEA->VALOR
		ElseIf MEA->FIL = '010402'//'05'//'010402'//
			_aRet[5] := MEA->VALOR
		EndIf
		
		MEA->(DbSkip())
		
	EndDo
	
	MEA->(DBCLOSEAREA())
	
	RestArea(_aArea)
		
Return _aRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ValPres  � Autor � Ramon Teles        � Data �  12/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para retornar o valor total dos debitos			  ���
���          � do meses futuros.	                                      ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ValPres(_dIniVcto,_dFimVcto,_cTipo)

	Local _aArea    := GetArea()
	
	Local _cQuery := ""
	
	Local _aRet := {0,0,0,0,0} 
	
	_cQuery := " SELECT E2_MSFIL AS FIL ,SUM(E2_VALOR+E2_ACRESC-E2_DECRESC) AS VALOR"
	_cQuery += " FROM "+RetSqlName("SE2")+" SE2  "
	_cQuery += " WHERE " + RetSqlCond("SE2") + " "
	If _cTipo == 1
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'C')"
	ElseIf _cTipo == 2	
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'E')"
	ElseIf _cTipo == 3
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'G')"
	EndIf
//	_cQuery += " AND E2_SALDO > 0 "
	_cQuery += " AND E2_L_EVENT <> '' "
	_cQuery += " AND E2_TIPO = 'NDF' "	
	_cQuery += " AND SE2.E2_VENCTO > '"+_dFimVcto+"' "  
	//_cQuery += " AND SE2.E2_EMISSAO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' " 
	_cQuery += " GROUP BY E2_MSFIL "  
	
	If Select ("MEF") <> 0
		MEF->(dbCloseArea())                                                           
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"MEF",.F.,.T.)
	
	MEF->(dbGoTop())
	
	_aRet := MEF->VALOR 
	
	MEF->(DBCLOSEAREA())
	
	RestArea(_aArea)
		
Return _aRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ValLati  � Autor � Ramon Teles        � Data �  19/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para retornar o valor dos debitos do Laticinio	  ���
���          � do mes atual e futuros.                                    ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ValLati(_dIniVcto,_dFimVcto,_cTipo)

Local _aArea    := GetArea()
Local _aRet		:= {}
Local _cSubSel
Local _cQuery := ""  
Local _cMes := VAL(SUBSTR(mv_par02,1,2))
Local _cVcto := "" 
	
	IF _cMes == 12
	   _cMes := 01
	Else
		_cMes ++
	Endif 
	_cMes:= STRZERO(_cMes,2)
	_cVcto := SUBSTR(mv_par02,3,6) + _cMes + '20'

	_cQuery := " SELECT E2_L_EVENT, SUM( E2_VALOR+E2_ACRESC-E2_DECRESC) AS DEB,"
	_cQuery += " ( SELECT SUM(E2_VALOR+E2_ACRESC-E2_DECRESC) FROM " + RetSqlName("SE2") + " SE21 WHERE SE21.D_E_L_E_T_ = ' '  " 
	_cQuery += "   AND SE21.E2_SALDO > 0 AND SE21.E2_TIPO = 'NDF' AND SE21.E2_VENCTO > '"+_dFimVcto+"'  " 
	_cQuery += "   AND SE21.E2_L_EVENT = SE2.E2_L_EVENT " 
	_cQuery += "   AND SE21.E2_L_EVENT <> '' " 
	If _cTipo == 1
	_cQuery += "   AND (SUBSTRING(SE21.E2_FORNECE,1,1) = 'C') "
	ElseIf _cTipo == 2
	_cQuery += "   AND (SUBSTRING(SE21.E2_FORNECE,1,1) = 'E') "
	ElseIf _cTipo == 3
	_cQuery += "   AND (SUBSTRING(SE21.E2_FORNECE,1,1) = 'G') "
	EndIf	
	_cQuery += " ) AS PRES "
	_cQuery += " FROM "+RetSqlName("SE2")+" SE2  "
	_cQuery += " WHERE " + RetSqlCond("SE2") + " "
	If _cTipo == 1
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'C')"
	ElseIf _cTipo == 2	
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'E')"
	ElseIf _cTipo == 3
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'G')"
	EndIf
//	_cQuery += " AND SE2.E2_SALDO > 0 "
	_cQuery += " AND SE2.E2_TIPO = 'NDF' "	
	_cQuery += " AND SE2.E2_VENCTO BETWEEN '"+_dIniVcto+"' AND '"+_dFimVcto+"' "
	_cQuery += " AND SE2.E2_L_EVENT <> ' ' "
	_cQuery += " GROUP BY E2_L_EVENT ORDER BY E2_L_EVENT"   
	
	If Select ("LAT") <> 0
		LAT->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"LAT",.F.,.T.)
	
	LAT->(dbGoTop())

	While LAT->(!Eof())
		
		AADD(_aRet,{LAT->E2_L_EVENT,LAT->DEB,LAT->PRES})
				
		LAT->(DbSkip())
		
	EndDo
	
	LAT->(DBCLOSEAREA())
	
	RestArea(_aArea)
		
Return _aRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ValDeb   � Autor � Ramon Teles        � Data �  12/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para retornar o valor total dos debitos em aberto   ���
���          � do meses anteriores.                                       ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ValDeb(_dIniVcto,_cTipo)

	Local _aArea    := GetArea()
	
	Local _cQuery := ""

	Local _nValorTt := 0 
	
	Local _cVcto := SUBSTR(mv_par02,3,4) + SUBSTR(mv_par02,1,2) + '20'
	
	_cQuery := " SELECT SUM(E2_VALOR+E2_ACRESC-E2_DECRESC) AS VALOR "
	_cQuery += " FROM "+RetSqlName("SE2")+" SE2  "
	_cQuery += " WHERE " + RetSqlCond("SE2") + " "
	If _cTipo == 1
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'C')"
	ElseIf _cTipo == 2	
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'E')"
	ElseIf _cTipo == 3
		_cQuery += " AND (SUBSTRING(SE2.E2_FORNECE,1,1) = 'G')"
	EndIf
	_cQuery += " AND E2_SALDO > 0 "
	_cQuery += " AND E2_TIPO = 'NDF' " 
	_cQuery += " AND E2_L_EVENT <> ' ' "
	_cQuery += " AND SUBSTRING(SE2.E2_PREFIXO,1,1) = 'G' 	"
	_cQuery += " AND SE2.E2_VENCTO < '"+_dIniVcto+"' "  
		
	If Select ("DBA") <> 0
		DBA->(dbCloseArea())
	EndIf
	
	_cQuery := changeQuery(_cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery),"DBA",.F.,.T.)
	
	DBA->(dbGoTop())

	_nValorTt := DBA->VALOR

	DBA->(DBCLOSEAREA())
	
	RestArea(_aArea)
		
Return _nValorTt

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � RetEntid � Autor � Ramon Teles        � Data �  07/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para retornar o tipo da entidade. 				  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function RetEntid()

	Local __cEnt	
	
	if mv_par01 == 1
		__cEnt := "Cooperado"
	elseif mv_par01 == 2
		__cEnt := "Funcion�rios"
	elseif mv_par01 == 3
		__cEnt := "Transp. Granel"
	else
		__cEnt := "Todos"
	endif

Return (__cEnt)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � CriaSX1  � Autor � Ramon Teles        � Data �  07/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CriaSX1()

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe o tipo de entidade que deseja ')
	Aadd( aHelpPor, ' filtrar.      ')
	U_xPutSx1(cPerg,"01","Tipo Entidade"," "," ","mv_ch1","N" ,1,0,0,"C","NaoVazio()","","","","MV_PAR01","Cooperado","Cooperado","Cooperado"   ,"","Funcionarios","Funcionarios","Funcionarios","Tranps. Granel","Tranps. Granel","Tranps. Granel","Todos","Todos","Todos","","","",aHelpPor,aHelpEng,aHelpSpa)
	
	//Data Saldo
	aHelpPor := {}
	Aadd( aHelpPor, 'Informe a data do saldo.                ')
	Aadd( aHelpPor, 'Formato (mmaaaa)                        ')
	U_xPutSx1(cPerg,"02","Data Saldo (mmaaaa)"," "," ","mv_ch2","C",6,0,0,"G","NaoVazio()","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
		
Return



