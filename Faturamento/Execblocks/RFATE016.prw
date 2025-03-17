USER FUNCTION RFATE016()

Local aLegenda := {}

aLegenda := {{"ENABLE"		,"Pedido em aberto"	},;     //Pedido em aberto
			{"DISABLE"		,"Pedido encerrado"	},;		//Pedido encerrado
			{"BR_AMARELO"	,"Apto a Faturar"	}}

Aadd(aLegenda,{"BR_BRANCO"	,"Pedido Bloqueado por Crédito"})
Aadd(aLegenda,{"BR_PRETO"	,"Pedido Bloqueado por Estoque"})  
Aadd(aLegenda,{"BR_AZUL"	,"Pedido Bloqueado por regra"})
Aadd(aLegenda,{"BR_LARANJA"	,"Pedido BloqueaPdo por verba"}) 

RETURN(aLegenda)