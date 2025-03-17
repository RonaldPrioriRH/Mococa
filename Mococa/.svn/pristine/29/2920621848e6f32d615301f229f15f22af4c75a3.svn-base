#INCLUDE "PROTHEUS.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MT100GE2  ºAutor  ³Claudio Ferreira    º Data ³  26/06/12   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ PE chamado durante a geração da SE2.                       º±±
±±º          ³ Utilizado para complementar o titulo a pagar              .º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TBC-GO                                                     º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function MT100GE2()

  Local nPosItem  := aScan(aHEADER,{|x| Trim(x[2])=="D1_ITEMCTA"})
  Local aTitAtual := ParamIXB[1]
  Local nOpc      := ParamIXB[2]
  Local aHeadSE2  := ParamIXB[3]
  Local aParcelas := ParamIXB[5]
  Local nPerc 	  := SuperGetMv("MV_XPERC") // 2.5 %
  Local cFornec   := AllTrim(SuperGetMv("MV_XFORN")) // Tetra Pak F00306
  Local cNatureza := AllTrim(SuperGetMv("MV_XNATU")) // Natureza 0201006

  if !empty(acols[1,nPosItem])
    RecLock("SE2", .F. )
    SE2->E2_ITEMD   := acols[1,nPosItem] //Grava o item informado na 1 linha  
    MsUnLock()
  endif

  //Cálculando o valor do Desconto dos titulos gerados para Tetra Pak que sejam da Natureza 0201006
  If (AllTrim(E2_FORNECE) = cFornec  .And. AllTrim(E2_NATUREZ) = cNatureza .And. AllTrim(E2_TIPO) = 'NF')
    RecLock("SE2", .F. )
    SE2->E2_DECRESC  := (E2_VALOR * nPerc) / 100 
    SE2->E2_SDDECRE  := (E2_VALOR * nPerc) / 100 
    MsUnLock()
  EndIf

  if SF1->(FieldPos("F1_MENNOTA"))> 0
    if !empty(SF1->F1_MENNOTA)
      RecLock("SE2", .F. )
      SE2->E2_HIST    := SF1->F1_MENNOTA //Grava o historico 
      MsUnLock()
    endif
  endif  

Return
