#include "protheus.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ AGLT044  º Autor ³ Guilherme França      º Data da Criacao  ³ 12/09/2017									º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescri‡„o ³ Rotina para alteração dos preços negociados direto pela tela do grupo de preços.                                                                   º±±
±±º          ³                                                 																º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Gestao do Leite  							                                                        		º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor    	º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	    	º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
*/

User Function AGLT044()

Local aArea := GetArea()
Local nI
Local oDlg
Local oGetDados
Local oButton1
Local oButton2
Local nUsado := 0
Local aSize	:= MsAdvSize(.f.)
Local aObjects := {}
Local aEdita := {}
Private bFildok		:= {|| FIELDOK()}

/*
Private bSuperDel	:= {|| SUPERDEL()}
Private bDelOK		:= {|| DELOK()}
Private bTudoOK		:= {|| TUDOOK()}
Private bLinhaOK	:= {|| LINHAOK()}
*/

Private oFont := TFont():New("MS Sans Serif",,018,,.T.,,,,,.F.,.F.)
Private oFont1 := TFont():New("Arial",,019,,.T.,,,,,.F.,.F.)
Private oFont2 := TFont():New("Arial",,018,,.F.,,,,,.F.,.F.)

Private aHeader := {}
Private aCols := {}
Private aRotina := {{"Pesquisar", "AxPesqui", 0, 1},;
                    {"Visualizar", "AxVisual", 0, 2},;
                    {"Incluir", "AxInclui", 0, 3},;
                    {"Alterar", "AxAltera", 0, 4},;
                    {"Excluir", "AxDeleta", 0, 5}}

				
DbSelectArea("SX3")
DbSetOrder(1)
DbSeek("SA2")

While !SX3->(Eof()) .and. SX3->X3_ARQUIVO == "SA2"

	If X3Uso(SX3->X3_USADO) .and. Alltrim(SX3->X3_CAMPO) $ " A2_COD / A2_LOJA / A2_NOME / A2_L_ADICI / A2_L_FIDEL / A2_L_EXTRA"  
		nUsado++        
		Aadd(aHeader,{Trim(X3Titulo()),;
		SX3->X3_CAMPO,;
		SX3->X3_PICTURE,;
		SX3->X3_TAMANHO,;
		SX3->X3_DECIMAL,;
		SX3->X3_VALID,;
		"",;
		SX3->X3_TIPO,;
		"",;
		"" })
	EndIf
	SX3->(DbSkip())
End
Aadd(aCols,Array(nUsado+1))

For nI := 1 To nUsado
    aCols[1][nI] := CriaVar(aHeader[nI][2])
Next
//aCols[1][nUsado+1] := .F.

aEdita := {"A2_L_ADICI","A2_L_FIDEL","A2_L_EXTRA"} //Campos editaveis na msgetdados

For nI:=1 to Len(aSize)
	aSize[nI] := aSize[nI] * 0.6
Next nI 

AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 100, .T., .T. } )
AAdd( aObjects, { 100, 015, .T., .F. } )
aInfo   := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
aPosObj := MsObjSize(aInfo,aObjects)

aSize[6] := aSize[6]*1.3


DEFINE MSDIALOG oDlg TITLE "Alteração Preço Negociado" FROM aSize[7],aSize[2] TO aSize[6],aSize[5] PIXEL


@ 01,01 SAY "Grupo: " FONT oFont1
@ 01,05 SAY ZL3->ZL3_COD FONT oFont2

@ 01,10 SAY "Descrição: " FONT oFont1
@ 01,16 SAY ZL3->ZL3_DESCRI  FONT oFont2

oGetDados := MsGetDados():New(aPosObj[2,1]*0.5,aPosObj[2,2],aPosObj[2,3]*1.2,aPosObj[2,4], 4,/*"Eval(bLinhaOK)"*/,/*"Eval(bTudoOK)"*/,/*campo incremento */,.F.,aEdita,,.F.,200,/*"Eval(bFildok)"*/,/*"Eval(bSuperDel)"*/,,/*"Eval(bDelOK)"*/,oDlg)

CriaTrab() //Carrega o aCols 
oGetDados:Refresh()

//@ 125, 020 BUTTON oButton2 PROMPT "Carregar" SIZE 048, 014 OF oDlg FONT oFont2 ACTION {|| CriaTrab(),oGetDados:Refresh()} PIXEL
@ aPosObj[2,3]*1.3, aPosObj[2,2]+20 BUTTON oButton2 PROMPT "Confirmar" SIZE 048, 014 OF oDlg FONT oFont2 ACTION {|| _lRet:=Salvar(),IIf(_lRet,oDlg:End(),)} PIXEL
@ aPosObj[2,3]*1.3, aPosObj[2,4]-50 BUTTON oButton1 PROMPT "Fechar" SIZE 048, 014 OF oDlg FONT oFont2 ACTION {|| oDlg:End()} PIXEL    
   

ACTIVATE MSDIALOG oDlg CENTERED

RestArea(aArea)

Return 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CriaTrab	 º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Preenche o aCols com os produtores do grupo de preço.         º±±
±±º          ³                                                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                               º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function CriaTrab()

Local _cAlias := GetNextAlias()
Local i := 0
Local _nFieldPos := 0
Local _nItem := 1


