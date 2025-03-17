#Include 'Protheus.ch'
#Include 'TbIconn.ch'
#Include 'Topconn.ch'

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AGLT040  º Autor ³ TOTVS                 º Data da Criacao  ³ 16/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Descricao Importação de Rotas                                                                                º±±
±±º          ³                     												                               				º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Descricao Importação de Rotas              				                                                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function AGLT040(cArqui)

Private cPerg := "AGLT040"
Private cFOpen := ""

// Controle de Cancelamento
If Empty(cArqui)
	MSGalert("[AGLT040] - Leitura Cancelada...","STOP")
	Return()
EndIf

GravaArq(cArqui)

Return()

Static Function GravaArq(cArqOrigem)

Local nLin := 0
Local lRota:= .F.
Local lValid:= .T.
Local aDados:={}
Local lProd:=.F.
Local nY, nX

// le arquivo texto
Local aDados:=LeArquivo(cArqOrigem,";")


oMetGlob:SetTotal(Len(aDados))
CursorWait()

For nX:=1 to Len(aDados)
// Incrementa regua

	oMetGlob:Set(nx)

	If Alltrim(aDados[nx,1]) == "Rota"
		cDescRota	:= Alltrim(aDados[nX,2])
		cRota		:= PADL(Alltrim(aDados[nX,3]),TamSX3("ZLW_COD")[1],"0")
		cKm			:= Val(Alltrim(aDados[nX,4]))
		cHrprsa		:= ""
		cHrprch 	:= ""
	ElseIf Alltrim(aDados[nx,1]) == "Saída"
		cHrprsa	:= Alltrim(aDados[nX,2])
		If Len(aDados[nx]) > 2
			cHrprch	:= Alltrim(aDados[nX,3])
			cVolPrev	:= Val(Alltrim(aDados[nX,4]))
			lRota		:= .T.
		Else
			cHrprch	:= ""
			cVolPrev	:= ""
		Endif
	ElseIf Alltrim(aDados[nX,1]) == "Chegada"
			cHrprch	:= Alltrim(aDados[nX,2])
			cVolPrev	:= Val(Alltrim(aDados[nX,3]))
			lRota		:= .T.
	Else

