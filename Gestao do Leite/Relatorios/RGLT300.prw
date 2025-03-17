#INCLUDE "TOTVS.CH"
#INCLUDE "REPORT.CH"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RGLT300  � Autor � TOTVS                 � Data da Criacao  � 15/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Relat�rio de diferen�as de leite por motorista                            						���
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
User Function RGLT300()

Private cPerg := "PRGLT300"

CriaSX1()

Pergunte(cPerg,.T.,'Diferen�as por motorista')

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
Local oMotorista, oDiferenca
Local cAlias := GetNextAlias()

CriaTab(@cAlias)

DEFINE REPORT oReport NAME "RGLT300" TITLE "Relat�rio de volume de leite por motorista" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport, cAlias)}

oReport:SetTotalInLine(.F.)

DEFINE SECTION oMotorista OF oReport  TITLE "Motorista" TABLES "SA2"
oMotorista:SetPageBreak(.T.)
oMotorista:SetTotalInLine(.F.)

DEFINE CELL NAME "ZLD_MOTOR" OF oMotorista ALIAS "ZLD" SIZE 20 BLOCK {|| (cAlias)->ZLD_MOTOR }
DEFINE CELL NAME "ZL0_NOME"	 OF oMotorista ALIAS "ZL0" SIZE 50 BLOCK {|| (cAlias)->ZL0_NOME }
DEFINE CELL NAME "ZL0_FRETIS" OF oMotorista ALIAS "ZL0" SIZE 20 BLOCK {|| Posicione("ZL0",1,xFilial("ZL0")+(cAlias)->ZLD_MOTOR,"ZL0_FRETIS") }
DEFINE CELL NAME "ZL0_NOMEFR"	 OF oMotorista ALIAS "ZL0" SIZE 50 BLOCK {|| Posicione("ZL0",1,xFilial("ZL0")+(cAlias)->ZLD_MOTOR,"ZL0_NOMEFR") }

DEFINE SECTION oDiferenca OF oMotorista  TITLE "Diferen�as" 
oDiferenca:SetTotalInLine(.F.)

DEFINE CELL NAME "ZLD_DTCOLE" OF oDiferenca ALIAS "ZLD"                     SIZE 30 BLOCK {|| DtoC(StoD((cAlias)->ZLD_DTCOLE)) }
DEFINE CELL NAME "VOL_TICKET" OF oDiferenca ALIAS "   " TITLE "Vol. Ticket" PICTURE PesqPict("ZLD","ZLD_TOTBOM") SIZE 30 BLOCK {|| (cAlias)->VOL_TICKET }
DEFINE CELL NAME "VOL_COLETA" OF oDiferenca ALIAS "   " TITLE "Vol. Coleta" PICTURE PesqPict("ZLD","ZLD_TOTBOM") SIZE 30 BLOCK {|| (cAlias)->VOL_COLETA }
DEFINE CELL NAME "DIFERENCA"  OF oDiferenca ALIAS "   " TITLE "Diferen�a"   PICTURE PesqPict("ZLD","ZLD_TOTBOM") SIZE 30 BLOCK {|| (cAlias)->DIFERENCA  }

oDiferenca:Cell("VOL_TICKET"):SetHeaderAlign("RIGH")
oDiferenca:Cell("VOL_COLETA"):SetHeaderAlign("RIGH")
oDiferenca:Cell("DIFERENCA"):SetHeaderAlign("RIGH")

DEFINE FUNCTION FROM oDiferenca:Cell("ZLD_DTCOLE") FUNCTION COUNT 
DEFINE FUNCTION FROM oDiferenca:Cell("VOL_TICKET") FUNCTION SUM   
DEFINE FUNCTION FROM oDiferenca:Cell("VOL_COLETA") FUNCTION SUM   
DEFINE FUNCTION FROM oDiferenca:Cell("DIFERENCA")  FUNCTION SUM   

Return(oReport)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RGLT300   �Autor  �Microsiga           � Data �  11/24/15   ���
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
Local oMotorista := oReport:Section(1)
Local oDiferenca := oReport:Section(1):Section(1)
Local _cMotorista := ""    
Local _lImpDif    := .f.

dbSelectArea(cAlias)
Count to _nReg

oReport:SetMeter(_nReg)

(cAlias)->(dbGoTop())
While !(cAlias)->(Eof())
	
	If oReport:Cancel()
		Exit
	EndIf
	oMotorista:Init()
	
	oMotorista:PrintLine()
	
	_cMotorista := (cAlias)->ZLD_MOTOR

	_lImpDif := .F.	

	oDiferenca:Init()
	While !(cAlias)->(Eof()) .AND. Alltrim(_cMotorista) == Alltrim((cAlias)->ZLD_MOTOR)

		_lImpDif := .T.	                        

	    oDiferenca:PrintLine()
	     
		(cAlias)->(dbSkip())
		
	EndDo              
	
	oDiferenca:Finish()
		
	oMotorista:Finish()	
	
	If !_lImpDif
		(cAlias)->(dbSkip()) 
	EndIf
	
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

cAlias := GetNextAlias()

DbSelectArea("ZLE")
DbSetOrder(1)
DbSeek(xFilial("ZLE")+MV_PAR03)

BeginSql Alias cAlias
	
	//*SELECT *	FROM (
	SELECT ZLD_MOTOR,
	ZLD_DTCOLE,
	ZL0_NOME,
	SUM(DISTINCT(ZLD_TOTBOM)) AS VOL_TICKET,
	SUM(ZLD_QTDBOM) AS VOL_COLETA,
	SUM(DISTINCT(ZLD_TOTBOM)) - SUM(ZLD_QTDBOM) AS DIFERENCA
	
	FROM %Table:ZLD% ZLD
	
	JOIN %Table:ZL0% ZL0
	ON ZL0_FILIAL = %xFilial:ZL0%
	AND ZL0_COD = ZLD_MOTOR
	AND ZL0.D_E_L_E_T_ = ' '
	
	WHERE ZLD_FILIAL = %xFilial:ZLD%
	AND ZLD_DTCOLE BETWEEN %Exp:ZLE->ZLE_DTINI% AND %Exp:ZLE->ZLE_DTFIM%
	AND ZLD_MOTOR  BETWEEN %Exp:MV_PAR01% AND %Exp:MV_PAR02%
	AND ZLD.D_E_L_E_T_ = ' '
	
	GROUP BY ZLD_MOTOR, ZL0_NOME, ZLD_DTCOLE
	
//	) AS A
	
//	WHERE A.DIFERENCA < 0

	ORDER BY 1, 2

EndSql
                       
Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � CriaSX1  � Autor � Ramon Teles        � Data �  14/08/13   ���
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
Aadd( aHelpPor, 'Informe o codigo do Transportador.   ')
Aadd( aHelpPor, '.                      ')
U_xPutSx1(cPerg,"01","Do Motorista"," "," ","mv_ch1","C",6,0,0,"G","","ZL0_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Transportador.   ')
Aadd( aHelpPor, '.                      ')
U_xPutSx1(cPerg,"02","At� o Motorista"," "," ","mv_ch2","C",6,0,0,"G","","ZL0_01","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Mix
aHelpPor := {}
Aadd( aHelpPor, 'Codigo do Mix a ser considerado     ')
U_xPutSx1(cPerg,"03","Do Mix"," "," ","mv_ch3","C",6,0,0,"G","MV_PAR03:=STRZero(VAL(MV_PAR03),6)","ZLE_02","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return