BeginSql alias _cAlias

	SELECT A2_COD, A2_LOJA, A2_NOME, A2_L_ADICI,A2_L_FIDEL, A2_L_EXTRA
	FROM %Table:SA2% A2 
	WHERE A2_L_LI_RO = %Exp:ZL3->ZL3_COD% AND A2_MSBLQL <> '1'
	AND A2.%NotDel% ORDER BY A2_NOME

EndSql

While !(_cAlias)->(Eof())

	//aadd(aCols,{(_cAlias)->A2_COD,(_cAlias)->A2_LOJA,(_cAlias)->A2_NOME,(_cAlias)->A2_L_ADICI,.f.})
	If _nItem > 1
		aAdd(aCols, aClone(aCols[_nItem-1])) //Cria linha a ser editada.
	EndIf
	For i := 1 to Len(aHeader)

		_nFieldPos := (_cAlias)->(FieldPos(aHeader[i][2]))
		If _nFieldPos > 0
			_nColPos := ascan(aHeader,{|x| ALLTRIM(x[2]) == Field(_nFieldPos)  })
			GDFieldPut((_cAlias)->(Field(_nFieldPos)), (_cAlias)->(FieldGet(_nFieldPos)), _nItem)
	
		EndIf      
	
	Next i

	_nItem++
	
	    
	(_cAlias)->(DbSkip())
EndDo

(_cAlias)->(DbCloseArea())

Return

//#######################################
// FUNCAO DE VALIDAÇÃO DO CAMPO DIGITADO
//#######################################
Static Function FIELDOK()

Local y := 0
Local _nQtd := 0
Local _lRet := .t.
Local _nQtdAtu := 0
Local _cAux := ""
Local _lErro := .f.

If Alltrim(ReadVar()) == "M->ZH3_QTDINI"
	_nQtdAtu := &(ReadVar()) //Le o conteudo da variavel posicionada
	If _nQtdAtu > 0
		For y := 1 To Len(aCols)
			If !aCols[y][3]
				If y <> n
					_lRet := CapaciSilo(aCols[y][1],aCols[y][2])
				    _nQtd += aCols[y][2]
				EndIf
			EndIf
		Next y
		
		If _lRet
			If _nQtd+_nQtdAtu > ZLD->ZLD_TOTBOM
				_lRet := .f.
				Alert("Quantidade digitada ultrapassa volume total do ticket!")
			EndIf
		
		EndIf
		
	Else
		_lRet := .f.
		Alert("Não é permitido valor zerado!")
	EndIf
Else
	_cAux := &(ReadVar()) //Le o conteudo da variavel posicionada
	For y := 1 To Len(aCols)
		If !aCols[y][3]
			If y <> n
				If _cAux == aCols[y][1]
					_lErro := .t.
				EndIf
			EndIf
		EndIf
	Next y
	
	If _lErro
		_lRet := .f.
		Alert("Silo já informado para este Ticket, ajuste apenas o volume!")
	EndIf
EndIf

Return _lRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ Salvar	 º Autor ³ TOTVS              º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Gravação dos dados alterados no cadastro do produtor         º±±
±±º          ³                                                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³                                                               º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Salvar()

Local y := 0
Local _nCont := 0
Local _nPosAdi := 0
Local _nPosFid := 0
Local _nPosExt := 0

//Return .t.
If MsgYesNo("Confirma gravação dos valores alterados no cadastro dos produtores?","Confirmação")

	_nPosAdi := ascan(aHeader,{|x| ALLTRIM(x[2]) == "A2_L_ADICI" })
	_nPosFid := ascan(aHeader,{|x| ALLTRIM(x[2]) == "A2_L_FIDEL" })
	_nPosExt := ascan(aHeader,{|x| ALLTRIM(x[2]) == "A2_L_EXTRA" })			

	For y := 1 to Len(aCols)
		DbSelectArea("SA2")
		SA2->(DbSetOrder(1))
		If SA2->(DbSeek(xFilial("SA2")+aCols[y][1]+aCols[y][2]))
			
			If (SA2->A2_L_ADICI <> aCols[y][_nPosAdi]) .or. (SA2->A2_L_FIDEL <> aCols[y][_nPosFid]) .or. (SA2->A2_L_EXTRA <> aCols[y][_nPosExt])
				_nCont++
			EndIf

			RecLock("SA2",.F.)
			If SA2->A2_L_ADICI <> aCols[y][_nPosAdi]
				SA2->A2_L_BKPAD := SA2->A2_L_ADICI
				SA2->A2_L_ADICI := aCols[y][_nPosAdi]
			EndIf

			If SA2->A2_L_FIDEL <> aCols[y][_nPosFid]
				SA2->A2_L_FIDEL := aCols[y][_nPosFid]
			EndIf
		
			If SA2->A2_L_EXTRA <> aCols[y][_nPosExt]
				SA2->A2_L_EXTRA := aCols[y][_nPosExt]
			EndIf
			MsUnLock()
		EndIf
	Next y
EndIf

If _nCont > 0
	MsgInfo("Alteração concluída! "+cValToChar(_nCont)+" registro(s) alterado(s)!","Confirmação")
EndIf


Return


/*
//#############################
Static Function LINHAOK()

Alert("LINHAOK")

Return .T. 

//#############################
Static Function TUDOOK()

ApMsgStop("TUDOOK")

Return .T. 

//#############################
Static Function DELOK()

ApMsgStop("DELOK")
Return .T. 

//#############################
Static Function SUPERDEL()

ApMsgStop("SUPERDEL")
Return .T. 
*/