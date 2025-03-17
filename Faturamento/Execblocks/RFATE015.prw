#Include "Protheus.ch"

USER FUNCTION RFATE015()

Local aLegenda := {}

aLegenda := {{"Empty(C5_LIBEROK) .And. Empty(C5_NOTA) .And. Empty(C5_BLQ)",'ENABLE','Pedido em Aberto' },;		//Pedido em Aberto 	
			{ "!Empty(SC5->C5_NOTA) .Or. C5_LIBEROK=='E' .And. Empty(C5_BLQ)" ,'DISABLE','Pedido Encerrado'},;		   	//Pedido Encerrado			
			{ "!Empty(SC5->C5_LIBEROK) .And. Empty(SC5->C5_NOTA) .And. Empty(SC5->C5_BLQ) .and. !U_CORX(SC5->C5_FILIAL, SC5->C5_NUM) .AND. !U_CORX2(SC5->C5_FILIAL, SC5->C5_NUM)",'BR_AMARELO','Apto a Faturar'},;
			{ "U_CORX(SC5->C5_FILIAL, SC5->C5_NUM)",'BR_BRANCO','Bloqueado por Crédito'},;
			{ "U_CORX2(SC5->C5_FILIAL, SC5->C5_NUM)",'BR_PRETO','Bloqueado por Estoque'},;			
			{ "SC5->C5_BLQ == '1' .and. !U_CORX(SC5->C5_FILIAL, SC5->C5_NUM) .and. !U_CORX2(SC5->C5_FILIAL, SC5->C5_NUM)",'BR_AZUL','Bloqueado por Regra'},;	//Pedido Bloquedo por regra    
			{ "SC5->C5_BLQ == '2' .and. !U_CORX(SC5->C5_FILIAL, SC5->C5_NUM) .and. !U_CORX2(SC5->C5_FILIAL, SC5->C5_NUM)",'BR_LARANJA','Bloqueado por Verba'}}	//Pedido Bloquedo por verba

RETURN(aLegenda)   

USER FUNCTION CORX(FILIAL, NUMPED)

LOCAL AAREA := GETAREA()

DBSELECTAREA("SC9")
SC9->(DBSETORDER(1))
SC9->(DbGoTop())

//IF SC9->(DBSEEK(XFILIAL("SC9")+NUMPED)) Funcionava apenas na Filial corrente do Pedido
IF SC9->(DBSEEK(FILIAL+NUMPED))
	WHILE !SC9->(EOF()) .AND. NUMPED == SC9->C9_PEDIDO
		IF SC9->C9_BLCRED != "10" .AND. !EMPTY(SC9->C9_BLCRED)
			RETURN(.T.)
		ENDIF		
		SC9->(DBSKIP())			
	ENDDO
ENDIF 

RESTAREA(AAREA) 

RETURN(.F.)

USER FUNCTION CORX2(FILIAL, NUMPED)

LOCAL AAREA := GETAREA()

DBSELECTAREA("SC9")
SC9->(DBSETORDER(1))
SC9->(DbGoTop())

//IF SC9->(DBSEEK(XFILIAL("SC9")+NUMPED)) Funcionava apenas na Filial corrente do Pedido
IF SC9->(DBSEEK(FILIAL+NUMPED))
	WHILE !SC9->(EOF()) .AND. NUMPED == SC9->C9_PEDIDO
		IF SC9->C9_BLEST != "10" .AND. !EMPTY(SC9->C9_BLEST)
			RETURN(.T.)
		ENDIF		
		SC9->(DBSKIP())			
	ENDDO
ENDIF 

RESTAREA(AAREA) 

RETURN(.F.)