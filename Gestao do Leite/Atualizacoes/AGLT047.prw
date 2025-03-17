#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "TBICONN.CH"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGLT047 �Autor  �Cleiton Campos/Guilherme Fran�a � Data �  04/03/17   ���
�������������������������������������������������������������������������͹��
���Desc.     � C�lcula pagamento de frete.                                ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
user function AGLT047(xOpc)

	Local _aArea := GetArea()
	Local bProcess
	Local oTProces
	Local _cTexto   := ""
	Local _cPerg    := "PAGLT047"
	Private _cEveQuebra := Alltrim(GetMv("LT_EVEQUEB"))

	If xOpc == "A"
		_cTexto := "O objetivo desta rotina � gerar os dados de fechamento dos carreteiros "
		_cTexto += "com base nos par�metros informados."
		bProcess  := {|oSelf| AGL047Z(oSelf)}
	Else
		_cTexto := "O objetivo desta rotina � gerar os t�tulos de quebra de leite no financeiro, "
		_cTexto += "gerar custo para o produto leite no SD3 e efetivar o c�lculo realizado para pagamento ao carreteiro."
		bProcess  := {|oSelf| AGL047B(oSelf)}
	EndIf

	AjustaSX1(_cPerg)

	If xOpc == "A" 

		If Pergunte(_cPerg, .T.)
			// Posiciona na tabela ZLE (Mix do leite)
			dbSelectArea("ZLE")
			ZLE->(dbSetOrder(1))
			If ZLE->(dbSeek(xFilial("ZLE") + MV_PAR01))

				If ZLE->ZLE_DTFIM != dDataBase
					xMagHelpFis("DATABASE INVALIDA",;
					"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes do fechamento!",;
					"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
					Return()
				EndIf

				ATUPRECO(_cEveQuebra)

				oTProces := tNewProcess():New("AGLT047","Fechamento Carreteiro",bProcess,_cTexto,_cPerg)
			Else
				xMagHelpFis("AGLT047","O c�digo do mix n�o foi localizado.","Informe um c�digo de mix existente.")
			EndIf
		EndIf
	Else
		Processa({|| AGL047B() })

	EndIf

	RestArea(_aArea)

return


Static Function AGL047Z(oObj)

Local _cAliasp    := GetNextAlias()
Local _nCont := 1
Local _nReg := 0

CriaTab(_cAliasp,0)
dbSelectArea(_cAliasp)
Count to _nReg
oObj:SetRegua1(_nReg)
oObj:SetRegua2(4)

(_cAliasp)->(dbGoTop())
While !(_cAliasp)->(Eof())
	oObj:IncRegua1("Carreteiro " +AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nReg))+" ("+AllTrim(str( round((_nCont/_nReg)*100,0) ))+"%) -> " + (_cAliasp)->ZLD_FRETIS)

	AGL047A(oObj,(_cAliasp)->ZLD_FRETIS,(_cAliasp)->ZLD_LJFRET)
	
	(_cAliasp)->(dbSkip())
	_nCont++
Enddo

Return	
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGL047A �Autor  �Cleiton Campos        � Data �  04/22/15   ���
�������������������������������������������������������������������������͹��
���Desc.     � Calcula pagamento de frete por KM ASFALTO, KM TERRA e por  ���
���          � litro de leite.                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AGL047A(oObj,xcCod,xcLoja)

	Local _cAlias    := GetNextAlias()
	Local _cAliasSE1 := ""
	Local _aCab      := {}
	Local _aItem     := {}
	Local _aItSE1    := {}
	Local _aAux      := {}
	Local _nItem     := 1
	Local _nReg      := 0
	Local _cCodAux	:= ""
	Local _cLojaAux := ""
	Local _cRotAtu := ""
	Local _nVlrQueb	:= 0
	Local _cRota1	:= ""
	Local _lSair := .f.

	Private _nTotLeite := 0
	Private _nQtdLeite := 0


	CriaTab(_cAlias,1,xcCod,xcLoja)
	dbSelectArea(_cAlias)
//	Count to _nReg
//	oObj:SetRegua1(_nReg)
//	oObj:SetRegua2(4)

	(_cAlias)->(dbGoTop())
	While !(_cAlias)->(Eof()) .and. !_lSair

		//Verifica se j� existe c�lculo para o transportador.
		DbSelectArea("ZM0")
		ZM0->(DbSetOrder(1))
		If ZM0->(DbSeek(xFilial("ZM0")+Alltrim(MV_PAR01)+(_cAlias)->ZLD_FRETIS+(_cAlias)->ZLD_LJFRET))

			MsgInfo("J� existe c�lculo de frete para o transportador "+(_cAlias)->ZLD_FRETIS+" no MIX "+MV_PAR01+". Este n�o ser� calculado.")
			(_cAlias)->(dbSkip())
			_lSair := .t.
			Loop
		
		EndIf

