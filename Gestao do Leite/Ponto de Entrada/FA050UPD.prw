#INCLUDE "RWMAKE.ch"

#DEFINE _ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ FA050UPD º Autor ³ TOTVS              º Data ³  08/12/10   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Ponto de entrada executado antes da entrada nas rotinas    º±±
±±º          ³ de Inclusao/ Alteracao/ Exclusao.                          º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º Uso      ³ Pre validacao de inclusao/alteracao/exclusao.              º±±
±±º          ³ 			                                                  º±±
±±º          ³ Nao permite que usuarios nao autorizados alterem os titulosº±±
±±º          ³ gerados pela rotina de Gestao do Leite.                    º±±
±±º          ³ 			                                                  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º Retorno  ³ .T./.F. - Se retornar .F. a inclusao/alteracao/exclusao    º±±
±±º          ³ 	nao tera prosseguimento.                                  º±±
±±º          ³ 			                                                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function FA050UPD

Local lRet  := .T.
Local cPerm := "N"
Local aArea := GetArea()
Local _nRecZLL := ZLL->(Recno())
//Se Alteracao ou Exclusao
//If (_Opc == 4 .Or. _Opc == 5)

If (_Opc == 4 .Or. _Opc == 5) //If (_Opc == 5)//Se Exclusao
	//Se o Setor ou o MIX estao preenchidos, eh porque o titulo veio do Gestao do Leite
	If !Empty(SE2->E2_L_SETOR) .Or. !Empty(SE2->E2_L_MIX) .OR. !Empty(SE2->E2_L_EVENT)
		//Se funcao igual a FINA050 eh porque ta excluindo diretamente no financeiro
		If ALLTRIM(FUNNAME()) == "FINA050" .or. ALLTRIM(FUNNAME()) == "FINA750"
			
			dbSelectArea("ZLU")
			dbSetOrder(1)
			If dbSeek(xFILIAL("ZLU")+cUserName)
				cPerm := ZLU->ZLU_CANCEL
			Else
				cPerm := "N"
			EndIf
			
			If cPerm == "N"//Se nao tem permissao
				xMagHelpFis("Gestão do Leite","Este titulo nao pode ser alterado ou excluido.","Utilize uma rotina do ambiente Gestão do Leite para executar este procedimento.")
				lRet := .F.
			Else
				DbSelectArea("ZLL")
				ZLL->(DbSetOrder(1))
				If ZLL->(DbSeek(xFilial("ZLL")+Alltrim(SE2->E2_NUM)))
					xMagHelpFis("Gestão do Leite","Foi localizado convenio ativo para este titulo na rotina de convenios do modulo Gestao do Leite.",;
					"Utilize uma rotina do ambiente Gestão do Leite para executar este procedimento.")				
					lRet := .F.
				EndIf
				ZLL->(DbGoTo(_nRecZLL))
				ZLL->(DbCloseArea())
			EndIf
		EndIf
	EndIf

EndIf

If (_Opc == 4 .Or. _Opc == 5)
	If Alltrim(FunName()) <> "MGLT010" .and. Alltrim(FunName()) <> "MGLT033" .and. Alltrim(FunName()) <> "MFIN002"
		If !Empty(SE2->E2_L_SITUA) .and. (SE2->E2_PREFIXO $ 'GL1#GL2')
			xMagHelpFis("Validação","Este titulo nao pode ser alterado ou excluido, pois se trata da aglutinação de crédito ou ";
			+"débito gerado automaticamente pelas rotinas de fechamento mensal.",;
			"Utilize uma rotina de cancelamento financeiro para executar este procedimento."+_ENTER;
			+_ENTER+"Em caso de dúvidas solicite suporte ao departamento de TI.")
			lRet := .F.
	    EndIf
	EndIf
EndIf
RestArea(aArea)
Return(lRet)