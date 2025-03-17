#Include "PROTHEUS.CH"         

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RFATE022    ¦ Autor ¦ Danilo Brito     ¦ Data ¦ 02/10/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ É executado após a gravação das informações, na inclusao.  ¦¦¦
¦¦¦          ¦ 															  ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa			                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RFATE022(lAlt) 

Local _aArea   := getArea()
Local _nVol    := 0
Local _nPesoL  := 0
Local _nPesoB  := 0
Local _cFilPed := SC5->C5_FILIAL+SC5->C5_NUM 
//Local nMyTotPed := 0 
//Local nMyTotDes	:= 0
//Local oGetd 

Default lAlt := .T. //parametro para tratar chamada deste PE pela funçao MT410ALT


//Soma a quantidade de volumes e grava no SC5.
DbSelectArea("SC6")
SC6->(DbSetOrder(1))
SB1->(DbSetOrder(1))
SC6->(DbSeek(_cFilPed))

IF SC5->C5_PESOL = 0 .or. SC5->C5_PBRUTO= 0 .or. C5_VOLUME1 = 0
	WHILE !SC6->(EOF()) .And. (alltrim(SC6->C6_FILIAL+SC6->C6_NUM) == _cFilPed)
		SB1->(dbseek(xFilial()+SC6->C6_PRODUTO))
		_nVol   += Round((SC6->C6_QTDVEN*SB1->B1_PESO)/SB1->B1_CONV ,0)//Soma volume por caixa 
		_nPesoB += SC6->C6_QTDVEN*SB1->B1_PESBRU //soma o peso bruto total
		_nPesoL += SC6->C6_QTDVEN*SB1->B1_PESO //soma o peso liquido total   
		SC6->(DbSkip())
	ENDDO 

//chama rotina padrao para calcular total do pedido
//Ma410Rodap(,@nMyTotPed,@nMyTotDes)
//Ma410Rodap(oGetd,@nMyTotPed,@nMyTotDes)

//Pedido Teste MC-18092020         

DbSelectArea("SC5")
SC5->(DbSetOrder(1))
SC5->(DbSeek(_cFilPed))

	//EE7_PESLIQ ou EE7_PESBRU pedidos EE7 
		If RecLock("SC5",.F.)
			If Empty(SC5->C5_PEDEXP) 
				SC5->C5_VOLUME1 := _nVol
				SC5->C5_PBRUTO  := _nPesoB
			  	SC5->C5_PESOL   := _nPesoL
			Else
				////Apenas Pedidos Exportação C5_PEDEXP
				SC5->C5_VOLUME1 := _nVol
				SC5->C5_TPFRETE := 'C' //gravar o tipo de Frete, existem pedidos que não estão 
		  	EndIf
	    MsUnlock()
	    EndIF
 
ENDIF 
//Fim Pedro Paulo  

//Grava SCV conforme campo C5_XFORPG
If FieldPos("C5_XFORPG") > 0  
	U_GravaSCV(SC5->C5_NUM)
Endif 

RestArea(_aArea)

Return    

/* Prencher a forma de pagamento do pedido de venda na tabela SCV  */

User Function GravaSCV(cNumPed) //Grava Forma de Pagamento
Local cPed     := cNumPed
Local cFormaPG := SC5->C5_XFORPG, cChave := ""
Local nCont    := 0
Local _nForm   := .T.

SX5->( dbSetOrder(1) )
SCV->( DbSetOrder(1) )                                                                                                                             //CV_FILIAL+CV_PEDIDO+CV_FORMAPG

if SCV->(DbSeek(xFilial("SCV")+cPed))

	cChave := SCV->(CV_FILIAL+CV_PEDIDO)             //Verifica se realmente foi gravado a forma de Pagamento.
	_nForm := .F.

	while cChave == SCV->(CV_FILIAL+CV_PEDIDO)

		if SX5->( dbSeek(xFilial()+"24"+cFormaPG) )

			RecLock("SCV",.F.)

			// SCV->CV_FILIAL  := xFilial("SCV") //Se existir a forma de pagamento altera para a forma de pagamento correta.
			// SCV->CV_PEDIDO  := cPed
			// SCV->CV_RATFOR  := 100

			SCV->CV_FORMAPG := AllTrim(SX5->X5_CHAVE)
			SCV->CV_DESCFOR := AllTrim(SX5->X5_DESCRI)

			SCV->(MsUnLock())

		endif

		nCont++
		SCV->( DbSkip() )

	enddo

endif //Caso não exista Forma de pagamento Grava a Forma Correta.

If _nForm
	
	SX5->( dbSetOrder(1) )
	if SX5->( dbSeek( xFilial("SX5")+"24"+cFormaPG) )
		
		RecLock("SCV",.T.)
		
		SCV->CV_FILIAL  := xFilial("SCV")
		SCV->CV_PEDIDO  := cPed
		SCV->CV_FORMAPG := AllTrim(SX5->X5_CHAVE)
		SCV->CV_DESCFOR := AllTrim(SX5->X5_DESCRI)
		SCV->CV_RATFOR  := 100
		
		SCV->( MsUnLock() )
		
	endif
Endif