//		oObj:IncRegua1("Carreteiro " +AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nReg))+" ("+AllTrim(str( round((_nCont/_nReg)*100,0) ))+"%) -> " + (_cAlias)->ZLD_FRETIS +" Linha : " + (_cAlias)->ZLD_LINROT)

		If Alltrim((_cAlias)->ZLD_FRETIS) <> Alltrim(_cCodAux) .OR. Alltrim((_cAlias)->ZLD_LJFRET) <> Alltrim(_cLojaAux)

			_cCodAux   := (_cAlias)->ZLD_FRETIS
			_cLojaAux  := (_cAlias)->ZLD_LJFRET
			_cRota1	:= (_cAlias)->ZLD_LINROT					
			DbSelectArea("ZLW")
			ZLW->(DbSetOrder(3))
			ZLW->(DbSeek(xFilial("ZLW")+(_cAlias)->ZLD_FRETIS+(_cAlias)->ZLD_LJFRET))

			oObj:IncRegua2("Pagamento de frete por KM ASFALTO")
			// Pagamento de frete por KM ASFALTO
			_aTotKM := SomaKM((_cAlias)->ZLD_FRETIS,(_cAlias)->ZLD_LJFRET)
			If ZLW->ZLW_VLRKM > 0 .AND. _aTotKM[1] > 0
				_aAux := RetOcorr("0001", ZLW->ZLW_VLRKM, _aTotKM[1], ZLW->ZLW_COD, _nItem++)
				aAdd(_aItem, aClone(_aAux))
			EndIf

			oObj:IncRegua2("Pagamento do frete por KM TERRA")
			// Pagamento do frete por KM TERRA
			If ZLW->ZLW_VLRKMT > 0 .AND. _aTotKM[2]  > 0
				_aAux := RetOcorr("0002", ZLW->ZLW_VLRKMT, _aTotKM[2] , ZLW->ZLW_COD, _nItem++)
				aAdd(_aItem, aClone(_aAux))
			EndIf

			SomaTotBom( (_cAlias)->ZLD_FRETIS,(_cAlias)->ZLD_LJFRET )

			While !(_cAlias)->(Eof()) .and. _cRotAtu != (_cAlias)->ZLD_LINROT .and.; 
			Alltrim((_cAlias)->ZLD_FRETIS) == Alltrim(_cCodAux) .and. Alltrim((_cAlias)->ZLD_LJFRET) == Alltrim(_cLojaAux)

				_cRotAtu := (_cAlias)->ZLD_LINROT

				DbSelectArea("ZLW")
				ZLW->(DbSetOrder(1))
				ZLW->(DbSeek(xFilial("ZLW")+_cRotAtu))


				oObj:IncRegua2("Pagamento do frete por litro de leite")
				// Pagamento do frete por litro de leite.

				If ZLW->ZLW_VLRFRT > 0 .and. (_cAlias)->ZLD_QTDBOM > 0
					_aAux := RetOcorr("0003", ZLW->ZLW_VLRFRT, (_cAlias)->ZLD_QTDBOM, _cRotAtu, _nItem++, (_cAlias)->ZLD_QTDBOM)
					aAdd(_aItem, aClone(_aAux))
				EndIf

				//_nQtdLeite += (_cAlias)->ZLD_QTDBOM

				(_cAlias)->(dbSkip())
				
			EndDo

			If Len(_aItem) < 1
				_aAux := RetOcorr("0003", 0, _nQtdLeite, _cRota1, _nItem++, _nQtdLeite)
				aAdd(_aItem, aClone(_aAux))
			EndIf

			aAdd(_aCab, {'ZM0_MIX'   , MV_PAR01 })
			aAdd(_aCab, {'ZM0_CODSA2', _cCodAux})
			aAdd(_aCab, {'ZM0_LOJSA2', _cLojaAux})
			aAdd(_aCab, {'ZM0_TOTTRP', _nTotLeite})
			aAdd(_aCab, {'ZM0_TOTPRD', _nQtdLeite})


			If Len(_aCab) > 0

				oObj:IncRegua2("Seleciona t�tulos a receber")
				//Seleciona t�tulos a receber
				_cAliasSE1 := CriaSE1(_cCodAux, _cLojaAux, ZLE->ZLE_DTFIM)
				dbSelectArea(_cAliasSE1)
				_aAux := RetTit(_cAliasSE1)
				If Len(_aAux)>0
					//aAdd(_aItSE1, _aAux)
					_aItSE1 := _aAux
				EndIf
				// Calcula desconto por quebra de leite.
				// Se a quantidade de leite dos produtores for maior que a quantidade de leite
				// no caminh�o.
				If _nQtdLeite > _nTotLeite
					//					_aAux := IncQuebra(_nTotLeite, _nQtdLeite - _nTotLeite, _nItem++)
					_nVlrQueb := IncQuebra(_nTotLeite, _nQtdLeite - _nTotLeite, _nItem++)
					If _nVlrQueb > 0
						_aAux := RetTit("",_nVlrQueb,RIGHT(_cCodAux,5)+RIGHT(MV_PAR01,4),ZLE->ZLE_DTFIM) //RIGHT(_cCodAux,5)+RIGHT(MV_PAR01,4) -> equivale ao numero do titulo  ser gerado
						If Len(_aAux)>0
							aAdd(_aItSE1, _aAux)

						EndIf
					EndIf
					//					If Len(_aAux) > 0
					//						aAdd(_aItem, aClone(_aAux))
					//					EndIf
				EndIf

				xExecAuto(_aCab, _aItem, _aItSE1)

			EndIf

			_aCab	:= {}
			_nItem     := 1
			_aItem     := {}
			_aItSE1    := {}
			_nTotLeite := 0
			_nQtdLeite := 0

		EndIf
	EndDo

	(_cAlias)->(DbCloseArea())

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RetOcorr �Autor  �Cleiton Campos        � Data �            ���
�������������������������������������������������������������������������͹��
���Desc.     � Returna Array com ocorr�ncias para pagamento de frete.     ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function RetOcorr(_pcOcorrencia, _pnVlr, _pnQtd, _pcLinha, _pnItem, _pnTorPrd)

	Local _aRetorno := {}

	Default _pnTorPrd := 0

	aAdd( _aRetorno, {'ZM1_ITEM'  , StrZero(_pnItem, 3)      })
	aAdd( _aRetorno, {'ZM1_OCORRE', _pcOcorrencia })
	//	aAdd( _aRetorno, {'ZM1_TOTPRD' , _pnTorPrd   })
	aAdd( _aRetorno, {'ZM1_QTDADE', _pnQtd       })
	aAdd( _aRetorno, {'ZM1_VALOR' , _pnVlr       })
	aAdd( _aRetorno, {'ZM1_LINHA' , _pcLinha     })

