#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT062     บ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 21/08/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Desvio de Rotas X Ocorrencias														                บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                        						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RGLT062()

Private _cPerg := "RGLT062"
Private oReport
Private lInverte	:= .F.
Private cMarca	:= GetMark()
Private nCity
Private cTpCli
Private _cTitulo	:= 'Relat๓rio Desvio de Rotas X Ocorr๊ncias'
//Declaracao das Fontes
Private oFont8 		:= TFont():New("COURIER NEW",08,08,,.F.,,,,.T.,.F.)
Private oFont8N		:= TFont():New("COURIER NEW",08,08,,.T.,,,,.T.,.F.)
Private oFont10 	:= TFont():New("COURIER NEW",10,10,,.F.,,,,.T.,.F.)
Private oFont10N	:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.F.)
Private oFont10NS	:= TFont():New("COURIER NEW",10,10,,.T.,,,,.T.,.T.)
Private oFont12 	:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
Private oFont12N	:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
Private oFont12NS	:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.T.)
Private oFont14 	:= TFont():New("COURIER NEW",14,14,,.F.,,,,.T.,.F.)
Private oFont14N	:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Private oFont16 	:= TFont():New("COURIER NEW",16,16,,.F.,,,,.T.,.F.)
Private oFont16N	:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
Private oFont16NS	:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.T.)

SetPrvt("oDlg","oSay")

CriaSX1()

Pergunte(_cPerg,.T.,_cTitulo)

oReport := ReportDef(_cPerg)
oReport:PrintDialog()


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณReportDef ณ Autor ณ TOTVS                 ณ Data ณ 00/00/00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                            ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ReportDef(_cPerg)



oReport := TReport():New("RGLT062",_cTitulo,_cPerg,{|oReport|PrintReport(oReport)},_cTitulo)

oReport:lParamPage	:= .F.
oReport:lHeaderVisible := .F.
oReport:lFooterVisible := .F.
//oReport:SetPortrait(.T.)
oReport:SetLandscape(.T.)
oReport:nLineHeight	:= 45

Return oReport

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณPrintReport ณ Autor ณ TOTVS                 ณ Data ณ 00/00/00 บฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Montagem do relatorio                                        ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport()

Local _nTamMax		:= oReport:PageWidth()- 50 //Tamanho mแximo da pแgina
Local _nTamMid		:= (oReport:PageWidth()/2) //Metade da pแgina
Local nWrtMid		:= _nTamMid + 10 //Impressใo de dados a partir do meio da pแgina

Local _dDtIni := DDATABASE
Local _dDtFim := DDATABASE
Local _cFretista := ""
Local _cCodFret	:= ""

Local _nValor	:= 0
Local _nTotal	:= 0

Local _cFiltro := ""

// Carrega periodo do relat๓rio conforme MIX informado.
DbSelectArea("ZLE")
DbSetOrder(1)
DbSeek(xFilial("ZLE")+Alltrim(mv_par01))
_dDtIni := ZLE->ZLE_DTINI
_dDtFim := ZLE->ZLE_DTFIM
DbCloseArea("ZLE")

oReport:SkipLine(6)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
oReport:SkipLine(1)

//Filtros da consulta das ocorrencias lan็adas.
_cFiltro := "%"
_cFiltro += " AND ZLC_DTCOLE BETWEEN '"+DtoS(_dDtIni)+"' AND '"+DtoS(_dDtFim)+"' "
If !(Empty(MV_PAR02))
	_cFiltro += " AND ZLC_SETOR = '"+MV_PAR02+"'  "
EndIf
If !(Empty(MV_PAR03) .and. Empty(MV_PAR04))
	_cFiltro += " AND ZLC_FRETIS BETWEEN '"+MV_PAR03+"' AND '"+MV_PAR04+"' "
EndIf
If !(Empty(MV_PAR05) .and. Empty(MV_PAR06))
	_cFiltro += " AND ZLC_LJFRET BETWEEN '"+MV_PAR05+"' AND '"+MV_PAR06+"' "
