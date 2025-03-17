#INCLUDE "rwmake.ch"
#include "PROTHEUS.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ PCOA3103 บ Autor ณ Claudio Ferreira  บ Data ณ  18/02/14    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Ponto de Entrada para criar filtros      (PCO)             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ PCO                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function PCOA3103
Local aArea      := GetArea()
Local cProcesso  := PARAMIXB[1]
Local cItem:= PARAMIXB[2]
Local aRet:= PARAMIXB[3]
Local cQry:= PARAMIXB[5]
Local cAnd:=''
Local aErros:={}   
Local nConta:=0
Local nMaxReg:=900
Private aLog:={}       
Private DEF_DATINI := 4
Private DEF_DATFIN := 5
if cProcesso$'000151/000054/000002' .AND. msgyesno("Utilizar Auto Filtro ?") 
	if cProcesso='000002' .and. cItem='01'
		cSql := " SELECT DISTINCT E2_FILIAL,E2_NUM,E2_FORNECE,E2_TIPO,E2_VALOR,E2_EMISSAO,ED_CODIGO,ED_CLORC,E2_CCD,B.R_E_C_N_O_ "
		cSql += " FROM " + RetSqlName("SED") + " A , " + RetSqlName("SE2") + " B, " + RetSqlName("AK6") + "  C "
		cSql += " WHERE A.D_E_L_E_T_=' ' AND B.D_E_L_E_T_=' ' AND C.D_E_L_E_T_=' ' "
		cSql += " AND E2_NATUREZ=ED_CODIGO AND E2_TIPO NOT IN ('PR ','PA ','TX ') AND E2_ORIGEM='FINA050' AND (E2_DESDOBR<>'S' OR (E2_DESDOBR='S' AND E2_PARCELA<>' ') )"
		if !empty(aRet[DEF_DATFIN])
		  cSql += " AND E2_EMISSAO BETWEEN  '"+Dtos(aRet[DEF_DATINI])+"' AND '"+Dtos(aRet[DEF_DATFIN]) + "'"
		endif  
		cSql += " AND ((ED_CLORC=AK6_CODIGO AND AK6_GERLAN='1')OR(ED_CLORC=' ')) "
		cSql += " AND 'SE2'||E2_FILIAL||E2_PREFIXO||E2_NUM||E2_PARCELA||E2_TIPO||E2_FORNECE||E2_LOJA NOT IN "
		cSql += " (SELECT AKD_CHAVE FROM " + RetSqlName("AKD") + " WHERE  AKD_OPER=E2_FILIAL AND AKD_PROCES='000002') "
		cSql += " ORDER BY E2_FILIAL,E2_NUM "
		cSql := ChangeQuery( cSql )
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cSql), "QRY", .F., .T. )
		cVirg:=''
		aadd(aLog,'Processo: '+cProcesso+'/'+cItem+'-'+Posicione('AKA',1,xFilial('AKA')+cProcesso+cItem,'AKA_DESCRI') )  
		if QRY->(Eof())
		  cAnd+= 'AND 1=2'
        else
			While QRY->(!Eof())
				if empty(cAnd)
					cAnd+=" AND SE2.R_E_C_N_O_ in ("
				endif
				cAnd+=cVirg+Alltrim(Str(QRY->R_E_C_N_O_))
				cVirg:=','
				aadd(aLog,'Titulo: '+QRY->(E2_FILIAL+'/'+E2_NUM+'/'+E2_FORNECE+'/'+DTOC(STOD(E2_EMISSAO))+' Natureza: '+ED_CODIGO+' - Classe: '+ED_CLORC+' - C.Custo: '+E2_CCD+' - '+Transform(E2_VALOR,'@e 999,999,999.99')))
				If Empty(QRY->ED_CLORC)
					nScan := aScan(aErros,{|x| x[1] == 'N'+QRY->ED_CODIGO})
					If ( nScan==0 )
						aadd(aErros,{'N'+QRY->ED_CODIGO,Posicione('SED',1,xFilial('SED')+QRY->ED_CODIGO,'ED_DESCRIC'),'Natureza','Sem classe'})
					EndIf
				EndIf			
				nConta++			
				QRY->(DbSkip())
				if nConta>nMaxReg
				  Aviso("Maximo de erros","O Limite maximo de erros foi encontrado. "+CRLF+CRLF+"Corrija estes e reprocesse novamente!",{"Ok"},3)
				  exit
				endif
			EndDo
			if !empty(cAnd)
				cAnd+=") "
			endif
		endif               
		QRY->(DbCloseArea())
	endif
	if cProcesso='000054' .and. cItem='01'
		cSql := " SELECT DISTINCT D1_FILIAL,D1_SERIE,D1_DOC,D1_DTDIGIT,D1_TOTAL,B1_COD,B1_CLORC,D1_CC "
		cSql += " FROM " + RetSqlName("SB1") + " A , " + RetSqlName("SD1") + " B, " + RetSqlName("SF4") + " C, " + RetSqlName("AK6") + " D  "
		cSql += " WHERE A.D_E_L_E_T_=' ' AND B.D_E_L_E_T_=' ' AND C.D_E_L_E_T_=' ' AND D.D_E_L_E_T_=' ' "
		cSql += " AND D1_COD=B1_COD "
		cSql += " AND D1_TES = F4_CODIGO "
		cSql += " AND B1_FILIAL='"+xFilial("SB1")+"' "
		cSql += " AND F4_FILIAL='"+xFilial("SF4")+"' "
		cSql += " AND F4_ESTOQUE<>'S'"
		cSql += " AND F4_DUPLIC<>'N'"
		cSql += " AND D1_TIPO<>'D'"
		//cSql += " AND D1_RATEIO<>'1'"
		if !empty(aRet[DEF_DATFIN])
		  cSql += " AND D1_DTDIGIT BETWEEN  '"+Dtos(aRet[DEF_DATINI])+"' AND '"+Dtos(aRet[DEF_DATFIN]) + "'"
		endif		
		cSql += " AND ((B1_CLORC=AK6_CODIGO AND AK6_GERLAN='1')OR(B1_CLORC=' ')) "
		cSql += " AND 'SD1'||D1_FILIAL||D1_DOC||D1_SERIE||D1_FORNECE||D1_LOJA||D1_COD||D1_ITEM NOT IN "
		cSql += " (SELECT AKD_CHAVE FROM " + RetSqlName("AKD") + " WHERE AKD_OPER=D1_FILIAL AND AKD_STATUS='1' AND AKD_PROCES='000054')"
		cSql += " ORDER BY D1_FILIAL,D1_SERIE,D1_DOC"
		cSql := ChangeQuery( cSql )
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cSql), "QRY", .F., .T. )
		cVirg:=''
		aadd(aLog,'Processo: '+cProcesso+'/'+cItem+'-'+Posicione('AKA',1,xFilial()+cProcesso+cItem,'AKA_DESCRI') )
		if QRY->(Eof())
		  cAnd+= 'AND 1=2'
        else
			While QRY->(!Eof())
				if empty(cAnd)
					cAnd+=" AND D1_DOC in ("
				endif
				cAnd+=cVirg+"'"+QRY->D1_DOC+"'"
				cVirg:=','
				aadd(aLog,'Documento: '+QRY->(D1_FILIAL+'-'+D1_DOC+'/'+D1_SERIE+'/'+DTOC(STOD(D1_DTDIGIT))+' Produto: '+B1_COD+' - Classe: '+B1_CLORC+' - C.Custo: '+D1_CC+' - '+Transform(D1_TOTAL,'@e 999,999,999.99')))
				nConta++			
				QRY->(DbSkip())
				if nConta>nMaxReg
				  Aviso("Maximo de erros","O Limite maximo de erros foi encontrado. "+CRLF+CRLF+"Corrija estes e reprocesse novamente!",{"Ok"},3)
				  exit
				endif
			EndDo
			if !empty(cAnd)
				cAnd+=") "
			endif
		endif
		QRY->(DbCloseArea())
	endif
	if cProcesso='000151' .and. cItem='02'
		cSql := " SELECT DISTINCT D3_FILIAL,D3_NUMSEQ,D3_CUSTO1,D3_EMISSAO,B1_COD, B1_CLORC,D3_CC "
		cSql += " FROM " + RetSqlName("SB1") + " A , " + RetSqlName("SD3") + " B, " + RetSqlName("AK6") + "  C "
		cSql += " WHERE A.D_E_L_E_T_=' ' AND B.D_E_L_E_T_=' ' AND C.D_E_L_E_T_=' ' "
		cSql += " AND D3_COD=B1_COD "
		cSql += " AND D3_CF = 'RE0' AND D3_OP=' '  AND D3_DOC <> 'INVENT' AND D3_ESTORNO<>'S' "
		if !empty(aRet[DEF_DATFIN])
		  cSql += " AND D3_EMISSAO BETWEEN  '"+Dtos(aRet[DEF_DATINI])+"' AND '"+Dtos(aRet[DEF_DATFIN]) + "'"
		endif
		cSql += " AND B1_FILIAL='"+xFilial("SB1")+"' "
		cSql += " AND D3_FILIAL='"+xFilial("SD3")+"' "  
		cSql += " AND ((B1_CLORC=AK6_CODIGO AND AK6_GERLAN='1')OR(B1_CLORC=' ')) "
		cSql += " AND 'SD3'||D3_FILIAL||D3_NUMSEQ||D3_CHAVE||D3_COD NOT IN "
		cSql += " (SELECT AKD_CHAVE FROM " + RetSqlName("AKD") + " WHERE AKD_OPER=D3_FILIAL AND AKD_PROCES='000151')"
		cSql += " ORDER BY D3_FILIAL,D3_NUMSEQ "
		cSql := ChangeQuery( cSql )
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cSql), "QRY", .F., .T. )
		cVirg:=''
		aadd(aLog,'Processo: '+cProcesso+'/'+cItem+'-'+Posicione('AKA',1,xFilial('AKA')+cProcesso+cItem,'AKA_DESCRI') )  
		if QRY->(Eof())
		  cAnd+= 'AND 1=2'
        else
			While QRY->(!Eof())
				if QRY->D3_CUSTO1>0
					if empty(cAnd)
						cAnd+=" AND D3_NUMSEQ in ("
					endif
					cAnd+=cVirg+"'"+QRY->D3_NUMSEQ+"'"
					cVirg:=','
				endif
				aadd(aLog,'Sequencial: '+QRY->(D3_FILIAL+'/'+D3_NUMSEQ+'/'+DTOC(STOD(D3_EMISSAO))+' Produto: '+B1_COD+' - Classe: '+B1_CLORC+' - C.Custo: '+D3_CC+' - '+Transform(D3_CUSTO1,'@e 999,999,999.99')))
				If Empty(QRY->B1_CLORC)
					nScan := aScan(aErros,{|x| x[1] == 'P'+QRY->B1_COD})
					If ( nScan==0 )
						aadd(aErros,{'P'+QRY->B1_COD,Posicione('SB1',1,xFilial('SB1')+QRY->B1_COD,'B1_DESC'),'Produto','Sem classe'})
					EndIf
				EndIf			
				nConta++			
				QRY->(DbSkip())
				if nConta>nMaxReg
				  Aviso("Maximo de erros","O Limite maximo de erros foi encontrado. "+CRLF+CRLF+"Corrija estes e reprocesse novamente!",{"Ok"},3)
				  exit
				endif
			EndDo
			if !empty(cAnd)
				cAnd+=") "
			endif
		endif               
		QRY->(DbCloseArea())
	endif
	if len(aLog)>0
	  aSort(aErros,,,{|X,Y| x[1] < y[1]})
      aadd(aLog,' ')
      aadd(aLog,' ')
      aadd(aLog,' ')
	  For i:=1 to Len(aErros)  
	     aadd(aLog,aErros[i,3]+':'+Substr(aErros[i,1],2)+' - '+aErros[i,2]+' - '+aErros[i,4])
	  Next i
	endif  
	if len(aLog)>0
		LogProc("Log do processo",aLog)
	endif
