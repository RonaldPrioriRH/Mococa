#INCLUDE "rwmake.ch"
#include "PROTHEUS.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ A010TOK  º Autor ³ GODINHO            º Data ³  28/08/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Ponto de Entrada para validar O PREENCHIMENTO do NCM       º±±
±±º          ³ quando o tipo do produto não for Serviço.                  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Estoque                                                    º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±º 28/08/17 ³ Godinho: inclusão e alteração de produtos                  º±±
±±º          ³                                                            º±±
±±º          ³                                                            º±±
±±º          ³                                                            º±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/


User Function A010TOK()

	//Local aArea := GetArea()
	Local lExecuta := .T.
	Local ctipo:= Alltrim(M->B1_TIPO)
	Local cNcm := M->B1_POSIPI
	
	
	IF (cTipo <> "SV" .and. EMPTY(cNcm))
	MsgInfo("Caro Sr.(A)"+ cusername + "por favor preencha o NCM do produto")
		lExecuta := .F.
		  return(lExecuta)
	Endif 
	
	lExecuta := .T.
		
	if M->B1_X_GDMIN > 0 .OR. M->B1_X_GDMAX > 0
		if M->B1_X_GDMIN == 0 .OR. M->B1_X_GDMAX == 0
			
			if M->B1_X_GDMIN > 0
				MsgInfo("É necessário informar o percentual de gordura máxima quando informado valor de percentual de gordura mínima.")
			else
				MsgInfo("É necessário informar o percentual de gordura mínima quando informado valor de percentual de gordura máxima.")
			endif
			
			lExecuta := .F.
		else
			if M->B1_X_GDMIN >  M->B1_X_GDMAX
				MsgInfo("O percentual de gordura mínima não pode ser maior que o percetual de gordura máxima.")
				lExecuta := .F.
			endif
		endif
	endif
	
		

Return lExecuta