EndIf
If !(Empty(MV_PAR07) .and. Empty(MV_PAR08))
	_cFiltro += " AND ZLC_LINROT BETWEEN '"+MV_PAR07+"' AND '"+MV_PAR08+"' "
EndIf
_cFiltro += "%"
// Consulta para obter os desvios de rotas lancados.
BeginSql alias "TRB"
	SELECT 	ZLC_TICKET AS TICKET,
	ZLC_FRETIS AS FRETISTA,
	ZLC_LJFRET AS LJFRET,
	ZLC_DTCOLE AS DTCOLE,
	ZLC_LINROT AS ROTA,
	ZLC_CODZLH AS CODIGO,
	ZLH_DESCRI AS DESCRI,
	ZLH_FATOR AS DEBCRE,
	ZLC_QTD AS QTD,
	ZLC_FORPAG AS FORPAG,
	(ZLC_VALOR * ZLC_QTD) AS VALOR,
	ZLC_OBS AS OBS,
	ZLC_STATUS AS APROV
	FROM
	%table:ZLC% ZLC, %table:ZLH% ZLH
	WHERE
	ZLC.%notDel% AND
	ZLH.%notDel% AND
	ZLC_CODZLH = ZLH_COD
	%exp:_cFiltro%
	ORDER BY ZLC_FRETIS, ZLC_DTCOLE
EndSql

DbSelectArea("TRB")
TRB->(dbGoTop())



While TRB->(!Eof())
	_cCodFret	:= TRB->FRETISTA	
	_cFretista := Posicione("SA2",1,xFilial("SA2")+TRB->FRETISTA+TRB->LJFRET,"A2_NOME")
	
	PrintCabec(_cFretista,_dDtIni,_dDtFim) //Impressao do cabe็alho e colunas do relat๓rio

	While TRB->(!Eof()) .AND. TRB->FRETISTA = _cCodFret
	
		If oReport:Row() >= oReport:PageHeight() - 100
			oReport:EndPage()
			oReport:StartPage()
			
			PrintCabec(_cFretista,_dDtIni,_dDtFim)
		Else
			oReport:SkipLine(1)
		EndIf
		
		_nValor := TRB->VALOR
		If TRB->DEBCRE == 'A'
			_cAplic := "Acrescimo"
		Else
			_cAplic	:= "Decrescimo"
			_nValor := _nValor * -1
		Endif
		
		If TRB->FORPAG == 'K'
			_cForma	:= "Km"
		ElseIf TRB->FORPAG == 'L'
			_cForma	:= "Litro"
		Else
			_cForma := "Fixo"
		EndIf		

		If TRB->APROV == 'A'
			_cAprov := "Autorizado"
		Else
			_cAprov	:= "Nใo Autori."
		Endif

		
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,DTOC(STOD(TRB->DTCOLE))	,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,TRB->TICKET				,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.17,TRB->ROTA					,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.23,Alltrim(TRB->CODIGO)+"-"+SubStr(TRB->DESCRI,1,30)	,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,_cAplic				,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.48,_cForma			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.57,cValtoChar(Transform(TRB->QTD,"@E 999,999.99"))			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.66,cValtoChar(Transform(_nValor,"@E 999,999.99"))			,oFont12)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.74,_cAprov			,oFont12)		
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.82,TRB->OBS			,oFont12)
		//Totalizador
		_nTotal += _nValor
		TRB->(DbSkip())
	EndDo
	
	oReport:SkipLine(1)
	oReport:ThinLine()
	
	//Totalizador
	If oReport:Row() >= oReport:PageHeight() - 200
		oReport:EndPage()
		oReport:StartPage()
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
	EndIf
	oReport:SkipLine(2)	

	If _nTotal > 0
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor adicional a ser pago no fechamento do frete:"			,oFont14N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,cValtoChar(Transform(_nTotal,"@E 999,999.99"))			,oFont14)
	ElseIf _nTotal < 0	
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Valor a ser debitado no pagamento do frete:"			,oFont14N)
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,cValtoChar(Transform(_nTotal,"@E 999,999.99"))			,oFont14)
	Else	
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"O transportador nใo tem diferen็as de valor por desvio de rotas a ser pago ou descontado.",oFont14N)	
	Endif
	_nTotal := 0
	oReport:EndPage()
	oReport:StartPage()
