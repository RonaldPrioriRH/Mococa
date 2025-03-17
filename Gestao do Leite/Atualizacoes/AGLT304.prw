#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "JPEG.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ  AGLT304 บ Autor ณ Cleiton Campos     บ Data ณ  24/06/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Leitura do medidor de vazใo.                               บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico.                                                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AGLT304()
	
	Private lRet    := .F.
	
	Private DlgProd
	Private oBoxLib
	
	// Definindo os objetos de marca็ใo
	Private oNoMarked   := LoadBitmap( GetResources(), "LBNO" )
	Private oMarked     := LoadBitmap( GetResources(), "LBOK" )
	
	//Inicializando o aGrd com valores minimos
	Private aGrd 		:= {{oNoMarked,"",""}}
	Private _cRetProd	:= ""
	Private _cCodSA2	
	Private _cLojSA2	
	Private oMOdel
	
	DEFINE MSDIALOG DlgProd TITLE "Medidor de Vazใo" FROM MDEFTELA(178),MDEFTELA(179) TO MDEFTELA(575),MDEFTELA(967) PIXEL

	@ MDEFTELA(004),MDEFTELA(004) TO MDEFTELA(180),MDEFTELA(391) LABEL "Leituras:" PIXEL OF DlgProd
	
	@ MDEFTELA(010),MDEFTELA(007) ListBox oBoxLib  Fields Headers;
		" "			,;
		"Ticket"	,;
		"Data"	,;
		"Hora"	,;
		"Quantidade" ,;
		"Temperatura" ,;
		Size MDEFTELA(381),MDEFTELA(168);
		ON DBLCLICK (FLocaArr(aGrd[oBoxLib:nAt,3])) Pixel Of DlgProd
	
	oBoxLib:SetArray(aGrd)
	oBoxLib:bLine := {|| {  ;
		aGrd[oBoxLib:nAt,01],;
		aGrd[oBoxLib:nAt,02],;
		aGrd[oBoxLib:nAt,03],;
		aGrd[oBoxLib:nAt,04],;
		aGrd[oBoxLib:nAt,05]}}
	
	@ MDEFTELA(182),MDEFTELA(353) Button "Ok" Size MDEFTELA(037),MDEFTELA(012) PIXEL OF DlgProd Action(fReCoPro())
	
	fPeProGr()
	
	ACTIVATE MSDIALOG DlgProd CENTERED
	
