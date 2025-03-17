#include 'protheus.ch'
#include 'parmtype.ch'
// PE: Que verifica os valores do Resultado; Calcula o SALDO; Grava no Resultado
// Executado no fechamento do Banco de Horas (PONM080)
//     1 - Exclui o Resultado de Banco de Horas
//     2 - Calcula o Saldo (SPB)
//     3 - Faz lançamento referente a Baixa no Banco de Horas
//     4 - Inclui o Saldo no Resultado (SPB)  

User Function PN80GRBH(cEveProv, cEveDesc, aSPI, aDelSPI, dDataGrv, cEveResc)
Local cFil_P9  := If(Empty(xFilial("SP9")), xFilial("SP9"), SubStr(SRA->RA_FILIAL,1,Len(Alltrim(xFilial("SP9"))))) 
Local cPD_PRO  := Posicione("SP9",2,cFil_P9+"023A","P9_CODFOL")
Local cPD_DES  := Posicione("SP9",2,cFil_P9+"024A","P9_CODFOL")
Local nVlr_PRO :=  nVlr_DES := 0
Local aPD_PRO  := {}
Local aPD_DES  := {}
Local aPD_FOL  := {}
Local aArea    := GetArea() 
Local aDelSPI  := aClone(paramixb[4])
Local cMatDe   := mv_par06
Local cMatAte  := mv_par07
Local lResc    := mv_par32 == 1 // Fecha banco para Rescisão
Local dDtPagto := mv_par24 // Data Pagamernto na Folha
Local dDtIniP  := mv_par27
Local dDtIniP  := mv_par29
Local nHoras   := 0
// PB_FILIAL+PB_MAT+PB_PD+PB_CC+PB_DEPTO+PB_POSTO+PB_CODFUNC
SPB->(dbGotop())
SPB->(dbSeek(SRA->RA_FILIAL + SRA->RA_MAT))

While !SPB->(EOF()) .and. SPB->(PB_FILIAL + PB_MAT ) == SRA->(RA_FILIAL + RA_MAT ) 
    If (SPB->PB_TIPO2 ) == "G" 
       If SPB->PB_PD == cPD_PRO
          nVlr_PRO += SPB->PB_HORAS
          If Len(aPD_PRO) == 0
             aadd(aPD_PRO, { cPD_PRO, SPB->PB_CC, SPB->PB_DATA, SPB->PB_TIPO1, Abs(SPB->PB_VALOR)})
          EndIf
	      SPB->(RecLock("SPB",.F.))
		     SPB->(DbDelete())
		  SPB->( MsUnlock() )
       ElseIf SPB->PB_PD == cPD_DES
          nVlr_DES += SPB->PB_HORAS
          If Len(aPd_DES) == 0
             aadd(aPD_DES, { cPD_DES, SPB->PB_CC, SPB->PB_DATA, SPB->PB_TIPO1, Abs(SPB->PB_VALOR)})
          EndIf
	      SPB->(RecLock("SPB",.F.))
		     SPB->(DbDelete())
		  SPB->( MsUnlock() )
       EndIf
    EndIf
    SPB->(dbSkip()) 
EndDo

cEvt_POS := GETMV("PRI_EVTP") // Banco Positivo - Evento Desconto 
cEvt_NEG := GETMV("PRI_EVTN") // Banco Negativo - Evento Positivo

If nVlr_PRO == 0 .and. nVlr_DES > 0 // Não teve Provento
   cEvt_BH := cEvt_NEG // (+) BH DESC FOL 
   nHoras  := nVlr_DES // Desconto em Folha
   aPd_FOL := aClone(aPd_DES) 
ElseIf nVlr_DES == 0  .and. nVlr_PRO > 0// Não teve Desconto
   cEvt_BH  := cEvt_POS //(-) BH PG FOLHA 
   nHoras   := nVlr_PRO
   aPd_FOL  := aClone(aPd_PRO) 
ElseIf nVlr_PRO > nVlr_DES // Provento Maior que o Desconto
   cEvt_BH := cEvt_POS //(-) BH PG FOLHA  
   nHoras  := nVlr_PRO - nVlr_DES
   aPd_FOL  := aClone(aPd_PRO) 
ElseIf nVlr_PRO < nVlr_DES // Desconto MAIOR que o Provento
   cEvt_BH := cEvt_NEG // (+) BH DESC FOL 
   nHoras  := nVlr_DES - nVlr_PRO
   aPd_FOL  := aClone(aPd_DES) 