Return(_aRetorno)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RetTit   �Autor  �Cleiton Campos        � Data �            ���
�������������������������������������������������������������������������͹��
���Desc.     � Retorna t�tulos a receber.                                 ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function RetTit(_pcAliasSE1,xnVlr,xcNum,xdDataFim)

	Local _aRetorno := {}
	Local _dDtVenc  
	Local _aAux := {}


	If !Empty(_pcAliasSE1)
		(_pcAliasSE1)->(dbGoTop())
		While !(_pcAliasSE1)->(Eof())

			aAdd( _aAux, {'ZM2_EVENTO'  , (_pcAliasSE1)->E1_L_EVENT  })
			aAdd( _aAux, {'ZM2_PREFIX'  , (_pcAliasSE1)->E1_PREFIXO  })
			aAdd( _aAux, {'ZM2_NUMERO'  , (_pcAliasSE1)->E1_NUM      })
			aAdd( _aAux, {'ZM2_PARCEL'  , (_pcAliasSE1)->E1_PARCELA  })
			aAdd( _aAux, {'ZM2_TIPTIT'  , (_pcAliasSE1)->E1_TIPO     })
			aAdd( _aAux, {'ZM2_EMISSA'  , StoD((_pcAliasSE1)->E1_EMISSAO) })
			aAdd( _aAux, {'ZM2_DTVENC'  , StoD((_pcAliasSE1)->E1_VENCREA) })
			aAdd( _aAux, {'ZM2_VALOR'   , (_pcAliasSE1)->VALOR })

			(_pcAliasSE1)->(dbSkip())
			aAdd(_aRetorno, _aAux)

			_aAux := {}
		EndDo

		(_pcAliasSE1)->(dbCloseArea())
	Else

		_dDtVenc  := DaySum(xdDataFim, GetMv("LT_VNCCAR"))
		//Preenche grid com dados do t�tulo que ser� gerado no fechamento do frete
		DbSelectArea("ZL8")
		DbSetOrder(1)
		If DbSeek(xFilial("ZL8")+_cEveQuebra)
			aAdd( _aAux, {'ZM2_EVENTO'  , _cEveQuebra  })
			aAdd( _aAux, {'ZM2_PREFIX'  , ZL8->ZL8_PREFIX  })
			aAdd( _aAux, {'ZM2_NUMERO'  , xcNum      })
			aAdd( _aAux, {'ZM2_PARCEL'  , TamSX3("E1_PARCELA")[1]})
			aAdd( _aAux, {'ZM2_TIPTIT'  , "DP "     })
			aAdd( _aAux, {'ZM2_EMISSA'  , xdDataFim })
			aAdd( _aAux, {'ZM2_DTVENC'  , _dDtVenc })
			aAdd( _aAux, {'ZM2_VALOR'   , xnVlr })
			_aRetorno :=  _aAux
		EndIf
	EndIf

