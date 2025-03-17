#include "rwmake.ch"
#include "protheus.ch"

#define MINDIAS 1

User Function CANCEXT()

	local oButton1, oButton2, oSay1, oSay2, oComboBox1, oGet1
	local cGet1 := AllTrim(Str(GetMV("MV_CANCEXT")))+Space(3)
	local cComboBox1 := IIf(Val(cGet1) == MINDIAS,"Nao","Sim")
	private oDlg
	
	//Usuários liberados: 'marcos.godinho','deivide.franca','anderson.souza','andreia.rafael','caique.mercadante') 
	if !RetCodUsr()$GetMv("MV_XUSRCAN")
		MsgAlert("Usuário sem premissão - MV_XUSRCAN!","Atenção")
		return()
	endif

        define msdialog oDlg title "Canc. Extemporâneo padrão: 0 dias Desativado" from 000,000 to 085,305 colors 0,16777215 pixel
		@003,004 say oSay1 prompt "Para ativar o cancelamento extemporâneo, configure abaixo:" size 152,007 of oDlg colors 0,16777215 pixel
		@012,004 mscombobox oComboBox1 var cComboBox1 items{"Sim","Nao"} size 072,010 of oDlg colors 0,16777215 pixel
		@014,090 say oSay2 prompt "Dias" size 010,007 of oDlg colors 0,16777215 pixel
		@012,105 msget oGet1 var cGet1 size 026,010 when Validar(cComboBox1) of oDlg colors 0,16777215 pixel
		@027,075 button oButton1 prompt "Confirmar" size 037,012 of oDlg action Ativar(cComboBox1,Val(cGet1)) pixel
		@027,114 button oButton2 prompt "Cancelar" size 037,012 of oDlg action Close(oDlg) pixel
		activate msdialog oDlg

return

Static Function Validar(cOpcao)
	lRet := IIf(cOpcao == "Sim",.T.,.F.)
return lRet

Static Function Ativar(cOpcao,nDias)
	if cOpcao == "Sim"
		PutMV("MV_CANCEXT",nDias)	//em dias
	endif
	
	Close(oDlg)
return
