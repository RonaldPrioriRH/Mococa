#INCLUDE "TOTVS.CH"
#INCLUDE "REPORT.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT079  � Autor � Guilherme Fran�a                 � Data da Criacao  � 31/01/2018     						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relat�rio volume sint�tico por produtor					                            						���
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
���Setor     � Gest�o do Leite                                                                         						���
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
User Function RGLT079()

Private cPerg := "PRGLT079"

CriaSX1()

Pergunte(cPerg,.T.,'Rela��o Produtores')

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
Local oProdutor
Local cAlias := GetNextAlias()
Private _nQtd := 0

CriaTab(@cAlias)

DEFINE REPORT oReport NAME "RGLT079" TITLE "Volume Sint�tico por Produtor - Coleta: "+DTOC(MV_PAR07)+" a "+DTOC(MV_PAR08) PARAMETER cPerg ACTION {|oReport| PrintReport(oReport, cAlias)}

oReport:SetTotalInLine(.F.)

DEFINE SECTION oProdutor OF oReport  TITLE "Produtores" TABLES "ZLD"
oProdutor:SetPageBreak(.T.)
oProdutor:SetTotalInLine(.F.)

DEFINE CELL NAME "ZLD_RETIRO"		OF oProdutor ALIAS "ZLD"	BLOCK {|| (cAlias)->ZLD_RETIRO }
DEFINE CELL NAME "ZLD_RETILJ"		OF oProdutor ALIAS "ZLD"	BLOCK {|| (cAlias)->ZLD_RETILJ }
DEFINE CELL NAME "A2_NOME"			OF oProdutor ALIAS "SA2"	BLOCK {|| (cAlias)->A2_NOME }
DEFINE CELL NAME "A2_END"			OF oProdutor ALIAS "SA2"	BLOCK {|| (cAlias)->A2_END }
DEFINE CELL NAME "VOLUME" 			OF oProdutor ALIAS "   " TITLE "Vol. Coleta" PICTURE PesqPict("ZLD","ZLD_TOTBOM") SIZE 30 BLOCK {|| (cAlias)->VOLUME }


oProdutor:Cell("VOLUME"):SetHeaderAlign("RIGH")
DEFINE FUNCTION FROM oProdutor:Cell("VOLUME") FUNCTION SUM

Return(oReport)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT079   �Autor  �Microsiga           � Data �  11/24/15   ���
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
Local oProdutor := oReport:Section(1)

dbSelectArea(cAlias)
Count to _nReg

oReport:SetMeter(_nReg)

(cAlias)->(dbGoTop())
While !(cAlias)->(Eof())

	If !((cAlias)->VOLUME > 0)
		(cAlias)->(dbSkip())
	EndIf
	
	If oReport:Cancel()
		Exit
	EndIf
	oProdutor:Init()
	
	oProdutor:PrintLine()
	
   	(cAlias)->(dbSkip())	

EndDo
oProdutor:Finish()

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
	
	SELECT ZLD_RETIRO, ZLD_RETILJ,A2_NOME,A2_END,SUM(ZLD_QTDBOM) AS VOLUME 
    FROM %Table:ZLD% ZLD 
    	JOIN %Table:SA2% A2 ON A2_COD = ZLD_RETIRO AND A2_LOJA = ZLD_RETILJ 
    	AND A2_L_LI_RO BETWEEN %Exp:MV_PAR05% AND %Exp:MV_PAR06%
    	AND A2.%NotDel%
    WHERE ZLD_FILIAL = %xFilial:ZLD% 
    AND ZLD_RETIRO BETWEEN %Exp:MV_PAR01% AND %Exp:MV_PAR02%
    AND ZLD_RETILJ BETWEEN %Exp:MV_PAR03% AND %Exp:MV_PAR04%    
    AND ZLD_DTCOLE BETWEEN  %Exp:DTOS(MV_PAR07)% AND %Exp:DTOS(MV_PAR08)% 
    AND ZLD.%NotDel%
    GROUP BY ZLD_RETIRO, ZLD_RETILJ,A2_NOME,A2_END
    ORDER BY A2_NOME


EndSql
                       
Return


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
Aadd( aHelpPor, 'Informe o codigo inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Do Produtor"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L4","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Ate Produtor"," "," ","mv_ch2","C",6,0,0,"G","","SA2_L4","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Da Loja"," "," ","mv_ch3","C",2,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","Ate Loja"," "," ","mv_ch4","C",2,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do grupo   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"05","Do Grupo Precos"," "," ","mv_ch5","C",6,0,0,"G","","ZL3_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final   do grupo   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"06","Ate o Grupo Precos"," "," ","mv_ch6","C",6,0,0,"G","","ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Do Periodo
aHelpPor := {}
Aadd( aHelpPor, 'Data inicial de coleta')
U_xPutSx1(cPerg,"07","Data Inicial"," "," ","mv_ch7","D",8,0,0,"G","","","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Periodo
aHelpPor := {}
Aadd( aHelpPor, 'Data final de coleta.')
U_xPutSx1(cPerg,"08","Data Final"," "," ","mv_ch8","D",8,0,0,"G","","","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return
