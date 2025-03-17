#INCLUDE "TOTVS.CH"
#INCLUDE "REPORT.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT081  � Autor � Guilherme Fran�a                 � Data da Criacao  � 31/01/2018     						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relat�rio produtores por Associa��o                            						���
���          � 															                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Financeiro	                                                                          						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
User Function RGLT081()

Private cPerg := "PRGLT081"

CriaSX1()

If !Pergunte(cPerg,.T.,'Produtores por Associa��o')
	Return
EndIf

oReport := ReportDef()
oReport:PrintDialog()

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ReportDef �Autor  �Microsiga           � Data �  11/26/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Defini��o do lay-out do relatorio.                         ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ReportDef()

Local oReport
Local oAssoc, oProdutor
Local cAlias := GetNextAlias()

Private _nQtd

CriaTab(@cAlias)

DEFINE REPORT oReport NAME "RGLT081" TITLE "Rela��o de Produtores por Associa��o - Coleta: "+DTOC(MV_PAR03)+" a "+DTOC(MV_PAR04) PARAMETER cPerg ACTION {|oReport| PrintReport(oReport, cAlias)}

oReport:SetTotalInLine(.F.)

DEFINE SECTION oAssoc OF oReport  TITLE "Associa��o" TABLES "ZM3"
oAssoc:SetPageBreak(.T.)
oAssoc:SetTotalInLine(.F.)

DEFINE CELL NAME "ZM3_CODIGO"		OF oAssoc ALIAS "ZM3" SIZE 10	BLOCK {|| (cAlias)->ZM3_CODIGO }
DEFINE CELL NAME "ZM3_NOME"			OF oAssoc ALIAS "ZM3" SIZE 25	BLOCK {|| (cAlias)->ZM3_NOME }
DEFINE CELL NAME "ZM3_CODSA2"		OF oAssoc ALIAS "ZM3"	BLOCK {|| (cAlias)->ZM3_CODSA2 }
DEFINE CELL NAME "ZM3_LOJA"			OF oAssoc ALIAS "ZM3"	BLOCK {|| (cAlias)->ZM3_LOJA }
DEFINE CELL NAME "ZM3_RAZAO"		OF oAssoc ALIAS "ZM3" SIZE 30	BLOCK {|| (cAlias)->ZM3_RAZAO }
DEFINE CELL NAME "ZM3_TICKET"		OF oAssoc ALIAS "ZM3"	BLOCK {|| IIF((cAlias)->ZM3_TICKET=="S","Sim","N�o") }
DEFINE CELL NAME "ZM3_ENTMIX"		OF oAssoc ALIAS "ZM3"	BLOCK {|| IIF((cAlias)->ZM3_ENTMIX=="S","Sim","N�o") }
DEFINE CELL NAME "ZM3_FRETE"		OF oAssoc ALIAS "ZM3"	BLOCK {|| IIF((cAlias)->ZM3_FRETE=="S","Sim","N�o") }
DEFINE CELL NAME "ZM3_QUALID"		OF oAssoc ALIAS "ZM3"	BLOCK {|| IIF((cAlias)->ZM3_QUALID=="S","Sim","N�o") }
DEFINE CELL NAME "ZM3_PRECO"		OF oAssoc ALIAS "ZM3"	BLOCK {|| (cAlias)->ZM3_PRECO }


DEFINE SECTION oProdutor OF oAssoc  TITLE "Produtores" 
oProdutor:SetTotalInLine(.F.)

DEFINE CELL NAME "ZM4_CODSA2"	OF oProdutor ALIAS "ZM4"	BLOCK {|| (cAlias)->ZM4_CODSA2 }
DEFINE CELL NAME "ZM4_LOJA"		OF oProdutor ALIAS "ZM4"	BLOCK {|| (cAlias)->ZM4_LOJA }
DEFINE CELL NAME "ZM4_NOME"		OF oProdutor ALIAS "ZM4"	BLOCK {|| (cAlias)->ZM4_NOME }
DEFINE CELL NAME "VOL_COLETA" OF oProdutor ALIAS "   " TITLE "Vol. Coleta" PICTURE PesqPict("ZLD","ZLD_TOTBOM") SIZE 30 BLOCK {|| _nQtd } //Mesma fun��o utilizada no MIX

