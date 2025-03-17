#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT300  � Autor �Cleiton Campos  	    � Data da Criacao  � 09/09/2014  									���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Consulta ocorrencias de crioscopia por produtor.                                                             ���
���          �                                                                                            					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � 												                                                        		���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Faturamento                                                                            						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor    	���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	    	���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
*/

User Function AGLT300(_cRetiro,_cLoja,_cNome)
      
Local _aArea := GetArea()

Private oDlg   

If Select ("TABH2O") <> 0
	TABH2O->(dbCloseArea())
EndIf

_cQuery := " SELECT ZLD_RETIRO, ZLD_RETILJ, ZLD_DTCOLE, ZLD_DTLANC," 
_cQuery += "		ZLD_PCTH2O, ZLD_PCTDES"
_cQuery += " FROM " + RetSqlName("ZLD")+" ZLD"
_cQuery += " WHERE ZLD_FILIAL >= '"+xFilial("ZLD")+"' "
_cQuery += " AND   ZLD_RETIRO     = '"+_cRetiro+"' "  
_cQuery += " AND   ZLD_RETILJ     = '"+_cLoja+"' "  
_cQuery += " AND   ZLD_PCTH2O    <> 0 "  
_cQuery += " AND   ZLD.D_E_L_E_T_ = ' '"

TCQUERY _cQuery NEW ALIAS "TABH2O"
	
DBSELECTAREA("TABH2O")
DBGOTOP("TABH2O")

DEFINE MSDIALOG oDlg TITLE "Consulta Crioscopia. Retiro : "+Alltrim(_cRetiro)+"-"+Alltrim(_cNome) FROM 000, 000  TO 260, 800 COLORS 0, 16777215 PIXEL

   	fWBrowse()
   	oWBrowse:Align := CONTROL_ALIGN_TOP

	@ 110, 185 BUTTON "FECHAR" SIZE 40,12 ACTION Close(oDlg) PIXEL OF oDlg
	
ACTIVATE MSDIALOG oDlg CENTERED
    
DBSELECTAREA("TABH2O")
DBCLOSEAREA("TABH2O")

RestArea(_aArea)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �fWBrowse  � Autor � Vin�cius Fernandes � Data �  27/06/13   ���
�������������������������������������������������������������������������͹��
���Descricao �Cria as parcelas					                          ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �COOPRATA                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function fWBrowse()

Local aWBrowse := {}
Static oWBrowse

dbSelectArea("TABH2O")
dbGoTOp()

if TABH2O->(EOF())
   	Aadd(aWBrowse,{"","","","","",""})
endif             

While !TABH2O->(Eof())    

   	Aadd(aWBrowse,{ TABH2O->ZLD_RETIRO, TABH2O->ZLD_RETILJ, StoD(TABH2O->ZLD_DTCOLE),StoD(TABH2O->ZLD_DTLANC),TABH2O->ZLD_PCTH2O,TABH2O->ZLD_PCTDES })	  
   	TABH2O->(dbSkip())

EndDo

@ 109, 000 LISTBOX oWBrowse Fields HEADER "Retiro","Loja","Dt. Coleta","Dt. Lanc.","% �gua","% Desconto" OF oDlg PIXEL ColSizes 35,110
oWBrowse:SetArray(aWBrowse)
oWBrowse:bLine := {|| {;
aWBrowse[oWBrowse:nAt,1],;
aWBrowse[oWBrowse:nAt,2],;
aWBrowse[oWBrowse:nAt,3],;
aWBrowse[oWBrowse:nAt,4],;
aWBrowse[oWBrowse:nAt,5],;
aWBrowse[oWBrowse:nAt,6]}}

Return