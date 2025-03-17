#include "totvs.ch"
#include "protheus.ch"
#include "topconn.ch"


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT066     � Autor � Ariclenes M. Costa           � Data da Criacao  � 23/09/2013             				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relatorio Extratifica��o por quantidade															                ���
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

User Function RGLT066()

	Local cPerg := "RGLT066" // var pergunta
	
	Private oReport
	Private lInverte	:= .F.
	Private cMarca	:= GetMark()
	Private nCity       
	Private cTpCli


	SetPrvt("oDlg","oSay")
	
	CriaSX1(cPerg)
	
	Pergunte(cPerg,.T.,'Extratifica��o por quantidade')
	
	sfPrint()
		
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �sfPrint �   Autor � Ariclenes M. Costa    � Data � 23/09/13 ���
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
���Funcao    �ReportDef � Autor � Ariclenes M. Costa    � Data � 23/09/13 ���
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
	
	oReport := TReport():New("RGLT066","Relat�rio Extratifi��o por Quantidade ",cPerg,{|oReport|PrintReport(oReport)},"Extratifi��o por Quantidade")
	
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
���Funcao    �PrintReport � Autor � Ariclenes M. Costa    � Data � 23/09/13 ���
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
	Local oFont10 		:= TFont():New("COURIER NEW",10,10,,.F.,,,,.T.,.F.)
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
	
	Local _nTotProd := 0
	Local _nTotVol := 0
	Local _nTotBru := 0
	Local _nTotLiq := 0

	oReport:SkipLine(6)
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)	

	oReport:SkipLine(1)

	//Consulta para buscar informacoes
	cQuery :=	"SELECT '1' AS SEQ,"
	cQuery +=  "'Ate 50 litros' AS FAIXA,"
	cQuery +=	" (SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF_QTDBOM <= 50) AS PRODUTORES,"
	cQuery +=	" SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	" (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM <= 50 ) AS BRUTO,"
	cQuery +=	" (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM <= 50) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM <= 50) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM <= 50 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '2' AS SEQ,"
	cQuery +=	"'de 51 a 100' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 50 AND ZLF.ZLF_QTDBOM <= 100) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 50 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 100 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '3' AS SEQ,"
	cQuery +=	"'de 101 a 200' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 100 AND ZLF.ZLF_QTDBOM <= 200) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 100 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 200 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '4' AS SEQ,"
	cQuery +=	"'de 201 a 300' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 200 AND ZLF.ZLF_QTDBOM <= 300) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 200 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 300 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '5' AS SEQ,"
	cQuery +=	"'de 301 a 400' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 300 AND ZLF.ZLF_QTDBOM <= 400) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 300 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 400 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '6' AS SEQ,"
	cQuery +=	"'de 401 a 500' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 400 AND ZLF.ZLF_QTDBOM <= 500) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 400 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 500 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 

	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '7' AS SEQ,"
	cQuery +=	"'de 501 a 1.000' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 500 AND ZLF.ZLF_QTDBOM <= 1000) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 500 AND"
	cQuery += 	" ZLF.ZLF_QTDBOM <= 1000 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '" 
	
	cQuery += 	" UNION "
	
	cQuery +=	"SELECT '8' AS SEQ,"
	cQuery +=	"'Acima de 1.000' AS FAIXA,"
	cQuery +=	"(SELECT COUNT(DISTINCT ZLF_RETIRO) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_QTDBOM > 1000) AS PRODUTORES,"
	cQuery +=	"SUM(ZLF.ZLF_QTDBOM) AS ZLF_QTDBOM,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 1000 ) AS BRUTO,"
	cQuery +=	"(SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'C' AND ZLF.ZLF_QTDBOM > 1000) - (SELECT SUM(ZLF.ZLF_TOTAL) FROM "+RetSqlName("ZLF")+" ZLF "+"WHERE ZLF.ZLF_DEBCRE = 'D' AND ZLF.ZLF_QTDBOM > 1000) AS LIQUIDO"
	cQuery +=	" FROM "+RetSqlName("ZLF")+" ZLF "
	cQuery +=	" WHERE ZLF.ZLF_QTDBOM > 1000 AND ZLF.ZLF_DTFIM BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' AND ZLF.D_E_L_E_T_ = ' '"
	
	cQuery +=  "ORDER BY SEQ"
	
	If Select ("Qry") <> 0
		Qry->(dbCloseArea())
	EndIf
	
	cQuery := changeQuery(cQuery)
	
	dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQuery),"Qry",.F.,.T.)
	
	Qry->(dbGoTop())

	//Criando Secao do Faturamento
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35	, "Extratifica��o por quantidade" 		,oFont16NS)
		
	oReport:SkipLine(5)
	
	//Criando Menu dos Produtos
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05,"Faixa"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"N�mero de produtores"					,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Volume granelizado(L)"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Pgto. Bruto(R$)"				,oFont12NS)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,"Pgto. L�quido(R$)"				,oFont12NS)
	
	oReport:SkipLine(1)
	
	While Qry->(!Eof())
				
			oReport:SkipLine(1)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05, qry->FAIXA				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,CVALTOCHAR(qry->PRODUTORES)				,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,CVALTOCHAR(qry->ZLF_QTDBOM)			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,CVALTOCHAR(qry->BRUTO)			,oFont12)
			oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,CVALTOCHAR(qry->LIQUIDO)			,oFont12)
			
			//Totalizador
			_nTotProd := _nTotProd + qry->PRODUTORES
			_nTotVol := _nTotVol + qry->ZLF_QTDBOM
			_nTotBru := _nTotBru + qry->BRUTO
			_nTotLiq := _nTotLiq + qry->LIQUIDO
				
			Qry->(dbSkip())
		
			If oReport:Row() >= oReport:PageHeight() - 200
		
				oReport:EndPage()
				oReport:StartPage()
				oReport:SkipLine(2)

				//Criando Menu dos Produtos
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05,"Faixa"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"N�mero de produtores"					,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43,"Volume granelizado(L)"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62,"Pgto. Bruto(R$)"			,oFont12NS)
				oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75,"Pgto. L�quido(R$)"			,oFont12NS)
			EndIf
					
	EndDo
	

		
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.05, "Total geral:"				,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25, CVALTOCHAR(_nTotProd)				,oFont12N)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.43, CVALTOCHAR(_nTotVol)				,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.62, CVALTOCHAR(_nTotBru)				,oFont12N)	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.75, CVALTOCHAR(_nTotLiq)				,oFont12N)		
	
	
	Qry->(DBCLOSEAREA())
	oReport:EndPage()
		
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � CriaSX1  � Autor � Ariclenes M. Costa � Data �  23/09/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
static function criaSX1(cPerg)

U_xPutSx1(cPerg, '01', 'Data de?'            , '', '', 'mv_ch1', 'D', 8                     , 0, 0, 'G', '', ''   , '', '', 'mv_par01')
U_xPutSx1(cPerg, '02', 'Data at�?'           , '', '', 'mv_ch2', 'D', 8                     , 0, 0, 'G', '', ''   , '', '', 'mv_par02')

return  