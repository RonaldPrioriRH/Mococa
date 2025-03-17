#Include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RFATE018    ¦ Autor ¦ Danilo Brito     ¦ Data ¦ 07/10/2013 ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de entrada antes exclusao do documento de saida, para¦¦¦
¦¦¦          ¦ validar ou não a exclusao.                      			  ¦¦¦
¦¦¦          ¦                                                            ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Uso       ¦ Mococa   		                                          ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
User Function RFATE018() 
Local lExclui := .F.
Local lRet := .T. 

Local aAreaSF2  := SF2->(GetArea())
Local aAreaSD2  := SD2->(GetArea())

//Local aAreaSE1  := SE1->(GetArea())
//Local aAreaSEA  := SEA->(GetArea())


//************************************
// Verifica se a nota esta em bordero
//************************************
SE1->( DbSetOrder(1), DbSeek( xFilial("SF2") + SF2->F2_SERIE + SF2->F2_DOC ) )
SEA->( DbSetOrder(1), DbSeek( xFilial("SEA") + SE1->E1_NUMBOR + SE1->E1_PREFIXO + SE1->E1_NUM ) ) //indice 4 

while (SE1->E1_FILIAL + SE1->E1_NUMBOR + SE1->E1_PREFIXO + SE1->E1_NUM) == (SEA->EA_FILORIG + SEA->EA_PREFIXO + SEA->EA_NUM) .and. !SEA->( Eof() )

		if 	SEA->EA_TRANSF == "S"  .and. SEA->EA_SITAUCA <> '0'
		lExclui := .F.
		endif
	
	SEA->( DbSkip())
	
enddo

SEA->( DbSetOrder(1), DbSeek(SEA->EA_FILORIG + SE1->E1_NUMBOR + SE1->E1_PREFIXO + SE1->E1_NUM ) )
if !lExclui	// Nao existe arquivo gerado para nenhuma das parcelas na SE1
	while (xFilial("SE1") + SE1->E1_PREFIXO + SE1->E1_NUM + SE1->E1_NUMBOR) == (SEA->EA_FILORIG + SEA->EA_PREFIXO + SEA->EA_NUM + SEA->EA_NUMBOR) .and. ;
		!SEA->( Eof() )
		RecLock("SEA")
			SEA->( DbDelete() )
		SEA->( DbSkip() )

	enddo
//**********************************************************************************************************************************
// retirado do Fonte pois estava limpando a tabela SE1 e permitindo a exclusão do título de forma errada
//***********************************************************************************************************************************
	/*while !SE1->( Eof() ) .and. ;
			(xFilial("SE1") + SE1->E1_PREFIXO + SE1->E1_NUM) == (xFilial("SF2") + SF2->F2_SERIE + SF2->F2_DOC)

		RecLock("SE1")
			SE1->E1_PORTADO := ""
			SE1->E1_AGEDEP	:= ""
			SE1->E1_CONTA	:= ""
			SE1->E1_SITUACA	:= '0'
			SE1->E1_OCORREN	:= ''
			SE1->E1_NUMBOR	:= ""
			SE1->E1_DATABOR	:= stod('')
		SE1->( DbUnLock() )
		
		SE1->( DbSkip() )

	enddo**/

	lRet := .T.	// MUDAR

else
	Aviso("ATENÇÃO", "Entrar em contato com Financeiro, pois a fatura desta nota foi enviada ao banco!", {"OK"} )
	lRet := .F.

endif

RestArea(aAreaSD2)
RestArea(aAreaSF2)
Return lRet