EndDo

TRB->(DBCLOSEAREA())
oReport:EndPage()

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณPrintCabecบ Autor ณ Guilherme Fran็a   บ Data ณ  21/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao de impressao do cabe็alho do relatorio.			  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintCabec(_cNome,_dIni,_dFim)

Local _cLogo := GetSrvProfString("StartPath","")+"lgrl01.bmp"

oReport:SayBitmap(005,010,_cLogo,162,164)
oReport:SkipLine(1)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.35	,_cTitulo,oFont16N)
oReport:SkipLine(2)

oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Transportador: "+TRB->FRETISTA+"/"+TRB->LJFRET+" - "+ _cNome,oFont12N)
oReport:SkipLine(1.5)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01	, "Perํodo: " + DtoC(_dIni)+" a "+DtoC(_dFim)  ,oFont12N)
	
oReport:SkipLine(2)
oReport:ThinLine()
oReport:SkipLine(1)
	
//Colunas do relat๓rio
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Emissใo"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,"Ticket"	,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.17,"Rota"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.23,"Ocorrencia"					,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.40,"Aplica็ใo"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.48,"Forma Pgt."				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.58,"Quantidade"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.69,"Valor"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.74,"Status"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.82,"Observa็ใo"				,oFont12N)
oReport:SkipLine(2)


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT059  บ Autor ณ Ramon Teles        บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor total dos debitos			  บฑฑ
ฑฑบ          ณ do meses anteriores.                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT059(_cFor,_dDtIni)

Local _aArea    := GetArea()

Local _cQuery2 := ""

Local _nDiffDate

Local _nValorOr := 0
Local _nValorJr := 0
Local _nValorTt := 0
Local _nValorTOr := 0
Local _nValorTJr := 0

Local _aRet := {}

_cQuery2 := " SELECT SE2.* "
_cQuery2 += " FROM "+RetSqlName("SE2")+" SE2  "
_cQuery2 += " WHERE " + RetSqlCond("SE2") + " "
_cQuery2 += " AND E2_SALDO > 0 "
_cQuery2 += " AND E2_TIPO = 'NDF' "
_cQuery2 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
_cQuery2 += " AND SE2.E2_VENCTO < '"+_dDtIni+"' "
_cQuery2 += " ORDER BY SE2.E2_FORNECE "

If Select ("DBA") <> 0
	DBA->(dbCloseArea())
EndIf

_cQuery2 := changeQuery(_cQuery2)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery2),"DBA",.F.,.T.)

DBA->(dbGoTop())

While DBA->(!Eof())
	
	_nValorOr := DBA->E2_VALOR
	_nDiffDate := DATE() - STOD(DBA->E2_VENCTO)
	_nValorJr := (DBA->E2_VALOR*(DBA->E2_PORCJUR/100))*_nDiffDate
	
	_nValorTOr += _nValorOr
	_nValorTJr += _nValorJr
	
	DBA->(DbSkip())
	
EndDo

DBA->(DBCLOSEAREA())

_nValorTt := _nValorTOr + _nValorTJr

RestArea(_aArea)

_aRet := {_nValorTOr,_nValorTJr,_nValorTt}

Return _aRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT0591 บ Autor ณ Ramon Teles        บ Data ณ  09/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor total dos debitos			  บฑฑ
ฑฑบ          ณ do meses futuros.                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT0591(_cFor,_dDtFim)

Local _aArea    := GetArea()

Local _cQuery3 := ""

Local _nRet

