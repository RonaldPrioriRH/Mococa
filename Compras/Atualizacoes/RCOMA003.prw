#Include "PROTHEUS.CH"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MA030TOK  �Autor  �Tarc�sio Silva Miranda� Data �31/01/2018 ���
�������������������������������������������������������������������������͹��
���Desc.     � Valida Cnpj duplicado atravez do par�metro MV_XINCCGC.     ���
�������������������������������������������������������������������������͹��
���Uso       � 															  ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function RCOMA003()                        

	Local oButton1
	Local oComboBo1
	Local nComboBo1 := iif(GetMv("MV_XINCCGC"),"Sim","N�o")
	Local oComboBo2
	Local nComboBo2 := iif(GetMv("MV_XINCCGC"),"Sim","N�o")
	Local oGroup1
	Local oSay1
	Local oSay2
	//Local nCont := 0 

	Static oDlg

	DEFINE MSDIALOG oDlg TITLE "MV_XINCCGC" FROM 000, 000  TO 200, 210 COLORS 0, 16777215 PIXEL

	@ 002, 004 GROUP oGroup1 TO 095, 099 PROMPT "Par�metro | " OF oDlg COLOR 0, 16777215 PIXEL
	@ 014, 010 SAY oSay1 PROMPT "Info. Atual :" SIZE 029, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 039, 010 SAY oSay2 PROMPT "Nova Inf :" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
	@ 012, 042 MSCOMBOBOX oComboBo1 VAR nComboBo1 ITEMS {"Sim","N�o"} SIZE 051, 010 OF oDlg COLORS 0, 16777215 When .F. PIXEL
	@ 059, 013 BUTTON oButton1 PROMPT "Confirmar" SIZE 079, 012 OF oDlg Action funSalvar(nComboBo2) PIXEL
	@ 037, 042 MSCOMBOBOX oComboBo2 VAR nComboBo2 ITEMS {"Sim","N�o"} SIZE 051, 010 OF oDlg COLORS 0, 16777215 PIXEL

	ACTIVATE MSDIALOG oDlg CENTERED

Return()

Static Function funSalvar(_nComboBo2)

	Default := _nComboBo2

	if !empty(_nComboBo2)
		Aviso("Aviso","Alterado com sucesso!",{"Ok"})
		PutMv("MV_XINCCGC",iif(_nComboBo2$"Sim",.T.,.F.))
		oDlg:End()
	endif

Return()