Return(_aRetorno)
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CriaTab �Autor  �Cleiton Campos        � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria tabela tempor�ria para c�lculo do pagamento do frete. ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CriaTab(_cAlias,xnOpc,xcCod,xcLoja)


	If xnOpc == 0
			BeginSql Alias _cAlias

			SELECT ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET
			FROM   (SELECT ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET, 
			ZLD_LINROT, 
			ZLD_DTCOLE, 
			ZLD_CODREC, 
			Sum(ZLD_QTDBOM) AS ZLD_QTDBOM 
			FROM   %Table:ZLD% ZLD 
			WHERE  ZLD_FILIAL = %xFilial:ZLD%
			AND   ZLD_DTCOLE BETWEEN %Exp:DtoS(ZLE->ZLE_DTINI)% AND %Exp:DtoS(ZLE->ZLE_DTFIM)%
			AND   ZLD_FRETIS BETWEEN %Exp:MV_PAR02%         AND %Exp:MV_PAR04%
			//AND   ZLD_FRETIS = %Exp:MV_PAR02%
			AND   ZLD_LJFRET BETWEEN %Exp:MV_PAR03%         AND %Exp:MV_PAR05%
			//AND   ZLD_LJFRET = %Exp:MV_PAR03%
			AND ZLD.%NotDel% 
			GROUP  BY ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET, 
			ZLD_LINROT, 
			ZLD_DTCOLE, 
			ZLD_CODREC 
			) A 
			GROUP  BY ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET
			ORDER BY ZLD_FRETIS, ZLD_LJFRET 

		EndSql
	

	ElseIf xnOpc == 1
		BeginSql Alias _cAlias

			SELECT ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET, 
			ZLD_LINROT,
			Sum(ZLD_QTDBOM) ZLD_QTDBOM 
			FROM   (SELECT ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET, 
			ZLD_LINROT, 
			ZLD_DTCOLE, 
			ZLD_CODREC, 
			Sum(ZLD_QTDBOM) AS ZLD_QTDBOM 
			FROM   %Table:ZLD% ZLD 
			WHERE  ZLD_FILIAL = %xFilial:ZLD%
			AND   ZLD_DTCOLE BETWEEN %Exp:DtoS(ZLE->ZLE_DTINI)% AND %Exp:DtoS(ZLE->ZLE_DTFIM)%
			//AND   ZLD_FRETIS BETWEEN %Exp:MV_PAR02%         AND %Exp:MV_PAR04%
			AND   ZLD_FRETIS = %Exp:xcCod%
			//AND   ZLD_LJFRET BETWEEN %Exp:MV_PAR03%         AND %Exp:MV_PAR05%
			AND   ZLD_LJFRET = %Exp:xcLoja%
			AND ZLD.%NotDel% 
			GROUP  BY ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET, 
			ZLD_LINROT, 
			ZLD_DTCOLE, 
			ZLD_CODREC 
			) A 
			GROUP  BY ZLD_FILIAL, 
			ZLD_FRETIS, 
			ZLD_LJFRET,
			ZLD_LINROT 
			ORDER BY  ZLD_QTDBOM DESC, ZLD_FRETIS, 
			ZLD_LJFRET 

		EndSql
	Else
		BeginSql alias _cAlias
			SELECT * FROM %Table:ZM2% M2
			WHERE ZM2_FILIAL = %xFilial:ZM2%
			AND ZM2_MIX = %Exp:MV_PAR01%
			//		AND ZM2_CODSA2 BETWEEN %Exp:MV_PAR02%        AND %Exp:MV_PAR04%
			AND ZM2_CODSA2 = %Exp:MV_PAR02%
			//AND ZM2_LOJSA2 BETWEEN %Exp:MV_PAR03%        AND %Exp:MV_PAR05%
			AND ZM2_LOJSA2 = %Exp:MV_PAR03%		
			AND ZM2_EVENTO = %Exp:_cEveQuebra%
			AND M2.%NotDel%
		EndSql

	EndIf

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �SomaKM �Autor  �Guilherme Fran�a        � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Soma km apontado nos tickets do transportador ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function SomaKM(xcCodigo,xcLoja)

	Local _aRet := {}

	If Select("TOTKM") <> 0
		TOTKM->(DbCloseArea())
	EndIf

	BeginSql alias "TOTKM"
		SELECT	   ZLD_FILIAL, 
		ZLD_FRETIS, 
		ZLD_LJFRET, 
		SUM(ZLD_KM)          AS KMA, 
		SUM(ZLD_KMTERR)      AS KMT  
		FROM (
		SELECT	ZLD_FILIAL, 
		ZLD_FRETIS, 
		ZLD_LJFRET, 
		ZLD_CODREC, 
		ZLD_KM,
		ZLD_KMTERR 
		FROM   %Table:ZLD% ZLD 
		WHERE  ZLD_FILIAL = %xFilial:ZLD%
		AND   ZLD_DTCOLE BETWEEN %Exp:DtoS(ZLE->ZLE_DTINI)% AND %Exp:DtoS(ZLE->ZLE_DTFIM)%
		AND   ZLD_FRETIS = %Exp:xcCodigo%
		AND   ZLD_LJFRET = %Exp:xcLoja%
		AND ZLD.%NotDel% 
		GROUP BY ZLD_FILIAL, ZLD_FRETIS, ZLD_LJFRET,ZLD_CODREC, ZLD_KM, ZLD_KMTERR) A

		GROUP BY ZLD_FILIAL, ZLD_FRETIS, ZLD_LJFRET
	EndSql

	If !TOTKM->(Eof())
		AADD(_aRet,TOTKM->KMA)
		AADD(_aRet,TOTKM->KMT)
	Else
		AADD(_aRet,0)
		AADD(_aRet,0)
	EndIf

