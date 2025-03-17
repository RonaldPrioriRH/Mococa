#include "totvs.ch"
#include "topconn.ch"
#include "tbiconn.ch"

user function fCmpObrig()
    local cAlias := "SA1"
    local cMsg  := "CAMPO; TITULO; OBRIGATORIO"
	Local cxEmp := "01"
	Local cxFil := "0101"

    PREPARE ENVIRONMENT EMPRESA cxEmp FILIAL cxFil MODULO "FIN" TABLES "SX3"
    
    if !(Select("SX3") > 0)
        dbSelectArea("SX3")
    endIf

    SX3->(DBGotop())

    if !SX3->(dbSeek(cAlias))
        cMsg := cMsg + iif(!Empty(cMsg),  chr(13)+chr(10), "") + "Nao foi possivel encontrar a tabela: "+cAlias+", Entrar em contato com o TI"
        return lRet
    endIf

    while !SX3->(EOF()) .and. SX3->X3_ARQUIVO == cAlias
        cMsg += iif(!Empty(cMsg), CRLF , "") + ALLTRIM(SX3->X3_CAMPO) + ";"+ALLTRIM(SX3->X3_TITULO) + ";" + IIF(x3Obrigat(SX3->X3_CAMPO), "X", "")
        SX3->(dbSkip())
    end

    MemoWrite("C:\TEMP\CAMPOS_OBRIG.CSV", cMsg)

    RESET ENVIRONMENT
return