Return .T.

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ fReCoPro บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function fReCoPro()

	lRet := .T.
	
	For nProc := 1 To Len(aGrd)
		oBoxLib:nAt := nProc
		If aGrd[oBoxLib:nAt,1] == oMarked
			nTotBom	 := aGrd[oBoxLib:nAt,5] 
			dDtColeta := aGrd[oBoxLib:nAt,3]
			cHrRec   := Left(aGrd[oBoxLib:nAt,4],5)
			aAdd(_aMedVaz, {aGrd[oBoxLib:nAt,2], aGrd[oBoxLib:nAt,3], aGrd[oBoxLib:nAt,4], aGrd[oBoxLib:nAt,5]} )
		ENDIF
	Next nProc
	
	DlgProd:END()
		
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ FLocaArr บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FLocaArr(cValPes)
	
	Local nProc 	:= 0
	Local nAux  	:= oBoxLib:nAt //Guarda a posicao que o usuario marcou
	Local _nCont	:= 1
	
	For nProc := 1 To Len(aGrd)
		oBoxLib:nAt := nProc
		If aGrd[oBoxLib:nAt,1] == oMarked
			_nCont++
		ENDIF
	Next nProc
	
	oBoxLib:nAt := nAux
	
	IF !(aGrd[oBoxLib:nAt,1] == oMarked) 
		IF _nCont <= 1
			aGrd[oBoxLib:nAt,1] := oMarked
		ELSE
			MSGINFO("ษ permitido a selecionar apenas uma medi็ใo.")
		ENDIF
	ELSE
		aGrd[oBoxLib:nAt,1] := oNoMarked		
	ENDIF
	
	oBoxLib:nAt := nAux
	oBoxLib:Refresh()
	
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ fPeProGr บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function fPeProGr()
	
	Local cArqTxt := GetMv("LT_MEDIDOR")
	Local _aLinha := {}  
	Local _aCabec := {}                                    
	Local _cTicket, _sData, _cHora, _nValor
	
	aGrd 	:= {}

	//Se arquivo vazio, abre tela para indicar local do arquivo
	If Empty(cArqTxt) .or. (FT_FUSE(cArqTxt) == -1)
		Coletas()
		Pergunte("COLETAS",.t.)
		
		cArqTxt :=  Alltrim(MV_PAR01)	
	    //Atualiza o parametro com o local indicado nos parametros.
		dbSelectArea("SX6")               
		GETMV("LT_MEDIDOR") 
		RecLock("SX6",.F.)
			SX6->X6_CONTEUD :=	cArqTxt
		MsUnLock()


	EndIf



	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Valida existencia do arquivo.       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If FT_FUSE(cArqTxt) == -1
		xmaghelpfis("Arquivo invแlido",;
		"Nใo foi possํvel abrir o arquivo informado.",;
		"Favor verificar se o arquivo informado esta correto.";
		+"Verifique o conteudo do parametro LT_MEDIDOR.")
		aAdd(aGrd, { oNoMarked, "" , "" , "" ,	0 })		
		Return
	EndIf


	// Abre o arquivo de peso da balan็a
	FT_FUSE(cArqTxt)
	
	// Posiciona na primeira linha do arquivo
	FT_FGoTop()

	_aCabec := STRTOKARR(FT_FReadLn(),";")
	
	_nData   := aScan(_aCabec, "Data")
	_nHora   := aScan(_aCabec, "Hora")
	_nColeta := aScan(_aCabec, "NumeroColeta")
	_nPlaca  := aScan(_aCabec, "Placa")
	_nQtdade := aScan(_aCabec, "QtdMedidor")
	
	If _nData == _nHora .and. _nPlaca == _nQtdade
		xmaghelpfis("Arquivo desconfigurado",;
		"O arquivo infirmado nใo possui o cabe็alho padrใo que foi configurado para esta importa็ใo.";
		+"Altere o arquivo TXT incluindo na primeira linha do arquivo o cabe็lho abaixo. Sem este cabe็alho nenhuma informa็ใo serแ exibida na tela.",;
		"Data;Hora;Bomba;Medidor;NumeroColeta;TipoLeite;E-S;Compartimento;Funcionario;Codigo;Operador;";
		+"Destino;Empresa;Linha;LinhaCli;Placa;Motorista;Boletim;QtdeBoletim;NotaFiscal;QtdeNota;Crioscopia;";
		+"QtdePuro;QtdMedidor;Temperatura;PlacaTanque;Capacidade;Motorista;Usuario;")
		aAdd(aGrd, { oNoMarked, "" , "" , "" ,	0 })		
		Return
	EndIf


	FT_FSkip()
        
	While !FT_FEof()
		
		_aLinha := STRTOKARR(FT_FReadLn(),";")
		                                        
		If ChkLeitura(_aLinha)
			aAdd(aGrd, { oNoMarked, _aLinha[_nColeta] , CtoD(_aLinha[_nData]) , _aLinha[_nHora] ,	Val(_aLinha[_nQtdade]) })		
		EndIf
		
		FT_FSkip()
		
	EndDo
	
	If Len(aGrd) <= 0
		aGrd := {{	oNoMarked	,;
					""			,;
					""			,;
					""			,;
					0           }}
	EndIf
	
	
	oBoxLib:SetArray(aGrd)
	oBoxLib:bLine := {|| {	aGrd[oBoxLib:nAt,01],;
							aGrd[oBoxLib:nAt,02],;
							aGrd[oBoxLib:nAt,03],; 
							aGrd[oBoxLib:nAt,04],;
							aGrd[oBoxLib:nAt,05]}}
							
	oBoxLib:Refresh()
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMDEFTELA  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MDEFTELA(nTam)
	
	Local nHRes	:=	oMainWnd:nClientWidth
	
	If nHRes == 640
		nTam *= 0.8
	ElseIf (nHRes == 798).Or.(nHRes == 800)
		nTam *= 1
	Else
		nTam *= 1.28
	EndIf
	If "MP8" $ oApp:cVersion
		If (Alltrim(GetTheme()) == "FLAT") .Or. SetMdiChild()
			nTam *= 0.90
		EndIf
	EndIf
	
Return Int(nTam)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ FSelTudo บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Selecionar todos os produtos do grid.                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FSelTudo()

	Local nProc := 0
	Local nAux  := oBoxLib:nAt //Guarda a posicao que o usuario marcou
	
	For nProc := 1 To Len(aGrd)
		oBoxLib:nAt := nProc
		If !(aGrd[oBoxLib:nAt,1] == oMarked)
			aGrd[oBoxLib:nAt,1] := oMarked //Marca no array a posicao que o usuario marcou
		ENDIF
	Next nProc
	
	oBoxLib:nAt := nAux
	oBoxLib:Refresh()
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ FDesTudo บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Desmarcar todos os produtos do grid.                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FDesTudo()

	Local nProc := 0
	Local nAux  := oBoxLib:nAt //Guarda a posicao que o usuario marcou
	
	For nProc := 1 To Len(aGrd)
		oBoxLib:nAt := nProc		
		If !(aGrd[oBoxLib:nAt,1] == oNoMarked)			
			aGrd[oBoxLib:nAt,1] := oNoMarked //Marca no array a posicao que o usuario marcou			
		EndIf
	Next nProc
	
	oBoxLib:nAt := nAux
	oBoxLib:Refresh()
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณChkLeitura บAutor  ณMicrosiga           บ Data ณ  07/29/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Verifica se a leitura jแ foi utilizada.                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ChkLeitura(_paLinha)