//		varinfo("aval",aval)
//		varinfo("cDad",cDad)

		cProdutor	:= StrZero(Val(Alltrim(SubStr(Alltrim(aDados[nX,1]),1,At("-",aDados[nX,1])-1))),TamSX3("A2_COD")[1])
		cProdutor	:="C"+SubStr(cProdutor,2,Len(cProdutor))

		cProprie	:= StrZero(Val(SubStr(Alltrim(aDados[nX,1]),At("-",aDados[nX,1])+1,Len(aDados[nX,1]))),TamSX3("A2_LOJA")[1])
		cPrevCol	:= Alltrim(aDados[nX,2])
		cFrequen	:= Alltrim(aDados[nX,3])
		cDia		:= Alltrim(aDados[nX,4])
		cVolume	:= Val(Alltrim(aDados[nX,5]))
		lProd:=.T.

		//Grava nova rota e fecha a rota anterior com o mesmo codigo
		//Gerando nova versao da rota
	EndIF
	If lRota
	BEGIN TRANSACTION
			//Funcao busca strutura de campos da ZLW
			aStruZLW:=BuscaStru("ZLW")

			//Busca o codigo de versao da ultima rota
			cQuery:="SELECT MAX(ZLW_VERSAO) as cVer FROM "+RetSqlName("ZLW")+" WHERE ZLW_COD = '"+cRota+"' AND D_E_L_E_T_ = ' '"
			TcQuery ChangeQuery(cQuery) New Alias "TEMP"
			TEMP->(dbGoTOp())
			_cVer:=TEMP->CVER
			TEMP->(dbCloseArea())

			dbSelectArea("ZLW")
			ZLW->(dbSetOrder(4))

			If ZLW->(dbSeek(xFilial("ZLW")+cRota+_cVer))
				//Alimenta o array com dados da rota

				For nY:=1 to Len(aStruZLW[1])
					IF Alltrim(aStruZLW[1][nY]) = 'ZLW_DESCRI'
						aStruZLW[2][nY]:=cDescRota
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_HRPRSA'
						aStruZLW[2][nY]:=cHrprsa
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_HRPRCH'
						aStruZLW[2][nY]:=cHrprch
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_VLMPR'
						aStruZLW[2][nY]:=ZLW->&(aStruZLW[1][nY])
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_KM'
						aStruZLW[2][nY]:=cKm
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_VERSAO'
						aStruZLW[2][nY]:=StrZero(Val(_cVer)+1,3)
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_DATINI'
						aStruZLW[2][nY]:=Date()
					ElseIF Alltrim(aStruZLW[1][nY]) = 'ZLW_MSBLQL'
						aStruZLW[2][nY]:='2'
					Else
						aStruZLW[2][nY]:=ZLW->&(aStruZLW[1][nY])
					EndIF
				Next nY

				//Bloqueia a versao anterior da rota
				RecLock("ZLW",.F.)
					ZLW->ZLW_MSBLQL = '1'
					ZLW->ZLW_DATFIM = Date()
				MsUnlock()
				//Cria a nova rota

				lValid := .T.
				RecLock("ZLW",.T.)
					For nY:=1 to Len(aStruZLW[1])
						ZLW->&(aStruZLW[1][nY]):=aStruZLW[2][nY]
					Next nY
				MsUnlock()

				//Bloqueia rodizio de rotas
				dbSelectArea("ZLY")
				ZLY->(dbSetOrder(3))
				IF ZLY->(dbSeek(xFilial("ZLY")+cRota+_cVer))
					aStruZLY:=BuscaStru("ZLY")
					For nY:=1 to Len(aStruZLY[1])
						IF Alltrim(aStruZLY[1][nY]) = 'ZLY_VERSAO'
							aStruZLY[2][nY]:=StrZero(Val(_cVer)+1,3)
						ElseIF Alltrim(aStruZLY[1][nY]) = 'ZLY_DATINI'
							aStruZLY[2][nY]:=Date()
						ElseIF Alltrim(aStruZLY[1][nY]) = 'ZLY_MSBLQL'
							aStruZLY[2][nY]:='2'
						ElseIF Alltrim(aStruZLY[1][nY]) = 'ZLY_DESROT'
							aStruZLY[2][nY]:=cDescRota
						Else
							aStruZLY[2][nY]:=ZLY->&(aStruZLY[1][nY])
						EndIF
					Next nY
					//Se nao estiver bloqueado bloqueia o rodizio de rotas da versao anterior
					IF ZLY->ZLY_MSBLQL <> '1'
						RecLock("ZLY",.F.)
							ZLY->ZLY_MSBLQL:='1'
							ZLY->ZLY_DATFIM:=Date()
						MsUnlock()
					EndIF

					//Cria a nova versao do rodizio de rotas
					RecLock("ZLY",.T.)
						For nY:=1 to Len(aStruZLY[1])
							ZLY->&(aStruZLY[1][nY]):=aStruZLY[2][nY]
						Next
					MsUnlock()
				Else
					MsgAlert("Ainda nao existe rodizio de rotas cadastros para a rota "+cRota+" versao "+_cVer+" favor cadastrar antes de importar esta rota!")
					DISARMTRANSACTION()
				EndIF
			Else
				MsgAlert("Rota "+cRota+" Não Encontrada. Dados dessa rota não serão importados!")
				lValid := .F.
				DISARMTRANSACTION()
			Endif
			lRota := .F.
			END TRANSACTION
			nItem:=1
	Endif

	// verifica se produtor existe
	IF lProd
		SA2->(dbSetOrder(1))
		If SA2->(dbSeek(xFilial("SA2")+cProdutor+cProprie))

			dbSelectArea('ZLZ')
			ZLZ->(dbSetOrder(3))
			Reclock("ZLZ",.T.)
				ZLZ->ZLZ_FILIAL		:=xFilial("ZLZ")
				ZLZ->ZLZ_ITEM		:=StrZero(nItem,3)
									nItem++
				ZLZ->ZLZ_CODPRO		:=SA2->A2_COD
				ZLZ->ZLZ_LJPROD		:=SA2->A2_LOJA
				ZLZ->ZLZ_NOMEPR		:=SA2->A2_NOME
				ZLZ->ZLZ_DIAPI		:=IIF(cDia="d1","2","3")
				ZLZ->ZLZ_HRPRSA		:=cPrevCol
				ZLZ->ZLZ_HRPRCH		:=cFrequen
				ZLZ->ZLZ_VLMPR		:=cVolume
				ZLZ->ZLZ_ROTA		:=cRota
				ZLZ->ZLZ_VERSAO		:=StrZero(Val(_cVer)+1,3)
			MsUnlock()
		Else
			MsgAlert("Produtor: "+cProdutor+" Loja: "+cProprie+"Não Encontrado. Este produtor nao será incluído no rozídio de rotas!")
		Endif
		lProd:=.F.
    EndIF
Next nX

MsgInfo("Arquivo importado com sucesso","Gestão do Leite")

Return


Static Function BuscaStru (_cAlias)

	Local _Stru:={}
	Local xAreaSX3:=GetArea("SX3")
	Local nQuant:=0
	Local aRet:={}

	dbSelectArea("SX3")
	dbSetOrder(1)
	dbSeek(_cAlias)
		While !SX3->(Eof()) .AND. AllTrim(SX3->X3_ARQUIVO) = Alltrim(_cAlias)
		    IF Alltrim(SX3->X3_CONTEXT) <> 'V'
			    AADD(_Stru,SX3->X3_CAMPO)
			    nQuant++
			EndIf
			SX3->(dbSkip())
		EndDo
		aTmp:=Array(nQuant)
	 	AADD(aRet,_Stru)
		AADD(aRet,aTmp)
	RestArea(xAreaSX3)
Return (aRet)



Static function LeArquivo(aArq,cSep)


Local 	cArqTxt := Alltrim(aArq)
Local 	nHdl    := FT_FUSE(cArqTxt)
Local 	aRet:={}
Local 	cAux    := ""
Local 	lCabec:=.T.
Default cSep:=','



If nHdl == -1
    MsgAlert("O arquivo de nome "+cArqTxt+" nao pode ser aberto! Verifique os parametros.","Atencao!")
    Return
Endif

FT_FGOTOP()

While !FT_FEOF()
	cAux   := FT_FREADLN()

	IF lCabec
		lCabec:=.F.
		FT_FSKIP()
		cAux   := FT_FREADLN()
	EndIF

	IF Alltrim(cAux) <> ''
		aAdd(aRet,STRTOKARR(cAux,cSep))
	EndIF
	FT_FSKIP()
EndDo

FT_FUSE(cArqTxt)

Return (aRet)