Return _aRet



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �SomaTotBom �Autor  �Guilherme Fran�a        � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Soma km apontado nos tickets do transportador ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function SomaTotBom(xcCodigo,xcLoja)

	Local _nRet := 0

	_nTotLeite := 0
	_nQtdLeite := 0


	If Select("TOTBOM") <> 0
		TOTBOM->(DbCloseArea())
	EndIf

	BeginSql alias "TOTBOM"
		SELECT SUM(ZLD_TOTBOM) AS QTDBOM, SUM(QTDPRD) AS QTDPRD FROM (
		SELECT	ZLD_FILIAL, 
		ZLD_FRETIS, 
		ZLD_LJFRET, 
		ZLD_CODREC, 
		ZLD_TOTBOM, 
		SUM(ZLD_QTDBOM) AS QTDPRD 
		FROM   %Table:ZLD% ZLD 
		WHERE  ZLD_FILIAL = %xFilial:ZLD%
		AND   ZLD_DTCOLE BETWEEN %Exp:DtoS(ZLE->ZLE_DTINI)% AND %Exp:DtoS(ZLE->ZLE_DTFIM)%
		AND   ZLD_FRETIS = %Exp:xcCodigo%
		AND   ZLD_LJFRET = %Exp:xcLoja%
		AND ZLD.%NotDel% 
		GROUP BY ZLD_FILIAL, ZLD_FRETIS, ZLD_LJFRET,ZLD_CODREC, ZLD_TOTBOM) A
	EndSql

	If !TOTBOM->(Eof())
		_nTotLeite := TOTBOM->QTDBOM
		_nQtdLeite := TOTBOM->QTDPRD

	EndIf

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �xExecAuto�Autor  �Cleiton Campos       � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria tabela tempor�ria para c�lculo do pagamento do frete. ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function xExecAuto(_paCabecalho, _paOcorr, _paSE1)

	Local oModel  := FwLoadModel("AGLT046")
	Local _iCab   := 0
	Local _iOcorr := 0
	Local _iSE1   := 0
	Local _i      := 0

	oModel:SetOperation(3) // inclus�o.

	oModel:Activate() // Ativa o modelo.

	//Preenche cabe�alho do modelo.
	For _iCab := 1 to Len(_paCabecalho)
		oModel:GetModel('ID_M_FLD_ZM0'):SetValue(_paCabecalho[_iCab][1]	, _paCabecalho[_iCab][2] )
	Next _iCab

	//Preenche grid de ocorrencias.
	For _iOcorr := 1 to Len(_paOcorr)

		If _iOcorr > 1
			oModel:GetModel('ID_M_GRD_ZM1'):AddLine()
		EndIf

		For _i := 1 to Len(_paOcorr[_iOcorr])

			oModel:SetValue('ID_M_GRD_ZM1', _paOcorr[_iOcorr][_i][1]	, _paOcorr[_iOcorr][_i][2]  )

		Next _i

	Next _iOcorr

	//Preenche grid de titulos a receber
	For _iSE1 := 1 to Len(_paSE1)

		If _iSE1 > 1
			oModel:GetModel('ID_M_GRD_ZM2'):AddLine()
		EndIf

		For _i := 1 to Len(_paSE1[_iSE1])

			If !Empty(_paSE1[_iSE1][_i][1])
				oModel:SetValue('ID_M_GRD_ZM2', _paSE1[_iSE1][_i][1]	, _paSE1[_iSE1][_i][2]  )
			EndIf
		Next _i

	Next _iSE1

	If Len(_paOcorr) > 0 .or. Len(_paSE1) > 0
		If oModel:VldData()

			oModel:CommitData()

		Else

			_lExecAuto := .F.

			aErro := oModel:GetErrorMessage()

			AutoGrLog( "Id do formul�rio de origem:"	+ ' [' + AllToChar( aErro[1] ) + ']' )
			AutoGrLog( "Id do campo de origem: " 		+ ' [' + AllToChar( aErro[2] ) + ']' )
			AutoGrLog( "Id do formul�rio de erro: " 	+ ' [' + AllToChar( aErro[3] ) + ']' )
			AutoGrLog( "Id do campo de erro:  " 		+ ' [' + AllToChar( aErro[4] ) + ']' )
			AutoGrLog( "Id do erro: " 					+ ' [' + AllToChar( aErro[5] ) + ']' )
			AutoGrLog( "Mensagem do erro: " 			+ ' [' + AllToChar( aErro[6] ) + ']' )
			AutoGrLog( "Mensagem da solu��o: " 			+ ' [' + AllToChar( aErro[7] ) + ']' )
			AutoGrLog( "Valor atribu�do: " 				+ ' [' + AllToChar( aErro[8] ) + ']' )
			AutoGrLog( "Valor anterior: " 				+ ' [' + AllToChar( aErro[9] ) + ']' )

			MostraErro()

		EndIf

	EndIf

	oModel:DeActivate()

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �xTeste�Autor  �Cleiton Campos       � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Cria tabela tempor�ria para c�lculo do pagamento do frete. ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function xTeste()

	Local _aCab  := {}
	Local _aItem := {}
	Local _aAux  := {}

	aAdd(_aCab, {'ZM0_MIX'   , "000005" })
	aAdd(_aCab, {'ZM0_CODSA2', "T00001" })
	aAdd(_aCab, {'ZM0_LOJSA2', "01"})

	aAdd( _aAux, {'ZM1_ITEM'  , StrZero(1, 3)      })
	aAdd( _aAux, {'ZM1_OCORRE', "0001" })
	aAdd( _aAux, {'ZM1_QTDADE', 200       })
	aAdd( _aAux, {'ZM1_VALOR' , 1.3       })

	aAdd(_aItem, aClone(_aAux))

	_aAux := {}
	aAdd( _aAux, {'ZM1_ITEM'  , StrZero(2, 3)      })
	aAdd( _aAux, {'ZM1_OCORRE', "0002" })
	aAdd( _aAux, {'ZM1_QTDADE', 100       })
	aAdd( _aAux, {'ZM1_VALOR' , 1.3       })

	aAdd(_aItem, aClone(_aAux))

	xExecAuto(_aCab, _aItem)

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �IncQuebra�Autor  �Cleiton Campos       � Data �             ���
�������������������������������������������������������������������������͹��
���Desc.     � Inclui cobran�a por quebra de leite.                       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function IncQuebra(_pnQtdLt, _pnQuebra, _pnItem)

	Local _nPercTl  := SuperGetMv("LT_PERCQB", .F. , 0.3)  // Percentual de toler�ncia.
	Local _cEveQuebra := Alltrim(GetMv("LT_EVEQUEB"))
	Local _aRetorno := {}
	Local _aAux     := {}
	Local _nPerQb   := 0
	Local _nQtdCob  := 0
	Local _nQtdTol  := 0   // Quantidade da toler�ncia.
	Local _nVlrMed  := Posicione("ZL8",1,xFilial("ZL8") + _cEveQuebra,"ZL8_VALOR") // Valor m�dio do litro de leite. (criar fun��o para retornar essa informa��o.)
	Local _nRet := 0   

	// Calcula o percentual da quebra
	_nPerQb := Round(( _pnQuebra / _pnQtdLt )*100 , 2)

	//Se o percnetual de quebra for maior que o percentual de toler�ncia
	If _nPerQb > _nPercTl


		//Calcula a quantidade tolerada para a quebra de leite
		//multiplicando a quantidade de leite transporatda pelo percentual
		//de toler�ncia de quebra. 
		_nQtdTol := Int(_pnQtdLt * (_nPercTl/100) )  

		//Calcula a quantidade de litros de leite que ser� cobrada do carreteiro.
		//Ser� cobrado do carreteiro somente a quantidade que exceder o limite de toler�ncia.
		//Aqui a quantidade tolerada � subtraida da quantidade total da quebra.
		If _pnQuebra > _nQtdTol
			_nQtdCob := Int(_pnQuebra - _nQtdTol) 
			_nRet := _nQtdCob * _nVlrMed
			//_aRetorno := RetOcorr("0004", _nVlrMed, _nQtdCob, "999999", _pnItem)
		EndIf

	EndIf