Local _lReturn := .T.
Local _cTicket := StrZero(Val(_paLinha[_nColeta] ),6)
Local _sData   := DtoS(CtoD(_paLinha[_nData]))
Local _cHOra   := _paLinha[_nHora]

ChkFile("ZLK")

If Select("ZLK") > 0
	dbSelectArea("ZLK")
	dbSetOrder(1)
	If ZLK->(dbSeek(xFilial("ZLK") +  _cTicket + _sData + _cHOra ))
		_lReturn := .F.
	EndIf
EndIf

Return(_lReturn)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFun…o    ณEmpPrefixo ณ Autor ณFabio Rogerio Pereira  ณ Data ณ19/02/02  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescri…o ณ Funcao de processamento da gravacao do SX6                 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณ Uso      ณ Empr้stimos bancแrios.                                     ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GrvSX6()
	//  X6_FIL   X6_VAR     X6_TIPO    X6_DESCRIC X6_DSCSPA  X6_DSCENG  X6_DESC1 X6_DSCSPA1 X6_DSCENG1
	//  X6_DESC2 X6_DSCSPA2 X6_DSCENG2 X6_CONTEUD X6_CONTSPA X6_CONTENG X6_PROPRI
	
	Local aSX6   := {}
	Local aEstrut:= {}
	Local i      := 0
	Local j      := 0
	Local lSX6	 := .F.
	Local cTexto := ''
	Local cAlias := ''
	
	aEstrut := {"X6_FIL","X6_VAR","X6_TIPO","X6_DESCRIC","X6_DSCSPA","X6_DSCENG","X6_DESC1","X6_DSCSPA1","X6_DSCENG1","X6_DESC2","X6_DSCSPA2","X6_DSCENG2","X6_CONTEUD","X6_CONTSPA","X6_CONTENG","X6_PROPRI","X6_PYME"}
	
	aAdd(asx6,{xFilial("SX6"), "LT_MEDIDOR", "C", "Caminho e nome do arquivo do medidor de vazใo", "", "", "", "", "", "", "","","C:\TOTVS\Medidor\coletas.txt","C:\TOTVS\Medidor\coletas.txt","C:\TOTVS\Medidor\coletas.txt","S","S"})
	
	ProcRegua(Len(aSX6))
	
	dbSelectArea("SX6")
	dbSetOrder(1)
	For i:= 1 To Len(aSX6)
		If !Empty(aSX6[i][2])
			If !dbSeek("  "+aSX6[i,2]) .And. !dbSeek(xFilial("SX6")+aSX6[i,2])
				lSX6	:= .T.
				If !(aSX6[i,2]$cAlias)
					cAlias += aSX6[i,2] //+ ":"+aSX6[i,4]+aSX6[i,7]+aSX6[i,10]+CHR(13)+CHR(10)
				EndIf
				RecLock("SX6",.T.)
				For j:=1 To Len(aSX6[i])
					If !Empty(FieldName(FieldPos(aEstrut[j])))
						FieldPut(FieldPos(aEstrut[j]),aSX6[i,j])
					EndIf
				Next j
				
				dbCommit()
				MsUnLock()
				cTexto += "Incluido o parametro " + aSX6[i,2] + Chr(13) + Chr(10)
			Else
				cTexto += "O parametro " + aSX6[i,2] + " ja existe e nao foi alterado." + Chr(13) + Chr(10)
			EndIf
			
		EndIf
	Next i
	
	cTexto := 'Incluidos novos parametros. Verifique as suas configuracoes e funcionalidades : '+ Chr(13) + Chr(10) + cTexto + Chr(13) + Chr(10)
	
Return cTexto



//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณTela para informar o caminho do arquivo COLETAS.TXTณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Static Function Coletas()

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	Aadd( aHelpPor, 'Informe o caminho e o nome do ')
	Aadd( aHelpPor, 'arquivo a ser importado.      ')
	Aadd( aHelpPor, 'Ex.: c:\medidor\coletas.txt   ')
	PutSx1("COLETAS","01","Arquivo "," "," ","mv_ch1","C",90,0,0,"G","","U_TXT","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
Return