EndIf

lBcoNeg  := GETMV("PRI_NEGBCO") // .T. = Gerar Banco Negativo e .F. = Não gera Banco Negativo // Gerar ou não Desconto no Resultado 
lRescNeg := GETMV("PRI_NEGRES") // .T. = Gerar Banco Negativo e .F. = Não gera Banco Negativo // Gerar ou não Desconto no Resultado, quando for rescisão

If Len(aPd_FOL) > 0
	// Gera novo evento no Resultado
	// Se Fechamento de Banco para Rescisao e Debito em Filial
	lGeraEvt := .T.
	
	// Gerar ou Não o Descnto no Resultado se o Banco Negativo
	If !lBcoNeg .and. cEvt_BH == cEvt_NEG
	   lGeraEvt := .F.
	ElseIf cMatDe == cMatAte .and. !lRescNeg .and. cEvt_BH == cEvt_NEG
	   lGeraEvt := .F.
	EndIf  
	
	If  lGeraEvt 
		If RecLock( "SPB" ,.T.)
			SPB->PB_FILIAL := SRA->RA_FILIAL
			SPB->PB_CC     := aPd_FOL[1,2]
			SPB->PB_MAT    := SRA->RA_MAT
			SPB->PB_PD     := aPd_FOL[1,1]
			SPB->PB_HORAS  := nHoras
			SPB->PB_DATA   := aPd_FOL[1,3]
			SPB->PB_TIPO1  := aPd_FOL[1,4]
			SPB->PB_TIPO2  := "G"
			SPB->PB_VALOR  := aPd_FOL[1,5]
		    SPB->( MsUnlock() )
		 EndIf
	EndIf
	
	// Grava no Banco a Informação que vai para Folha
	// Busca o Valor da Hora Valorizada ou Não valorizada
	nLenX := Len( aDelSPI )
	nQtdHr := 0
	For nX := 1 To nLenX
	   // nUtiliz  --> 1=Normais - 2=Valorizadas
	   // SPI->(dbGoTop())
	   SPI->( dbGoto( aDelSPI[ nX ] ) )
	   If (PosSP9( SPI->PI_PD , SRA->RA_FILIAL, "P9_TIPOCOD") $ "1*3" )
         // Se Utiliz = 1 = Normais, então busca horas Valorizadas, porque o total das horas normais está na variavel nHoras
         // Se Utiliz = 2 = Valorizadas, então busca horas Normais, porque o total das horas variaveis está na variavel nHoras
         nQtdHr := __TimeSum( nQtdHr, IF( nUtiliz == 1 , SPI->PI_QUANTV,  SPI-> PI_QUANT ) ) 
      Else
         nQtdHr := __TimeSub( nQtdHr, IF( nUtiliz == 1 , SPI->PI_QUANTV,  SPI-> PI_QUANT ) )
      EndIf
	Next nX
	
	If nHoras == 0
	   nHoras := nQtdHr
	EndIf
	
	// Indice 1: PI_FILIAL+PI_MAT+PI_PD+Dtos(PI_DATA)
	lSPI := SPI->(dbSeek(SRA->RA_FILIAL + SRA->RA_MAT + aPd_FOL[1,1] + DtoS(aPd_FOL[1,3])))
	IF RecLock("SPI", !lSPI)
		SPI->PI_FILIAL	:= SRA->RA_FILIAL
		SPI->PI_MAT		:= SRA->RA_MAT
		SPI->PI_PD		:= cEvt_BH
		SPI->PI_DATA	:= aPd_FOL[1,3]
		If Abs(nHoras) == Abs( nQtdHr)
		   SPI->PI_QUANT	:= Abs(nQtdHr)
		   SPI->PI_QUANTV	:= Abs(nQtdHr)
		Else
		   SPI->PI_QUANT	:= IF( nUtiliz == 1, fConvHr(nHoras, "H"), Abs(nQtdHr))
		   SPI->PI_QUANTV	:= IF( nUtiliz == 1, Abs(nQtdHr), fConvHr(nHoras, "H"))
		EndIf
		SPI->PI_FLAG	:= "G"
		SPI->PI_CC		:= aPd_FOL[1,2]
		SPI->PI_STATUS  := "B"
		SPI->PI_DTBAIX  := aPd_FOL[1,3]
	    SPI->( MsUnlock() )
	 EndIf
EndIf
RestArea(aArea ) 
return