Return _nRet
//Return(_aRetorno)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �CriaSE1�Autor  �Cleiton Campos       � Data �               ���
�������������������������������������������������������������������������͹��
���Desc.     � Seleciona os t�tulos a receber em aberto para o carreteiro.���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function CriaSE1(_pcCliente, _pcLoja, _pdDtFim)

	Local _cAliasSE1 := GetNextAlias()
	Local _dDataFim  := DaySum(_pdDtFim, GetMv("LT_VNCCAR"))

	_dDataFim := DtoS(_dDataFim)

	BeginSql Alias _cAliasSE1

		SELECT E1_FILIAL,  E1_PREFIXO, E1_NUM, E1_PARCELA, E1_TIPO , E1_CLIENTE, E1_LOJA,
		E1_L_EVENT, E1_EMISSAO, E1_VENCREA,
		(E1_SALDO + E1_SDACRES - E1_SDDECRE) AS VALOR

		FROM %Table:SE1% SE1

		JOIN %Table:SA1% SA1
		ON   A1_FILIAL  = %xFilial:SA1%
		AND  A1_COD     = E1_CLIENTE
		AND  A1_LOJA    = E1_LOJA
		AND SA1.%NotDel%

		WHERE E1_FILIAL  =  %xFilial:SE1%
		AND   E1_CLIENTE =  %Exp:_pcCliente% 
		AND   E1_LOJA    =  %Exp:_pcLoja%   
		AND   E1_VENCREA <= %Exp:_dDataFim%
		AND   E1_VENCREA > '20171101'
		AND   E1_SALDO > 0
		AND   SE1.%NotDel%

	EndSql


Return(_cAliasSE1)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AGL047B �Autor  �Guilherme Fran�a      � Data �  19/10/17   ���
�������������������������������������������������������������������������͹��
���Desc.     � Gera titulos financeiros de desconto da quebra do leite.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       �                                                            ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AGL047B(oObj)

	//Local _cAlias    := GetNextAlias()
	Local _nReg      := 0
	Local _nCont     := 1
	Local _cCodAux	:= ""
	Local _cLojaAux := ""
	Local _cEveQuebra := Alltrim(GetMv("LT_EVEQUEB"))
	Local _lRet := .t.
	Local _nQtdtit := 0

	If Empty(ZM0->ZM0_CTE)
		Alert("Obrigat�rio informar o n�mero do CTE antes da efetivaro c�lculo!","CTE n�o informado")
		Return
	EndIf
	
	dbSelectArea("ZLE")
	ZLE->(dbSetOrder(1))
	If ZLE->(dbSeek(xFilial("ZLE") + ZM0->ZM0_MIX))
		If ZLE->ZLE_DTFIM != dDataBase
			xMagHelpFis("DATABASE INVALIDA",;
			"A data do sistema("+DTOC(dDataBase)+") nao esta no ultimo dia do mes do fechamento!",;
			"Altere a data do sistema para "+DTOC(LastDay(ZLE->ZLE_DTFIM)) )
			Return()
		EndIf
	EndIf
	

	Begin Transaction

				
		DbSelectArea("ZM2")
		DbSetOrder(1)
		//ZM2_FILIAL, ZM2_MIX, ZM2_CODSA2, ZM2_LOJSA2, ZM2_ITEM, R_E_C_N_O_, D_E_L_E_T_
		If ZM2->(DbSeek(xFilial("ZM2")+ZM0->ZM0_MIX+ZM0->ZM0_CODSA2+ZM0->ZM0_LOJSA2))
			
			While !ZM2->(Eof()) .and. ZM2->ZM2_MIX == ZM0->ZM0_MIX .and. ZM2->ZM2_CODSA2 == ZM0->ZM0_CODSA2 .and. ZM2->ZM2_LOJSA2 == ZM0->ZM0_LOJSA2    
				If ZM2->ZM2_EVENTO == _cEveQuebra
					DbSelectArea("SE1")
					DbSetOrder(1)
					If !SE1->(dbSeek(xFILIAL("SE1")+ZM2->ZM2_PREFIX+ZM2->ZM2_NUMERO+ZM2->ZM2_PARCEL+ZM2->ZM2_TIPTIT))
		
						DbSelectArea("ZL8")
						DbSetOrder(1)
						DbSeek(xFilial("ZL8")+_cEveQuebra)
		
						_lRet := U_IncluSE1(ZM2->ZM2_PREFIX,ZM2->ZM2_NUMERO,ZM2->ZM2_PARCEL,ZM2->ZM2_TIPTIT,ZM2->ZM2_CODSA2,ZM2->ZM2_LOJSA2,;
						ZL8->ZL8_NATPRD,ZM2->ZM2_EMISSA,ZM2->ZM2_DTVENC,ZM2->ZM2_VALOR,0,0,"",ZM2->ZM2_DESCRI,0,_cEveQuebra,"AGLT046","")
					EndIf
				EndIf
				_nQtdtit++
				ZM2->(DbSkip())
			EndDo
		EndIf

		If _lRet
			_lRet := GeraCusto()

		EndIf

		If _lRet
			DbSelectArea("ZM0")
			RecLock("ZM0",.F.)
			ZM0->ZM0_STATUS := "F"
			ZM0->(MsUnLock())
		Else
			DisarmTransaction()
			Alert("Ocorreram erros que impediram a efetiva��o do frete, comunique o suporte","Falha na efetiva��o")	
		EndIf

	End Transaction
