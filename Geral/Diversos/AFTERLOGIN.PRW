#include "protheus.ch"
#include 'fileio.ch'
#Include "TopConn.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � AfterLogin     � Autor � TBC-GO       � Data �  04/01/17   ���
�������������������������������������������������������������������������͹��
���Descricao � Ponto de Entrada ap�s realizar login.                      ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � TBC-GO                                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function AfterLogin()
	Local cId	:= ParamIXB[1]
	//Local cNome := ParamIXB[2]
	Local _ambiente 	:= upper(getenvserver())
	Local cMensag1 := " "
	Local cMensag2 := " "
	Local cAmbPad  := "PADRAO"
	
	if sx6->(dBseek(Space(Len(xFilial("SX6")))+'PADRAO' ))
	cAmbPad:=alltrim(UPPER(SX6->x6_descric))
	endif  
	If Alltrim(cModulo) <> "CFG" 
		If sx6->(dBseek(Space(Len(xFilial("SX6")))+_ambiente )) 
			if !empty(alltrim(SX6->x6_descric))
			if !cId$alltrim(SX6->x6_descric)
				cMensag1 := "Ambiente "+_ambiente+", bloqueado para uso"
				cMensag2 := "Favor usar o ambiente >> "+cAmbPad+" <<"
				final(cMensag1, cMensag2 )
			endif
			endif    
		Endif
	Endif

	/*
	If  cModulo == 'FIN' .and. Upper(cDow(date()) ) == 'THURSDAY'  // Quinta feira

		u_liquidapg(.t.)    // Gera liquida��o automatica

	Endif
	*/
Return 