oProdutor:Cell("VOL_COLETA"):SetHeaderAlign("RIGH")
DEFINE FUNCTION FROM oProdutor:Cell("VOL_COLETA") FUNCTION SUM

Return(oReport)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT081   �Autor  �Microsiga           � Data �  11/24/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function PrintReport(oReport, cAlias)

Local _nReg  := 0
Local oAssoc := oReport:Section(1)
Local oProdutor := oReport:Section(1):Section(1)
Local _cAssoc := ""

dbSelectArea(cAlias)
Count to _nReg

oReport:SetMeter(_nReg)

(cAlias)->(dbGoTop())
While !(cAlias)->(Eof())
	
	If oReport:Cancel()
		Exit
	EndIf
	oAssoc:Init()
	
	oAssoc:PrintLine()
	
	_cAssoc := (cAlias)->ZM3_CODIGO

	oProdutor:Init()
	While !(cAlias)->(Eof()) .AND. Alltrim(_cAssoc) == Alltrim((cAlias)->ZM3_CODIGO)
		
		_nQtd := VolProd((cAlias)->ZM4_CODSA2,(cAlias)->ZM4_LOJA)

	    oProdutor:PrintLine()
	     
		(cAlias)->(dbSkip())
		
	EndDo              
	
	oProdutor:Finish()
		
	oAssoc:Finish()	

EndDo

(cAlias)->(dbCloseArea())

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CriaTab�Autor  �Microsiga           � Data �  11/26/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria tabela tempor�ria para impress�o do relat�rio.        ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CriaTab(cAlias)


BeginSql Alias cAlias

	SELECT M3.*, ZM4_CODSA2, ZM4_LOJA, ZM4_NOME 
	FROM %Table:ZM4% M4
	    JOIN %Table:ZM3% M3 ON ZM3_FILIAL = ZM4_FILIAL AND ZM3_CODIGO = ZM4_CODIGO AND M3.%NotDel%
	WHERE M4.ZM4_CODIGO BETWEEN %Exp:MV_PAR01% AND %Exp:MV_PAR02%
	AND M4.%NotDel%
	ORDER BY ZM3_NOME, ZM4_NOME
EndSql
                       
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �VolProd   �Autor  �Guilherme Fran�a    � Data �  31/01/18   ���
�������������������������������������������������������������������������͹��
���Desc.     � Retorna volume entregue pelo produtor no per�odo parametrizado���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function VolProd(xcCod,xcLoja)

Local _cAlias := "VOLP"
Local _nRet := 0

BeginSql Alias _cAlias

	SELECT SUM(ZLD_QTDBOM) TBOM 
    FROM %Table:ZLD% ZLD 
        WHERE ZLD_FILIAL = %xFilial:ZLD% 
        AND ZLD_DTCOLE BETWEEN  %Exp:DTOS(MV_PAR03)% AND %Exp:DTOS(MV_PAR04)% 
        AND ZLD_RETIRO = %Exp:xcCod% AND ZLD_RETILJ = %Exp:xcLoja% 
        AND ZLD.%NotDel%

EndSql

If !(_cAlias)->(Eof())
	_nRet := (_cAlias)->TBOM
EndIf
                       
(_cAlias)->(DbCloseArea())                       

Return _nRet


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � CriaSX1  � Autor � TOTVS        � Data �  14/08/13   ���
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

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da associa��o. ')
Aadd( aHelpPor, '.                      ')
U_xPutSx1(cPerg,"01","Da associa��o"," "," ","mv_ch1","C",6,0,0,"G","","ZM3_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final da rota.   ')
Aadd( aHelpPor, '.                      ')
U_xPutSx1(cPerg,"02","At� a associ��o"," "," ","mv_ch2","C",6,0,0,"G","","ZM3_01","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Periodo
aHelpPor := {}
Aadd( aHelpPor, 'Data inicial de coleta')
U_xPutSx1(cPerg,"03","Data Inicial"," "," ","mv_ch3","D",8,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Periodo
aHelpPor := {}
Aadd( aHelpPor, 'Data final de coleta.')
U_xPutSx1(cPerg,"04","Data Final"," "," ","mv_ch4","D",8,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)



Return
