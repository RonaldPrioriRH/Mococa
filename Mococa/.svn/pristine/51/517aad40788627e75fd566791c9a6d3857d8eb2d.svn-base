#include "rwmake.ch"
#include "topconn.ch"

/*/{Protheus.doc} ROMSE012
Utilizado no PE M020INC - Inclusão automática de Transportadora
@author Godinho 
@since 10/05/2017
@version P12
@param nulo          
@return nulo
/*/
User Function ROMSE012()
Dbselectarea("SA4")
Dbsetorder(1)
IF SA4->(Dbseek(xFilial("SA4")+SA2->(A2_COD+A2_LOJA)))
	_lGrv :=.f.
ELSE
	_lGrv :=.t.
ENDIF
if SA2->A2_XTRANS =="1" 
	If RecLock("SA4",_lGrv)
   		SA4->A4_FILIAL  := xFilial("SA4")
   		SA4->A4_COD	    := SA2->(A2_COD+A2_LOJA)
		SA4->A4_NOME    := SA2->A2_NOME
		SA4->A4_NREDUZ  := SA2->A2_NREDUZ
		SA4->A4_END	    := SA2->A2_END 
		SA4->A4_COD_MUN := SA2->A2_COD_MUN
		SA4->A4_MUN	    := SA2->A2_MUN
		SA4->A4_BAIRRO  := SA2->A2_BAIRRO
		SA4->A4_EST     := SA2->A2_EST
		SA4->A4_CEP     := SA2->A2_CEP
		SA4->A4_DDD     := SA2->A2_DDD  
		SA4->A4_DDI     := SA2->A2_DDI
		SA4->A4_TEL     := SA2->A2_TEL
		SA4->A4_CGC     := SA2->A2_CGC
		SA4->A4_INSEST  := SA2->A2_INSCR
		SA4->A4_EMAIL   := SA2->A2_EMAIL
		SA4->A4_COMPLEM := SA2->A2_COMPLEM
		SA4->A4_CODPAIS := SA2->A2_CODPAIS
	  //SA4->A4_TPTRANS := SA2->A2_A2_CONTRIB
	MsUnlock("SA4")     
	END
EndIf
Return