Return


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �gerMi        � Autor � Abrahao P. Santos     � Data da Criacao  � 05/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Gera Movi.Interno do Ticket                                                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
Static Function GeraCusto()

	Local _aAutoSD3 := {}
	Local cTm := getmv("LT_FRETETM")
	Local cProduto := getmv("LT_PRTRIBU")
	Local cRastro := getmv("MV_RASTRO")
	Local cSetor := SuperGetMv("LT_CODSETO",.f.,"000001")
	Local _cArmaz	:=	POSICIONE("ZL2",1,XFILIAL("ZL2")+cSetor,"ZL2_LOCAL")
	Local _nVlrCusto :=	0
	Local _lRet := .t.
	Local _cCTE := GetNextAlias()


	BeginSql alias _cCTE
		SELECT D1_CUSTO FROM %Table:SD1% SD1
		WHERE D1_FILIAL = %xFilial:SD1% 
		AND D1_COD = '55010157'
		AND D1_DOC = %Exp:ZM0->ZM0_CTE% 
		AND D1_FORNECE = %Exp:ZM0->ZM0_CODSA2% 
		AND D1_LOJA = %Exp:ZM0->ZM0_LOJSA2%
		AND D1_EMISSAO >= %Exp:DTOS(dDataBase)% 
		AND SD1.%NotDel%
	EndSql 
	
	If !(_cCTE)->(Eof())
		_nVlrCusto	:= (_cCTE)->D1_CUSTO
	EndIf
	(_cCTE)->(DbCloseArea())
	
/*
	DbSelectArea("ZM1")
	DbSetOrder(1)
	If ZM1->(DbSeek(xFilial("ZM1")+ZM0->ZM0_MIX+ZM0->ZM0_CODSA2+ZM0->ZM0_LOJSA2))
		While !ZM1->(Eof()) .and. ZM1->ZM1_MIX == ZM0->ZM0_MIX .and. ZM1->ZM1_CODSA2 == ZM0->ZM0_CODSA2 .AND. ZM1->ZM1_LOJSA2 == ZM0->ZM0_LOJSA2
			If ZM1->ZM1_DEBCRE == "C"
				_nVlrCusto	+= ZM1->ZM1_VLRTOT
			Else
				_nVlrCusto	-= ZM1->ZM1_VLRTOT
			EndIf
			ZM1->(DbSkip()) 
		EndDo
	EndIf
*/
	//Posiciona no cadastro de Produtos
	dbSelectArea("SB1")
	SB1->(dbSetOrder(1))
	If !SB1->(dbSeek(xFilial("SB1") + cProduto ))

		xMagHelpFis("INFORMA��O",;
		"O produto: " + _cCodProd + " n�o consta na tabela de produtos.",;
		"Favor comunicar ao departamento de inform�tica do problema encontrada, pois desta forma n�o ser� poss�vel concluir a opera��o")
		Return .F.

	EndIf

	If _nVlrCusto > 0
		//Posiciona na tabela de Saldos em Estoque
		//Se nao encontrar o produto na tabela de saldos,
		//inclui saldo inicial para o produto.
		dbSelectArea("SB2")
		SB2->(dbSetOrder(1))
		If !SB2->(dbSeek(xFILIAL("SB2") + SB1->B1_COD + _cArmaz))
			CriaSB2(SB1->B1_COD,_cArmaz)
		EndIf
	
	
		AAdd( _aAutoSD3,{"D3_FILIAL"    , XFILIAL("SD3")	, nil } )	// Alterado para definir a filial do movimento	: Obrigatorio
		AAdd( _aAutoSD3,{"D3_TM"		, cTm 				, nil } )	// Tipo do Movimento Interno	: Obrigatorio
		AAdd( _aAutoSD3,{"D3_COD"		, SB1->B1_COD			, nil } )	// Codigo do Produto			: Obrigatorio
		AAdd( _aAutoSD3,{"D3_UM"		, SB1->B1_UM				, nil } )	// Unidade de Medida			: Obrigatorio
		AAdd( _aAutoSD3,{"D3_QUANT"	    , 0      	, nil } )	// Quantidade de Leite
		AAdd( _aAutoSD3,{"D3_LOCAL"	    , _cArmaz, nil } )	// Almoxarifado					: Obrigatorio
		AAdd( _aAutoSD3,{"D3_EMISSAO"	, ZM0->ZM0_DATFIM	, nil } )	// Data de Emissao				: Obrigatorio
		AAdd( _aAutoSD3,{"D3_DOC"	    , ZM0->ZM0_CTE, nil } )	// Documento
		AAdd( _aAutoSD3,{"D3_CUSTO1"	, _nVlrCusto	, nil } )	// Custo (na Moeda 1)
		AAdd( _aAutoSD3,{"D3_L_ORIG"	, ZM0->ZM0_MIX+ZM0->ZM0_CODSA2		, nil } )	// Origem do documento - ticket
		AAdd( _aAutoSD3,{"D3_L_SETOR"	, cSetor		, nil } )	// Setor
	
		lMsErroAuto := .F.
		Pergunte("MTA240",.F.) // Chama perguntas da rotina para evitar erros no Sigaauto
		MSExecAuto({|x,y| Mata240(x,y)},_aAutoSD3,3)
		If lMsErroAuto
			mostraerro()
			xmaghelpfis("Erro","Erro ao gerar movimento de custo SD3!","Tente novamente, se o erro persistir comunique urgentemente ao Suporte!")
			//		bToGo := MsgYesNo("Deseja continuar a rotina?")
			_lRet := .f.
		Endif
	Else
		_lRet := .f.
		xmaghelpfis("Erro","Erro ao gerar movimento de custo SD3!","O CTE do transportador pode n�o ter sido localizado, confirme o n�mero!")
	EndIf
	
