#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICODE.CH"
#INCLUDE "TBICONN.CH"         
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOTVS.CH"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ROMSE14Z º Autor ³ JJ Consulting      º Data ³  05/09/19   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Liberação automatica dos pedidos gerados pela OMS          º±±
±±º          ³                                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
/*User Function ROMSE14Z()
Local aArea 	:= GetArea()
Local _cQuery	:= " "

_cQuery  := " SELECT DAI_FILIAL as FILIAL,DAI_PEDIDO as PEDIDO, DAI_CLIENT as CLIENTE, DAI_LOJA as LOJA, " 
_cQuery  := " C6_PRODUTO as PRODUTO, C6_QTDVEN as QTDE, SC6.R_E_C_N_O as R_E_C_N_O_ "
//_cQuery  += " C6_PRODUTO as PRODUTO, C6_QTDVEN as QTDE, DAI.R_E_C_N_O_ as R_E_C_N_O_ "
_cQuery  += " FROM DAI010 DAI"
_cQuery  += " INNER JOIN SC6010 SC6 ON SC6.C6_FILIAL = DAI_FILIAL AND SC6.C6_NUM = DAI_PEDIDO "    
_cQuery  += " AND SC6.C6_CLI = DAI_CLIENT AND SC6.C6_LOJA = DAI_LOJA AND SC6.D_E_L_E_T_ = ' ' "
_cQuery  += " INNER JOIN SC9010 SC9 ON C9_FILIAL = DAI_FILIAL AND C9_PEDIDO = DAI_PEDIDO "
_cQuery  += " AND SC9.C9_CLIENTE = DAI_CLIENT AND SC9.C9_LOJA = DAI_LOJA AND SC9.D_E_L_E_T_ = ' ' AND SC9.C9_BLEST = '02' AND SC9.C9_ITEM = SC6.C6_ITEM "
_cQuery  += " WHERE DAI.DAI_FILIAL = '"+xFilial("DAI")+"' AND DAI.DAI_COD = '" + DAK->DAK_COD + "' AND DAI.D_E_L_E_T_ = ' ' "  

MemoWrite("C:\teste\ROMSE14Z_V1.sql",_cQuery) //06/09/2019 Caique

if Select("TRBDAI") > 0
	TRBDAI->(DbCloseArea())
endif

TCQuery _cQuery New Alias "TRBDAI"

DbSelectArea("TRBDAI")
DbGotop()
IF TRBDAI->(EOF())
	TRBDAI->(DbCloseArea())
	
		MSGBOX("Não existem registros para processar")
	
	Return
ENDIF*/

/*WHILE !TRBDAI->(EOF())

	DbSelectArea("SC6")
	DbGoto(TRBDAI->R_E_C_N_O_)              

   
   //ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   //³Libera por Item de Pedido                                               ³
   //ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	Begin Transaction    
	
    
    ±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
    ±±³Funcao    ³MaLibDoFat³ Autor ³Eduardo Riera          ³ Data ³09.03.99 ³±±
    ±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
    ±±³Descri+.o ³Liberacao dos Itens de Pedido de Venda                      ³±±
    ±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
    ±±³Retorno   ³ExpN1: Quantidade Liberada                                  ³±±
    ±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
    ±±³Transacao ³Nao possui controle de Transacao a rotina chamadora deve    ³±±
    ±±³          ³controlar a Transacao e os Locks                            ³±±
    ±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
    ±±³Parametros³ExpN1: Registro do SC6                                      ³±±
    ±±³          ³ExpN2: Quantidade a Liberar                                 ³±±
    ±±³          ³ExpL3: Bloqueio de Credito                                  ³±±
    ±±³          ³ExpL4: Bloqueio de Estoque                                  ³±±
    ±±³          ³ExpL5: Avaliacao de Credito                                 ³±±
    ±±³          ³ExpL6: Avaliacao de Estoque                                 ³±±
    ±±³          ³ExpL7: Permite Liberacao Parcial                            ³±±
    ±±³          ³ExpL8: Tranfere Locais automaticamente                      ³±±
    ±±³          ³ExpA9: Empenhos ( Caso seja informado nao efetua a gravacao ³±±
    ±±³          ³       apenas avalia ).                                     ³±±
    ±±³          ³ExpbA: CodBlock a ser avaliado na gravacao do SC9           ³±±
    ±±³          ³ExpAB: Array com Empenhos previamente escolhidos            ³±±
    ±±³          ³       (impede selecao dos empenhos pelas rotinas)          ³±±
    ±±³          ³ExpLC: Indica se apenas esta trocando lotes do SC9          ³±±
    ±±³          ³ExpND: Valor a ser adicionado ao limite de credito          ³±±
    ±±³          ³ExpNE: Quantidade a Liberar - segunda UM                    ³±±
    ±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
    

	MaLibDoFat(TRBDAI->R_E_C_N_O_,TRBDAI->QTDE,.F.,.T.,.F.,.F.,.T.)
	End Transaction    
	 

    //ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    //³Libera registro 						                                   ³
    //ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	

     //ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
     //³Atualiza o Flag do Pedido de Venda                                      ³
     //ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Begin Transaction
	
	SC6->(MaLiberOk({TRBDAI->PEDIDO},.F.))
	
	End Transaction     
	
	TRBDAI->(DbSkip())	
ENDDO

SC6->DbCloseArea()
RestArea(aArea)
Return*/