Else 
	if !msgyesno("O reprocessamento sem filtro poderแ demorar, continua ?")
		cAnd:='AND 1=2'
	Endif
Endif
RestArea(aArea)
Return cQry+cAnd


/*
_____________________________________________________________________________
ฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆ
ฆฆ+-----------------------------------------------------------------------+ฆฆ
ฆฆฆPrograma  ฆ LogProc  ฆ Autor ฆ Claudio Ferreira      ฆ Data ฆ 12/09/08 ฆฆฆ
ฆฆ+----------+------------------------------------------------------------ฆฆฆ
ฆฆฆDescri็เo ฆ Relatorio de Log de Processos                              ฆฆฆ
ฆฆ+----------+------------------------------------------------------------ฆฆฆ
ฆฆฆ Uso      ฆ Generico                                                   ฆฆฆ
ฆฆฆ          ฆ                                                            ฆฆฆ
ฆฆ+-----------------------------------------------------------------------+ฆฆ
ฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆฆ
ฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏฏ
*/

Static Function LogProc(cOrigem,aLog)

titulo   := "LOG DO PROCESSO - "+cOrigem
cDesc1   := "Este programa irแ emitir um Log de Processo"
cDesc2   := "conforme parametros especificados."
cDesc3   := ""
cString  := ""
aReturn  := { "Zebrado", 1,"Administracao", 2, 2, 1, "",1 }
nLastKey := 0
ntamanho := "M"
wnrel    := "LOGPROC"
nomeProg := "LOGPROC"
li       := 99
m_pag    := 1
nTipo    := IIF(aReturn[4]==1,15,18)
wnrel    := SetPrint(cString,wnrel,,@titulo,cDesc1,cDesc2,cDesc3,.F.,,.F.,)
If LastKey() == 27 .Or. nLastKey == 27
	Return
Endif
SetDefault(aReturn,cString)
RptStatus({|| ILogPro2(cOrigem,aLog)},Titulo)

Return Nil

Static Function ILogPro2(cOrigem,aLog)
cabec1  := "Descricao do Evento"
cabec2  := ""
SetRegua(len(aLog))
For _xi:=1 to len(aLog)
	incregua()
	if li > 60
		li:=Cabec(titulo,cabec1,cabec2,nomeprog,nTamanho,nTipo)+1
	endif
	@ li,000 Psay aLog[_xi]
	li++
Next

Roda(0,nTamanho)

Set Device to Screen

If aReturn[5] == 1
	Set Printer To
	dbCommitAll()
	ourspool(wnrel)
endif

MS_FLUSH()

Return Nil



