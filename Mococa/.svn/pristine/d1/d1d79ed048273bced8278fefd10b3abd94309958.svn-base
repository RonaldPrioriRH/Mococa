#Include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"

/*/{Protheus.doc} RFINE005

CTB/PCO

Tratamento de validação do C.Custo

@author Claudio Ferreira
@since 13/04/2017
@version P12
@param Nao recebe parametros
@return lRet
/*/
User Function RFINE005()
Local lRet:=.t.
if 'TMSA144D'$Funname() .or. 'TMSA250'$Funname()
  M->E2_CCD:=DT7->DT7_CC
endif

//Tratamento EEC 
if 'EEC'$Funname() 
  M->E2_CCD:=SuperGetMV("MV_XCCECC",.F.,"")
endif

if 'GPEM670'$Funname()
  Return lRet //Ignora Titulo folha
endif

//Tratamento GENÉRICO 
if empty(M->E2_CCD)
  M->E2_CCD:=SuperGetMV("MV_XCCFIN",.F.,"")
endif

if empty(M->E2_CCD) .AND. M->E2_RATEIO<>'S' .AND. !IsBlind() .AND. !Upper(AllTrim(M->E2_TIPO))$GetMv("MV_XSE2TP",,"PA") /*Se for tipo PA não fica obrigatório, Alterado por Tarcísio Silva, 13/03/2018 Solicitado pelo Sr. Godinho, */
  Aviso('Atenção!','Informar o campo [C.Custo Deb]',{'Ok'})
  lRet:=.f.
endif

Return lRet