return _lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � AjustaSX1� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AjustaSX1(_cPerg)

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}

	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
	Aadd( aHelpPor, 'zado para o Fechamento.                ')
	Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
	Aadd( aHelpPor, 'periodo correto.                       ')
	U_xPutSX1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Codigo do Carreteiro para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto. ')
	//Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
	//Aadd( aHelpPor, 'ou entao do T00001 ao T00001 para      ')
	Aadd( aHelpPor, 'considerar apenas este Carreteiro.       ')
	U_xPutSX1(_cPerg,"02","Carreteiro ?","Carreteiro de?","Carreteiro de?","mv_ch2","C",6,0,0,"G",,"SA2_L1","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Loja do Carreteiro para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto.                 ')
	U_xPutSX1(_cPerg,"03","Loja ?","Loja De?","Loja De?","mv_ch3","C",2,0,0,"G",,"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

	
	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Codigo do Carreteiro para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto.                 ')
	U_xPutSX1(_cPerg,"04","Carreteiro Ate?","Carreteiro Ate?","Carreteiro Ate?","mv_ch4","C",6,0,0,"G",,"SA2_L1","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

	aHelpPor := {}
	aHelpSpa := {}
	aHelpEng := {}
	Aadd( aHelpPor, 'Informe o Loja do Carreteiro para ser  ')
	Aadd( aHelpPor, 'considerado no Acerto.                 ')
	U_xPutSX1(_cPerg,"05","Loja At�?","Loja At�?","Loja At�?","mv_ch5","C",2,0,0,"G",,"","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � ATUPRECO� Autor � Microsiga          � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Descricao � Atualiza��o do pre�o cobrado na quebra do transportador.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function ATUPRECO(xcEvento)

Local _cAlias := "ZL8"
Local oGetVlr
Local oFont1 := TFont():New("MS Sans Serif",,016,,.T.,,,,,.F.,.F.)
Local oSay1
Local oSButton1
Local _cEvento := xcEvento
Local nVlr := 0
Static oDlg

DbSelectArea("ZL8")
DbSetOrder(1)
DbSeek(xFilial("ZL8")+_cEvento)

nVlr := ZL8->ZL8_VALOR


DEFINE MSDIALOG oDlg TITLE "Pre�o quebra transportador" FROM 000, 000  TO 180, 300 COLORS 0, 16777215 PIXEL
@ 009, 013 SAY oSay1 PROMPT "Confirma pre�o m�dio da quebra de leite?" SIZE 200, 009 OF oDlg FONT oFont1 COLORS 0, 16777215 PIXEL
@ 024, 013 SAY oSay1 PROMPT "Valor: " SIZE 041, 009 OF oDlg FONT oFont1 COLORS 0, 16777215 PIXEL
@ 024, 060 MSGET oGetVlr VAR nVlr SIZE 050, 010 OF oDlg PICTURE "@E 999,999.9999" COLORS 0, 16777215 PIXEL

//DEFINE SBUTTON oSButton1 FROM 35, 080 TYPE 01 OF oDlg ENABLE ACTION {|| ConfirmZL8(_cEvento,nVlr), oDlg:End()}
@ 43,65 BUTTON oSButton1 PROMPT "Confirmar" SIZE 048, 014 OF oDlg  ACTION {|| ConfirmZL8(_cEvento,nVlr), oDlg:End()} PIXEL
ACTIVATE MSDIALOG oDlg CENTERED

Return nVlr


Static Function ConfirmZL8(_xcCod,xnVlr)

DbSelectArea("ZL8")
DbSetOrder(1)
If DbSeek(xFilial("ZL8")+_xcCod)

	RecLock("ZL8",.F.)
	ZL8->ZL8_VALOR := xnVlr
	MsUnlock()
	
EndIf

Return