_cQuery3 := " SELECT SUM(E2_VALOR) AS VALOR "
_cQuery3 += " FROM "+RetSqlName("SE2")+" SE2  "
_cQuery3 += " WHERE " + RetSqlCond("SE2") + " "
_cQuery3 += " AND E2_SALDO > 0 "
_cQuery3 += " AND E2_TIPO = 'NDF' "
_cQuery3 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
_cQuery3 += " AND SE2.E2_VENCTO > '"+_dDtFim+"' "

If Select ("DBP") <> 0
	DBP->(dbCloseArea())
EndIf

_cQuery3 := changeQuery(_cQuery3)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery3),"DBP",.F.,.T.)

DBP->(dbGoTop())

_nRet := DBP->VALOR

DBP->(DBCLOSEAREA())

RestArea(_aArea)

Return _nRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ FGLT0592 บ Autor ณ Ramon Teles        บ Data ณ  09/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor das NFs dos Cooperados.		  บฑฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function FGLT0592(_cFor,_dDtIni,_dDtFim)

Local _aArea    := GetArea()

Local _cQuery4 := ""

Local _aRet := {}

_cQuery4 := " SELECT E2_LOJA,E2_NUM ,E2_VALOR AS VALOR"
_cQuery4 += " FROM "+RetSqlName("SE2")+" SE2  "
_cQuery4 += " WHERE " + RetSqlCond("SE2") + " "
_cQuery4 += " AND E2_SALDO > 0 "
_cQuery4 += " AND E2_TIPO = 'NF' "
_cQuery4 += " AND SE2.E2_FORNECE = '"+_cFor+"' "
_cQuery4 += " AND SE2.E2_VENCTO BETWEEN '"+_dDtIni+"' AND '"+_dDtFim+"'"

If Select ("CNF") <> 0
	CNF->(dbCloseArea())
EndIf

_cQuery4 := changeQuery(_cQuery4)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,_cQuery4),"CNF",.F.,.T.)

CNF->(dbGoTop())

While CNF->(!Eof())
	
	AADD(_aRet,{CNF->E2_LOJA , CNF->E2_NUM ,CNF->VALOR})
	
	CNF->(DbSkip())
	
EndDo

CNF->(DBCLOSEAREA())



Return _aRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ PrintC   บ Autor ณ Ramon Teles        บ Data ณ  12/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retornar o valor das NFs dos Cooperados.		  บฑฑ
ฑฑบ          ณ 					                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function PrintC

Local _aArea    := GetArea()
Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)

//Criando Colunas
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
oReport:SkipLine(2)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.01,"Emissใo"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10,"Documento/Parcela"	,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.25,"Filial"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.31,"Vencimento"					,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.42,"Hist๓rico"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.64,"D/C"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.68,"Valor Orig."				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.79,"Juros"				,oFont12N)
oReport:Say(oReport:Row(),oReport:PageWidth() * 0.87,"Valor total"				,oFont12N)

oReport:SkipLine(2)

RestArea(_aArea)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ CriaSX1  บ Autor ณ Ramon Teles        บ Data ณ  08/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CriaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Mix
aHelpPor := {}
Aadd( aHelpPor, 'Codigo do Mix a ser considerado     ')
U_xPutSx1(_cPerg,"01","Do Mix"," "," ","mv_ch1","C",6,0,0,"G","MV_PAR01:=STRZero(VAL(MV_PAR01),6)","ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"02","Setor   "," "," ","mv_ch2","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"03","Do Produtor"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L3","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"04","Ate Produtor"," "," ","mv_ch4","C",6,0,0,"G","","SA2_L3","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial do transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"05","Da Loja"," "," ","mv_ch5","C",2,0,0,"G","","","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final do transportador')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"06","Ate Loja"," "," ","mv_ch6","C",2,0,0,"G","","","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial da rota   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"07","Da Rota"," "," ","mv_ch7","C",6,0,0,"G","","ZLWLI3","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final   da rota   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(_cPerg,"08","Ate a Rota"," "," ","mv_ch8","C",6,0,0,"G","","ZLWLI3","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return
