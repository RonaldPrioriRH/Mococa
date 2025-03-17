#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "COLORS.ch"

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT020     � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Tela de Mix - Lista os setores,linhas e produtores e seus respectivos valores           						���
���          � Possibilita lancamento,alteracao,exclusao de valores de eventos 												���
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
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

User Function AGLT020(ntipo)

Local nAux       := 0

Private aAux1    := {}
Private aAux2    := {}
Private aAux3    := {}
Private xvisual	 := .F.
Private cVersao  := "1"
Private cFilIni  := "000000"
Private cFilFim  := "ZZZZZZ"
Private cSetIni  := "000000"
Private cSetFim  := "ZZZZZZ"
Private cLinIni  := "000000"
Private cLinFim  := "ZZZZZZ"
Private cPrdIni  := "000000"
Private cPrdFim  := "ZZZZZZ"
Private aOrdem   := {}
Private aBrowse1 := {}
Private aBrowse2 := {}
Private aBrowse3 := {}
Private aBrowse4 := {}
Private aTitulo1 := {}
Private aTitulo2 := {}
Private aTitulo3 := {}
Private aTitulo4 := {}
Private aTam1    := {}
Private aTam2    := {}
Private aTam3    := {}
Private aTam4    := {}
Private aStruct  := {}
Private aStruct2 := {}
Private aStruct3 := {}
Private aStruct4 := {}
Private aSetCmps := {} // campos dinamicos dos setores
Private aLinCmps := {} // campos dinamicos das linhas
Private aPrdCmps := {} // campos dinamicos dos produtores
Private aSize    := MsAdvSize()
Private nTotVol	 := 0
Private nTotLtr	 := 0
Private nTotVlr	 := 0
Private nSubTot	 := 0
Private cArqTRS
Private cArqTRL
Private cArqTRP
Private cArqTRF
Private cInd1TRS
Private cInd1TRL
Private cInd1TRP
Private cInd1TRF
Private oDlg1
Private oDlg2
Private oDlg3
Private npper
Private grouplin := .F. // agrupa linha
Private ShowLtr  := .T. // mostra em valor por litro
Private lSomaFrt := GetMv("LT_SOMAFRT")
Private _nRound := 4 //Arredondamento do pre�o
/*
//��������������������������������������������������������������Ŀ
//�O parametro LT_EVELTR armazenara o valor do frete pago        �
//�via bonificacao, pois este valor nao podera compor o custo do �
//�leite.                                                        �
//����������������������������������������������������������������
*/
Private cEvetFrt := IIF(!Empty(GetMv("LT_EVELTR")),AllTrim(GetMv("LT_EVELTR")),Space(3))  //Codigo do Evento de Frete
Private cEvetFal := "  " //AllTrim(GetMv("LT_EVEFALT")) //Codigo do Evento de Falta de Leite
Private cEvetInc := IIF(!Empty(GetMv("LT_EVEINCE")),AllTrim(GetMv("LT_EVEINCE")),Space(3)) //Codigo do Evento de Incentivo(ICMS)
Private cEvetAdc := IIF(!Empty(GetMv("LT_EVEADIC")),AllTrim(GetMv("LT_EVEADIC")),Space(3)) //Codigo do Evento de Adicional de Mercado
Private cCodBonIf:= "000000" //GetMv("LT_CODBON")  //Codigo do evento de Bonificacao
Private cCodINSS := IIF(!Empty(GetMv("LT_EVEINSS")),AllTrim(GetMv("LT_EVEINSS")),Space(3)) //Codigo do evento de INSS (Funrural)
Private cCodFUND := "  " // GetMv("LT_EVEFUND") //Codigo do evento de Fundepec
Private cFilSet  := "  " // filtro dos setores
Private cFileName:= "  "
Private cPerg1   := "AGLT020A  "
Private cPerg2   := "AGLT020B  "

Private oFonTm1

DEFINE FONT oFonTm1 NAME "Tahoma" BOLD

Private oFont9N	 := TFont():New("Courier New",18,9 ,.T.,.F.,10,.T.,10,.T.,.F.)
Private oFont8N	 := TFont():New("Courier New",18,9 ,.T.,.F.,8,.T.,8,.T.,.F.)
Private aObjects := {}
Private aInfo    := {}
Private aArrFon  := {}
Private aDados   := {}
Private aDados2  := {}
Private aGer	 := {}
Private aDet	 := {}
Private aGer	 := {}
Private dt1      := STOD(Substr(DTOS(ddatabase),1,6)+"01")
Private dt2      := LastDay(dt1)
Private agrupa   := .T.
Private NumMix   := ""
Private TPMIX    := ""
Private cEx1     := ""
Private cEx2     := ""

If Empty(cCodBonif)
	xMagHelpFis("Parametro LT_CODBON","Parametro LT_CODBON nao esta preenchido!","Preencha o parametro com o codigo da Bonificacao de Leite.")
	cCodBonIf := "000000"
EndIf

//���������������������������������������������������������������������Ŀ
//� Obtem tamanhos das telas                                            �
//�����������������������������������������������������������������������
AAdd( aObjects, { 0, 0, .T., .T., .T. } )

aInfo    := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
aPosObj1 := MsObjSize( aInfo, aObjects,  , .T. )

Public _pnVLEITE := 0
//���������������������������������������������������������������������Ŀ
//� Exige do usuario ser o tema versao 10                               �
//�����������������������������������������������������������������������
If "P10" $ oApp:cVersion
	If (AllTrim(GetTheme()) == "FLAT") .Or. SetMdiChild()
		lFlat := .T.
		nOffSet := 7
	Else
		xMagHelpFis("Mensagem","Tema n�o homologado para o Mix do Leite ","Use o tema TEMAP10 ( Em: Miscelanea - Configura��o Tema ) ")
		Return
	EndIf
EndIf


//���������������������������������������������������������������������Ŀ
//� Verfica o tipo de tratamento                                        �
//� 1-Inclusao                                                          �
//� 2-Manutencao                                                        �
//� 5-Exclusao do Fechamento                                            �
//�10-Visualizacao                                                      �
//�����������������������������������������������������������������������

// Seta visualizacao como falso.
xVisual := .F.

If ntipo = 1                                // Trata Inclusao do Mix
	//���������������������������������������������������������������������Ŀ
	//� Chama tela de inclusao                                              �
	//�����������������������������������������������������������������������
	GltInc(ntipo,agrupa,NumMix)
	
ElseIf ntipo = 10
	//���������������������������������������������������������������������Ŀ
	//� Visualizacao da Tela de Setores (nao permite alteracoes)            �
	//�����������������������������������������������������������������������
	xVisual := .T.
	
	NumMix := ZLE->ZLE_COD
	ShowLtr :=.T.
	/*
	Comentado por TOTVS   em 24/06/09
	Motivo: Adicionei botao "Totais" que mostra os valores totais por Evento.
	If MsgYesNo("Mostrar valores por litro?")
	ShowLtr :=.T.
	Else
	ShowLtr := .F.
	EndIf
	*/
	
	NumMix := ZLE->ZLE_COD
	dt1    := ZLE->ZLE_DTINI             // Periodo inicial do Mix
	dt2    := ZLE->ZLE_DTFIM             // Periodo final do Mix
	npper  := dtoc(dt1)+" a "+ dtoc(dt2) // Barra de Titulo
	cVersao:= ZLE->ZLE_VERSAO
	// Quando a variavel cVersao estiver em branco
	// Entao serao obtidos os valores totais do Mix
	// Ou seja, a somatoria de totas as versoes.
	
	
	TpMIX  := "M"
	ShowSetores(agrupa,ntipo,NumMix)
	
ElseIf ntipo = 2
	
	//���������������������������������������������������������������������Ŀ
	//� Manutencao do Mix - Permite geracao de eventos                      �
	//�����������������������������������������������������������������������
	
	If ZLE->ZLE_STATUS == "F"
		xmaghelpfix("Atencao","O Mix atual est� Fechado e nao pode ser modificado!","Cancele o Fechamento realizado para alterar ou clique na opcao visualizar para apenas ver o Mix!")
		Return
	EndIf
	
	NumMix := ZLE->ZLE_COD
	ShowLtr :=.T.
	/*  Comentado por TOTVS   em 24/06/09
	Motivo: Adicionei botao "Totais" que mostra os valores totais por Evento.
	If MsgYesNo("Mostrar valores por litro?")
	ShowLtr :=.T.
	Else
	ShowLtr := .F.
	EndIf
	*/
	
	NumMix := ZLE->ZLE_COD
	dt1    := ZLE->ZLE_DTINI             // Periodo inicial do Mix
	dt2    := ZLE->ZLE_DTFIM             // Periodo final do Mix
	npper  := DTOC(dt1)+" a "+ DTOC(dt2) // Variavel que mostra na tela o periodo do mix atual

	//Atualiza ZLD_GRPRC com o valor gravado em A2_L_LI_RO para que fique alinhado com a �ltima altera��o de roda e n�o gere diverg�ncias no MIX
    AtualizaGrupo(dt1,dt2)

	
	//Deleta registros da ZLF para produtores que est�o com volume zerado.
	LimpaZLF(dt1,dt2)

	cVersao:= ZLE->ZLE_VERSAO
	ShowSetores(agrupa,ntipo,NumMix)     // Chama tela de setores
	
ElseIf ntipo = 5
	
	If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_CANCEL") != "S"
		xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
		Return
	EndIf
	
	
	//���������������������������������������������������������������������Ŀ
	//� Exclusao do Mix                                                     �
	//�����������������������������������������������������������������������
	NumMix := ZLE->ZLE_COD
	cVersao:= ZLE->ZLE_VERSAO
	
	//���������������������������������������������������������������������Ŀ
	//� Verifica se nao existem fechamentos realizados                      �
	//�����������������������������������������������������������������������
	bAux   := .F.
	cQuery := "SELECT COUNT(*) AS QTDREG FROM " + RetSqlName("ZLF") + " ZLF "
	cQuery += " WHERE ZLF_FILIAL = '"+xFilial("ZLF")+"' AND D_E_L_E_T_ = ' '"
	cQuery += " AND ZLF_CODZLE = '"+NumMix+"' "
	cQuery += " AND ZLF_VERSAO = '"+cVersao+"' "
	cQuery += " AND ZLF_ACERTO = 'S'"
	If Select("TRAB1") <> 0
		TRAB1->(dbCloseArea("TRAB1"))
	EndIf
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRAB1", .T., .F. )
	If !TRAB1->(Eof())
		If TRAB1->QTDREG > 0
			bAux:=.T.
		EndIf
	EndIf
	TRAB1->(dbCloseArea())
	If bAux
		xMagHelpFis("MIX","Nao foi possivel excluir o Mix por existirem Fechamentos realizados!","Cancele primeiramente os fechamentos referentes a esse Mix!")
		Return
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Verifica se existe Mix versao 2(Complemento) para este MIX.         �
	//�����������������������������������������������������������������������
	dbSelectArea("ZLF")
	dbSetOrder(1)
	dbSeek(xFilial("ZLF")+ZLE->ZLE_COD+SOMA1(cVersao),.T.)
	If ZLF->ZLF_VERSAO >= SOMA1(cVersao)
		xMagHelpFis("MIX","Nao foi possivel excluir o Mix. Existe Complemento de Pre�o para o mesmo!","Exclua o Complemento Pre�o antes de excluir o MIX.")
		Return
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Apaga ZLE e ZLF                                                     �
	//�����������������������������������������������������������������������
	If MsgYesNo("Confirma realmente a exclus�o do Mix "+NumMix + " Versao "+cVersao+" ? ")
		If !MsgYesNo("Essa operacao ir� excluir todos os Eventos gerados para esse Mix! Continuar assim mesmo?")
			Return
		EndIf
		
		DbSelectArea("ZLE")
		DbSetOrder(1)
		IF ZLE->(DbSeek(xFilial("ZLE")+NumMix))
			RecLock("ZLE",.F.)
			ZLE->(DbDelete())
			MsUnLock()

			DbSelectArea("ZLF")
			ZLF->(DbSetOrder(1))
			If ZLF->(DbSeek(xFilial("ZLF")+NumMix))
				While !ZLF->(Eof()) .and. (ZLF->ZLF_FILIAL == xFilial("ZLF") .and. ZLF->ZLF_CODZLE ==  NumMix)
					RecLock("ZLF",.F.)
					ZLF->(DbDelete())
					MsUnLock()
					
					ZLF->(DbSkip())
				EndDo
			EndIf
		EndIf
		/* Alterado para senten�a acima pois n�o estava funcionando no banco Oracle.
		cEx1 := "DELETE "
		cEx1 += "FROM "
		cEx1 += RetSqlName("ZLE") + " "
		cEx1 += "WHERE"
		cEx1 += " ZLE_FILIAL = '" + xFilial("ZLE") 	+ "'"
		cEx1 += " ZLE_COD = '"         + NumMix  + "'"
		cEx1 += " AND ZLE_VERSAO = '"  + cVersao + "'"
		cEx1 += " AND D_E_L_E_T_ = ' '"
		lSqlOk := !(TcSqlExec(cEx1) < 0)
		
		If lSqlOk
			cEx2 := "DELETE "
			cEx2 += "FROM "
			cEx2 += RetSqlName("ZLF") + " "
			cEx2 += "WHERE"
			cEx2 += " ZLF_FILIAL = '" + xFilial("ZLF") 	+ "' "
			cEx2 += " ZLF_CODZLE = '"       + NumMix  + "'"
			cEx2 += " AND ZLF_VERSAO = '"   + cVersao + "'"
			cEx2 += " AND D_E_L_E_T_ = ' '"
	
			lSqlOk := !(TcSqlExec(cEx2) < 0)
		EndIf
		
		If lSqlOk .and.  (TcGetDB() == 'ORACLE')
			lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
		EndIf
		*/
		
	EndIf
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �ShowSetores  � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � MOSTRA SETORES                                                                       						���
���          �                                 							                               						���
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
Static Function ShowSetores(agrupa,ntipo,NumMix)

Local oOK     := LoadBitmap(GetResources(),'LBOK')
Local xtitulo := "Mix do Leite - Setores - Periodo de "+npper

//���������������������������������������������������������������������Ŀ
//� Cria tabela temporaria TRS - Setores                                �
//�����������������������������������������������������������������������
CriaTmp("TRS",agrupa,.F.)

//���������������������������������������������������������������������Ŀ
//� Grava dados na Tabela temporaria a partir da tabela ZLF             �
//�����������������������������������������������������������������������
Processa ( {|| GravaTmp("TRS",.T.,ntipo) })

//���������������������������������������������������������������������Ŀ
//� Cria estrutura da Tabela Temporaria (Eventos viram colunas)         �
//�����������������������������������������������������������������������
CfgBrowse("TRS",agrupa)

dbSelectArea("TRS")
dbGoTop()
aAdd(aOrdem,"Filial")


//���������������������������������������������������������������������Ŀ
//� Cria Browse dos Setores                                           	�
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlg1 FROM  00,00 TO aSize[6],aSize[5] TITLE xtitulo PIXEL OF oMainWnd
oBrowse1 := VCBrowse():New(00,00,aPosObj1[1,3],(aPosObj1[1,4]),,,,oDlg1,,,,,, , , , , , , , ,.T.)
oBrowse1 := oBrowse1:GetBrowse()
oBrowse1:lLineDrag	:= .T.

For i:=1 To Len(aBrowse1)
	oCol1 := TCColumn():New( OemToAnsi(aTitulo1[i,1]), &("{ || "+aBrowse1[i,1]+"}"),aBrowse1[i,3],,,if(aBrowse1[i,2]=="N","RIGHT","LEFT"),aTam1[i], .F., .F.,,,, .F.,, )
	oBrowse1:AddColumn(oCol1)
Next i

oBrowse1:BLDBLCLICK := { || ShowLinhas(TRS->TRS_FILIAL,TRS->TRS_COD,ntipo,NumMix)  }
@ (aPosObj1[1,4]+5),005 Button OemToAnsi("Abrir Setor") Size 50,10 Action Processa({|| ShowLinhas(TRS->TRS_FILIAL,TRS->TRS_COD,ntipo,NumMix) }) OF oDlg1 PIXEL
@ (aPosObj1[1,4]+5),060 Button OemToAnsi("Gr�fico") Size 50,10 Action MontaGrf("TRS",aTitulo1) OF oDlg1 PIXEL
@ (aPosObj1[1,4]+5),115 Button OemToAnsi("Exportar") Size 50,10 Action Export("TRS",aTitulo1) OF oDlg1 PIXEL
@ (aPosObj1[1,4]+5),170 Button OemToAnsi("Imprimir") Size 50,10 Action U_RGLT027("TRS",aTitulo1,ShowLtr,xtitulo) OF oDlg1 PIXEL
@ (aPosObj1[1,4]+5),225 Button OemToAnsi("Totais") Size 50,10 Action ShowVals("TRS",agrupa) OF oDlg1 PIXEL
@ (aPosObj1[1,4]+5),280 Button OemToAnsi("Fechar") Size 50,10 Action close(oDlg1) OF oDlg1 PIXEL
ACTIVATE MSDIALOG oDlg1 Centered


//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria caso exista                               �
//�����������������������������������������������������������������������
If Select("TRS") <> 0
	FechaTab("TRS")
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �GetTotGp     � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Retorna total de movimentos na ZLF de determinado evento                                						���
���          � ATENCAO: ESSA ROTINA E' UTILIZADA EM VARIOS RELATORIOS			                							���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cpfilial,cpCod,cpSetor,cpLinha,cpProdutor                                                						���
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
User Function GetTotGp(cpfilial,cpCod,cpSetor,cpLinha,cpProdutor,cpLj,cpNumMix,cpEntMix,cpVersao,cTpMix)

Local cArea  := GetArea()
Local valret := 0 
Local cEvetFrt := AllTrim(GetMv("LT_EVELTR"))  //Codigo do Evento de Frete
Local cEvetFal := "" //AllTrim(GetMv("LT_EVEFALT")) //Codigo do Evento de Falta de Leite

//���������������������������������������������������������������������Ŀ
//� Obtendo grupos de eventos                                           �
//�����������������������������������������������������������������������
cQuery := "SELECT * FROM " + RetSqlName("ZL8") + " ZL8 "
cQuery += " WHERE D_E_L_E_T_ = ' '"

//��������������������������������������������������������������Ŀ
//� A tabela de eventos sera compartilha por este motivo que o   �
//� fonte abaixo foi comentado.                                  �
//����������������������������������������������������������������
/*
If !Empty(cpFilial)
cQuery += " AND ZL8_FILIAL ='"+cpFilial+"'"
EndIf
*/
If !Empty(cpEntMix)
	cQuery += " AND ZL8_MIX = '"+cpEntMix+"'"
EndIf
cQuery += " AND ZL8_GRUPO = '"+cpCod+"'"
cQuery += " ORDER BY ZL8_COD"

If Select("TR8") <> 0
	TR8->(dbCloseArea("TR8"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TR8", .T., .F. )

While !TR8->(Eof())
	//Se Codigo do Evento eh diferente de Frete e diferente de Falta de leite soma ao total do grupo
	If TR8->ZL8_COD <> cEvetFrt .And. TR8->ZL8_COD <> cEvetFal
		//���������������������������������������������������������������������Ŀ
		//� Obtendo movimentos na ZLF do grupo corrente                         �
		//�����������������������������������������������������������������������
		cQuery := "SELECT SUM(CASE WHEN ZLF_DEBCRE='C' THEN ZLF_TOTAL Else 0 END) as CREDITO, "
		cQuery += " SUM(CASE WHEN ZLF_DEBCRE='D' THEN ZLF_TOTAL Else 0 END) as DEBITO "
		cQuery += " FROM " + RetSqlName("ZLF") + " ZLF "
		cQuery += " WHERE "
		cQuery += "  ZLF_EVENTO = '"+TR8->ZL8_COD+"'"
		If !Empty(AllTrim(cpFilial))
			cQuery += " AND ZLF_FILIAL = '"+cpFilial+"'"
		EndIf
		If !Empty(AllTrim(cpSetor))
			cQuery += " AND ZLF_SETOR = '"+cpSetor+"'"
		EndIf
		If !Empty(AllTrim(cpLinha))
			cQuery += " AND ZLF_LINROT = '"+cpLinha+"'"
		EndIf
		If !Empty(AllTrim(cpProdutor))
			cQuery += " AND ZLF_RETIRO = '"+cpProdutor+"'"
		EndIf
		If !Empty(AllTrim(cpLj))
			cQuery += " AND ZLF_RETILJ = '"+cpLj+"'"
		EndIf
		If !Empty(AllTrim(cpVersao))
			cQuery += " AND ZLF_VERSAO = '"+cpVersao+"'"
		EndIf
		If !Empty(AllTrim(cTpMix))
			cQuery += " AND ZLF_TP_MIX = '"+cTpMix+"'"
		EndIf
		cQuery += " AND ZLF_CODZLE = '" + cpNumMix + "'"
		If Select("TRF") <> 0
			TRF->(dbCloseArea("TRF"))
		EndIf
		cQuery += " AND D_E_L_E_T_ = ' ' "
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRF", .T., .F. )
		While !TRF->(Eof())
			valret += TRF->CREDITO
			valret -= TRF->DEBITO
			TRF->(dbSkip())
		EndDo
		TRF->(dbCloseArea())
	EndIf
	TR8->(dbSkip())
EndDo
TR8->(dbCloseArea())

RestArea(cArea)
Return valret

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �GetTotEv     � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Retorna total de movimentos na ZLF de determinado evento                                						���
���          � ATENCAO: ESSA ROTINA E' UTILIZADA EM VARIOS RELATORIOS			                							���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cpfilial,cpCod,cpSetor,cpLinha,cpProdutor                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/

User Function GetTotEv(cpfilial,cpCod,cpSetor,cpLinha,cpProdutor,cpLj,cpNumMix,cpVersao,cTpMix)

Local cArea  := GetArea()
Local valret := 0

//���������������������������������������������������������������������Ŀ
//� Obtendo valores do evento                                           �
//�����������������������������������������������������������������������
cQuery := "SELECT SUM(ZLF_TOTAL) as TOTAL FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL = '"+cpFilial+"'"
cQuery += " AND ZLF_EVENTO = '"+cpCod+"'"
If !Empty(cpSetor)
	cQuery += " AND ZLF_SETOR = '"+cpSetor+"'"
EndIf
If !Empty(cpLinha)
	cQuery += " AND ZLF_LINROT = '"+cpLinha+"'"
EndIf
If !Empty(cpProdutor)
	cQuery += " AND ZLF_RETIRO = '"+cpProdutor+"'"
EndIf
If !Empty(cpLj)
	cQuery += " AND ZLF_RETILJ = '"+cpLj+"'"
EndIf
If !Empty(cpVersao)
	cQuery += " AND ZLF_VERSAO = '"+cpVersao+"'"
EndIf
If !Empty(cTpMix)
	cQuery += " AND ZLF_TP_MIX = '"+cTpMix+"'"
EndIf
cQuery += " AND ZLF_CODZLE = '"+cpNumMix+"' "
cQuery += " AND D_E_L_E_T_ = ' ' "
If Select("TRF") <> 0
	TRF->(dbCloseArea("TRF"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRF", .T., .F. )
While !TRF->(Eof())
	valret += TRF->TOTAL
	TRF->(dbSkip())
EndDo
TRF->(dbCloseArea())

//���������������������������������������������������������������������Ŀ
//� Se o evento For de debito converte em negativo                      �
//�����������������������������������������������������������������������
If Posicione("ZL8",1,xFilial("ZL8") + cpCod,"ZL8_DEBCRE")=="D"
	valret := valret*-1
EndIf

RestArea(cArea)

Return valret

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �ShowMix      � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Retorna Eventos por Grupo                                                            						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cCodGrupo                                                                             						���
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

Static Function ShowMix(cCodGrupo)
Local cArea :=  GetArea()
Local bret  := .F.

//���������������������������������������������������������������������Ŀ
//� Verifica se existe algum evento desse grupo que entra no MIX        �
//�����������������������������������������������������������������������
cQuery := "SELECT * FROM " + RetSqlName("ZL8") + " ZL8 "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZL8_GRUPO = '"+cCodGrupo+"'"
cQuery += " AND ZL8_MIX = 'S'"
If Select("TR8") <> 0
	TR8->(dbCloseArea("TR8"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TR8", .T., .F. )
If !TR8->(Eof())
	bret := .T.
EndIf
TR8->(dbCloseArea("TR8"))

RestArea(cArea)
Return bret
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �CriaTmp      � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Cria tabelas temporarias                                                             						���
���          � TRS-setores TRL-linhas TRP-produtores TRF-Fretistas   	                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cTab,cAgrupa                                                                          						���
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
Static Function CriaTmp(cTab,cAgrupa,lCols)

Local _cIndicPro:= ""

Local nTamFil   := TamSx3("ZL2_FILIAL")[1]//Verifica se o campo filial tem tamanho dois ou quatro
Local nTamLoj   := TamSx3("A2_LOJA")[1]//Verifica se o campo loja tem tamanho dois ou quatro
Local _cFiltro := " .T. "
aStruct  := {}
aStruct2 := {}
aStruct3 := {}
aStruct4 := {}

//���������������������������������������������������������������������Ŀ
//� Criando estrutura da tabela temporaria das unidades                 �
//�����������������������������������������������������������������������
AAdd(aStruct,{cTab+"_FILIAL"  ,"C",nTamFil})
AAdd(aStruct,{cTab+"_COD"     ,"C",6})
If cTab=="TRP" .or. cTab=="TRF"
	AAdd(aStruct,{cTab+"_LOJA"     ,"C",nTamLoj})
EndIf
AAdd(aStruct,{cTab+"_DESCRI"  ,"C",25})   //NOME
AAdd(aStruct,{cTab+"_VOL"     ,"N",11,0}) //VOLUME
AAdd(aStruct,{cTab+"_POR"     ,"N",6,2})  // %
AAdd(aStruct,{cTab+"_TOTLTR"  ,"N",15,_nRound}) // TOTAL POR LITRO (Valor Liquido)
AAdd(aStruct,{cTab+"_TOTVLR"  ,"N",14,2}) // TOTAL DO VALOR GERAL (Total Geral)
If cTab <> "TRF"
	AAdd(aStruct,{cTab+"_TOTBAS"  ,"N",15,6}) // TOTAL BASE POR LITRO (MIX Atual)
EndIf
If cTab=="TRP" .And. !cAgrupa
	//AAdd(aStruct,{cTab+"_TOTLIQ"  ,"N",14,4}) // TOTAL LIQUIDO - impostos
	//AAdd(aStruct,{cTab+"_ULTBON"  ,"N",15,6}) // ULTIMA BONIFICACAO
EndIf

//���������������������������������������������������������������������Ŀ
//� Criando colunas a partir dos eventos - Agrupado ou Nao Agrupado     �
//� Se nao For agrupado em modo de visualizacao pega colunas da ZLF     �
//�����������������������������������������������������������������������
If cAgrupa
	dbSelectArea("ZL7")
	dbSetOrder(1)
	dbGoTop()
	While (!Eof())
		If ShowMix(ZL7_COD)  // mostra no mix?
			AAdd(aStruct,{cTab+"_"+ZL7->ZL7_COD,"N",15,6})
			AAdd(aStruct2,{cTab+"_"+ZL7->ZL7_COD,"N",15,6,ZL7_COD,ZL7_NREDUZ}) // usado para diferenciar as colunas criadas dinamicamente
			AAdd(aStruct3,{ZL7_NREDUZ})
			AAdd(aStruct4,{ZL7_COD})
		EndIf
		dbSkip()
	EndDo
	dbCloseArea("ZL7")
Else
	If xvisual
		cQuery := " SELECT ZLF_EVENTO FROM " + RetSqlName("ZLF") + " ZLF "
		cQuery += " WHERE "
		cQuery += " ZLF_FILIAL = '"+xFilial("ZLF")+"' "
		cQuery += " AND ZLF_CODZLE = '"+NumMix+"' "
		cQuery += " AND ZLF_ENTMIX = 'S' AND D_E_L_E_T_ = ' ' "
		cQuery += " GROUP BY ZLF_EVENTO ORDER BY ZLF_EVENTO"
		If Select("TMP") <> 0
			TMP->(dbCloseArea("TMP"))
		EndIf
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP", .T., .F. )
		While TMP->(!Eof())
			//Tratamento para nao criar a coluna Frete e Falta de Leite para o produtor, so pra linha ou setor
			If cTab=="TRP"
				If TMP->ZLF_EVENTO <> cEvetFrt .And. TMP->ZLF_EVENTO <> cEvetFal
					cAux:=Posicione("ZL8",1,xFilial("ZL8") + TMP->ZLF_EVENTO,"ZL8_NREDUZ")
					AAdd(aStruct,{cTab+"_"+TMP->ZLF_EVENTO,"N",15,6})
					AAdd(aStruct2,{cTab+"_"+TMP->ZLF_EVENTO,"N",15,6,TMP->ZLF_EVENTO,AllTrim(cAux)}) // usado para diferenciar as colunas criadas dinamicamente
					//AAdd(aStruct3,{Posicione("ZL8",1,xFilial(cFilIni)+TMP->ZLF_EVENTO,"ZL8_NREDUZ")})
					AAdd(aStruct3,{cAux})
					AAdd(aStruct4,{TMP->ZLF_EVENTO})
				EndIf
			Else
				cAux:=Posicione("ZL8",1,xFilial("ZL8")+TMP->ZLF_EVENTO,"ZL8_NREDUZ")
				AAdd(aStruct,{cTab+"_"+TMP->ZLF_EVENTO,"N",15,6})
				AAdd(aStruct2,{cTab+"_"+TMP->ZLF_EVENTO,"N",15,6,TMP->ZLF_EVENTO,AllTrim(cAux)}) // usado para diferenciar as colunas criadas dinamicamente
				//AAdd(aStruct3,{Posicione("ZL8",1,xFilial(cFilIni)+TMP->ZLF_EVENTO,"ZL8_NREDUZ")})
				AAdd(aStruct3,{cAux})
				AAdd(aStruct4,{TMP->ZLF_EVENTO})
			EndIf
			TMP->(dbSkip())
		EndDo
		TMP->(dbCloseArea())
	Else
		dbSelectArea("ZL8")
		dbSetOrder(1)
		dbGoTop()
		//dbSeek(cFilIni)
		While (!Eof())//.And.cFilIni==ZL8->ZL8_FILIAL
			//Adiciona filtra que verifica se o evento � usado na filial corrente
			If FieldPos("ZL8_FILUSA") > 0 .and. !Empty(ZL8->ZL8_FILUSA)
			 	_cFiltro := " cFilAnt $ Alltrim(ZL8->ZL8_FILUSA) "
			Else
				_cFiltro := " .T. "
			EndIf

			//Tratamento para nao criar a coluna Frete e Falta de Leite para o produtor, so pra linha ou setor
			If cTab=="TRP" .and. ZL8->ZL8_MSBLQL <> "1"
				If ZL8->ZL8_COD <> cEvetFrt .And. ZL8->ZL8_COD <> cEvetFal  .and. &_cFiltro
					If ZL8->ZL8_MIX == "S" //.And. ZL8_FILIAL == cFilIni
						If (ZL8_PERTEN == 'G' .And. cTab == 'TRF') .or. cTab != 'TRF'
							AAdd(aStruct,{cTab+"_"+ZL8->ZL8_COD,"N",15,6})
							AAdd(aStruct2,{cTab+"_"+ZL8->ZL8_COD,"N",15,6,ZL8_COD,ZL8_NREDUZ}) // usado para diferenciar as colunas criadas dinamicamente
							AAdd(aStruct3,{ZL8_NREDUZ})
							AAdd(aStruct4,{ZL8_COD})
						EndIf
					EndIf
				EndIf
			Else
				If ZL8->ZL8_MIX == "S" .and. ZL8->ZL8_MSBLQL <> "1"  .and. &_cFiltro //.And. ZL8_FILIAL == cFilIni
					If (ZL8_PERTEN == 'G' .And. cTab == 'TRF') .or. cTab != 'TRF'
						AAdd(aStruct,{cTab+"_"+ZL8->ZL8_COD,"N",15,6})
						AAdd(aStruct2,{cTab+"_"+ZL8->ZL8_COD,"N",15,6,ZL8_COD,ZL8_NREDUZ}) // usado para diferenciar as colunas criadas dinamicamente
						AAdd(aStruct3,{ZL8_NREDUZ})
						AAdd(aStruct4,{ZL8_COD})
					EndIf
				EndIf
			EndIf
			dbSkip()
		EndDo
		dbCloseArea("ZL8")
	EndIf
EndIf

//���������������������������������������������������������������������Ŀ
//� Criando coluna de Status                                            �
//�����������������������������������������������������������������������
AAdd(aStruct,{cTab+"_STATUS"  ,"C",20})

//���������������������������������������������������������������������Ŀ
//� Tela que valida as colunas a serem visualizadas                     �
//�����������������������������������������������������������������������
//If lCols
//ShowCols()
//EndIf

//���������������������������������������������������������������������Ŀ
//� Criando tabela temporaria a partir da estrutura definida.           �
//�����������������������������������������������������������������������
If Select(cTab) == 0
	
	If cTab == "TRS"
		cArqTRS := CriaTrab(aStruct,.T.)
		dbUseArea(.T.,,cArqTRS,cTab,.F.,.F.)
		cInd1TRS := CriaTrab(Nil,.F.)
		IndRegua(cTab,cInd1TRS,cTab+"_DESCRI",,,)
		dbClearIndex()
		dbSetIndex(cInd1TRS+OrdBagExt())
		aSetCmps := aStruct2
	EndIf
	
	If cTab == "TRL"
		_cIndicPro:= "TRL_FILIAL+TRL_DESCRI"//CODIGO + LOJA DO PRODUTOR	
		cArqTRL := CriaTrab(aStruct,.T.)
		dbUseArea(.T.,,cArqTRL,cTab,.F.,.F.)
		cInd1TRL := CriaTrab(Nil,.F.)
		IndRegua(cTab,cInd1TRL,_cIndicPro,,,)
		dbClearIndex()
		dbSetIndex(cInd1TRL+OrdBagExt())
		aLinCmps := aStruct2
	EndIf
	
	If cTab == "TRP"
		
		_cIndicPro:= "TRP_FILIAL+TRP_DESCRI+TRP_COD + TRP_LOJA"//CODIGO + LOJA DO PRODUTOR
		
		cArqTRP := CriaTrab(aStruct,.T.)
		dbUseArea(.T.,,cArqTRP,cTab,.F.,.F.)
		cInd1TRP := CriaTrab(Nil,.F.)
		//IndRegua(cTab,cInd1TRP,cTab+"_FILIAL",,,)
		IndRegua(cTab,cInd1TRP,_cIndicPro,,,)
		dbClearIndex()
		dbSetIndex(cInd1TRP+OrdBagExt())
		aPrdCmps := aStruct2
	EndIf
	
	If cTab == "TRF"
		cArqTRF := CriaTrab(aStruct,.T.)
		dbUseArea(.T.,,cArqTRF,cTab,.F.,.F.)
		cInd1TRF := CriaTrab(Nil,.F.)
		IndRegua(cTab,cInd1TRF,cTab+"_FILIAL",,,)
		dbClearIndex()
		dbSetIndex(cInd1TRF+OrdBagExt())
	EndIf
	
EndIf
Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �CfgBrowse    � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Cria Estrutura do Browse                                                             						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cTab,cAgrupa                  	                                                        						���
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
Static Function CfgBrowse(cTab,cAgrupa)

Local lfind := .F.
aAux1 := {}
aAux2 := {}
aAux3 := {}

//���������������������������������������������������������������������Ŀ
//� Definindo Estrutura do Browse e Titulos                             �
//�����������������������������������������������������������������������
For t:=1 To Len(aStruct)
	lfind:=.F.
	For u:=1 To Len(aStruct2)
		If aStruct[t,1]== aStruct2[u,1]
			If ShowLtr
				aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999.9999","")})
			Else
				aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999,999,999.99","")})
			EndIf
			aAdd(aAux2,{aStruct2[u,6]})
			lfind := .T.
		EndIf
	Next u
	If !lfind
		
		//Define a mascara do volume sem virgula
		If aStruct[t,1] == cTab+"_VOL"
			aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999,999,999","")})
		ElseIf aStruct[t,1] == cTab+"_POR"//Define a mascara do % com duas casas
			aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999.99","")})
		ElseIf aStruct[t,1] == cTab+"_TOTVLR" //Define a mascara do Total Geral com duas casas
			aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999,999,999.99","")})
		Else
			aAdd(aAux1,{aStruct[t,1],aStruct[t,2],Iif(aStruct[t,2]=="N","@E 999,999,999.9999","")})
		EndIf
		
		aAdd(aAux2,{""})
		Iif(aStruct[t,1]==cTab+"_FILIAL" ,aAux2[t,1]:="Filial"	,)
		Iif(aStruct[t,1]==cTab+"_COD"	 ,aAux2[t,1]:="Codigo"	,)
		Iif(aStruct[t,1]==cTab+"_DESCRI" ,aAux2[t,1]:="Nome"	,)
		Iif(aStruct[t,1]==cTab+"_LOJA"	 ,aAux2[t,1]:="Loja"	,)
		Iif(aStruct[t,1]==cTab+"_POR"	 ,aAux2[t,1]:="(%)"		,)
		Iif(aStruct[t,1]==cTab+"_VOL"	 ,aAux2[t,1]:="Volume"	,)
		Iif(aStruct[t,1]==cTab+"_TOTBAS" ,aAux2[t,1]:="Vlr.Bruto"	,)
		Iif(aStruct[t,1]==cTab+"_TOTLTR" ,aAux2[t,1]:="Vlr.Liquido"	,)
		Iif(aStruct[t,1]==cTab+"_TOTVLR" ,aAux2[t,1]:="Total Geral"	,)
		//Iif(aStruct[t,1]==cTab+"_TOTLIQ",aAux2[t,1]:="Vlr s/ INSS"	,)
		//	Iif(aStruct[t,1]==cTab+"_TOTLIQ",aAux2[t,1]:="Total Liquido"	,)
		//Iif(aStruct[t,1]==cTab+"_ULTBON" ,aAux2[t,1]:="MIX.Ant."	,)
		Iif(aStruct[t,1]==cTab+"_STATUS" ,aAux2[t,1]:="Status"	,)
	EndIf
Next t

//���������������������������������������������������������������������Ŀ
//� Definindo tamanhos das colunas                                      �
//�����������������������������������������������������������������������
For w:=1 To Len(aAux2)
	aAdd(aAux3,Iif(ShowLtr,34,34))
Next w

aAux3[1]:=22 // filial
aAux3[2]:=25 // Codigo
aAux3[3]:=80 // Descricao
aAux3[4]:=40 // Volume
aAux3[5]:=25 // (%)
aAux3[7]:=40 // Total Geral

If cTab=="TRS" .or. cTab=="TRL"
	aAux3[6]:=30 // Vlr.Liquido
EndIf

If cTab=="TRP" .or. cTab=="TRF"
	aAux3[3]:=15 // Loja
	aAux3[4]:=90 // Descricao
	aAux3[5]:=30 // Volume
	aAux3[6]:=20 // (%)
	aAux3[8]:=40 // Total Geral
EndIf


//���������������������������������������������������������������������Ŀ
//� Atribuindo definicoes as variaveis estaticas                        �
//�����������������������������������������������������������������������
If cTab == "TRS"
	aBrowse1 := aAux1
	aTitulo1 := aAux2
	aTam1 	 := aAux3
EndIf
If cTab == "TRL"
	aBrowse2 := aAux1
	aTitulo2 := aAux2
	aTam2 	 := aAux3
EndIf
If cTab == "TRP"
	aBrowse3 := aAux1
	aTitulo3 := aAux2
	aTam3 	 := aAux3
EndIf
If cTab == "TRF"
	aBrowse4 := aAux1
	aTitulo4 := aAux2
	aTam4 	 := aAux3
EndIf
Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �GravaTmp     � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Grava dados no arquivo temporario                                                       						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cTab,cAgrupa                                                                          						���
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
Static Function GravaTmp(cTab,cAgrupa,ntipo)

Local nCount  := 0
Local _limt   := 0
Local _ntotca := 0
Local ncontt  := 1
Local _nprd   := ""
Local nLr     := ""
Local _Fila   := ""
Local nFretis := ""
Local aAux    :={}
Local cAux	  :=""
Local nSumVol := 0
Local nSumVlr := 0
Local nSumBase:= 0
Local nTotIns := 0
Local nValIns := 0
Local nValQua := 0
Local nTotQua := 0
Local nAux    :=0
Local nQtdRec := 0
Local aTotais := {}
Local _nSinal := 1
Local _cBkpFil:= cFilAnt

nTotVol := 0


//���������������������������������������������������������������������Ŀ
//� Cria array que armazenara os totais de cada coluna do browse        �
//�����������������������������������������������������������������������
For iw:=1 To Len(aStruct2)
	aAdd(aTotais,0)
Next ix

If cTab == "TRS" //ARQUIVO DO SETOR
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo setores que o usuario pode acessar                          �
	//�����������������������������������������������������������������������
	dbSelectArea("ZLU")
	dbSetOrder(1)
	dbSeek(xFilial("ZLU")+Padr(cUserName,25))
	If Found()
		aAux:=strtokarr(AllTrim(Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_SETOR")),"/")
	EndIf
	cAux:=""
	For z:=1 To Len(aAux)
		cAux+="'"+aAux[z]+"'"
		Iif(z!=len(aAux),cAux+=",",)
	Next z
	cFilSet:=cAux
	
	If Empty(AllTrim(cFilSet))
		xMagHelpFis("Permissao","Voc� n�o possui acesso aos Setores do Mix.","Solicite o acesso ao Suporte.")
		Return
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo setores para gravar na tabela temporaria TRS                �
	//�����������������������������������������������������������������������
	
	//Tratamento para uso de setor compartilhado 07/01/10
	/*
	cQuery := " SELECT CASE WHEN ZL2_FILIAL = '  '"
	cQuery += "        THEN '"+xFilial("ZLD")+"' "
	cQuery += "        ELSE ZL2_FILIAL"
	cQuery += "        END AS FILIAL,"
	cQuery += " ZL2_COD AS COD,ZL2_DESCRI AS DESCRI FROM " + RetSqlName("ZL2") + " ZL2 "
	*/
	cQuery := "SELECT"
	cQuery += " ZL2_FILIAL AS FILIAL,"
	cQuery += " ZL2_COD AS COD,"
	cQuery += " ZL2_DESCRI AS DESCRI "
	cQuery += "FROM "
	cQuery += RetSqlName("ZL2") + " ZL2 "
	cQuery += "WHERE"
	cQuery += " ZL2_FILIAL = '"+xFilial("ZL2")+"' "
	cQuery += " AND ZL2_COD IN ("+cFilSet+") AND D_E_L_E_T_ = ' ' "
	cQuery += "ORDER BY"
	cQuery += " ZL2_COD"
	
EndIf

If cTab == "TRL" //ARQUIVO DE GRUPO DE PRECO
// ATENCAO: APESAR DE ALGUNS NOMES DE CAMPO AINDA SE REFERIREM A LINHA, A ZL3 PASSOU A SER UMA TABELA DE GRUPO DE PRECO
	
	//������������������������������������������������������������������������������Ŀ
	//� Obtendo Grupos de preco para gravar na tabela temporaria TRL                 �
	//��������������������������������������������������������������������������������
	cQuery := "SELECT "
	cQuery += " ZLD_FILIAL AS FILIAL,"
	cQuery += " ZLD_GRPRC AS COD,"
	cQuery += " ZL3_DESCRI AS DESCRI, "
	cQuery += " SUM(ZLD_QTDBOM) AS QTD "
	cQuery += " FROM "
	cQuery += RetSqlName("ZLD") + " ZLD "
	cQuery += " JOIN " + RetSqlName("ZL3") + " ZL3 ON  ZLD.ZLD_GRPRC = ZL3.ZL3_COD AND ZL3_SETOR  BETWEEN '"+cSetIni+"' AND  '"+cSetFim+"' AND ZL3_MSBLQL <> '1'  " 
	cQuery += " AND ZL3.D_E_L_E_T_ = ' ' "
	cQuery += " INNER JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ "
	cQuery += " 	AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' " // Indica que a associacao que o produtor faz parte, n�o entra no MIX.
	cQuery += " WHERE"
	cQuery += " ZLD.ZLD_FILIAL = '" + xFilial("ZLD") + "'   "
	cQuery += " 	AND ZLD.ZLD_DTCOLE BETWEEN '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'  AND ZLD.D_E_L_E_T_ = ' ' " 
	cQuery += " GROUP BY"
	cQuery += "  ZLD_FILIAL,ZLD_GRPRC,ZL3_DESCRI"
	cQuery += "  HAVING (SUM(ZLD_QTDBOM) > 0) "	
	cQuery += " ORDER BY"
	cQuery += "  ZL3_DESCRI "
/*
	cQuery := "SELECT"
//	cQuery += " ZL3_FILIAL AS FILIAL,"
	cQuery += " ZLD_FILIAL AS FILIAL,"
	cQuery += " ZL3_COD AS COD,"
	cQuery += " ZL3_DESCRI AS DESCRI "
	cQuery += "FROM "
	cQuery += RetSqlName("ZL3") + " ZL3 "
	cQuery += "INNER JOIN " + RetSqlName("ZLD") + " ZLD ON ZLD.ZLD_FILIAL = '" + xFilial("ZLD") + "' AND ZLD.ZLD_GRPRC = ZL3.ZL3_COD  "
	cQuery += " 	AND ZLD.ZLD_DTCOLE BETWEEN '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' AND ZLD.ZLD_TOTBOM > 0 AND ZLD.D_E_L_E_T_ = ' ' " 

	cQuery += "INNER JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ "
	cQuery += " 	AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' " // Indica que a associacao que o produtor faz parte, n�o entra no MIX.
	cQuery += "WHERE"
//	cQuery += " AND ZL3_FILIAL BETWEEN '"+cFilIni+"' AND  '"+cFilFim+"'"
	cQuery += " ZL3_SETOR  BETWEEN '"+cSetIni+"' AND  '"+cSetFim+"'"
	cQuery += " AND ZL3_MSBLQL <> '1' "
	cQuery += " AND ZL3.D_E_L_E_T_ = ' ' "
	cQuery += " GROUP BY"
	cQuery += "  ZLD_FILIAL,ZL3_COD,ZL3_DESCRI" //ZL3_FILIAL,
	
	cQuery += " ORDER BY"
	cQuery += "  ZL3_COD"
*/
EndIf

If cTab == "TRP" //ARQUIVO DO PRODUTOR
	
	//���������������������������������������������������������������������Ŀ
	//� Zera campos dinamicos (rever)                                       �
	//�����������������������������������������������������������������������
	ncontt = 1
	dbSelectArea("TRP")
	dbGoTop()
	Do While !Eof()
		xCod    := aStruct2[ncontt,5]
		ncontt   = ncontt + 1
		RecLock("TRP",.F.)
		&("TRP_"+xcod)  := xRes
		MsUnLock()
		dbSkip()
	EndDo
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo Produtores p/ gravar  tabela temporaria TRP                 �
	//�����������������������������������������������������������������������
	cQuery := "SELECT"
	cQuery += " ZLD.ZLD_FILIAL AS FILIAL,"
	cQuery += " ZLD.ZLD_RETIRO AS COD,"
	cQuery += " ZLD.ZLD_RETILJ AS LOJA,"
	cQuery += " MAX(SA2.A2_NOME) AS DESCRI "
	cQuery += "FROM "
	cQuery +=  RetSqlName("ZLD") + " ZLD "
	cQuery += "JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ "
	cQuery += " 	AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' " // Indica que a associacao que o produtor faz parte, n�o entra no MIX.
	cQuery += "WHERE"
	cQuery += " ZLD.ZLD_FILIAL BETWEEN '" + cFilIni + "' AND  '"  + cFilFim + "'"
	cQuery += " AND ZLD.ZLD_SETOR  BETWEEN '" + cSetIni + "' AND  '"  + cSetFim + "'"
 	cQuery += " AND ZLD.ZLD_GRPRC BETWEEN '" + cLinIni + "' AND  '"  + cLinFim +"'"
	cQuery += " AND ZLD.ZLD_DTCOLE BETWEEN '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' "
	cQuery += " AND ZLD.D_E_L_E_T_ = ' '"
	cQuery += "GROUP BY"
	cQuery += " ZLD.ZLD_FILIAL,"
	cQuery += " ZLD.ZLD_RETIRO,"
	cQuery += " ZLD.ZLD_RETILJ "
	cQuery += "ORDER BY"
	cQuery += " ZLD.ZLD_RETIRO"
	
EndIf

If cTab == "TRF" //ARQUIVO DO FRETISTA
	
	//���������������������������������������������������������������������Ŀ
	//� Obtem dados para o Fretista                                         �
	//�����������������������������������������������������������������������
	cQuery := "SELECT"
	cQuery += " ZLD.ZLD_FILIAL AS FILIAL,"
	cQuery += " ZLD.ZLD_FRETIS AS COD,"
	cQuery += " ZLD.ZLD_LJFRET AS LOJA,"
	cQuery += " MAX(SA2.A2_NREDUZ) AS DESCRI "
	cQuery += "FROM "
	cQuery += RetSqlName("ZLD") + " ZLD "
	cQuery += "JOIN " + RetSqlName("SA2") + " SA2 ON SA2. = ZLD.ZLD_FRETIS AND SA2.A2_LOJA = ZLD.ZLD_LJFRET "
	cQuery += " 	AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' " // Indica que a associacao que o produtor faz parte, n�o entra no MIX.
	cQuery += "WHERE"
	cQuery += " ZLD.ZLD_FILIAL = '" + cFilIni + "'"
	cQuery += " AND ZLD.ZLD_SETOR = '"  + cSetIni + "'"
	cQuery += " AND ZLD.ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' "
	cQuery += " AND ZLD.D_E_L_E_T_ = ' '"
	cQuery += "GROUP BY"
	cQuery += " ZLD.ZLD_FILIAL,"
	cQuery += " ZLD.ZLD_FRETIS,"
	cQuery += " ZLD.ZLD_LJFRET "
	cQuery += "ORDER BY"
	cQuery += " ZLD.ZLD_FRETIS"
	
EndIf

//���������������������������������������������������������������������Ŀ
//� Fecha tabela temporaria caso exista                                 �
//�����������������������������������������������������������������������
If Select("TMP") <> 0
	TMP->(dbCloseArea("TMP"))
EndIf
/*
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP", .T., .F. )

//���������������������������������������������������������������������Ŀ
//� Conta registros da consulta para atualizar regua                    �
//�����������������������������������������������������������������������
While !TMP->(Eof())
nCount++
TMP->(dbSkip())
EndDo
*/

TCQUERY cQuery NEW ALIAS ("TMP")
dbSelectArea("TMP")
Count To nCount

ProcRegua(nCount)
nCount := 0

//���������������������������������������������������������������������Ŀ
//� Gravando resultado da consulta na tabela temporaria (TRS,TRL ou TRP)�
//�����������������������������������������������������������������������
TMP->(dbGoTop())
While !TMP->(Eof())
	
	//�������������������������������������������������������Ŀ
	//�Posiciona na filial dos dados a serem inseridos no mix.�
	//���������������������������������������������������������
	cFilAnt:= TMP->FILIAL
	
	IncProc()
	nCount++
	
	//���������������������������������������������������������������������Ŀ
	//� Inicio da gravacao da na tabela temporaria                          �
	//�����������������������������������������������������������������������
	RecLock(cTab,.T.)
	&(cTab+"->"+cTab+"_FILIAL")	:= TMP->FILIAL
	&(cTab+"->"+cTab+"_COD")  	:= TMP->COD
	&(cTab+"->"+cTab+"_DESCRI") := TMP->DESCRI
	/*
	If cTab=="TRS" .OR. cTab=="TRL" .OR. cTab=="TRP"
	&(cTab+"->"+cTab+"_DESCRI") := TMP->DESCRI
	EndIf
	
	If cTab=="TRF"
	//&(cTab+"->"+cTab+"_DESCRI") := Posicione("SA2",1,xFilial("SA2")+TMP->COD+TMP->LOJA,"A2_NOME")
	&(cTab+"->"+cTab+"_DESCRI") := Posicione("SA2",1,xFilial("SA2")+TMP->COD+TMP->LOJA,"A2_NREDUZ")
	EndIf
	*/
	
	If cTab == "TRP" .OR. cTab == "TRF"
		&(cTab+"->"+cTab+"_LOJA")  	:= TMP->LOJA
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo Volume de Leite                                             �
	//�����������������������������������������������������������������������
	If cTab == "TRS"
		&(cTab+"->"+cTab+"_VOL") := U_VolLeite(TMP->FILIAL,dt1,dt2,TMP->COD,"","","","") // BUSCA VOLUME DE LEITE DO SETOR
		nAux    := U_GetTotCr(TMP->FILIAL,TMP->COD,,,,NumMix,cVersao)
		nValQua := U_GetTotDeb(TMP->FILIAL,TMP->COD,,,,NumMix,cVersao)
		nTotQua := nValQua / TRS->TRS_VOL
		TRS->TRS_TOTBAS := (nAux - nValQua) / TRS->TRS_VOL
		nSumBase += nAux - nValQua

		_nSinal := IIF(Posicione("ZL8",1,xFilial("ZL8")+cCodINSS,"ZL8_DEBCRE")=="C",1,-1)
		nValIns         := U_GetTotEv(TMP->FILIAL,cCodINSS,TMP->COD,,,,NumMix,cVersao) * _nSinal
		nTotIns         := nValIns / TRS->TRS_VOL


	EndIf
	If cTab == "TRL"
		&(cTab+"->"+cTab+"_VOL") := U_VolLeite(TMP->FILIAL,dt1,dt2,cSetIni,TMP->COD,"","") // BUSCA VOLUME DE LEITE DO SETOR
		nAux    := U_GetTotCr(TMP->FILIAL,cSetIni,TMP->COD,,,NumMix,cVersao)
		nValQua := U_GetTotDeb(TMP->FILIAL,cSetIni,TMP->COD,,,NumMix,cVersao)
		nTotQua := nValQua / TRL->TRL_VOL
		TRL->TRL_TOTBAS := (nAux - nValQua )/TRL->TRL_VOL
		nSumBase += nAux - nValQua

		_nSinal := IIF(Posicione("ZL8",1,xFilial("ZL8")+cCodINSS,"ZL8_DEBCRE")=="C",1,-1)
		nValIns         := U_GetTotEv(TMP->FILIAL,cCodINSS,cSetIni,TMP->COD,,,NumMix,cVersao) * _nSinal
		nTotIns         := nValIns / TRL->TRL_VOL


	EndIf
	If cTab == "TRP"
		TRP->TRP_VOL    := U_VolLeite(TMP->FILIAL,dt1,dt2,cSetIni,cLinIni,TMP->COD,TMP->LOJA,"") // BUSCA VOLUME DE LEITE DO SETOR
		nValQua         := U_GetTotDeb(TMP->FILIAL,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)
		nTotQua         := nValQua / TRP->TRP_VOL
		nAux            := U_GetTotCr(TMP->FILIAL,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)
		TRP->TRP_TOTBAS := (nAux - nValQua )/TRP->TRP_VOL //Mix Atual menos penalizacoes qualidade
		
		//TRP->TRP_TOTBAS := (U_GetTotCr(TMP->FILIAL,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)/TRP->TRP_VOL) - nTotQua //Mix Atual menos penalizacoes qualidade
		nSumBase += nAux - nValQua
		
		_nSinal := IIF(Posicione("ZL8",1,xFilial("ZL8")+cCodINSS,"ZL8_DEBCRE")=="C",1,-1)
		nValIns         := U_GetTotEv(TMP->FILIAL,cCodINSS,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao) * _nSinal
		nTotIns         := nValIns / TRP->TRP_VOL
		
		If !cAgrupa
			// obtem valor liquido (menos impostos)
			// como a funcao ja retorna o valor negativo deve-se somar
			
			//TRP->TRP_TOTLIQ := TRP->TRP_TOTBAS+((U_GetTotEv(TMP->FILIAL,cCodINSS,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)+;
			//U_GetTotEv(TMP->FILIAL,cCodFUND,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao))/TRP->TRP_VOL)
			
			//TRP->TRP_TOTLTR := TRP->TRP_TOTBAS+(U_GetTotEv(TMP->FILIAL,cCodINSS,cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)/TRP->TRP_VOL)
			
			// pega bonificacao do ultimo mix
			
			//���������������������������������������������������������������������������������������������������������Ŀ
			//� A coluna "ultima bonificacao" foi comentada pois a EMPRESA nao trabalhara com este tipo de bonificacao. �
			//�����������������������������������������������������������������������������������������������������������
			//cAux:=GetUltMix(NumMix)
			//TRP->TRP_ULTBON := (U_GetTotEv(TMP->FILIAL,cCodBonif,cSetIni,cLinIni,TMP->COD,TMP->LOJA,cAux,cVersao)/GetVolume(cAux,TMP->COD,TMP->LOJA))
		EndIf
	EndIf
	If cTab == "TRF"
		TRF->TRF_VOL := U_VolFret(xFilial("ZLD"),cSetIni,,TMP->COD,TMP->LOJA,dt1,dt2,1)
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo valores das colunas dinamicas (eventos)                     �
	//�����������������������������������������������������������������������
	For iw:=1 To Len(aStruct2)
		If cagrupa
			If cTab == "TRS"
				nSubTot := U_GetTotGp(TMP->FILIAL,aStruct2[iw,5],TMP->COD,"","","",NumMix,"S",cVersao) // RETORNA VALOR DO GRUPO DO SETOR
			EndIf
			If cTab == "TRL"
				nSubTot := U_GetTotGp(TMP->FILIAL,aStruct2[iw,5],cSetIni,TMP->COD,"","",NumMix,"S",cVersao) // RETORNA VALOR DO GRUPO DO SETOR
			EndIf
			If cTab == "TRP"
				nSubTot := U_GetTotGp(TMP->FILIAL,aStruct2[iw,5],cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,"S",cVersao) // RETORNA VALOR DO GRUPO DO SETOR
			EndIf
		Else
			If cTab == "TRS"
				nSubTot := U_GetTotEv(TMP->FILIAL,aStruct2[iw,5],TMP->COD,,,,NumMix,cVersao)
			EndIf
			If cTab == "TRL"
				nSubTot := U_GetTotEv(TMP->FILIAL,aStruct2[iw,5],cSetIni,TMP->COD,,,NumMix,cVersao)
			EndIf
			If cTab == "TRP"
				nSubTot := U_GetTotEv(TMP->FILIAL,aStruct2[iw,5],cSetIni,cLinIni,TMP->COD,TMP->LOJA,NumMix,cVersao)
			EndIf
			If cTab == "TRF"
				nSubTot := U_GetEvtFrt(TMP->FILIAL,cSetIni,"",TMP->COD,TMP->LOJA,aStruct2[iw,5],NumMix,cVersao)
			EndIf
		EndIf
		
		aTotais[iw] += nSubTot
		
		If ShowLtr
			&(aStruct2[iw,1]) := (nSubTot/&(cTab+"->"+cTab+"_VOL")) // VALOR POR LITRO
		Else
			&(aStruct2[iw,1]) := nSubTot // VALOR TOTAL
		EndIf
		
		//���������������������������������������������������������Ŀ
		//� Tratamento para que o frete nao seja somado aos totais. �
		//�����������������������������������������������������������
		If lSomaFrt //Se soma o frete no MIX.
			nTotLtr += &(aStruct2[iw,1])
			nTotVlr += nSubTot
		Else
			//Se Codigo do Evento eh igual ao de Frete ou igual ao de Falta de leite e Tabela eh diferente de Frete....zera
			If (aStruct2[iw,5] == cEvetFrt .Or. aStruct2[iw,5] == cEvetFal) .And. cTab <> "TRF"
				nTotLtr += 0
				nTotVlr += 0
			Else
				nTotLtr += &(aStruct2[iw,1])
				nTotVlr += nSubTot
			EndIf
		EndIf
	Next iw
	
	//���������������������������������������������������������������������Ŀ
	//� Mode de visualizacao          (por litro ou valor total)            �
	//�����������������������������������������������������������������������
	If ShowLtr
		&(cTab+"->"+cTab+"_TOTLTR")  := nTotLtr - nTotIns//Desconta o valor do INSS
		&(cTab+"->"+cTab+"_TOTVLR")  := nTotVlr
	Else
		&(cTab+"->"+cTab+"_TOTLTR")  := nTotVlr/&(cTab+"->"+cTab+"_VOL") - nValIns //Desconta o valor do INSS
		&(cTab+"->"+cTab+"_TOTVLR")  := nTotVlr
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Obtendo Status do registro corrente                                 �
	//�����������������������������������������������������������������������
	If cTab == "TRS"
		&(cTab+"->"+cTab+"_STATUS")	  := GetStatus(TMP->FILIAL,TMP->COD,"","","","")
	EndIf
	If cTab == "TRL"
		&(cTab+"->"+cTab+"_STATUS")	  := GetStatus(TMP->FILIAL,cSetIni,TMP->COD,"","","L")
	EndIf
	If cTab == "TRP"
		&(cTab+"->"+cTab+"_STATUS")	  := GetStatus(TMP->FILIAL,cSetIni,cLinIni,TMP->COD,TMP->LOJA,"L")
	EndIf
	If cTab == "TRF"
		&(cTab+"->"+cTab+"_STATUS")	  := GetStatus(TMP->FILIAL,cSetIni,"",TMP->COD,TMP->LOJA,"F")
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Finaliza gravacao na tabela temporaria                              �
	//�����������������������������������������������������������������������
	(cTab)->(MsUnLock())
	
	//���������������������������������������������������������������������Ŀ
	//� Zera totalizadores e calcula Volume Total da tabela                 �
	//�����������������������������������������������������������������������
	nTotLtr := 0
	nTotVlr := 0
	nTotVol += &(cTab+"->"+cTab+"_VOL")
	TMP->(dbSkip())
EndDo

/*
//��������������������������������������������������������������������Ŀ
//�Restaura a filial antes de efetuar o preenchimento dos dados do mix.�
//����������������������������������������������������������������������
*/
cFilAnt:= _cBkpFil

//���������������������������������������������������������������������Ŀ
//� Cria array para armazenar valores totais e qtd das colunas          �
//�����������������������������������������������������������������������
For iw:=1 To Len(aStruct2)
	aAdd(aAux,{0,0})
Next iw

//���������������������������������������������������������������������Ŀ
//� Calcula porcentagem e totais das colunas                            �
//�����������������������������������������������������������������������
nSumVol := 0
nSumVlr := 0
nSumBase := 0
nTotIns := 0
dbSelectArea(cTab)
dbGoTop()
While !Eof()
	nQtdRec++
	nSumVol += &(cTab+"->"+cTab+"_VOL")
	nSumVlr += &(cTab+"->"+cTab+"_TOTVLR")
	nSumBase += &(cTab+"->"+cTab+"_TOTBAS")

	// porcentagem
	&(cTab+"->"+cTab+"_POR") := (&(cTab+"->"+cTab+"_VOL")/nTotVol)*100
	
	dbSkip()
EndDo

//���������������������������������������������������������������������Ŀ
//� Grava linha de Total Geral.										    �
//�����������������������������������������������������������������������
If cTab == "TRS" .Or. cTab == "TRL" .Or. cTab == "TRP" .Or. cTab == "TRF"
	
	RecLock(cTab,.T.)
	/*
	If cTab == "TRL"
	&(cTab+"->"+cTab+"_FILIAL")	:= cFilIni
	EndIf
	*/
	nSumVlr := 0
	For iw:=1 To Len(aStruct2) // colunas dinamicas
		If ShowLtr
			&(aStruct2[iw,1]) := (aTotais[iw]/nSumVol)

			nSumVlr += aTotais[iw]			

			If aStruct2[iw,5] == cCodINSS
				_nSinal := IIF(Posicione("ZL8",1,xFilial("ZL8")+cCodINSS,"ZL8_DEBCRE")=="C",1,-1)
				nTotIns := aTotais[iw] * _nSinal
			EndIf
		Else
			&(aStruct2[iw,1]) := aTotais[iw]
			nSumVlr += aTotais[iw]
		EndIf
	Next iw


	&(cTab+"->"+cTab+"_DESCRI")	:= "Total Geral"
	&(cTab+"->"+cTab+"_VOL") 	:= nSumVol
	&(cTab+"->"+cTab+"_POR") 	:= 100
	&(cTab+"->"+cTab+"_TOTVLR") := nSumVlr
	&(cTab+"->"+cTab+"_TOTLTR") := (nSumVlr -nTotIns)/nSumVol
	
	If cTab <> "TRF"
		&(cTab+"->"+cTab+"_TOTBAS") := nSumVlr/nSumVol //nSumBase/nSumVol
	EndIf
	

/*	
	&(cTab+"->"+cTab+"_DESCRI")	:= "Total Geral"
	&(cTab+"->"+cTab+"_VOL") 	:= nSumVol
	&(cTab+"->"+cTab+"_POR") 	:= 100
	&(cTab+"->"+cTab+"_TOTVLR") := nSumVlr
	&(cTab+"->"+cTab+"_TOTLTR") := (nSumVlr /nSumVol) - nTotIns
	
	If cTab <> "TRF"
		&(cTab+"->"+cTab+"_TOTBAS") := nSumVlr/nSumVol //nSumBase/nSumVol
	EndIf
	
	For iw:=1 To Len(aStruct2) // colunas dinamicas
		If ShowLtr
			&(aStruct2[iw,1]) := (aTotais[iw]/nSumVol)
		Else
			&(aStruct2[iw,1]) := aTotais[iw]
		EndIf
	Next iw
*/
	MsUnLock()
EndIf
dbGoTop()


Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �ShowLinhas   � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra dados na tela                                                                    						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cCodFil,cCodSet                                                                       						���
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
Static Function ShowLinhas(cCodFil,cCodSet,ntipo,NumMix)

Local agrupa := .T.
Local tTitulo := "Mix > Setor: "+AllTrim(Posicione("ZL2",1,xFilial("ZL2")+cCodSet,"ZL2_DESCRI"))+"         [De "+npper+"]"

If Empty(AllTrim(cCodSet))
	Return
EndIf

cFilIni := cCodFil
cFilFim := cCodFil
cSetIni := cCodSet
cSetFim := cCodSet

//���������������������������������������������������������������������Ŀ
//� Verifica se deve mostrar grupos ou eventos como coluna              �
//�����������������������������������������������������������������������
//If MsgYesNo("Detalhar Eventos?")
	agrupa:=.F.
	grouplin:=.F.
/*Else
	agrupa:=.T.
	grouplin:=.T.
EndIf
*/

//���������������������������������������������������������������������Ŀ
//� Cria tabela temporaria                                              �
//�����������������������������������������������������������������������
CriaTmp("TRL",agrupa,.T.)


//���������������������������������������������������������������������Ŀ
//� Grava dados na tabela temporaria                                    �
//�����������������������������������������������������������������������
Processa ( {|| GravaTmp("TRL",agrupa) })


//���������������������������������������������������������������������Ŀ
//� Define configuracoes do Browse                                      �
//�����������������������������������������������������������������������
aBrowse2:={}
aTitulo2:={}
CfgBrowse("TRL",agrupa)

dbSelectArea("TRL")
dbGoTop()

aAdd(aOrdem,"Filial")

//���������������������������������������������������������������������Ŀ
//� Mostra Browse das Linhas                                            �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlg2 FROM  00,00 TO aSize[6],aSize[5] TITLE tTitulo PIXEL OF oMainWnd
oBrowse2 := VCBrowse():New(00,00,aPosObj1[1,3],(aPosObj1[1,4]),,,,oDlg2,,,,,, , , , , , , , ,.T.)
oBrowse2 := oBrowse2:GetBrowse()
oBrowse2:lLineDrag	:= .T.
For i:=1 To Len(aBrowse2)
	oCol2 := TCColumn():New( OemToAnsi(aTitulo2[i,1]), &("{ || "+aBrowse2[i,1]+"}"),aBrowse2[i,3],,,if(aBrowse2[i,2]=="N","RIGHT","LEFT"),aTam2[i], .F., .F.,,,, .F., )
	oBrowse2:AddColumn(oCol2)
Next i
oBrowse2:BLDBLCLICK := { ||ShowProdutor(cCodFil,cCodSet,TRL->TRL_COD,ntipo,NumMix,TRL->TRL_DESCRI)  }

//���������������������������������������������������������������������Ŀ
//� Mostra Botoes do Browse das Linhas                                  �
//�����������������������������������������������������������������������
@ (aPosObj1[1,4]+5),005 Button OemToAnsi("Abrir Grupo")   Size 50,10 Action Processa({|| ShowProdutor(cCodFil,cCodSet,TRL->TRL_COD,ntipo,NumMix,TRL->TRL_DESCRI) }) OF oDlg2 PIXEL
//@ (aPosObj1[1,4]+5),060 Button OemToAnsi("Transportador") Size 50,10 Action Processa({|| ShowFrt(cCodFil,cCodSet,TRL->TRL_COD,ntipo,NumMix) })      OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),115 Button OemToAnsi("Gerar Eventos") Size 50,10 Action Processa({|| U_GerEvts(TRL->TRL_FILIAL,TRL->TRL_DESCRI),UpdateTab("TRL",grouplin) })    OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),170 Button OemToAnsi("Aprovacao")     Size 50,10 Action Processa({|| ShowStatus(TRL->TRL_DESCRI),UpdateTab("TRL",grouplin) })                  OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),225 Button OemToAnsi("Grafico")     Size 50,10 Action MontaGrf("TRL",aTitulo2)          		  OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),280 Button OemToAnsi("Exportar")    Size 50,10 Action Export("TRL",aTitulo2)            		  OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),335 Button OemToAnsi("Imprimir")    Size 50,10 Action U_RGLT027("TRL",aTitulo2,ShowLtr,tTitulo) OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),390 Button OemToAnsi("Totais")      Size 50,10 Action ShowVals("TRL",agrupa)            		  OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),445 Button OemToAnsi("Prc.Negoc.")  Size 50,10 Action Processa({|| If(AdcMerc(),UpdateTab("TRL",grouplin),Nil) })   OF oDlg2 PIXEL
@ (aPosObj1[1,4]+5),500 Button OemToAnsi("Fechar")      Size 50,10 Action close(oDlg2)                      		  OF oDlg2 PIXEL

ACTIVATE MSDIALOG oDlg2 Centered

//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria e atualiza a mesma                        �
//�����������������������������������������������������������������������
If Select("TRL") <> 0
	FechaTab("TRL")
	UpdateTab("TRS",.T.)
EndIf


Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �ShowProdutor � Autor � TOTVS                 � Data da Criacao  � 08/10/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra dados na tela                                                                    						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�cCodFila,cCodSet,cCodLin                                                              						���
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
Static Function ShowProdutor(cCodFil,cCodSet,cCodLin,ntipo,NumMix,cDescricao)

Local agrupa := .T.
Local cTitulo:= ""

If Empty(AllTrim(cCodLin))
	Return
EndIf

If 'TOTAL' $ Upper(cDescricao)
	Return
EndIf

cFilIni := cCodFil
cFilFim := cCodFil
cSetIni := cCodSet
cSetFim := cCodSet
cLinIni := cCodLin
cLinFim := cCodLin

//���������������������������������������������������������������������Ŀ
//� Verifica se deve mostrar grupos ou eventos como coluna              �
//�����������������������������������������������������������������������
//If MsgYesNo("Detalhar Eventos?")
	agrupa:=.F.
//Else
//	agrupa:=.T.
//EndIf

//���������������������������������������������������������������������Ŀ
//� Cria tabela temporaria                                              �
//�����������������������������������������������������������������������
CriaTmp("TRP",agrupa,.T.)


//���������������������������������������������������������������������Ŀ
//� Grava dados na tabela temporaria                                    �
//�����������������������������������������������������������������������
Processa ( {|| GravaTmp("TRP",agrupa) })


//���������������������������������������������������������������������Ŀ
//� Define configuracoes do Browse                                      �
//�����������������������������������������������������������������������
aBrowse3:={}
aTitulo3:={}
CfgBrowse("TRP",agrupa)

dbSelectArea("TRP")
dbGoTop()
aAdd(aOrdem,"Filial")

cTitulo := "Mix > Setor: "+AllTrim(Posicione("ZL2",1,xFilial("ZL2")+cCodSet,"ZL2_DESCRI"))
cTitulo += " > Grupo: "+cCodLin+" - "+AllTrim(Posicione("ZL3",1,xFilial("ZL3")+cCodLin,"ZL3_DESCRI"))
cTitulo += "     [De "+npper+"]"

//���������������������������������������������������������������������Ŀ
//� Mostra Browse dos Produtores                                        �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlg3 FROM  00,00 TO aSize[6],aSize[5] TITLE cTitulo PIXEL OF oMainWnd
oBrowse3:= VCBrowse():New(00,00,aPosObj1[1,3],(aPosObj1[1,4]),,,,oDlg3,,,,,,,,,,,,,,.T.)
oBrowse3:= oBrowse3:GetBrowse()
oBrowse3:lLineDrag	:= .T.
For i:=1 To Len(aBrowse3)
	oCol3 := TCColumn():New( OemToAnsi(aTitulo3[i,1]), &("{ || "+aBrowse3[i,1]+"}"),aBrowse3[i,3],,,if(aBrowse3[i,2]=="N","RIGHT","LEFT"),aTam3[i], .F., .F.,,,, .F., )
	oBrowse3:AddColumn(oCol3)
Next i
oBrowse3:BLDBLCLICK := { ||editLin(agrupa,ntipo,ShowLtr,TRP->TRP_DESCRI)}

//���������������������������������������������������������������������Ŀ
//� Mostra Botoes do Browse dos Produtore                               �
//�����������������������������������������������������������������������
@ (aPosObj1[1,4]+5),005 Button OemToAnsi("Editar")        Size 50,10 Action {|| editLin(agrupa,ntipo,ShowLtr,TRP->TRP_DESCRI) } OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),060 Button OemToAnsi("Gerar Eventos") Size 50,10 Action Processa({|| U_GerEvts(TRP->TRP_FILIAL,TRP->TRP_DESCRI),UpdateTab("TRP",agrupa) }) OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),115 Button OemToAnsi("Grafico")       Size 50,10 Action MontaGrf("TRP",aTitulo3)          			OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),170 Button OemToAnsi("Exportar")      Size 50,10 Action Export("TRP",aTitulo3)            			OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),225 Button OemToAnsi("Imprimir")      Size 50,10 Action U_RGLT027("TRP",aTitulo3,ShowLtr,cTitulo) OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),280 Button OemToAnsi("Pesquisar")     Size 50,10 Action PesqProdut(oBrowse3,"TRP") 				OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),335 Button OemToAnsi("Prc.Negoc.")    Size 50,10 Action Processa({|| If(AdcMerc(),UpdateTab("TRP",agrupa),Nil) }) OF oDlg3 PIXEL
@ (aPosObj1[1,4]+5),390 Button OemToAnsi("Fechar")        Size 50,10 Action close(oDlg3)                      			OF oDlg3 PIXEL

ACTIVATE MSDIALOG oDlg3 Centered

//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria e atualiza a mesma                        �
//�����������������������������������������������������������������������
If Select("TRP") <> 0
	FechaTab("TRP")
EndIf

UpdateTab("TRL",grouplin)

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � Permi_   � Autor � TOTVS                 � Data da Criacao  � 08/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Valida se evento pode ser editado                                                       						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�codigo do evento                                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � verdadeiro ou falso                                                                                      	���
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
Static Function Permi_(xCod)

Local aArea := GetArea()
Local bret:=.F.

dbSelectArea("ZL8")
dbSetOrder(1)
dbGoTop()
If dbSeek(xFilial("ZL8")+xCod)
	
	If upper(ZL8->ZL8_ALTERA) == "S" .And. (ZL8->ZL8_PERTEN == "P" .Or. ZL8->ZL8_PERTEN == "T")
		bret:= .T.
	Else
		bret:= .F.
	EndIf
Else
	bret:= .F.
EndIf

If AllTrim(TRP->TRP_STATUS) != "Aberto"
	bret:=.F.
EndIf

RestArea(aArea)

Return bret

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � FechaTab � Autor � TOTVS                 � Data da Criacao  � 08/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Fecha tela de periodo e retorna as datas para serem mostrada na tela para o usuario     						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function FechaTab(cTab)

//���������������������������������������������������������������������Ŀ
//� Deleta dados da tabela temporaria                                   �
//�����������������������������������������������������������������������
dbSelectArea(cTab)
ZAP
dbCloseArea(cTab)


If cTab == "TRS"
	dbUseArea(.T.,,cArqTRS,cTab,.F.,.F.)
	Ferase(cArqTRS + GetDbExtension())
	Ferase(cArqTRS + OrdBagExt())
EndIf
If cTab == "TRL"
	dbUseArea(.T.,,cArqTRL,cTab,.F.,.F.)
	Ferase(cArqTRL + GetDbExtension())
	Ferase(cArqTRL + OrdBagExt())
EndIf
If cTab == "TRP"
	dbUseArea(.T.,,cArqTRP,cTab,.F.,.F.)
	Ferase(cArqTRP + GetDbExtension())
	Ferase(cArqTRP + OrdBagExt())
EndIf
If cTab == "TRF"
	dbUseArea(.T.,,cArqTRF,cTab,.F.,.F.)
	Ferase(cArqTRF + GetDbExtension())
	Ferase(cArqTRF + OrdBagExt())
EndIf
dbCloseArea(cTab)
Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GLTINC   � Autor � TOTVS                 � Data da Criacao  � 16/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Trata inclusao do ctree da tabela do Mix.                                            						���
���          � Somente de eventos										                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function GltInc(ntipo,agrupa)

Local oFonTm1
Local cCombo := "Mix do Leite"
Local aItems := {"Mix do Leite","Mix do Frete"}

Private oDlgVen1, oVlrPed1,oLbCabec,oNov,odt2,odt1
Private ncod   := space(06)


//���������������������������������������������������������������������Ŀ
//� Mostra tela de inclusao do Mix                                      �
//�����������������������������������������������������������������������
@ 00,00 To 150,300 Dialog oDlgVen1 Title "Periodo do Fechamento"
@ 00,00 To 220,300 Pixel Of oDlgVen1
oPanCon := TPanel()	:New(00,00, "", oDlgVen1, Nil, .T., .F., Nil, Nil, 200,300, .T., .F. )
@ 20,010 say "Periodo Inicial" Pixel Of oPanCon
@ 20,050 MsGet odt1 Var dt1 Picture "99/99/99"  Pixel Of oPanCon
@ 35,010 SAY "Periodo Final" Pixel Of oPanCon
@ 35,050 MsGet odt2 Var dt2 Picture "99/99/99"  Pixel Of oPanCon
@ 60,050 BmpButton Type 1 Action ftela(dt1,dt2,ntipo,agrupa)
@ 60,080 BMPBUTTON TYPE 2 ACTION close(oDlgVen1)
Activate Dialog oDlgVen1 Center

Return.T.

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ftela    � Autor � TOTVS                 � Data da Criacao  � 08/10/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Fecha tela de periodo e retorna as datas para serem mostrada na tela para o usuario     						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function ftela(dt1,dt2,ntipo,agrupa)

Local bExist := .F.
Local cNewMix := ""
Local cNewVersao := ""

//���������������������������������������������������������������������Ŀ
//� Verifica se ja existe o Mix                                         �
//�����������������������������������������������������������������������
If ntipo = 1
	//cQry2 := " SELECT ZLE_COD,ZLE_VERSAO FROM " + RETSQLNAME("ZLE")
	cQry2 := " SELECT ZLE_COD,MAX(ZLE_VERSAO) AS VERSAO FROM " + RETSQLNAME("ZLE")
	cQry2 += " WHERE ZLE_FILIAL = '" + xFilial("ZLE") + "'"
	cQry2 += " AND ZLE_DTINI  >= '" + DTOS(dt1) + "'"
	cQry2 += " AND ZLE_DTFIM <= '" + DTOS(dt2) + "'"
	cQry2 += " AND D_E_L_E_T_  <> '*'"
	cQry2 += " GROUP BY ZLE_COD"
	If Select("TRAB2") <> 0
		TRAB2->(dbCloseArea("TRAB2"))
	EndIf
	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB2", .F., .T.)
	If !TRAB2->(Eof())
		If MsgYesNo("Esse periodo ja possui um Mix! Deseja criar uma nova Versao?")
			bExist     := .T.
			cNewMix    := TRAB2->ZLE_COD
			//cNewVersao := soma1(TRAB2->ZLE_VERSAO)
			cNewVersao := soma1(TRAB2->VERSAO)
		Else
			Return
		EndIf
	EndIf
	TRAB2->(dbCloseArea())
EndIf
npper := dtoc(dt1)+" a "+ dtoc(dt2)
close(oDlgVen1)

//���������������������������������������������������������������������Ŀ
//� Grvando Mix                                                         �
//�����������������������������������������������������������������������
RecLock("ZLE",.T.)
ZLE->ZLE_FILIAL := xFilial("ZLE")
If bExist
	ZLE->ZLE_COD    := cNewMix
	ZLE->ZLE_VERSAO := cNewVersao
Else
	//	ZLE->ZLE_COD    := GetSxeNum("ZLE","ZLE_COD")
	ZLE->ZLE_COD    := soma1(U_maxCodigo("ZLE_COD"))
	ZLE->ZLE_VERSAO := "1"
EndIf
ZLE->ZLE_DTINI  := dt1
ZLE->ZLE_DTFIM  := dt2
ZLE->ZLE_STATUS := "A"
MsUnLock()

If bExist
	MsgInfo("Versao do Mix criado com sucesso!")
Else
	MsgInfo("Mix criado com sucesso!")
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RunFormulas � Autor � TOTVS                 � Data da Criacao  � 26/11/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Executa as formulas dos evetos para todos os produtores do setor posicionado           						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function RunFormulas(apSet,apEve,cpMix,cModo,lPerg)

Local nForm       := 0
Local aSetores    := {}
Local aEventos    := {}
Local nConta      := 0
Local nVolume     := 0
Local nPercent    := 0
Local nQtdPrd     := 0
Local ncalc       := 0
Local nTotParc    := 0
Local nVolPro     := 0
Local nCrePro 	  := 0
Local dataini,datafim
Local bContinue   := .T.
Local cEveDcr,cEveMix,cEveDC
Local lApagar 	  := Iif(cModo=="Apagar",.T.,.F.)
Local lRest   	  := Iif(cModo=="Restaurar",.T.,.F.)


//���������������������������������������������Ŀ
//�Variaveis utilizadas em formulas dos eventos.�
//�����������������������������������������������
Private _cTributac := ""



//���������������������������������������������������������������������Ŀ
//� Confirma funcao de Apagar Eventos                                   �
//�����������������������������������������������������������������������
If lApagar
	If !MsgYesNo("Tem certeza de deseja EXCLUIR os eventos selecionados?")
		Return
	EndIf
EndIf

//���������������������������������������������������������������������Ŀ
//� Valida se existe o MIX                                              �
//�����������������������������������������������������������������������
dbSelectArea("ZLE")
dbSetOrder(1)
dbSeek(xFilial("ZLE")+cpMIX+cVersao)
If !Found()
	xMagHelpFis("Numero do Mix","Numero do Mix nao encontrado!","Digite um numero de Mix v�lido!")
	Return
EndIf

dataIni:=ZLE->ZLE_DTINI
dataFim:=ZLE->ZLE_DTFIM

//���������������������������������������������������������������������Ŀ
//� Parametros p/ filtrar Produtor,Fretista e Linha                     �
//�����������������������������������������������������������������������
ValidPerg()
If lPerg//Define se deve apresentar os parametros
	If !Pergunte(cPerg1,.T.)
		Return
	EndIf
Else
	Pergunte(cPerg1,.F.)
EndIf

//���������������������������������������������������������������������Ŀ
//� Localiza marcados no array e lanca em novos arrays                  �
//�����������������������������������������������������������������������
For y:=1 To Len(apSet)
	If apSet[y,1] == .T. // marcado
		aAdd(aSetores,apSet[y,2])
	EndIf
Next y

For y:=1 To Len(apEve)
	If apEve[y,1] == .T. .AND. apEve[y,3] != cCodINSS// marcado
		aAdd(aEventos,apEve[y,3])
		
		//���������������������������������������������������������������������Ŀ
		//� Grava valor digitado pelo usuario na tabela                         �
		//�����������������������������������������������������������������������
		dbSelectArea("ZL8")
		dbSetOrder(1)
		If dbSeek(xFilial("ZL8")+apEve[y,3])
			RecLock("ZL8",.F.)
			ZL8->ZL8_VALOR	:=	apEve[y,5]
			MsUnLock()
		EndIf
		dbCloseArea("ZL8")
	EndIf
Next y

//���������������������������������������������������������������������Ŀ
//� TRATAMENTO DO ADICIONAL DE MERCADO e INCENTIVO ICMS.                �
//� Eles sao adicionados ao fim do array para serem calculados por      �
//� ultimo, depois de todas as bonificacoes.                            �
//�����������������������������������������������������������������������
If !Empty(cEvetAdc)
	AADD(aEventos,cEvetAdc) //Adiciona o evento Adicional de mercado no array a ser calculado.
EndIf
If !Empty(cCodINSS)
	AADD(aEventos,cCodINSS) //Adiciona o evento de INSS para ser calculado no final
EndIf


If len(aSetores) == 0 .or. len(aEventos) == 0
	xMagHelpFis("Falha","Existe algum item obrigatorio nao preenchido!","Marque ao menos um Evento e um Setor!")
	Return
EndIf

//���������������������������������������������������������������������Ŀ
//� Conta linhas dos setores para jogar na barra de progresso           �
//�����������������������������������������������������������������������
cAux:=""
For x:=1 To Len(aSetores)
	cAux+="'"+aSetores[x]+"'"
	If x!=len(aSetores)
		cAux+=","
	EndIf
Next x

cQuery := "SELECT COUNT(*) AS QTDREG FROM " + RetSqlName("ZL3") + " ZL3 "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZL3_FILIAL = '"+xFilial("ZL3")+"'  "
cQuery += " AND ZL3_SETOR IN ("+cAux+")"

If Select("TCT") <> 0
	TCT->(dbCloseArea("TCT"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TCT", .T., .F. )

If TCT->(!Eof())
	ProcRegua(TCT->QTDREG,"Aguarde.. Esse procedimento pode ser demorado!")
EndIf

TCT->(dbCloseArea())

//���������������������������������������������������������������������Ŀ
//� Le array dos setores para executar formulas                         �
//�����������������������������������������������������������������������
For r:=1 To Len(aSetores)
	
	//���������������������������������������������������������������������Ŀ
	//� Posiciona no Setor corrente                                         �
	//�����������������������������������������������������������������������
	dbSelectArea("ZL2")
	ZL2->(dbSetOrder(1))
	ZL2->(dbSeek(xFilial("ZL2") + aSetores[r]))
	
	
	//���������������������������������������������������������������������Ŀ
	//� Le Linhas do Setor corrente                                         �
	//�����������������������������������������������������������������������
	dbSelectArea("ZL3")
	ZL3->(dbSetOrder(3))//ZL3_FILIAL+ZL3_SETOR
	ZL3->(dbSeek(xFilial("ZL3") + ZL2->ZL2_COD))
	
	While !ZL3->(Eof()) .And. xFilial("ZL3") == ZL3->ZL3_FILIAL .And. ZL3->ZL3_SETOR == ZL2->ZL2_COD
		
		IncProc("Lendo Grupo Pre�o: " + ZL3->ZL3_COD)
		
		If ZL3->ZL3_COD >= MV_PAR05 .And. ZL3->ZL3_COD <= MV_PAR06
			
			//���������������������������������������������������������������������Ŀ
			//� Obtem fretistas que movimentaram no Setor corrente                  �
			//�����������������������������������������������������������������������
			cQuery := "SELECT"
			cQuery += " ZLD_FILIAL AS FILIAL,"
			cQuery += " ZLD_FRETIS AS COD,"
			cQuery += " ZLD_LJFRET AS LOJA "
			cQuery += "FROM "
			cQuery += RetSqlName("ZLD") + " ZLD "
			cQuery += " JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ  "
			cQuery += " 		AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' "
			cQuery += "WHERE"
			cQuery += " ZLD_FILIAL = '"        + xFilial("ZLD")+ "'"
			cQuery += " AND ZLD_SETOR  = '"        + ZL2->ZL2_COD  + "'"
			cQuery += " AND ZLD_GRPRC = '"        + ZL3->ZL3_COD  + "'"
			cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dataIni) + "' AND '" + DTOS(dataFim) + "' "
			cQuery += " AND ZLD.D_E_L_E_T_ = ' ' "
			cQuery += "GROUP BY"
			cQuery += " ZLD_FILIAL,"
			cQuery += " ZLD_FRETIS,"
			cQuery += " ZLD_LJFRET "
			cQuery += "ORDER BY"
			cQuery += " ZLD_FRETIS"
			
			If Select("TMPZLD") <> 0
				TMPZLD->(dbCloseArea("TMPZLD"))
			EndIf			
			dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMPZLD", .T., .F. )
			
			While TMPZLD->(!Eof())
				
				//���������������������������������������������������������������������Ŀ
				//� Posiciona no fornecedor                                             �
				//�����������������������������������������������������������������������
				dbSelectArea("SA2")
				dbSetOrder(1)
				dbGoTop()
				dbSeek(xFilial("SA2")+TMPZLD->COD+TMPZLD->LOJA)
				
				_pnVLEITE := U_VLEITE('','','N')

				//���������������������������������������������������������������������Ŀ
				//� Le eventos do array                                                 �
				//�����������������������������������������������������������������������
				For e:=1 To Len(aEventos)
					
					//���������������������������������������������������������������������Ŀ
					//� Posiciona no Evento p/ executar formula                             �
					//�����������������������������������������������������������������������
					dbSelectArea("ZL8")
					dbSetOrder(1)
					dbGoTop()
					dbSeek(xFilial("ZL8") + aEventos[e])
					
					//���������������������������������������������������������������������Ŀ
					//� Executa  Condicao p/ rodar formula                                  �
					//�����������������������������������������������������������������������
					If &(ZL8->ZL8_CONDIC) .or. lApagar
						
						cEveDcr:=	ZL8->ZL8_DESCRI
						cEveMix:=	ZL8->ZL8_MIX
						cEveDC :=	ZL8->ZL8_DEBCRED
						
						//���������������������������������������������������������������������Ŀ
						//� Grava o evento do Fretista na ZLF ou deleta ZLF se for valor zero	�
						//� Se for Credito rateia entre os produtores							�
						//� Se for Debito grava apenas um registro ao fretista					�
						//� Obs: Nao executa se for modo de Restauracao (lRest)					�
						//�����������������������������������������������������������������������
						If ZL8->ZL8_DEBCRE == "C" .and. !lRest
							
							//�������������������������������������������������������������������������Ŀ
							//� Caso seja necessario efetuar o rateamento do evento entre os produtores �
							//� que o transportador efetuou o transporte de leite.                      �
							//���������������������������������������������������������������������������
							If FieldPos("ZL8_RATEIO") > 0 .and. ZL8->ZL8_RATEIO == 'S'
								
								If gEvtFrtRat(cFilIni,NumMix,cVersao,ZL2->ZL2_COD,ZL3->ZL3_COD,;
									ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
									SA2->A2_COD,SA2->A2_LOJA,SA2->A2_NOME,cEveDcr,ZL8->ZL8_FORMUL,lApagar,.T.,0)
									//nconta++
									
								EndIf
								
								//����������������������������������������������������������
								//�Caso n�o seja necessario efetuar o rateamento do evento.�
								//����������������������������������������������������������
							Else
								
								//���������������������������������������������������������������������Ŀ
								//� Executa formula                                                     �
								//�����������������������������������������������������������������������
								If !lApagar
									nForm:=&(ZL8->ZL8_FORMUL)
								EndIf
								
								If Empty(nForm) .or. lApagar
									nForm	:=	0
								EndIf
								
								If gEvtFrt(cFilIni,NumMix,cVersao,ZL2->ZL2_COD,ZL3->ZL3_COD,;
									ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
									SA2->A2_COD,SA2->A2_LOJA,nForm,;
									ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,"")
									//nconta++
								EndIf
								
							EndIf
							
						EndIf
						
						If ZL8->ZL8_DEBCRE == "D" .and. !lRest
							
							//��������������������������������������������������������������������Ŀ
							//� Executa formula                                                     �
							//�����������������������������������������������������������������������
							If !lApagar
								nForm:=&(ZL8->ZL8_FORMUL)
							EndIf
							
							If Empty(nForm) .or. lApagar
								nForm	:=	0
							EndIf
							
							//���������������������������������������������������������������������Ŀ
							//� Se For Debito converte para positivo na gravacao                    �
							//�����������������������������������������������������������������������
							nForm := nForm * -1
							
							If gEvtFrt(cFilIni,NumMix,cVersao,ZL2->ZL2_COD,ZL3->ZL3_COD,;
								ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
								SA2->A2_COD,SA2->A2_LOJA,nForm,;
								ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,"")
								//nconta++
							EndIf
							
						EndIf
						
						// fim da condicao da formula
					EndIf
					
					// prox. evento
				Next e
				
				// prox. fretista
				TMPZLD->(dbSkip())
			EndDo
			TMPZLD->(dbCloseArea())
			
			
			//���������������������������������������������������������������������Ŀ
			//� Listando produtores da linha corrente que movimentaram              �
			//�����������������������������������������������������������������������
			cQuery := "SELECT"
			cQuery += " ZLD_FILIAL AS FILIAL,"
			cQuery += " ZLD_RETIRO AS COD,"
			cQuery += " ZLD_RETILJ AS LOJA,"
			cQuery += " MAX(ZLD_DCRRET) AS DESCRI,"
			cQuery += " ZLD_TRIBUT AS TRIBUTAC "
			cQuery += "FROM "
			cQuery +=  RetSqlName("ZLD") + " ZLD "
			cQuery += " JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ  "
			cQuery += " 		AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' "
			cQuery += "WHERE"
			cQuery += " ZLD_FILIAL = '"        + xFilial("ZLD")+ "'"
			cQuery += " AND ZLD_SETOR  = '"        + ZL2->ZL2_COD  + "'"
			cQuery += " AND ZLD_GRPRC = '"        + ZL3->ZL3_COD  + "'"
			cQuery += " AND ZLD_RETIRO BETWEEN '"  + MV_PAR01      + "' AND '" + MV_PAR02      + "'"
			cQuery += " AND ZLD_RETILJ BETWEEN '"  + MV_PAR03      + "' AND '" + MV_PAR04      + "'"
			cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dataIni) + "' AND '" + DTOS(dataFim) + "' "
			cQuery += " AND ZLD.D_E_L_E_T_ = ' '"
			cQuery += "GROUP BY"
			cQuery += " ZLD_FILIAL,"
			cQuery += " ZLD_RETIRO,"
			cQuery += " ZLD_RETILJ,"
			cQuery += " ZLD_TRIBUT "
			cQuery += "ORDER BY"
			cQuery += " ZLD_RETIRO"
			
			If Select("TMPZLD") <> 0
				TMPZLD->(dbCloseArea("TMPZLD"))
			EndIf
			
			dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMPZLD", .T., .F. )
			
			While TMPZLD->(!Eof())

				//����������������������������������������������������������Ŀ
				//�Armazena o tipo da tributacao para ser usado nas formulas.�
				//������������������������������������������������������������
				_cTributac:= TMPZLD->TRIBUTAC
				
				//���������������������������������������������������������������������Ŀ
				//� Posiciona no Fornecedor para usar tabela na execusao da formula     �
				//�����������������������������������������������������������������������
				dbSelectArea("SA2")
				dbSetOrder(1)
				dbGoTop()
				If dbSeek(xFilial("SA2")+TMPZLD->COD+TMPZLD->LOJA)
				   nConta++
				EndIf



				
				//���������������������������������������������������������������������Ŀ
				//� Le o array de Eventos para rodar formulas                           �
				//�����������������������������������������������������������������������
				_pnVLEITE := U_VLEITE('','','N')

				For e:=1 To Len(aEventos)
					
					//���������������������������������������������������������������������Ŀ
					//� Posiciona no Evento para usar tabela na execusao da formula         �
					//�����������������������������������������������������������������������
					dbSelectArea("ZL8")
					dbSetOrder(1)
					dbGoTop()
					dbSeek(xFilial("ZL8") + aEventos[e])
					
					//���������������������������������������������������������������������Ŀ
					//� Executa condicao do evento p/ rodar formula                         �
					//�����������������������������������������������������������������������                s� executa o evento do INSS por ultimo
					If ((&(ZL8->ZL8_CONDIC) .and. ZL8->ZL8_MSBLQL <> '1' .And. bContinue) .OR. lApagar ) //.and. !(ZL8->ZL8_COD == cCodINSS .and. (e == Len(aEventos)) )
						
						//���������������������������������������������������������������������Ŀ
						//� Executa formula                                                     �
						//�����������������������������������������������������������������������
						If !lApagar
							nForm := &(ZL8->ZL8_FORMUL)
						EndIf
						
						If Empty(nForm) .or. lApagar
							nForm := 0
						EndIf
						
						//���������������������������������������������������������������������Ŀ
						//� Restaura valor do ultimo Mix                                        �
						//�����������������������������������������������������������������������
						If lRest
							nForm:=U_GetTotEv(cFilIni,ZL8->ZL8_COD,ZL2->ZL2_COD,ZL3->ZL3_COD,SA2->A2_COD,SA2->A2_LOJA,GetUltMix(NumMix),cVersao)
						EndIf
						
						//���������������������������������������������������������������������Ŀ
						//� Se For Debito converte para positivo na gravacao                    �
						//�����������������������������������������������������������������������
						If ZL8->ZL8_DEBCRE == "D" .And. nForm < 0
							nForm := nForm*-1
						EndIf
						
						//���������������������������������������������������������������������Ŀ
						//� TRATAMENTO DO ADICIONAL DE MERCADO.                                 �
						//� Ele eh calculado depois de todas as bonificacoes, pois ele depende  �
						//� do valor das mesmas para ser gerado ou nao.                         �
						//� Se preenchido no cadastro do produtor o valor do Adicional, entao   �
						//� o sistema soma todas as bonificacoes, caso o valor das mesmas seja  �
						//� menor que o do Adicional no cadastro do produtor ele gera valor     �
						//� no evento de adicional para que o preco do produtor seja o mesmo do �
						//� do cadastro.                                                        �
						//� Nem todas as bonificacoes entram na base do adicional, como as de   �
						//� qualidade e Incentivo(ICMS).                                        �
						//�����������������������������������������������������������������������
						If ZL8->ZL8_COD == cEvetAdc .AND. &(ZL8->ZL8_CONDIC)
							nCrePro := U_GETCREDPR(NumMix,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,,.T.)
							nCrePro -= U_GetRedut(NumMix,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,,.T.)
							If (SA2->A2_L_ADICI - nCrePro) < 0
								nForm := 0
							Else
								nVolPro := _pnVLEITE //U_VLEITE()
								nForm   := (SA2->A2_L_ADICI-nCrePro) * nVolPro
							EndIf
						EndIf
						
						//����������������������������������������������������������������������Ŀ
						//� TRATAMENTO DO INCENTIVO A PRODUCAO                                   �
						//� O Incentivo tem que ser calculado depois de todas as bonificacoes    �
						//� Na sua base de calculo entram todos os creditos do produtor 		 �
						//������������������������������������������������������������������������
						If &(ZL8->ZL8_CONDIC) .And. ZL8->ZL8_COD == cEvetInc
							nForm := &(ZL8->ZL8_FORMUL)
						EndIf
						
						//�����������������������������������������������������������������������Ŀ
						//� Grava na ZLF - Se valor For zero deleta ZLF                           �
						//�                                                                       �
						//�O codigo fonte abaixo foi comentado e inserido logo abaixo passando    �
						//�as descricoes dos: setor, linha, produtor e evento, visto que na funcao�
						//�gEvtPrd se posiciona para pegar tais dados sem necessidade.            �
						//�������������������������������������������������������������������������
						If gEvtPrd(cFilIni,NumMix,cVersao,ZL2->ZL2_COD,ZL3->ZL3_COD,;
							ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
							SA2->A2_COD,SA2->A2_LOJA,nForm,ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,_cTributac)
							//nconta++
						EndIf
						
					EndIf
					
					// prox. evento
				Next e
				
				// prox. produtor
				TMPZLD->(dbSkip())
			EndDo
			TMPZLD->(dbCloseArea())
			
		EndIf
		
		// prox. linha
		dbSelectArea("ZL3")
		dbSkip()
	EndDo
	
	IncProc()
	
	// prox. setor
Next r

//������������������������������������������������������������������Ŀ
//� Tratamento para calcular o valor do Evento Adicional de Mercado. �
//��������������������������������������������������������������������
DEFINE FONT oFont NAME "Tahoma" BOLD
DEFINE MSDIALOG oDlgMsn FROM  00,00 TO 160,350 TITLE "Fechamento" PIXEL
@005,005 TO 55,170
@010,010 say "Operacao Concluida!" PIXEL OF oDlgMsn FONT oFont
If nConta > 0
	@025,010 say "Geracao de eventos executada com sucesso! " PIXEL OF oDlgMsn
	@040,010 say "Total de produtores processados: "+transform(nConta,"@E 999,999,999") PIXEL OF oDlgMsn
Else
	@025,010 say "Geracao de eventos executada!" PIXEL OF oDlgMsn
	@035,010 say "Porem nao foram encontrados registros de acordo com o filtro! " PIXEL OF oDlgMsn
	@045,010 say "(Verifique se o Status est� em Aberto!) " PIXEL OF oDlgMsn
EndIf
TButton():New(060,030, ' Ok ', oDlgMsn,{|| close(oDlgMsn) },100,10,,,,.T.)
ACTIVATE MSDIALOG oDlgMsn Centered

Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � UpdateTab   � Autor � TOTVS                 � Data da Criacao  � 27/11/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Atualiza dados das tabelas temporarias                                                 						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function UpdateTab(cTab,agp)

dbSelectArea(cTab)
ZAP
Processa ( {|| CriaTmp(cTab,agp,.F.),GravaTmp(cTab,agp) })

If cTab=="TRS"
	oBrowse1:Refresh()
ElseIf cTab=="TRL"
	oBrowse2:Refresh()
ElseIf cTab=="TRP"
	oBrowse3:Refresh()
ElseIf cTab=="TRF"
	oBrowse4:Refresh()
EndIf

Return
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GerEvts     � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra tela de geracao dos eventos na ZLF                                              						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
User Function GerEvts(cpFil,cDescricao)

Local aArea := GetArea()
Local oDlg
Local oGet01
Local oOK   := LoadBitmap(GetResources(),'LBOK')
Local oNO   := LoadBitmap(GetResources(),'LBNO')
Local oSim  := LoadBitmap(GetResources(),'BR_VERDE')
Local oNao  := LoadBitmap(GetResources(),'BR_VERMELHO')
Local cNMix := space(6)
Local bGet	:= .T.
Local cAux  :=""
Local aBrowEve:= {}
Local aSetors := {}
Local nTamFil := TamSx3("ZL2_FILIAL")[1]//Verifica se o campo filial tem tamanho dois ou quatro
Local _cFiltro := " .T. " //Filtro Adicional

If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_GEREVE") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf

//Indica que o usuario esta posicionado no totalizador, pois somente nesta linha a filial esta em branco
If 'TOTAL' $ Upper(cDescricao)
	xMagHelpFis("Informa��o","Voc� esta posicionado no totalizador.","Favor posicionar em uma linha do MIX que contenha dados do(a) grupo/produtor/fretista!")
	Return
EndIf

//If cpFil != cFilAnt
//	xMagHelpFis("Problema","A Filial atual � diferente da filial selecionada no MIX!","Altere a filial do sistema antes de entrar no MIX!")
//	Return
//EndIf

If xVisual
	xMagHelpFis("Nao permitido","Em modo Visualizar essa rotina nao pode ser executada!","Entre atraves da opcao Manutencao!")
	Return
EndIf

//���������������������������������������������������������������������Ŀ
//� Cria array com Eventos que poderao ser executados                   �
//�����������������������������������������������������������������������
dbSelectArea("ZL8")
dbSetOrder(1)
dbGoTop()


While ZL8->(!Eof()) .And. xFilial("ZL8") == ZL8->ZL8_FILIAL
	

	If FieldPos("ZL8_FILUSA") > 0 .and. !Empty(ZL8->ZL8_FILUSA)
	 	_cFiltro := " cFilAnt $ Alltrim(ZL8->ZL8_FILUSA) "
	Else
		_cFiltro := " .T. "
	EndIf

	//�����������������������������������������������������������������������Ŀ
	//� Se o tipo do evento eh leite ou Redutor e o evento entra no MIX=SIM e �
	//� o codigo do evento eh diferente de Evento de Adicional Mercado e      �
	//� o codigo do evento eh diferente de Evento de Incentivo (ICMS).        �
	//�������������������������������������������������������������������������
	
	//���������������������������������������������������������������������������������������������������������Ŀ
	//� A linha abaixo foi comentada pois pode ser necessario o lancamento de eventos que nao compoem           �
	//� o valor do leite mas sao necessarios para desconto na folha do leite.                                   �
	//�����������������������������������������������������������������������������������������������������������
	If (ZL8->ZL8_TPEVEN == "L" .Or. ZL8->ZL8_TPEVEN == "R") .And. ZL8->ZL8_MIX == "S" .And. ZL8->ZL8_COD <> cEvetAdc .And.;
	 ZL8->ZL8_COD <> cEvetInc .and. ZL8->ZL8_MSBLQL <> "1" .and. &_cFiltro
		
		//���������������������������������������������������������������������Ŀ
		//�Inserido para que os eventos referentes ao transportador que sejam   �
		//�lancados manualmente somente possom ser gerados manualmente,         �
		//�isto devido a tela de lancamentos de eventos manuais do fretista     �
		//�ter sido agrupada por fretista e nao mais por fretista e linha, pois �
		//�a pessoa poderia lancar um determinado evento manualmente e          �
		//�outro pela rotina de geracao de eventos, tendo dois eventos com      �
		//�o mesmo codigo lancados.                                             �
		//�����������������������������������������������������������������������
		/*
		If ZL8->ZL8_PERTEN == "G"
		If ZL8->ZL8_MODEDI != 'S'
		
		aAdd(aBrowEve,{.F.,Iif(ZL8->ZL8_ALTERA=="S",.T.,.F.),ZL8->ZL8_COD,ZL8->ZL8_DESCRI,ZL8->ZL8_VALOR,ZL8->ZL8_ORDENA})
		EndIf
		Else
		aAdd(aBrowEve,{.F.,Iif(ZL8->ZL8_ALTERA=="S",.T.,.F.),ZL8->ZL8_COD,ZL8->ZL8_DESCRI,ZL8->ZL8_VALOR,ZL8->ZL8_ORDENA})
		EndIf
		*/
		aAdd(aBrowEve,{.F.,Iif(ZL8->ZL8_ALTERA=="S",.T.,.F.),ZL8->ZL8_COD,ZL8->ZL8_DESCRI,ZL8->ZL8_VALOR})
		
	EndIf
	dbSkip()
EndDo

//����������������������������������������������������������������Ŀ
//�Inserido para efetuar uma ordem                                 �
//�de execucao logica dos eventos pelo campo ZL8_ORDENA, isto      �
//�para que eventos que tenham dependencia tenham seus valores     �
//�gerados corretamente.                                           �
//������������������������������������������������������������������
//aBrowEve:= aSort(aBrowEve,,,{|x,y| x[6] < y[6] })

//���������������������������������������������������������������������Ŀ
//� Cria array com Setores que poderao ser executados                   �
//�����������������������������������������������������������������������
cAux:=AllTrim(Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_SETOR"))
dbSelectArea("ZL2")
dbSetOrder(1)
dbSeek(xFilial("ZL2"))

While !ZL2->(Eof()) .AND. xFilial("ZL2") == ZL2->ZL2_FILIAL
	If nTamFil <= 2
		//Tratamento quando o cadastro de setor esta compartilhado
		If Empty(xFilial("ZL8"))
			If ZL2->ZL2_COD $ cAux
				aAdd(aSetors,{.T.,ZL2_COD,ZL2_DESCRI})
			EndIf
		ElseIf LEFT(ZL2_COD,2)==xFilial("ZL8")
			If ZL2->ZL2_COD $ cAux
				aAdd(aSetors,{.T.,ZL2_COD,ZL2_DESCRI})
			EndIf
		EndIf
	Else
		//Tratamento quando o cadastro de setor esta compartilhado entre filiais
		If Empty(AllTrim(SubStr(xFilial("ZL2"),5,2)))
			If ZL2->ZL2_COD $ cAux
				aAdd(aSetors,{.T.,ZL2_COD,ZL2_DESCRI})
			EndIf
		ElseIf SubStr(ZL2_COD,1,2) == AllTrim(SubStr(xFilial("ZL2"),5,2))
			If ZL2->ZL2_COD $ cAux
				aAdd(aSetors,{.T.,ZL2_COD,ZL2_DESCRI})
			EndIf
		EndIf
	EndIf
	ZL2->(dbSkip())
EndDo

//���������������������������������������������������������������������Ŀ
//� Se existir variavel NumMix deve-se bloquear o MSGET do Codigo do Mix�
//�����������������������������������������������������������������������
If type("NumMix") != "U"
	cNMix := NumMix
	bGet := .F.
EndIf

//���������������������������������������������������������������������Ŀ
//� Tela de geracao de eventos                                          �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlg FROM 0,0 TO 420,415 PIXEL TITLE 'Geracao de Eventos'
@003,001 TO 020,210
@007,005 say "Mix: " Pixel Of oDlg
@005.5,017 MsGet oGet01  Var cNMix F3 "ZLE_01" WHEN bGet Pixel Of oDlg
@007,055 say "Filial: " + cFilAnt + "-" + SM0->M0_FILIAL  Pixel Of oDlg

//���������������������������������������������������������������������Ŀ
//� Browse dos Eventos da Geracao de Eventos                            �
//�����������������������������������������������������������������������
oBrowse := VCBrowse():New(23,01,210,80,,{'','','Codigo','Evento','Valor'},{10,20,30,20,10}, oDlg, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
oBrowse:SetArray(aBrowEve)

If len(aBrowEve) > 0
	oBrowse:bLine := {||{If(aBrowEve[oBrowse:nAt,01],oOK,oNO),If(aBrowEve[oBrowse:nAt,02],oSim,oNao),aBrowEve[oBrowse:nAt,03],aBrowEve[oBrowse:nAt,04],aBrowEve[oBrowse:nAt,05] } }
	oBrowse:bLDblClick := {|| aBrowEve[oBrowse:nAt][1] := !aBrowEve[oBrowse:nAt][1],oBrowse:DrawSelect()}
EndIf

//���������������������������������������������������������������������Ŀ
//� Browse dos Setores da Geracao de Eventos                            �
//�����������������������������������������������������������������������
oBrT := VCBrowse():New(110,001,210,70,,{'','Codigo','Setor'},{20,30,30}, oDlg, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
oBrT:SetArray(aSetors)
If len(aSetors) > 0
	oBrT:bLine := {||{If(aSetors[oBrT:nAt,01],oOK,oNO),aSetors[oBrT:nAt,02],aSetors[oBrT:nAt,03] } }
	oBrT:bLDblClick := {|| aSetors[oBrT:nAt][1] := !aSetors[oBrT:nAt][1],oBrT:DrawSelect()}
EndIf

//���������������������������������������������������������������������Ŀ
//� Botoes da Geracao de Eventos                                        �
//�����������������������������������������������������������������������
TButton():New(185,005, 'Confirmar', oDlg,{|| Processa({|| RunFormulas(aSetors,aBrowEve,cNMix,"",.T.) }) },40,10,,,,.T.)
TButton():New(185,095, 'Alterar Valor', oDlg,{|| Iif(aBrowEve[oBrowse:nAt][2],lEditCell(@aBrowEve,oBrowse,'@E 9,999.9999',5),) },40,10,,,,.T.)
TButton():New(185,050, 'Ver Evento', oDlg,{|| ShowEvento(aBrowEve[oBrowse:nAt][3]) },40,10,,,,.T.)
TButton():New(185,140, 'Evet Marc/Desm', oDlg,{|| fMarkAll(@aBrowEve),oBrowse:DrawSelect()},40,10,,,,.T.)
TButton():New(198,005, 'Fechar', oDlg,{|| Close(oDlg) },40,10,,,,.T.)
TButton():New(198,050, 'Apagar', oDlg,{|| Processa({|| RunFormulas(aSetors,aBrowEve,cNMix,"Apagar",.T.) }) },40,10,,,,.T.)
TButton():New(198,095, 'Restaurar', oDlg,{|| Processa({|| RunFormulas(aSetors,aBrowEve,cNMix,"Restaurar",.T.) }) },40,10,,,,.T.)
TButton():New(198,140, 'Setor Marc/Des', oDlg,{|| fMarkAll(@aSetors),oBrT:DrawSelect()},40,10,,,,.T.)

ACTIVATE MSDIALOG oDlg CENTERED

RestArea(aArea)

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � editLin     � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra tela de edicao das linhas dos produtores no Mix                                 						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Agrupa , Tipo                                                                        						���
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

Static Function editLin(group,tp,mostraLtr,cDescricao)


Local _nOrdTRP  := TRP->(IndexOrd())
Local _nRecTRP  := TRP->(Recno())

Local _aAreaGr	:= {}
Local _nLin   	:= 1
Local nLin    	:= 30
Local nPos1   	:= 5
Local nPos2   	:= 40
Local nPos3   	:= 120
Local ncont   	:= 1
Local nTit01,nTit02,nTit03,nTit04,nTit05,nTit06,nTit07,nTit08,nTit09,nTit10,nTit11,nTit12,nTit13,nTit14,nTit15:=0
Local oGet01,oGet02,oGet03,oGet04,oGet05,oGet06,oGet07,oGet08,oGet09,oGet10,oGet11,oGet12,oGet13,oGet14,oGet15
Local oTot01,oTot02,oTot03,oTot04,oTot05,oTot06,oTot07,oTot08,oTot09,oTot10,oTot11,oTot12,oTot13,oTot14,oTot15

Private cCmp01,cCmp02,cCmp03,cCmp04,cCmp05,cCmp06,cCmp07,cCmp08,cCmp09,cCmp10,cCmp11,cCmp12,cCmp13,cCmp14,cCmp15
Private oTit01,oTit02,oTit03,oTit04,oTit05,oTit06,oTit07,oTit08,oTit09,oTit10,oTit11,oTit12,oTit13,oTit14,oTit15
Private nLtr01,nLtr02,nLtr03,nLtr04,nLtr05,nLtr06,nLtr07,nLtr08,nLtr09,nLtr10,nLtr11,nLtr12,nLtr13,nLtr14,nLtr15:=0
Private bPer01,bPer02,bPer03,bPer04,bPer05,bPer06,bPer07,bPer08,bPer09,bPer10,bPer11,bPer12,bPer13,bPer14,bPer15
Private nTot01,nTot02,nTot03,nTot04,nTot05,nTot06,nTot07,nTot08,nTot09,nTot10,nTot11,nTot12,nTot13,nTot14,nTot15:=0
Private nPosInc, nPosAdc
Private nMaxTots:= 15
Private nVlrMix := 0
Private nVlrTot := 0
Private nTotBas := 0
Private oGetMix

Private _aEventAux:= {}

If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_GEREVE") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf

If 'TOTAL' $ Upper(cDescricao)
	xMagHelpFis("Informa��o","Voc� esta posicionado no totalizador.","Favor posicionar em um produtor para efetuar a edi��o de seus eventos.")
	Return
EndIf

If (group .or. tp != 2)
	xMagHelpFis("Nao permitido","Edicao s� � permitida em modo detalhado de eventos e manutencao!","Saia do Mix e entre novamente pela opcao Manutencao detalhando os eventos!")
	Return
EndIf

If !MostraLtr
	xMagHelpFis("Nao permitido","Edicao s� � permitida em modo valor por litro!","Saia do Mix e entre novamente mostrando valores por litro!")
	Return
EndIf
/*
If  TRP->TRP_FILIAL != cFilAnt
xMagHelpFis("Filial","A Filial do sistema � diferente da filial do setor atual.","Altere a filial do sistema.")
Return
EndIf
*/
_aAreaGr:= GetArea()

/*
//��������������������������������������������������������������������Ŀ
//�                                                                    �
//�Verificar nos eventos manuais quais destes pertencem aos produtores.�
//����������������������������������������������������������������������
*/
For _nLin:=1 To Len(aStruct2)
	
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	If ZL8->(dbSeek(xFilial("ZL8") + aStruct2[_nLin,5]))
		
		//If ZL8->ZL8_MODEDI == 'S' .And. (ZL8->ZL8_PERTEN == 'C')		
		If ZL8->ZL8_PERTEN == 'P'
			
			aAdd(_aEventAux,{aStruct2[_nLin,1],;
			aStruct2[_nLin,2],;
			aStruct2[_nLin,3],;
			aStruct2[_nLin,4],;
			aStruct2[_nLin,5],;
			aStruct2[_nLin,6]})
		EndIf
		
	EndIf
	
Next _nLin

restArea(_aAreaGr)

If Len(_aEventAux) == 0
	
	xMagHelpFis("INFORMA��O",;
	"N�o existem eventos cadastrados para efetuar o lan�amento manual.",;
	"Favor comunicar ao responsavel do m�dulo do leite.")
	Return
	
EndIf

//���������������������������������������������������������������������Ŀ
//� Tela de edicao                                                      �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlgEdit FROM 0,0 TO 350,450 PIXEL TITLE 'TELA PARA EDI��O DE EVENTOS'

@ 05,05 TO 023,215
//@ 25,127 TO 085,210
@ 25,05 TO 085,210

@ 10,nPos1 + 05 say "Produtor:" Pixel Of oDlgEdit
@ 10,nPos2 		say LEFT(TRP->TRP_DESCRI,30) Pixel Of  oDlgEdit
@ 10,nPos3 		say TRANSFORM(TRP->TRP_VOL,"@E 999,999,999") + " Litros" Pixel Of  oDlgEdit

oScroll:= TScrollBox():New(oDlgEdit,25,05,125,210,.T.,.F.,.T.)

@ 005,nPos1 Say "Evento" Pixel Of oScroll
@ 005,nPos2 Say "Valor por Litro" Pixel Of oScroll
@ 005,nPos3 Say "Valor Total" Pixel Of oScroll



//���������������������������������������������������������������������Ŀ
//� Criando objetos de MSGET para cada campo dinamico (evento)          �
//�����������������������������������������������������������������������
nLin:=15
If ncont<=len(_aEventAux)
	oTit01 := _aEventAux[ncont,6]
	nLtr01 := &(_aEventAux[ncont,1])
	cCmp01 := _aEventAux[ncont,1]
	bPer01 := Permi_(_aEventAux[ncont,5])
	nTot01 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot01 := &(cCmp01)*TRP->TRP_VOL
	//nLtr01 := nTot01/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit01 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet01 Var nLtr01 PICTURE "@E 999,999.9999" WHEN bPer01 Pixel Of oScroll VALID {|| rCalcTot("L",1),rCalcTot("T",1)}
	@ nLin,nPos3 MsGet oTot01 Var nTot01 PICTURE "@E 9,999,999.99"   WHEN bPer01 SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",1)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit02 := _aEventAux[ncont,6]
	nLtr02 := &(_aEventAux[ncont,1])
	cCmp02 := _aEventAux[ncont,1]
	bPer02 := Permi_(_aEventAux[ncont,5])
	nTot02 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot02 := &(cCmp02)*TRP->TRP_VOL
	//nLtr02 := nTot02/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit02 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet02 Var nLtr02 PICTURE "@E 999,999.9999" WHEN bPer02 Pixel Of oScroll VALID {|| rCalcTot("L",2),rCalcTot("T",2)}
	@ nLin,nPos3 MsGet oTot02 Var nTot02 PICTURE "@E 9,999,999.99"   WHEN bPer02  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",2)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit03 := _aEventAux[ncont,6]
	nLtr03 := &(_aEventAux[ncont,1])
	cCmp03 := _aEventAux[ncont,1]
	bPer03 := Permi_(_aEventAux[ncont,5])
	nTot03 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot03 := &(cCmp03)*TRP->TRP_VOL
	//nLtr03 := nTot03/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit03 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet03 Var nLtr03 PICTURE "@E 999,999.9999" WHEN bPer03 Pixel Of oScroll VALID {|| rCalcTot("L",3),rCalcTot("T",3)}
	@ nLin,nPos3 MsGet oTot03 Var nTot03 PICTURE "@E 9,999,999.99"   WHEN bPer03  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",3)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit04 := _aEventAux[ncont,6]
	nLtr04 := &(_aEventAux[ncont,1])
	cCmp04 := _aEventAux[ncont,1]
	bPer04 := Permi_(_aEventAux[ncont,5])
	nTot04 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot04 := &(cCmp04)*TRP->TRP_VOL
	//nLtr04 := nTot04/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit04 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet04 Var nLtr04 PICTURE "@E 999,999.9999" WHEN bPer04 Pixel Of oScroll VALID {|| rCalcTot("L",4),rCalcTot("T",4)}
	@ nLin,nPos3 MsGet oTot04 Var nTot04 PICTURE "@E 9,999,999.99"   WHEN bPer04  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",4)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit05 := _aEventAux[ncont,6]
	nLtr05 := &(_aEventAux[ncont,1])
	cCmp05 := _aEventAux[ncont,1]
	bPer05 := Permi_(_aEventAux[ncont,5])
	nTot05 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot05 := &(cCmp05)*TRP->TRP_VOL
	//nLtr05 := nTot05/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit05 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet05 Var nLtr05 PICTURE "@E 999,999.9999" WHEN bPer05 Pixel Of oScroll VALID {|| rCalcTot("L",5),rCalcTot("T",5)}
	@ nLin,nPos3 MsGet oTot05 Var nTot05 PICTURE "@E 9,999,999.99"   WHEN bPer05  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",5)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit06 := _aEventAux[ncont,6]
	nLtr06 := &(_aEventAux[ncont,1])
	cCmp06 := _aEventAux[ncont,1]
	bPer06 := Permi_(_aEventAux[ncont,5])
	nTot06 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot06 := &(cCmp06)*TRP->TRP_VOL
	//nLtr06 := nTot06/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit06 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet06 Var nLtr06 PICTURE "@E 999,999.9999" WHEN bPer06 Pixel Of oScroll VALID {|| rCalcTot("L",6),rCalcTot("T",6)}
	@ nLin,nPos3 MsGet oTot06 Var nTot06 PICTURE "@E 9,999,999.99"   WHEN bPer06  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",6)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit07 := _aEventAux[ncont,6]
	nLtr07 := &(_aEventAux[ncont,1])
	cCmp07 := _aEventAux[ncont,1]
	bPer07 := Permi_(_aEventAux[ncont,5])
	nTot07 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot07 := &(cCmp07)*TRP->TRP_VOL
	//nLtr07 := nTot07/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit07 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet07 Var nLtr07 PICTURE "@E 999,999.9999" WHEN bPer07 Pixel Of oScroll VALID {|| rCalcTot("L",7),,rCalcTot("T",7)}
	@ nLin,nPos3 MsGet oTot07 Var nTot07 PICTURE "@E 9,999,999.99"   WHEN bPer07  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",7)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit08 := _aEventAux[ncont,6]
	nLtr08 := &(_aEventAux[ncont,1])
	cCmp08 := _aEventAux[ncont,1]
	bPer08 := Permi_(_aEventAux[ncont,5])
	nTot08 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot08 := &(cCmp08)*TRP->TRP_VOL
	//nLtr08 := nTot08/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit08 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet08 Var nLtr08 PICTURE "@E 999,999.9999" WHEN bPer08 Pixel Of oScroll VALID {|| rCalcTot("L",8),rCalcTot("T",8)}
	@ nLin,nPos3 MsGet oTot08 Var nTot08 PICTURE "@E 9,999,999.99"   WHEN bPer08  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",8)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit09 := _aEventAux[ncont,6]
	nLtr09 := &(_aEventAux[ncont,1])
	cCmp09 := _aEventAux[ncont,1]
	bPer09 := Permi_(_aEventAux[ncont,5])
	nTot09 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot09 := &(cCmp09)*TRP->TRP_VOL
	//nLtr09 := nTot09/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit09 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet09 Var nLtr09 PICTURE "@E 999,999.9999" WHEN bPer09 Pixel Of oScroll VALID {|| rCalcTot("L",9),rCalcTot("T",9)}
	@ nLin,nPos3 MsGet oTot09 Var nTot09 PICTURE "@E 9,999,999.99"   WHEN bPer09  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",9)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit10 := _aEventAux[ncont,6]
	nLtr10 := &(_aEventAux[ncont,1])
	cCmp10 := _aEventAux[ncont,1]
	bPer10 := Permi_(_aEventAux[ncont,5])
	nTot10 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot10 := &(cCmp10)*TRP->TRP_VOL
	//nLtr10 := nTot10/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit10 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet10 Var nLtr10 PICTURE "@E 999,999.9999" WHEN bPer10 Pixel Of oScroll VALID {|| rCalcTot("L",10),rCalcTot("T",10)}
	@ nLin,nPos3 MsGet oTot10 Var nTot10 PICTURE "@E 9,999,999.99"   WHEN bPer10  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",10)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit11 := _aEventAux[ncont,6]
	nLtr11 := &(_aEventAux[ncont,1])
	cCmp11 := _aEventAux[ncont,1]
	bPer11 := Permi_(_aEventAux[ncont,5])
	nTot11 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot11 := &(cCmp11)*TRP->TRP_VOL
	//nLtr11 := nTot11/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit11 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet11 Var nLtr11 PICTURE "@E 999,999.9999" WHEN bPer11 Pixel Of oScroll VALID {|| rCalcTot("L",11),rCalcTot("T",11)}
	@ nLin,nPos3 MsGet oTot11 Var nTot11 PICTURE "@E 9,999,999.99"   WHEN bPer11  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",11)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit12 := _aEventAux[ncont,6]
	nLtr12 := &(_aEventAux[ncont,1])
	cCmp12 := _aEventAux[ncont,1]
	bPer12 := Permi_(_aEventAux[ncont,5])
	nTot12 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot12 := &(cCmp12)*TRP->TRP_VOL
	//nLtr12 := nTot12/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit12 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet12 Var nLtr12 PICTURE "@E 999,999.9999" WHEN bPer12 Pixel Of oScroll VALID {|| rCalcTot("L",12),rCalcTot("T",12)}
	@ nLin,nPos3 MsGet oTot12 Var nTot12 PICTURE "@E 9,999,999.99"   WHEN bPer12  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",12)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit13 := _aEventAux[ncont,6]
	nLtr13 := &(_aEventAux[ncont,1])
	cCmp13 := _aEventAux[ncont,1]
	bPer13 := Permi_(_aEventAux[ncont,5])
	nTot13 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot13 := &(cCmp13)*TRP->TRP_VOL
	//nLtr13 := nTot13/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit13 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet13 Var nLtr13 PICTURE "@E 999,999.9999" WHEN bPer13 Pixel Of oScroll VALID {|| rCalcTot("L",13),rCalcTot("T",13)}
	@ nLin,nPos3 MsGet oTot13 Var nTot13 PICTURE "@E 9,999,999.99"   WHEN bPer13  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",13)}
	nLin += 13
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit14 := _aEventAux[ncont,6]
	nLtr14 := &(_aEventAux[ncont,1])
	cCmp14 := _aEventAux[ncont,1]
	bPer14 := Permi_(_aEventAux[ncont,5])
	nTot14 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot14 := &(cCmp14)*TRP->TRP_VOL
	//nLtr14 := nTot14/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit14 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet14 Var nLtr14 PICTURE "@E 999,999.9999" WHEN bPer14 Pixel Of oScroll VALID {|| rCalcTot("L",14),rCalcTot("T",14)}
	@ nLin,nPos3 MsGet oTot14 Var nTot14 PICTURE "@E 9,999,999.99"   WHEN bPer14  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",14)}
	nLin += 14
EndIf
ncont++
If ncont<=len(_aEventAux)
	oTit15 := _aEventAux[ncont,6]
	nLtr15 := &(_aEventAux[ncont,1])
	cCmp15 := _aEventAux[ncont,1]
	bPer15 := Permi_(_aEventAux[ncont,5])
	nTot15 := U_GetTotEv(TRP->TRP_FILIAL,_aEventAux[ncont,5],cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	//nTot15 := &(cCmp15)*TRP->TRP_VOL
	//nLtr15 := nTot15/TRP->TRP_VOL
	@ nLin,nPos1 Say   oTit15 Pixel Of oScroll
	@ nLin,nPos2 MsGet oGet15 Var nLtr15 PICTURE "@E 999,999.9999" WHEN bPer15 Pixel Of oScroll VALID {|| rCalcTot("L",15),rCalcTot("T",15)}
	@ nLin,nPos3 MsGet oTot15 Var nTot15 PICTURE "@E 9,999,999.99"   WHEN bPer15  SIZE 50,7 Pixel Of oScroll VALID {|| rCalcTot("T",15)}
	nLin += 15
EndIf
ncont++

@ 160,005 BMPBUTTON TYPE 01 ACTION Processa({|| close(oDlgEdit),SaveRec(),oDlg3:Refresh() })
@ 160,035 BMPBUTTON TYPE 02 ACTION close(oDlgEdit)
//@ 162,120 Say "MIX Atual:" Pixel Of oDlgEdit
//@ 160,160 MsGet oGetMix Var nVlrMix PICTURE "@E 999,9999.9999" WHEN .F. Pixel Of oDlgEdit

ACTIVATE MSDIALOG oDlgEdit CENTERED

/*
//����������������������������������������������������������������������������Ŀ
//�Quando o usuario confirmar a realizacao de insercao manual                  �
//�de algum evento o grid do produtor eh recriado para que os eventos          �
//�manuais tenham seus valores inseridos desta forma eh necessario             �
//�efetuar o reposicionamento na linha que estava posicionada anteriormente ao �
//�lancamento.                                                                 �
//������������������������������������������������������������������������������
*/
dbSelectArea("TRP")
TRP->(dbSetOrder(_nOrdTRP))
TRP->(dbGoTo(_nRecTRP))
oDlg3:Refresh()
oBrowse3:Refresh()

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � rCalcTot    � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Atualiza calculos do registro do produtor na tabela TRS                                						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function rCalcTot(cTipo,nPos)

Local aArea   := GetArea()
Local aAreaTRP:= TRP->(GetArea())
Local nBasAdc := 0
Local nVlrAdc := 0
Local nCrePro := 0
Local nX      := 0
Local nPosAdc := 0
Local nPosInc := 0

Default cTipo := ""
Default nPos  := 0

//����������������������������������������������������������������������
//� Zera as variaveis privadas.                                        �
//����������������������������������������������������������������������
nVlrMix := 0
nVlrTot := 0
nTotBas := 0

//����������������������������������������������������������������������
//� Se o usuario alterou o campo Litro, entao recalcula o valor total. �
//����������������������������������������������������������������������
If cTipo == "L"
	
	&("nTot"+strzero(nPos,2)) := &("nLtr"+strzero(nPos,2)) * TRP->TRP_VOL
	
	//�����������������������������������������������������������������������������������
	//� Senao o usuario alterou o campo Valor Total, entao recalcula o valor por Litro. �
	//�����������������������������������������������������������������������������������
	
ElseIf cTipo == "T"
	
	&("nLtr"+strzero(nPos,2)) := &("nTot"+strzero(nPos,2)) / TRP->TRP_VOL
EndIf

/*
//�����������������������������������������������������������������������������������������������������������������Ŀ
//�Calcula a 1a vez sem o Incentivo e Adicional de Mercado, porque eles sao calculados com base nos outros eventos. �
//�������������������������������������������������������������������������������������������������������������������
For nX:=1 To nMaxTots
If !Empty(&("nTot"+strzero(nX,2)))

//����������������������������������������������������������������������������������������Ŀ
//� Este If serve como flag da variavel nPosAdc, so deve alterar o valor da mesma uma vez. �
//� Essa variavel armazena a posicao do campo que contem o valor do evento de Adicional.   �
//������������������������������������������������������������������������������������������
If nPosAdc == 0
nPosAdc := If(aStruct2[nX,5]==cEvetAdc,nX,0)//Identifica a posicao com o valor do Adicional Mercado
EndIf

//����������������������������������������������������������������������������������������Ŀ
//� Este If serve como flag da variavel nPosInc, so deve alterar o valor da mesma uma vez. �
//� Essa variavel armazena a posicao do campo que contem o valor do evento de Incentivo.   �
//������������������������������������������������������������������������������������������
If nPosInc == 0
nPosInc := If(aStruct2[nX,5]==cEvetInc,nX,0)//Identifica a posicao com o valor do Incentivo(ICMS)
EndIf

dbSelectArea("ZL8")
dbSetOrder(1)
If dbSeek(xFilial("ZL8")+aStruct2[nX,5])
If ZL8->ZL8_MIX == "S" .And. ZL8->ZL8_DEBCRE == "C"

//��������������������������������������������������������������������������������������������������Ŀ
//� Tratamento para nao somar ao MIX.ATUAL o frete e falta de leite e Incentivo.                     �
//����������������������������������������������������������������������������������������������������
If (ZL8->ZL8_COD <> cEvetFrt .And. ZL8->ZL8_COD <> cEvetFal .And. ZL8->ZL8_COD <> cEvetInc)

nTotBas+=&("nTot"+strzero(nX,2))

//Base do Adicional Mercado
If ZL8->ZL8_BASADI == "S" .And. ZL8->ZL8_COD <> cEvetAdc
nBasAdc+=&("nTot"+strzero(nX,2))
EndIf
EndIf
EndIf
EndIf
EndIf
Next nX

//���������������������������������������������������������������������Ŀ
//� POSICIONA NO SA2 - CADASTRO DE PRODUTOR.                            �
//�����������������������������������������������������������������������
dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFilial("SA2")+TRP->TRP_COD+TRP->TRP_LOJA)

//���������������������������������������������������������������������Ŀ
//� TRATAMENTO DO ADICIONAL DE MERCADO.                                 �
//� Ele eh calculado depois de todas as bonificacoes, pois ele depende  �
//� do valor das mesmas para ser gerado ou nao.                         �
//� Se preenchido no cadastro do produtor o valor do Adicional, entao   �
//� o sistema soma todas as bonificacoes, caso o valor das mesmas seja  �
//� menor que o do Adicional no cadastro do produtor ele gera valor     �
//� no evento de adicional para que o preco do produtor seja o mesmo do �
//� do cadastro.                                                        �
//� Nem todas as bonificacoes entram na base do adicional, como as de   �
//� qualidade e Incentivo(ICMS).                                        �
//�����������������������������������������������������������������������
If !Empty(nPosAdc)
nCrePro := SA2->A2_L_ADICI - (nBasAdc/TRP->TRP_VOL)
If (nCrePro) < 0
&("nLtr"+strzero(nPosAdc,2)) := 0
&("nTot"+strzero(nPosAdc,2)) := 0
Else
&("nLtr"+strzero(nPosAdc,2)) := nCrePro
&("nTot"+strzero(nPosAdc,2)) := nCrePro*TRP->TRP_VOL
EndIf
EndIf

//���������������������������������������������������������������������Ŀ
//� TRATAMENTO DO INCENTIVO ICMS.                                       �
//� O Incentivo tem que ser calculado depois de todas as bonificacoes   �
//� inclusive do Adicional de Mercado.                                  �
//� Na sua base de calculo entram todos os creditos do produtor.        �
//�����������������������������������������������������������������������
If !Empty(nPosInc)
//&("nTot"+strzero(nPosInc,2)) := (nTotBas * (IF(SA2->A2_L_ICMS=="S",U_GETFAIXA(xFilial("ZL9"),"000001","000006",U_VLEITE("","","N")),U_GETFAIXA(xFilial("ZL9"),"000001","000007",U_VLEITE("","","N")))/100))
&("nTot"+strzero(nPosInc,2)) := U_VLRINCENT(NumMix,SA2->A2_COD,SA2->A2_LOJA,cSetIni,cLinIni," ",nTotBas)
&("nLtr"+strzero(nPosInc,2)) := &("nTot"+strzero(nPosInc,2)) / TRP->TRP_VOL
EndIf

//����������������������������������������������������������Ŀ
//� Calcula a 2a vez com o Incentivo e Adicional de Mercado. �
//������������������������������������������������������������
nVlrTot := 0
nTotBas := 0
For nX:=1 To nMaxTots
If !Empty(&("nTot"+strzero(nX,2)))

nVlrTot+=&("nTot"+strzero(nX,2))

dbSelectArea("ZL8")
dbSetOrder(1)
If dbSeek(xFilial("ZL8")+aStruct2[nX,5])
If ZL8_MIX == "S" .And. ZL8_DEBCRE == "C"
//��������������������������������������������������������������������������������������������������Ŀ
//� Tratamento para nao somar ao MIX.ATUAL o frete e falta de leite.                                 �
//����������������������������������������������������������������������������������������������������
If (ZL8->ZL8_COD <> cEvetFrt .And. ZL8->ZL8_COD <> cEvetFal)
nTotBas+=&("nTot"+strzero(nX,2))
EndIf
EndIf
EndIf
EndIf
Next nX

//��������������������������������������������������������������������������������������������������Ŀ
//� Calcula o valor das penalizacoes da qualidade para descontar do valor do MIX.Atual.              �
//����������������������������������������������������������������������������������������������������
nValQua := U_GetTotDeb(cFilIni,cSetIni,cLinIni,SA2->A2_COD,SA2->A2_LOJA,NumMix,cVersao)
nTotQua := nValQua / TRP->TRP_VOL

nVlrMix := (nTotBas / TRP->TRP_VOL) - nTotQua
oGetMix:Refresh()
*/

RestArea(aArea)
RestArea(aAreaTRP)

Return(.T.)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � SaveRec     � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Salva alteracao do registro do produtor na edicao do mesmo                             						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function SaveRec()

Local aArea     := GetArea()
Local nTotal    := 0
Local nVlrLtr   := 0
Local xCont     := 1
Local bAux      := .F.
Local xCmpo     := ""
Local nValIns   := 0
Local nTotIns   := 0
Local nValQua   := 0
Local nTotQua   := 0
Local _cFiltro  := ""
Local _cAlias   := ""
Local _nNumReg  := 0
Local _nCont    := 1
Local _nTotLeite:= 0
Local _nVlrEveTr:= 0
Local _nVlrRest := 0
Local _nVlrInc  := 0
Local _nVlrAlter := 0

//�����������������������������������Ŀ
//�Define filtros para a query abaixo.�
//�������������������������������������
_cFiltro := "%"
_cFiltro += " AND ZLD.ZLD_FILIAL = '" + xFilial("ZLD")+ "'"
_cFiltro += " AND ZLD.ZLD_SETOR = '"  + cSetIni       + "'"
//_cFiltro += " AND ZLD.ZLD_LINROT = '" + cLinIni       + "'"
_cFiltro += " AND ZLD.ZLD_GRPRC = '" + cLinIni       + "'"
_cFiltro += " AND ZLD.ZLD_RETIRO = '" + TRP->TRP_COD  + "'"
_cFiltro += " AND ZLD.ZLD_RETILJ = '" + TRP->TRP_LOJA + "'"
_cFiltro += " AND ZLD.ZLD_DTCOLE BETWEEN '" + DtoS(dt1) + "' AND '" + DtoS(dt2) + "'"
_cFiltro += "%"

//����������������������������������������������������������������������
//�Query para selecionar o tipo de tributacao do leite que existe para �
//�o cooperado, pois os eventos devem ser armazenados ja para o devido �
//�tipo de tributacao do leite.                                        �
//����������������������������������������������������������������������
_cAlias:= GetNextAlias()

BeginSql alias _cAlias
	SELECT
	SUM(ZLD_QTDBOM) QTDLEITE,
	MAX(SA2.A2_NOME) DESCPROD,
	MAX(ZL2.ZL2_DESCRI) DESCSETOR,
	MAX(ZL3.ZL3_DESCRI) DESCLINHA,
	ZLD_TRIBUT
	FROM
	%Table:ZLD% ZLD
	JOIN %Table:SA2% SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ  AND SA2.%NotDel% 	AND SA2.A2_L_ASMIX <> 'N'
	JOIN %Table:ZL2% ZL2 ON ZL2.ZL2_FILIAL = ZLD.ZLD_FILIAL AND ZL2.ZL2_COD = ZLD.ZLD_SETOR  AND ZL2.%NotDel%
	JOIN %Table:ZL3% ZL3 ON ZL3.ZL3_FILIAL = %xFilial:ZL3% AND ZL3.ZL3_COD = ZLD.ZLD_GRPRC AND ZL3.%NotDel%
	WHERE
	ZLD.%NotDel%
	%Exp:_cFiltro%
	GROUP BY
	ZLD_TRIBUT
	HAVING (SUM(ZLD_QTDBOM) > 0)
EndSql

//�����������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
//�Efetua o somatorio geral do leite para efetuar proporcao posteriormente para encontrar o valor do evento de acordo com o tipo de tributacao do leite.�
//�������������������������������������������������������������������������������������������������������������������������������������������������������
dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

While !(_cAlias)->(Eof())
	
	_nTotLeite += (_cAlias)->QTDLEITE
	
	(_cAlias)->(dbSkip())
EndDo

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

//����������������������������������������������������������������������������������������Ŀ
//�Armazena o numero de registros encontrados, este numero                                 �
//�sera utilizado posteriormente no calculo para determinar a proporcao do valor do evento.�
//������������������������������������������������������������������������������������������
COUNT TO _nNumReg

ProcRegua(nMaxTots)

_nVlrAlter := 0
While xCont<= nMaxTots .And. xCont <= Len(_aEventAux)
	
	IncProc()
	
	bAux   := &("bPer"+strzero(xCont,2))
	nTotal := &("nTot"+strzero(xCont,2))
	nVlrLtr:= &("nLtr"+strzero(xCont,2))
	xCmpo  := &("cCmp"+strzero(xCont,2))
	
	//����������������������������������������������������������������������Ŀ
	//� Se o campo nao eh editado pelo usuario entao nao tem porque regravar �
	//� a ZLF, com excessao do Incentivo e do Adicional Mercado que nao sao  �
	//� editaveis, porem sao alterados automaticamente pelo sistema quando   �
	//� alterado algum outro campo que eh editavel.                          �
	//������������������������������������������������������������������������
	dbSelectArea("ZLF")
	dbSetOrder(3) // ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_TRIBUT
	dbGoTop()
	If dbSeek(cFilIni+NumMix+cVersao+cSetIni+cLinIni+_aEventAux[xCont,5]+TRP->TRP_COD+TRP->TRP_LOJA)
   		bAux := (nVlrLtr <> ZLF->ZLF_VLRLTR)
    EndIf
    If _aEventAux[xCont,5] <> cCodINSS
    	_nVlrAlter += nTotal
    EndIf
	If bAux //.Or. aStruct2[xCont,5] == cEvetInc .Or. aStruct2[xCont,5] == cEvetAdc
		
		//posiciona no Evento
		dbSelectArea("ZL8")
		ZL8->(dbSetOrder(1))
		//If dbSeek(cFilIni+aStruct2[xCont,5])
		If ZL8->(dbSeek(xFilial("ZL8") + _aEventAux[xCont,5]))
			
			//���������������������������������������������������������������������Ŀ
			//� Se For Debito converte para positivo na gravacao                    �
			//�����������������������������������������������������������������������
			If ZL8->ZL8_DEBCRE == "D" .And. nTotal < 0
				nTotal := nTotal*-1
			EndIf
			
			//���������������������������������������������������������������������Ŀ
			//� Grava no arquivo temporario os valores digitados na tela (TRP).     �
			//�����������������������������������������������������������������������
			//TRP->&xCmpo := nVlrLtr
			
			//�������������������������������������������������������������Ŀ
			//� Efetua proporcao do valor do evento digitado de acordo com  �
			//� o tipo de tributacao do leite.                              �
			//���������������������������������������������������������������
			_nVlrRest:= nTotal
			_nCont   := 1
			
			dbSelectArea(_cAlias)
			(_cAlias)->(dbGoTop())
			
			While !(_cAlias)->(Eof())
				
				If _nCont <>  _nNumReg
					
					_nVlrEveTr:= ((_cAlias)->QTDLEITE / _nTotLeite) * nTotal
					_nVlrRest := _nVlrRest - _nVlrEveTr
					
				Else
					
					_nVlrEveTr:= _nVlrRest
					
				EndIf
				
				//���������������������������������������������������������������������Ŀ
				//� Grava na ZLF o valor do envento por tipo de tributacao do leite.    �
				//�����������������������������������������������������������������������
				gEvtPrd(cFilIni,NumMix,cVersao,cSetIni,cLinIni,;
				ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
				TRP->TRP_COD,TRP->TRP_LOJA,_nVlrEveTr,;
				(_cAlias)->DESCSETOR,(_cAlias)->DESCLINHA,(_cAlias)->DESCPROD,ZL8->ZL8_NREDUZ,(_cAlias)->ZLD_TRIBUT)
				
				_nCont++
				
				(_cAlias)->(dbSkip())
			EndDo
			
		EndIf
	EndIf
	
	xCont++
EndDo

//������������������������������������������������������������Ŀ
//� Adicionado para efetuar o recalculo do                     �
//� adicional de mercado apos alteracao manual efetuada.       �
//��������������������������������������������������������������
If !Empty(cEvetAdc)
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	If ZL8->(dbSeek(xFilial("ZL8") + cEvetAdc))
		//dbSelectArea(_cAlias)
		//(_cAlias)->(dbGoTop())
	
		dbSelectArea("SA2")
		SA2->(dbSetOrder(1))
		SA2->(dbSeek(xFilial("SA2") + TRP->TRP_COD + TRP->TRP_LOJA))
		
		nCrePro := U_GETCREDPR(NumMix,TRP->TRP_COD,TRP->TRP_LOJA,cSetIni,cLinIni,,.T.)
		nCrePro -= U_GetRedut(NumMix,TRP->TRP_COD,TRP->TRP_LOJA,cSetIni,cLinIni,,.T.)	
		If (SA2->A2_L_ADICI - nCrePro) < 0
			nForm := 0
		Else
			nVolPro := U_VLEITE('','','N')
			nForm   := (SA2->A2_L_ADICI-nCrePro) * nVolPro
		EndIf
		_nVlrAlter := (nCrePro * nVolPro) + nForm // Tratamento para for�ar o c�culo correto do funrural na edi��o manual de eventos
	
		//�����������������������������������������������������������������������Ŀ
		//� Grava na ZLF - Se valor For zero deleta ZLF                           �
		//�                                                                       �
		//�O codigo fonte abaixo foi comentado e inserido logo abaixo passando    �
		//�as descricoes dos: setor, linha, produtor e evento, visto que na funcao�
		//�gEvtPrd se posiciona para pegar tais dados sem necessidade.            �
		//�������������������������������������������������������������������������
		gEvtPrd(cFilIni,NumMix,cVersao,cSetIni,cLinIni,;
		ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
		TRP->TRP_COD,TRP->TRP_LOJA,nForm,;
		ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,SA2->A2_L_TRIBU)
	
	    /*
		If gEvtPrd(cFilIni,NumMix,cVersao,ZL2->ZL2_COD,ZL3->ZL3_COD,;
			ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
			SA2->A2_COD,SA2->A2_LOJA,nForm,ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,_cTributac)
			//nconta++
		EndIf
	   */
	
	EndIf
EndIf
//������������������������������������������������������������Ŀ
//� Adicionado para efetuar o recalculo do                     �
//� incentivo apos um lancamento manual efetuado.              �
//��������������������������������������������������������������
If !Empty(cEvetInc)
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	If ZL8->(dbSeek(xFilial("ZL8") + cEvetInc))
		
		dbSelectArea(_cAlias)
		(_cAlias)->(dbGoTop())
		
		While !(_cAlias)->(Eof())
			
			
			_nVlrInc:= U_CALCIMP('INCENTIVO','N',(_cAlias)->ZLD_TRIBUT,cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao,.T.)
			
			//���������������������������������������������������������������������Ŀ
			//� Grava na ZLF o valor do envento por tipo de tributacao do leite.    �
			//�����������������������������������������������������������������������
			gEvtPrd(cFilIni,NumMix,cVersao,cSetIni,cLinIni,;
			ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
			TRP->TRP_COD,TRP->TRP_LOJA,_nVlrInc,;
			(_cAlias)->DESCSETOR,(_cAlias)->DESCLINHA,(_cAlias)->DESCPROD,ZL8->ZL8_NREDUZ,(_cAlias)->ZLD_TRIBUT)
			
			(_cAlias)->(dbSkip())
		EndDo
		
		//������������������������������������������������������������������������Ŀ
		//�Efetua o somatorio do valor do incentivo para atualizar o valor na tela.�
		//��������������������������������������������������������������������������
		_nVlrInc:= U_GetTotEv(cFilIni,ZL8->ZL8_COD,cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao,"")
		
		//���������������������������������������������������������������������Ŀ
		//� Grava no arquivo temporario o valor do incentivo recalculado.	    �
		//�����������������������������������������������������������������������
		//&('TRP->TRP_' + cEvetInc):= _nVlrInc / _nTotLeite
		
	EndIf
EndIf
//�������������������������������������Ŀ
//�Finaliza a area criada anteriormente.�
//���������������������������������������
dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())


//������������������������������������������������������������Ŀ
//� Adicionado para efetuar o recalculo do FUNRURAL            �
//� apos alteracao manual efetuada.       �
//��������������������������������������������������������������
If !Empty(cCodINSS)
	dbSelectArea("ZL8")
	ZL8->(dbSetOrder(1))
	If ZL8->(dbSeek(xFilial("ZL8") + cCodINSS))
		If ((&(ZL8->ZL8_CONDIC) .and. ZL8->ZL8_MSBLQL <> '1' ) )
				
			//���������������������������������������������������������������������Ŀ
			//� Executa formula   _nVlrAlter                                                  �
			//�����������������������������������������������������������������������
			nCrePro := U_GETCREDPR(NumMix,TRP->TRP_COD,TRP->TRP_LOJA,cSetIni,cLinIni)
			nCrePro -= U_GetRedut(NumMix,TRP->TRP_COD,TRP->TRP_LOJA,cSetIni,cLinIni)	

			nForm := U_FUNRURAL(nCrePro)//&(ZL8->ZL8_FORMUL)
					
			//���������������������������������������������������������������������Ŀ
			//� Se For Debito converte para positivo na gravacao                    �
			//�����������������������������������������������������������������������
			If ZL8->ZL8_DEBCRE == "D" .And. nForm < 0
				nForm := nForm*-1
			EndIf
						
						
			//�����������������������������������������������������������������������Ŀ
			//� Grava na ZLF - Se valor For zero deleta ZLF                           �
			//�������������������������������������������������������������������������
			If gEvtPrd(cFilIni,NumMix,cVersao,cSetIni,cLinIni,;
				ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
				SA2->A2_COD,SA2->A2_LOJA,nForm,ZL2->ZL2_DESCRI,ZL3->ZL3_DESCRI,SA2->A2_NOME,ZL8->ZL8_NREDUZ,SA2->A2_L_TRIBU)
				//nconta++

			EndIf
			
		EndIf
	EndIf
EndIf


//���������������������������������������������������������������������Ŀ
//� Calcula o INSS para subtrair do Valor Liquido.                      �
//�����������������������������������������������������������������������
If !Empty(cCodINSS)
	_nSinal := IIF(Posicione("ZL8",1,xFilial("ZL8")+cCodINSS,"ZL8_DEBCRE")=="C",1,-1)
	nValIns := nForm //U_GetTotEv(cFilIni,cCodINSS,cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)* _nSinal
	nTotIns := nValIns / TRP->TRP_VOL
	nValQua := U_GetTotDeb(cFilIni,cSetIni,cLinIni,TRP->TRP_COD,TRP->TRP_LOJA,NumMix,cVersao)
	nTotQua := nValQua / TRP->TRP_VOL
	
	TRP->TRP_TOTBAS := (nTotBas/TRP->TRP_VOL)-nTotQua // TOTAL BASE POR LITRO (MIX.Atual) menos penalizacoes qualidade
	TRP->TRP_TOTLTR := (nVlrTot/TRP->TRP_VOL)-nTotIns // TOTAL POR LITRO (Valor Liquido) menos INSS
	TRP->TRP_TOTVLR := nVlrTot                        // TOTAL DO VALOR GERAL (Total Geral)
EndIf

//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria e atualiza a mesma                        �
//�����������������������������������������������������������������������
If Select("TRP") <> 0
	//FechaTab("TRP")
	UpdateTab("TRP",.F.)
EndIf

RestArea(aArea)
Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ValidPerg   � Autor � TOTVS               � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Perguntas para filtragem de aplicacao na geracao de eventos                            						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg1,"01","Do Produtor"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L9","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Produtor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg1,"02","Ate Produtor"," "," ","mv_ch2","C",6,0,0,"G","","SA2_L9","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg1,"03","Da Loja"," "," ","mv_ch3","C",4,0,0,"G","","","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final do produtor')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg1,"04","Ate Loja"," "," ","mv_ch4","C",4,0,0,"G","","","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Linha
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do grupo  ')
Aadd( aHelpPor, 'de pre�o que deseja filtrar.       ')
U_xPutSx1(cPerg1,"05","Do Grupo"," "," ","mv_ch5","C",6,0,0,"G","","ZL3_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Linha
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do grupo   ')
Aadd( aHelpPor, 'de pre�o que deseja filtrar.      ')
U_xPutSx1(cPerg1,"06","Ate Grupo"," "," ","mv_ch06","C",6,0,0,"G","","ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

/*
//Filtra Donos de Tanque
aHelpPor := {}
Aadd( aHelpPor, 'Aplicar somente aos Produtores     ')
Aadd( aHelpPor, 'Donos de Tanque?                   ')
U_xPutSx1(cPerg1,"11","Filtra Donos "," "," ","mv_ch11","N",1,0,0,"C","","","","","MV_PAR11","Nao","Nao","Nao","","Sim","Sim","Sim","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Filtra Usuarios de Tanque
aHelpPor := {}
Aadd( aHelpPor, 'Aplicar somente aos Produtores     ')
Aadd( aHelpPor, 'Usuarios de Tanque Coletivo?       ')
U_xPutSx1(cPerg1,"12","F.Usuarios TC"," "," ","mv_ch12","N",1,0,0,"C","","","","","MV_PAR12","Nao","Nao","Nao","","Sim","Sim","Sim","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
*/

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AbreLinhas  � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra as linhas dos fretistas e os valores dos eventos correspondentes                						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Setor,Fretista,Loja,Periodo                                                          						���
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
���          � 00/00/00 � A exibicao da ultima tela de aprofundamento dos  �                                  � 			���
���          � 00/00/00 � transportadores que era de todas as linhas do    �                                  � 			���
���          � 00/00/00 � transportador no setor corrente passara a        �                                  � 			���
���          � 00/00/00 � demonstrar somente por setor a EMPRESA nao paga  �                                  � 			���
���          � 00/00/00 � por linha o transportador.	    		       �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
Static Function AbreLinhas(cpFilial,cpSetor,cpFretis,cpLjFret,dt1,dt2,_nTipo,cDescricao)

Local aDadosL 	:= {}
Local aCampos 	:= {}
Local aTitulo5 	:= {}
Local aTamanhos := {}
Local aLinha 	:= {}
Local aAux 		:= {}
Local oDlgFrt
Local nTotBrt 	:= 0
Local nTotDesc 	:= 0
Local nAux 		:= 0

Local _cBkpFil  :=cFilAnt

If 'TOTAL' $ Upper(cDescricao)
	Return
EndIf

//���������������������������������������������������������������������������������������������������������������Ŀ
//� Define estrutura do browse                                         											  �
//� aCampos [1]titulo [2]C=Char N=Number [3]Tamanho [4]Cod.Evento [5]D=Debito C=Credito [6]S=Altera N=Nao altera  �
//�����������������������������������������������������������������������������������������������������������������
aAdd(aCampos,{"Codigo"      ,"C",6 ,"","",""})
aAdd(aCampos,{"Loja"        ,"C",4 ,"","",""})
aAdd(aCampos,{"Fretista"    ,"C",40,"","",""})
//aAdd(aCampos,{"Linha"       ,"C",6 ,"","",""})
aAdd(aCampos,{"Volume"      ,"N",14,"","",""})
aAdd(aCampos,{"Km Rodado"   ,"N",14,"","",""})
//aAdd(aCampos,{"Dias/Viagens","N",14,"","",""})

//���������������������������������������������������������������������Ŀ
//� Obtem Eventos de Credits do Fretistas da ZLF p/ criar colunas       �
//�����������������������������������������������������������������������
If xvisual
	
	//Comentado e adicionado o codigo abaixo para solucionar a questao que estava trazendo
	//para um mesmo codigo de evento duas vezes por causa de sua descricao
	//e tornar dinamico o titulo do Mix de acordo com o cadastro de evento
	/*
	cQuery := " SELECT ZLF_EVENTO,ZLF_DCREVE FROM " + RetSqlName("ZLF") + " ZLF "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	cQuery += " AND ZLF_FILIAL = '"+cpFilial+"' "
	cQuery += " AND ZLF_ENTMIX = 'S' "
	cQuery += " AND ZLF_TP_MIX = 'F' "
	cQuery += " AND ZLF_CODZLE = '"+NumMix+"' "
	cQuery += " GROUP BY ZLF_EVENTO,ZLF_DCREVE  ORDER BY ZLF_EVENTO"
	*/
	
	cQuery := " SELECT ZLF.ZLF_EVENTO,ZL8.ZL8_NREDUZ"
	cQuery += " FROM " + RetSqlName("ZLF") + " ZLF JOIN " + RetSqlName("ZL8") + " ZL8 ON ZLF.ZLF_EVENTO = ZL8.ZL8_COD "
	cQuery += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQuery += " AND ZL8.D_E_L_E_T_ = ' '"
	cQuery += " AND ZLF.ZLF_FILIAL = '" + cpFilial + "' "
	cQuery += " AND ZLF.ZLF_ENTMIX = 'S' "
	cQuery += " AND ZLF.ZLF_DEBCRE = 'C' "
	cQuery += " AND ZLF.ZLF_TP_MIX = 'F' "
	cQuery += " AND ZLF.ZLF_CODZLE = '" + NumMix   + "' "
	cQuery += " GROUP BY ZLF.ZLF_EVENTO,ZL8.ZL8_NREDUZ ORDER BY ZLF_EVENTO"
	
	If Select("TMP") <> 0
		TMP->(dbCloseArea("TMP"))
	EndIf
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP", .T., .F. )
	
	While TMP->(!Eof())
		aAdd(aCampos,{TMP->ZL8_NREDUZ,"N",12,TMP->ZLF_EVENTO,"C","N"})
		TMP->(dbSkip())
	EndDo
	
	TMP->(dbCloseArea())
	
Else
	dbSelectArea("ZL8")
	ZL8->(dbGoTop())
	While ZL8->(!Eof())
		
		If (ZL8->ZL8_PERTEN == "G" .Or. ZL8->ZL8_PERTEN = "T") .And. ZL8_DEBCRE == "C" .and. ZL8->ZL8_MSBLQL <> "1"
			//aAdd(aCampos,{ZL8->ZL8_NREDUZ,"N",12,ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_ALTERA,ZL8->ZL8_MODEDI})
			aAdd(aCampos,{ZL8->ZL8_NREDUZ,"N",12,ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_ALTERA,"N"})
		EndIf
		
		ZL8->(dbSkip())
	EndDo
	
EndIf


aAdd(aCampos,{"Total Bruto","N",14,"","",""})


//���������������������������������������������������������������������Ŀ
//� Obtem Eventos de Debitos do Fretistas da ZLF p/ criar colunas       �
//�����������������������������������������������������������������������
If xvisual
	
	//Comentado e adicionado o codigo abaixo para solucionar a questao que estava trazendo
	//para um mesmo codigo de evento duas vezes por causa de sua descricao
	//e tornar dinamico o titulo do Mix de acordo com o cadastro de evento
	/*
	cQuery := " SELECT ZLF_EVENTO,ZLF_DCREVE FROM " + RetSqlName("ZLF") + " ZLF "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	cQuery += " AND ZLF_FILIAL = '"+cpFilial+"' "
	cQuery += " AND ZLF_DEBCRE = 'D' "
	cQuery += " AND ZLF_TP_MIX = 'F' "
	cQuery += " AND ZLF_CODZLE = '"+NumMix+"' "
	cQuery += " GROUP BY ZLF_EVENTO,ZLF_DCREVE  ORDER BY ZLF_EVENTO"
	*/
	cQuery := " SELECT ZLF.ZLF_EVENTO,ZL8.ZL8_NREDUZ"
	cQuery += " FROM " + RetSqlName("ZLF") + " ZLF JOIN " + RetSqlName("ZL8") + " ZL8 ON ZLF.ZLF_EVENTO = ZL8.ZL8_COD "
	cQuery += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQuery += " AND ZL8.D_E_L_E_T_ = ' '"
	cQuery += " AND ZLF.ZLF_FILIAL = '" + cpFilial + "' "
	cQuery += " AND ZLF.ZLF_DEBCRE = 'D' "
	cQuery += " AND ZLF.ZLF_TP_MIX = 'F' "
	cQuery += " AND ZLF.ZLF_CODZLE = '" + NumMix   + "' "
	cQuery += " GROUP BY ZLF.ZLF_EVENTO,ZL8.ZL8_NREDUZ ORDER BY ZLF_EVENTO"
	
	If Select("TMP") <> 0
		TMP->(dbCloseArea("TMP"))
	EndIf
	
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP", .T., .F. )
	
	While TMP->(!Eof())
		aAdd(aCampos,{TMP->ZL8_NREDUZ,"N",12,TMP->ZLF_EVENTO,"D","N"})
		TMP->(dbSkip())
	EndDo
	TMP->(dbCloseArea())
	
Else
	dbSelectArea("ZL8")
	ZL8->(dbGoTop())
	While ZL8->(!Eof())// .And.xFilial("ZL8") == cpFilial
		
		If (ZL8->ZL8_PERTEN == "G" .or. ZL8->ZL8_PERTEN == "T") .And. ZL8_DEBCRE == "D" .and. ZL8->ZL8_MSBLQL <> "1"
			//aAdd(aCampos,{ZL8->ZL8_NREDUZ,"N",12,ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_ALTERA,ZL8->ZL8_MODEDI})
			aAdd(aCampos,{ZL8->ZL8_NREDUZ,"N",12,ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_ALTERA,"N"})
		EndIf
		
		ZL8->(dbSkip())
	EndDo
	
EndIf


aAdd(aCampos,{"Total Liquido","N",14,"","",""})


//���������������������������������������������������������������������Ŀ
//� Criando titulos do browse                                           �
//�����������������������������������������������������������������������
For u:=1 To Len(aCampos)
	aAdd(aTitulo5,LEFT(aCampos[u,1],17))
	//aAdd(aTamanhos,17)
	aAdd(aTamanhos,34)
Next u


//���������������������������������������������������������������������Ŀ
//� Obtendo dados do browse                                             �
//�����������������������������������������������������������������������
cQuery :="SELECT"
cQuery +=" ZLD_FRETIS,"
cQuery +=" ZLD_LJFRET,"
cQuery +=" SUM(ZLD_QTDBOM) AS VOLUME "
cQuery +="FROM "
cQuery +=  RetSqlName("ZLD") + " ZLD "
cQuery +="WHERE"
cQuery +=" D_E_L_E_T_ = ' '"
cQuery +=" AND ZLD_FILIAL = '" + cpFilial + "'"
cQuery +=" AND ZLD_SETOR = '"  + cpSetor  + "'"
cQuery +=" AND ZLD_FRETIS = '" + cpFretis + "'"
cQuery +=" AND ZLD_LJFRET = '" + cpLjFret + "'"
cQuery +=" AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' "
cQuery +="GROUP BY"
cQuery +=" ZLD_FRETIS,"
cQuery +=" ZLD_LJFRET"
cQuery += " HAVING (SUM(ZLD_QTDBOM) > 0) "
If Select("TMP1") <> 0
	TMP->(dbCloseArea("TMP1"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP1", .T., .F. )

//�������������������������������������������������������������������Ŀ
//�Posiciona na filial dos dados da tela do mix para que seja possivel�
//�verificar os valores dos eventos gerados.                          �
//���������������������������������������������������������������������
cFilAnt:= cpFilial

dbSelectArea("TMP1")
TMP1->(dbGoTop())

While TMP1->(!Eof())
	
	nTotBrt := 0
	nTotDesc:= 0
	aLinha  := {}
	
	For x:=1 To Len(aCampos)
		
		aAdd(aLinha,"")
		Iif(aCampos[x,1]=="Codigo"   ,aLinha[x]:= TMP1->ZLD_FRETIS,)
		Iif(aCampos[x,1]=="Loja"     ,aLinha[x]:= TMP1->ZLD_LJFRET,)
		Iif(aCampos[x,1]=="Fretista" ,aLinha[x]:= Posicione("SA2",1,xFilial("SA2")+TMP1->ZLD_FRETIS+TMP1->ZLD_LJFRET,"A2_NOME"),)
		//Iif(aCampos[x,1]=="Linha",aLinha[x]:=TMP1->ZLD_LINROT,)
		//Iif(aCampos[x,1]=="Volume",aLinha[x]:=U_VolFret(cpFilial,cpSetor,TMP1->ZLD_LINROT,cpFretis,cpLjFret,dt1,dt2,1),)
		Iif(aCampos[x,1]=="Volume"   ,aLinha[x]:= U_VolFret(cpFilial,cpSetor,"",cpFretis,cpLjFret,dt1,dt2,1),)
		//Iif(aCampos[x,1]=="Km Rodado",aLinha[x]:=U_Getkm(cpFilial,cpSetor,TMP1->ZLD_LINROT,cpFretis,cpLjFret,dt1,dt2),)
		Iif(aCampos[x,1]=="Km Rodado",aLinha[x]:= U_Getkm(cpFilial,cpSetor,"",cpFretis,cpLjFret,dt1,dt2),)
		//Iif(aCampos[x,1]=="Dias/Viagens",aLinha[x]:=GetDiFrt(cpFretis,cpLjFret,TMP1->ZLD_LINROT,dt1,dt2),)
		
		//���������������������������������������������������������������������Ŀ
		//� Se For campo dinamico busca total do evento na ZLF                  �
		//�����������������������������������������������������������������������
		If aCampos[x,4] != ""
			
			//nAux := Round(U_GetEvtFrt(cpFilial,cpSetor,TMP1->ZLD_LINROT,cpFretis,cpLjFret,aCampos[x,4],NumMix,cVersao),2)
			nAux := Round(U_GetEvtFrt(cpFilial,cpSetor,"",cpFretis,cpLjFret,aCampos[x,4],NumMix,cVersao),2)
			
			aLinha[x] := nAux
			
			If aCampos[x,5] == "C"
				nTotBrt+=nAux
			EndIf
			
			If aCampos[x,5] == "D"
				nTotDesc+=nAux
			EndIf
			
		EndIf
		
		Iif(aCampos[x,1]=="Total Bruto",aLinha[x]:=nTotBrt,)
		Iif(aCampos[x,1]=="Total Liquido",aLinha[x]:=nTotBrt+nTotDesc,)
		
	Next x
	
	Aadd(aDadosL,aLinha)
	TMP1->(dbSkip())
	
EndDo

dbSelectArea("TMP1")
TMP1->(dbCloseArea())

/*
//�������������������������������������������������������������������Ŀ
//�restaura a filial antes de verificar os valores dos eventos gerados�
//�para o fretista.                                                   �
//���������������������������������������������������������������������
*/
cFilAnt:= _cBkpFil


//���������������������������������������������������������������������Ŀ
//� Mostra Browse das Linhas dos Fretistas e seus valores               �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlgFrt FROM 0,0 TO aSize[6],aSize[5] PIXEL TITLE 'Mix - Fretistas por grupo de pre�o'
oBrowse5 := VCBrowse():New(00,00,aPosObj1[1,3],(aPosObj1[1,4]),,aTitulo5,aTamanhos, oDlgFrt, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
oBrowse5:SetArray(aDadosL)
cExp:=""
For x:=1 To Len(aTitulo5)
	cExp += " aDadosL[oBrowse5:nAt,"+AllTrim(str(x))+"]"
	Iif(x!=len(aTitulo5),cExp+=",",)
Next x
oBrowse5:bLine := &("{|| {"+cExp+"} }")

oBrowse5:BLDBLCLICK := { || editFrt(aDadosL,oBrowse5:nAt,aCampos,_nTipo),oBrowse5:Refresh()  }

//���������������������������������������������������������������������Ŀ
//� Botoes do Browse                                                    �
//�����������������������������������������������������������������������
@ (aPosObj1[1,4]+5),005 Button OemToAnsi('Gerar Eventos') Size 50,10 Action Eval({|| U_GerEvts(cpFilial,aDadosL[oBrowse5:nAt,3]),close(oDlgFrt),AbreLinhas(cpFilial,cpSetor,cpFretis,cpLjFret,dt1,dt2,_nTipo,cDescricao)}) OF oDlgFrt PIXEL
@ (aPosObj1[1,4]+5),060 Button OemToAnsi('Imprimir'     ) Size 50,10 Action U_RGLT027('ARRAY',aTitulo2,showLtr,'Mix - Fretistas por Linha',aCampos,aDadosL,aTitulo5) OF oDlgFrt PIXEL
@ (aPosObj1[1,4]+5),115 Button OemToAnsi("Exportar")      Size 50,10 Action Export('ARRAY',aTitulo5,aDadosL) OF oDlgFrt PIXEL
@ (aPosObj1[1,4]+5),170 Button OemToAnsi('Fechar'       ) Size 50,10 Action Close(oDlgFrt) OF oDlgFrt PIXEL

ACTIVATE MSDIALOG oDlgFrt CENTERED

//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria e atualiza a mesma                        �
//�����������������������������������������������������������������������
If Select("TRF") <> 0
	UpdateTab("TRF",.F.)
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetDiFrt    � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Retorna quantidade de dias trabalhadas pelo fretista                                   						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Fretista,Loja,Periodo                                                                						���
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
Static Function GetDiFrt(cpFretis,cpLjFret,cpLinha,dt1,dt2)
Local cArea := GetArea()
Local nDias := 0

cQuery := "SELECT ZLD_DTCOLE FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLD_FILIAL = '"+xFilial("ZLD")+"'  "
cQuery += " AND ZLD_FRETIS = '"+cpFretis+"'  "
cQuery += " AND ZLD_GRPRC = '"+cpLinha+"'  "
//cQuery += " AND ZLD_LINROT = '"+cpLinha+"'  "
cQuery += " AND ZLD_LJFRET = '"+cpLjFret+"'  "
cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
//RETIRADO 07/01/10 - GERA ERROR.LOG
//cQuery += " GROUP BY ZLD_DTCOLE ORDER BY ZLD_FRETIS"
cQuery += " GROUP BY ZLD_DTCOLE"
If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )
While TRB->(!Eof())
	nDias++
	TRB->(dbSkip())
EndDo

RestArea(cArea)
Return nDias



/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetEvtFrt   � Autor � TOTVS                 � Data da Criacao  � 01/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Retorna valor total dos eventos do fretista                                            						���
���          � ATENCAO: ESSA ROTINA E' UTILIZADA EM VARIOS RELATORIOS			                							���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Filial, setor, linha, fretista, loja , evento                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor total do evento                                                                        	���
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
User Function GetEvtFrt(cpFilial,cpSetor,cpLinha,cpFretis,cpLjFret,cpCod,cpNumMix,cpVersao)

Local cArea  := GetArea()
Local valret := 0

//���������������������������������������������������������������������Ŀ
//� Obtem movimentos da ZLF do evento corrente                          �
//�����������������������������������������������������������������������
cQuery := "SELECT SUM(ZLF_TOTAL) as TOTAL FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL = '"+cpFilial+"'"
cQuery += " AND ZLF_EVENTO = '"+cpCod+"'"
If !Empty(cpSetor)
	cQuery += " AND ZLF_SETOR = '"+cpSetor+"'"
EndIf
If !Empty(AllTrim(cpLinha))
	cQuery += " AND ZLF_LINROT = '"+cpLinha+"'"
EndIf
If !Empty(cpFretis)
	cQuery += " AND ZLF_A2COD = '"+cpFretis+"'"
EndIf
If !Empty(cpLJFret)
	cQuery += " AND ZLF_A2LOJA = '"+cpLJFret+"'"
EndIf
//cQuery += " AND SUBSTR(ZLF_A2COD,1,1) = 'G' "
cQuery += " AND SUBSTR(ZLF_A2COD,1,1) = 'G' "
cQuery += " AND ZLF_CODZLE = '"+cpNumMix+"' "
If !Empty(AllTrim(cpVersao))
	cQuery += " AND ZLF_VERSAO = '"+cpVersao+"' "
EndIf
cQuery += " AND ZLF_TP_MIX  = 'F' AND D_E_L_E_T_ = ' ' "
If Select("TRW") <> 0
	TRW->(dbCloseArea("TRW"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRW", .T., .F. )
While !TRW->(Eof())
	valret += TRW->TOTAL
	TRW->(dbSkip())
EndDo
TRW->(dbCloseArea())

//���������������������������������������������������������������������Ŀ
//� Se o evento For de debito converte em negativo                      �
//�����������������������������������������������������������������������
If Posicione("ZL8",1,xFilial("ZL8")+cpCod,"ZL8_DEBCRE")=="D"
	valret := valret*-1
EndIf

RestArea(cArea)
Return valret

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowEvento  � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra campos do Evento                                                                						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Cod.Evento                                                                           						���
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
Static Function ShowEvento(cCodEv)

Local aArea := GetArea()

Private cCadastro := "Cadastro de Eventos"
Private cAlias    := "ZL8"

dbSelectArea("ZL8")
dbSetOrder(1)
dbSeek(xFilial("ZL8")+cCodEv)

axvisual("ZL8",ZL8->(Recno()),5)

dbCloseArea("ZL8")

RestArea(aArea)
Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowStatus  � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra tela de finalizacao da linha                                                    						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Cod.Evento                                                                           						���
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
Static Function ShowStatus(cDescricao)

If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_APRMIX") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf

If 'TOTAL' $ Upper(cDescricao)
	xMagHelpFis("Informa��o","Voc� esta posicionado no totalizador.","Favor posicionar em uma linha do MIX que contenha dados do grupo!")
	Return
EndIf

DEFINE FONT oFont NAME "Tahoma" BOLD

DEFINE MSDIALOG oDlgFech FROM  00,00 TO 270,350 TITLE "Fechamento" PIXEL
@005,005 TO 130,173

@010,010 say "Status do Grupo" PIXEL OF oDlgFech FONT oFont
@025,010 say "Essa rotina ir� preparar a linha para poder ser faturada!" PIXEL OF oDlgFech
@035,010 say "Apos efetuar a Aprovacao da Linha/Rota, nao ser� mais poss�vel" Pixel Of oDlgFech
@045,010 say "alterar os valores da mesma." PIXEL OF oDlgFech
@055,010 say "Selecione a opcao desejada:" PIXEL OF oDlgFech

TButton():New(070,037,' Aprovar Setor '   , oDlgFech,{|| Processa( {|| setStatus(TRL->TRL_FILIAL,cSetIni,"","P","L"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(085,037,' Aprovar Grupo '   , oDlgFech,{|| Processa( {|| setStatus(TRL->TRL_FILIAL,cSetIni,TRL->TRL_COD,"P","L"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(100,037,' Reabilitar Grupo ', oDlgFech,{|| Processa( {|| setStatus(TRL->TRL_FILIAL,cSetIni,TRL->TRL_COD,"A","L"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(115,037,' Fechar '          , oDlgFech,{|| Close(oDlgFech) },100,10,,,,.T.)

ACTIVATE MSDIALOG oDlgFech Centered

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AprvFrt     � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra tela de aprovacao dos Fretistas                                                 						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
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
Static Function AprvFrt(cDescricao)

Local aArea := GetArea()

If 'TOTAL' $ Upper(cDescricao)
	xMagHelpFis("Informa��o","Voc� esta posicionado no totalizador.","Favor posicionar em uma linha do MIX que contenha dados do fretista!")
	Return
EndIf

If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_APRMIX") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf

DEFINE FONT oFont NAME "Tahoma" BOLD

DEFINE MSDIALOG oDlgFech FROM  00,00 TO 270,350 TITLE "Fechamento" PIXEL
@005,005 TO 130,173

@010,010 say "Status do Transportador" PIXEL OF oDlgFech FONT oFont
@025,010 say "Essa rotina ir� aprovar a Folha do Transportador!" PIXEL OF oDlgFech
@035,010 say "Apos efetuar a Aprovacao, nao ser� mais poss�vel alterar os" Pixel Of oDlgFech
@045,010 say "valores." Pixel Of oDlgFech
@055,010 say "Selecione a opcao desejada:" PIXEL OF oDlgFech

TButton():New(070,037,' Aprovar Todos '           , oDlgFech,{|| Processa( {|| setStatus(TRF->TRF_FILIAL,cSetIni,"","P","F"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(085,037,' Aprovar Transportador '   , oDlgFech,{|| Processa( {|| setStatus(TRF->TRF_FILIAL,cSetIni,TRF->TRF_COD,"P","F"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(100,037,' Reabilitar Transportador ', oDlgFech,{|| Processa( {|| setStatus(TRF->TRF_FILIAL,cSetIni,TRF->TRF_COD,"A","F"),close(oDlgFech) } ) },100,10,,,,.T.)
TButton():New(115,037,' Fechar '                  , oDlgFech,{|| close(oDlgFech) },100,10,,,,.T.)

ACTIVATE MSDIALOG oDlgFech Centered

Return


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � setFinaliz  � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Seta eventos como fechados                                                             						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Cod.Evento , Setor, Linha                                                            						���
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
Static Function setStatus(cpFil,cpSet,cpLinFrt,cpTp,cpFornTp)

ProcRegua(10)
IncProc(5)

cEx1 := "UPDATE " + RetSqlName("ZLF") + " "
cEx1 += "SET ZLF_STATUS='"+cpTp+"' " // A=Aberto P=Aprovado
cEx1 += "WHERE D_E_L_E_T_ = ' ' "
cEx1 += "AND ZLF_FILIAL = '"+cpFil+"' "
cEx1 += "AND ZLF_CODZLE = '"+NumMix+"' "
cEx1 += "AND ZLF_SETOR = '"+cpSet+"' "
If !Empty(AllTrim(cpLinFrt))
	If cpFornTp == "P" // Produtor
		cEx1 += "AND ZLF_LINROT = '"+cpLinFrt+"' "
	EndIf
	If cpFornTp == "T"  // Fretista
		cEx1 += "AND ZLF_A2COD  = '"+cpLinFrt+"' "
	EndIf
EndIf
cEx1 += "AND ZLF_TP_MIX = '"+cpFornTp+"' "
cEx1 += "AND ZLF_ACERTO != 'S' "
If TcSqlExec(cEx1) < 0
	Alert(TCSQLError())
EndIf

IncProc(5)
Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetStatus   � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem status atual                                                                     						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Filial,Setor,Linha,Produtor,Loja                                                     						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Status					                                                                                  	���
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
Static Function GetStatus(cpfil,cpset,cplin,cpForn,cpLoja,cpTipo)

Local cRet := ""
Local nAbert := 0
Local nPrep	 := 0	
Local nFech	 := 0

//���������������������������������������������������������������������Ŀ
//� Obtem Status agrupados e calcula qtd de cada status                 �
//�����������������������������������������������������������������������
cQuery := "SELECT ZLF_STATUS AS CSTATUS FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL ='"+cpFil+"'"
If !xVisual
	cQuery += " AND ZLF_VERSAO ='"+cVersao+"'"
EndIf
cQuery += " AND ZLF_CODZLE ='"+NumMix+"'"
If !Empty(AllTrim(cpTipo))
	cQuery += " AND ZLF_TP_MIX ='"+cpTipo+"'"
EndIf
If !Empty(AllTrim(cpSet))
	cQuery += " AND ZLF_SETOR = '"+cpSet+"'"
EndIf
If !Empty(AllTrim(cpLin))
	cQuery += " AND ZLF_LINROT = '"+cpLin+"'"
EndIf
If !Empty(AllTrim(cpForn))
	cQuery += " AND ZLF_A2COD = '"+cpForn+"'"
EndIf
If !Empty(AllTrim(cpLoja))
	cQuery += " AND ZLF_A2LOJA = '"+cpLoja+"'"
EndIf
cQuery += " AND D_E_L_E_T_ = ' ' GROUP BY ZLF_STATUS "
If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )
While !TRX->(Eof())
	Do case
		case TRX->CSTATUS == ""
			nAbert++
		case TRX->CSTATUS == "A"
			nAbert++
		case TRX->CSTATUS == "P"
			nPrep++
		case TRX->CSTATUS == "F"
			nFech++
		otherwise
			nAbert++
	endcase
	
	TRX->(dbSkip())
EndDo
TRX->(dbCloseArea())

If nAbert >= 0 .And. nPrep == 0 .And. nFech == 0
	cRet:="Aberto"
EndIf
If nPrep > 0 .And. nAbert > 0 .And. nFech == 0
	cRet:="Parc.Aprovado"
EndIf
If nPrep > 0 .And. nAbert == 0 .And. nFech == 0
	cRet:="Aprovado"
EndIf
If (nPrep > 0 .or. nAbert > 0) .And. nFech > 0
	cRet:="Parc.Fechado"
EndIf
If nPrep == 0 .And. nAbert == 0 .And. nFech > 0
	cRet:="Fechado"
EndIf

Return cRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � isOpen      � Autor � TOTVS                 � Data da Criacao  � 03/02/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Veririca se existem registros diferentes de aberto na ZLF.                       						    ���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Filial,Setor,Linha,Produtor,Loja                                                     						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � .T.=tudo em aberto  .F.=registros nao abertos			                                                	���
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
Static Function isOpen(cpfil,cpset,cplin,cpForn,cpLoja)

Local nQtd	:=	0
Local lRet	:=	.F.

//���������������������������������������������������������������������Ŀ
//� Obtem quantidade de registros nao abertos                           �
//�����������������������������������������������������������������������
cQuery := "SELECT COUNT(*) AS QTDREG FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL ='"+cpFil+"'"
cQuery += " AND ZLF_VERSAO ='"+cVersao+"'"
cQuery += " AND ZLF_CODZLE ='"+NumMix+"'"
If !Empty(AllTrim(cpSet))
	cQuery += " AND ZLF_SETOR = '"+cpSet+"'"
EndIf
If !Empty(AllTrim(cpLin))
	cQuery += " AND ZLF_LINROT = '"+cpLin+"'"
EndIf
If !Empty(AllTrim(cpForn))
	cQuery += " AND ZLF_A2COD  = '"+cpForn+"'"
EndIf
If !Empty(AllTrim(cpLoja))
	cQuery += " AND ZLF_A2LOJA = '"+cpLoja+"'"
EndIf
//cQuery += " AND ZLF_STATUS != 'A' "
cQuery += " AND ZLF_STATUS <> 'A' AND D_E_L_E_T_ = ' ' "

If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )

If !TRX->(Eof())
	nQtd:=TRX->QTDREG
EndIf

TRX->(dbCloseArea())

If nQtd > 0
	lRet:=.F.
Else
	lRet:=.T.
EndIf

Return lRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetUltMix   � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem numero do Mix anterior                                                           						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Mix atual                                                                            						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Mix anterior                                                                                 	���
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
Static Function GetUltMix(cpMix)

Local cUlt := ""
Local aArea := GetArea()

cQuery := "SELECT ZLE_COD FROM " + RetSqlName("ZLE") + " ZLE "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " GROUP BY ZLE_COD ORDER BY ZLE_COD "
If Select("TRZ") <> 0
	TRZ->(dbCloseArea("TRZ"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRZ", .T., .F. )
While !TRZ->(Eof())
	If cpMix == TRZ->ZLE_COD
		exit
	EndIf
	cUlt := TRZ->ZLE_COD
	TRZ->(dbSkip())
EndDo
TRZ->(dbCloseArea())

RestArea(aArea)
Return cUlt

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetDesPrd   � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem valor do desconto de frete aplicado ao servidor                                  						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Fretista,Loja,Mix                                                                    						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor do desconto                                                                            	���
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
Static Function GetDesPrd(cpFretis,cpLj,cpMix)

Local nRet:=0
Local aArea := GetArea()

cQuery := "SELECT SUM(ZLF_TOTAL) AS TOTAL FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL ='"+xFilial("ZLF")+"'"
cQuery += " AND ZLF_CODZLE = '"+cpMix+"'"
cQuery += " AND ZLF_A2COD  = '"+cpFretis+"'"
cQuery += " AND ZLF_A2LOJA = '"+cpLj+"'"
cQuery += " AND ZLF_TP_MIX = 'L'"
cQuery += " AND ZLF_DEBCRE = 'D' AND D_E_L_E_T_ = ' ' "
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRV", .T., .F. )
If TRV->(!Eof())
	nRet:=TRV->TOTAL
EndIf
TRV->(dbCloseArea())

RestArea(aArea)
Return nRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetTotCr    � Autor � TOTVS                 � Data da Criacao  � 04/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem valor de todos os creditos ao produtor                                           						���
���          � ATENCAO: ESSA ROTINA E' UTILIZADA EM VARIOS RELATORIOS			                							���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Filial,Setor,Linha,Produtor,Loja,Mix                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor do credito                                                                             	���
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
User Function GetTotCr(cpfilial,cpSetor,cpLinha,cpProdutor,cpLj,cpNumMix,cpVersao)

Local cArea  := GetArea()
Local valret := 0

//���������������������������������������������������������������������Ŀ
//� Obtendo valores do evento                                           �
//�����������������������������������������������������������������������
cQuery := "SELECT SUM(ZLF_TOTAL) as TOTAL FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE "
cQuery += " ZLF_FILIAL = '"+cpFilial+"'"
If !Empty(cpSetor)
	cQuery += " AND ZLF_SETOR = '"+cpSetor+"'"
EndIf
If !Empty(cpLinha)
	cQuery += " AND ZLF_LINROT = '"+cpLinha+"'"
EndIf
If !Empty(cpProdutor)
	cQuery += " AND ZLF_A2COD = '"+cpProdutor+"'"
	
EndIf
If !Empty(cpLj)
	cQuery += " AND ZLF_A2LOJA = '"+cpLj+"'"
EndIf
cQuery += " AND ZLF_CODZLE = '"+cpNumMix+"' "
If !Empty(AllTrim(cpVersao))
	cQuery += " AND ZLF_VERSAO = '"+cpVersao+"' "
EndIf
cQuery += " AND ZLF_TP_MIX = 'L'"
cQuery += " AND ZLF_ENTMIX = 'S'"
cQuery += " AND ZLF_DEBCRE = 'C'"
cQuery += " AND D_E_L_E_T_ = ' ' "
//���������������������������������������������������������Ŀ
//� Tratamento para que o frete nao seja somado aos totais. �
//�����������������������������������������������������������
If Type("lSomaFrt") <> "U"
	If !lSomaFrt //Se nao soma o frete no MIX.
		cQuery += " AND ZLF_EVENTO NOT IN('"+cEvetFrt+"','"+cEvetFal+"') " //Codigo do Evento de Frete,Falta de Leite
	EndIf
EndIf

If Select("CTRF") <> 0
	CTRF->(dbCloseArea("CTRF"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "CTRF", .T., .F. )
While !CTRF->(Eof())
	valret += CTRF->TOTAL
	CTRF->(dbSkip())
EndDo
CTRF->(dbCloseArea())

RestArea(cArea)
Return valret

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � GetTotDeb   � Autor � TOTVS                 � Data da Criacao  � 25/05/2010             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem valor de todos os debitos de qualidade do produtor.                              						���
���          �                                                                          							        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Filial,Setor,Linha,Produtor,Loja,Mix                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor do debito                                                                                 				���
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

User Function GetTotDeb(_cFil,_cSetor,_cLinha,_CodProd,_cLoja,_cCodMix,_cVersao)

Local cArea    := GetArea()
Local valret   := 0

Local _cAlias  := GetNextAlias()

Local _cFiltro := "%"

Local _nVlrRedu:= 0


//������������������Ŀ
//�Define os filtros.�
//��������������������

If Len(AllTrim(_cFil)) > 0
	
	_cFiltro += " AND ZLF.ZLF_FILIAL = '" + _cFil 	 + "'"
	
EndIf

If Len(AllTrim(_cSetor)) > 0
	
	_cFiltro += " AND ZLF.ZLF_SETOR = '"  + _cSetor  + "'"
	
EndIf

If Len(AllTrim(_cLinha)) > 0
	
	_cFiltro += " AND ZLF.ZLF_LINROT = '" + _cLinha  + "'"
	
EndIf

If Len(AllTrim(_CodProd)) > 0
	
	_cFiltro += " AND ZLF.ZLF_A2COD = '"  + _CodProd + "'"
	
EndIf

If Len(AllTrim(_cLoja)) > 0
	
	_cFiltro += " AND ZLF.ZLF_A2LOJA = '" + _cLoja 	 + "'"
	
EndIf

If Len(AllTrim(_cCodMix)) > 0
	
	_cFiltro += " AND ZLF.ZLF_CODZLE = '" + _cCodMix + "'"
	
EndIf

If Len(AllTrim(_cVersao)) > 0
	
	_cFiltro += " AND ZLF.ZLF_VERSAO = '" + _cVersao + "'"
	
EndIf

_cFiltro += "%"

BeginSql alias _cAlias
	SELECT
	NVL(SUM(ZLF_TOTAL),0) AS DEBITO
	FROM
	%Table:ZLF% ZLF
		JOIN %Table:ZL8% ZL8 ON ZL8.ZL8_COD = ZLF.ZLF_EVENTO 
		AND ZL8.ZL8_TPEVEN = 'R' 
		AND ZL8.ZL8_DEBCRE = 'D'
		AND ZL8.D_E_L_E_T_ = ' '
	 
	WHERE
	ZLF.ZLF_ENTMIX = 'S'
	AND ZLF.ZLF_TP_MIX = 'L'
	AND ZLF.%NotDel%	
	%Exp:_cFiltro%
EndSql

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

If !(_cAlias)->(Eof())
	
	_nVlrRedu:= (_cAlias)->DEBITO
	
EndIf

dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())


RestArea(cArea)

Return _nVlrRedu

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � Getvolume   � Autor � TOTVS                 � Data da Criacao  � 16/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem volume do produtor                                                               						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Mix,al,Setor,Linha,Produtor,Loja,Mix                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor do credito                                                                                				���
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
Static Function GetVolume(cpMix,cpPrd,cpLj)

Local aArea := GetArea()
Local dti,dtf
Local nRet :=0

dti := Posicione("ZLE",1,xFilial("ZLE")+cpMix,"ZLE->ZLE_DTINI")
dtf := Posicione("ZLE",1,xFilial("ZLE")+cpMix,"ZLE->ZLE_DTFIM")
nRet:= U_VolLeite(cFilIni,dti,dtf,cSetIni,cLinIni,cpPrd,cpLj)

RestArea(aArea)
Return nRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowFrt     � Autor � TOTVS                 � Data da Criacao  � 16/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra tela dos Fretistas                                                              						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Mix,al,Setor,Linha,Produtor,Loja,Mix                                                 						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Valor do credito                                                                             	���
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
Static Function ShowFrt(cCodFil,cCodSet,cCodLin,ntipo,NumMix)

Local agrupa := .F.
Local cTitulo:= "Fretistas"

cFilIni := cCodFil
cFilFim := cCodFil
cSetIni := cCodSet
cSetFim := cCodSet
cLinIni := cCodLin
cLinFim := cCodLin

//���������������������������������������������������������������������Ŀ
//� Cria tabela temporaria                                              �
//�����������������������������������������������������������������������
CriaTmp("TRF",.F.,.T.)

//���������������������������������������������������������������������Ŀ
//� Grava dados na Tabela temporaria a partir da tabela ZLF             �
//�����������������������������������������������������������������������
Processa ( {|| GravaTmp("TRF",agrupa,ntipo) })

//���������������������������������������������������������������������Ŀ
//� Cria estrutura da Tabela Temporaria (Eventos viram colunas)         �
//�����������������������������������������������������������������������
CfgBrowse("TRF",agrupa)


dbSelectArea("TRF")
dbGoTop()
aAdd(aOrdem,"Filial")

//���������������������������������������������������������������������Ŀ
//� Cria Browse dos Fretistas                                         	�
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlg4 FROM  00,00 TO aSize[6],aSize[5] TITLE "Mix - Fretistas" PIXEL OF oMainWnd
oBrowse4 := VCBrowse():New(00,00,aPosObj1[1,3],(aPosObj1[1,4]),,,,oDlg4,,,,,, , , , , , , , ,.T.)
oBrowse4 := oBrowse4:GetBrowse()
oBrowse4:lLineDrag	:= .T.

For i:=1 To Len(aBrowse4)
	oCol4 := TCColumn():New( OemToAnsi(aTitulo4[i,1]), &("{ || "+aBrowse4[i,1]+"}"),aBrowse4[i,3],,,if(aBrowse4[i,2]=="N","RIGHT","LEFT"),aTam4[i], .F., .F.,,,, .F.,, )
	oBrowse4:AddColumn(oCol4)
Next i

oBrowse4:BLDBLCLICK := { || AbreLinhas(cFilIni,cSetIni,TRF->TRF_COD,TRF->TRF_LOJA,dt1,dt2,ntipo,TRF->TRF_DESCRI)}

@ (aPosObj1[1,4]+5),005 Button OemToAnsi("Detalhar") Size 50,10 Action Processa( {|| AbreLinhas(cFilIni,cSetIni,TRF->TRF_COD,TRF->TRF_LOJA,dt1,dt2,ntipo,TRF->TRF_DESCRI)}) OF oDlg4 PIXEL
@ (aPosObj1[1,4]+5),060 Button OemToAnsi("Gerar Eventos") Size 50,10 Action Processa({|| U_GerEvts(TRF->TRF_FILIAL,TRF->TRF_DESCRI),UpdateTab("TRF",agrupa) })  OF oDlg4 PIXEL
@ (aPosObj1[1,4]+5),115 Button OemToAnsi("Aprovacao") Size 50,10 Action Processa({|| AprvFrt(TRF->TRF_DESCRI),UpdateTab("TRF",agrupa) })  OF oDlg4 PIXEL
@ (aPosObj1[1,4]+5),170 Button OemToAnsi("Imprimir") Size 50,10 Action U_RGLT027("TRF",aTitulo4,.F.,'Mix - Fretistas') OF oDlg4 PIXEL
@ (aPosObj1[1,4]+5),225 Button OemToAnsi("Exportar") Size 50,10 Action Export("TRF",aTitulo4) OF oDlg4 PIXEL
@ (aPosObj1[1,4]+5),280 Button OemToAnsi("Fechar") Size 50,10 Action close(oDlg4) OF oDlg4 PIXEL

ACTIVATE MSDIALOG oDlg4 Centered

//���������������������������������������������������������������������Ŀ
//� Destroi tabela temporaria e atualiza a mesma                        �
//�����������������������������������������������������������������������
If Select("TRF") <> 0
	FechaTab("TRF")
EndIf
UpdateTab("TRL",grouplin)

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowGrf     � Autor � TOTVS                 � Data da Criacao  � 16/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Chama tela do Grafico                                                                  						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function MontaGrf(cTab,aColNames)

Local aOpcoes := {}
Local aCmps:={}
Local aCol:={}
Local aVlr:={}
Local cSelct,nPos


For n:=1 To Len(aStruct)
	If aStruct[n,2] == "N"
		aAdd(aCmps,aStruct[n,1])
		aAdd(aOpcoes,aColNames[n,1])
	EndIf
Next n

DEFINE FONT oFont NAME "Tahoma" BOLD

DEFINE MSDIALOG oDlgOpc FROM  00,00 TO 140,230 TITLE "Grafico" PIXEL OF oMainWnd
@020,005 TO 040,110
@005,010 SAY "Geracao de Grafico" Pixel Of oDlgOpc FONT oFont
@025,010 SAY "Coluna" Pixel Of oDlgOpc
@025,040 COMBOBOX cSelct SIZE 55,08  PIXEL OF oDlgOpc ITEMS aOpcoes
@045,010 Button OemToAnsi("Ok") Size 40,10 Action Close(oDlgOpc) OF oDlgOpc PIXEL
@045,055 Button OemToAnsi("Cancelar") Size 40,10 Action Close(oDlgOpc) OF oDlgOpc PIXEL
ACTIVATE MSDIALOG oDlgOpc Centered

For ncont:=1 To Len(aOpcoes)
	If AllTrim(aOpcoes[ncont]) == AllTrim(cSelct)
		nPos:=ncont
	EndIf
Next ncont

dbSelectArea(cTab)
dbSetOrder(1)
(cTab)->(dbGoTop())
While (cTab)->(!Eof())
	If &(cTab+"->"+cTab+"_DESCRI")!="Total"
		aAdd(aCol,LEFT(&(cTab+"->"+cTab+"_DESCRI"),7))
		aAdd(aVlr,&(cTab+"->"+aCmps[nPos]))
	EndIf
	(cTab)->(dbSkip())
EndDo
dbGoTop()

U_ShowGrafico("Grafico do Mix - "+cSelct,aCol,aVlr)

Return


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowCols    � Autor � TOTVS                 � Data da Criacao  � 29/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Chama tela das Colunas que devem ser marcadas para visualizacao na tela                						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function ShowCols()

Local oChb01
Local nAux  := 0
Local nPos1 := 5
Local oOK   := LoadBitmap(GetResources(),'LBOK')
Local oNO   := LoadBitmap(GetResources(),'LBNO')

Private aColuns := {}
Private lChb01  :=.F.

For y:=1 To Len(aStruct2)
	aAdd(aColuns,{.T.,aStruct2[y,6]})
next

DEFINE MSDIALOG oDlgCols FROM  00,00 TO 250,260 TITLE "Colunas do Mix" PIXEL OF oMainWnd
@005,005 SAY "Marque as Colunas a serem visualizadas:" Pixel Of oDlgCols

//���������������������������������������������������������������������Ŀ
//� Browse das Colunas a serem visualizadas                             �
//�����������������������������������������������������������������������
oBrowse7 := VCBrowse():New(20,05,120,70,,{'','Nome'},{10,30}, oDlgCols, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
oBrowse7:SetArray(aColuns)
If len(aColuns) > 0
	oBrowse7:bLine := {||{If(aColuns[oBrowse7:nAt,01],oOK,oNO), aColuns[oBrowse7:nAt,02] } }
	oBrowse7:bLDblClick := {|| aColuns[oBrowse7:nAt][1] := !aColuns[oBrowse7:nAt][1],oBrowse7:DrawSelect()}
EndIf

@110,005 Button OemToAnsi("Ok") Size 40,10 Action {|| RvStruct(),Close(oDlgCols) } OF oDlgCols PIXEL
ACTIVATE MSDIALOG oDlgCols Centered

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � RvStruct    � Autor � TOTVS                 � Data da Criacao  � 29/12/2008             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Ajusta a estrutura da tabela temporaria de acordo com as colunas selecionadas          						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function RvStruct()

Local aNew1:={}
Local aNew2:={}
Local lfind:=.T.

//���������������������������������������������������������������������Ŀ
//� Cria Estrutura apenas das colunas marcadas                          �
//�����������������������������������������������������������������������
For q:=1 To Len(aStruct2)
	If aColuns[q,1]==.T.
		aAdd(aNew2,aStruct2[q])
	EndIf
Next q

//���������������������������������������������������������������������Ŀ
//� Cria Estrutura da Tab.Temp. sem as colunas nao marcadas             �
//�����������������������������������������������������������������������
For q:=1 To Len(aStruct)
	lfind := .F.
	For r:=1 To Len(aStruct2)
		If aStruct[q,1]==aStruct2[r,1]
			lfind:=.T.
		EndIf
	Next r
	For r:=1 To Len(aNew2)
		If aStruct[q,1]==aNew2[r,1]
			lfind:=.F.
		EndIf
	Next r
	If !lfind
		aAdd(aNew1,aStruct[q])
	EndIf
Next q

aStruct  := aNew1
aStruct2 := aNew2

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � editFrt     � Autor � TOTVS                 � Data da Criacao  � 13/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Edicao dos eventos de fretista                                                         						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� group(se agrupa eventos), tipo de Mix                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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

Static Function editFrt(aDados,nLinPos,aStructFrt,nTipo)

Local aArea := GetArea()
Local nLin  := 30
Local nPos1 := 5
Local nPos2 := 40
Local nPos3 := 120
Local ncont := 1
Local oTitulo01,oTitulo02,oTitulo03,oTitulo04,oTitulo05,oTitulo06,oTitulo07,oTitulo08,oTitulo09,oTitulo10,oTitulo11,oTitulo12,oTitulo13,oTitulo14,oTitulo15
Local oTotal01,oTotal02,oTotal03,oTotal04,oTotal05,oTotal06,oTotal07,oTotal08,oTotal09,oTotal10,oTotal11,oTotal12,oTotal13,oTotal14,oTotal15
Static nTotal01,nTotal02,nTotal03,nTotal04,nTotal05,nTotal06,nTotal07,nTotal08,nTotal09,nTotal10,nTotal11,nTotal12,nTotal13,nTotal14,nTotal15
Static bPerg01,bPerg02,bPerg03,bPerg04,bPerg05,bPerg06,bPerg07,bPerg08,bPerg09,bPerg10,bPerg11,bPerg12,bPerg13,bPerg14,bPerg15
Static aCmpFrt := {}

If Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_GEREVE") != "S"
	xMagHelpFis("Permissao","Voce nao tem permissao para acessar essa rotina!","Comunique ao Suporte!")
	Return
EndIf

If (ntipo != 2)
	xMagHelpFis("Nao permitido","Edicao s� � permitida no modo manutencao!","Saia do Mix e entre novamente pela opcao Manutencao detalhando os eventos!")
	Return
EndIf

If TRF->TRF_FILIAL != cFilAnt
	xMagHelpFis("Filial","A Filial do sistema � diferente da filial do setor atual.","Altere a filial do sistema.")
	Return
EndIf

//���������������������������������������������������������������������Ŀ
//� Montando array de campos dinamicos dos    Fretistas                 �
//�����������������������������������������������������������������������
aCmpFrt:= {}
For i:=1 To Len(aStructFrt)
	
	/*
	If !Empty(AllTrim(aStructFrt[i,4])) .And. Posicione("ZL8",1,xFilial("ZL8")+aStructFrt[i,4],"ZL8_ALTERA")=="S"// 05/11/2009 - Modificado por Heder - adicionado a comparacao: Posicione("ZL8",1,xFilial("ZL8")+aStructFrt[i,4],"ZL8_ALTERA")=="S"
	aAdd(aCmpFrt,{aStructFrt[i,4],aStructFrt[i,1],i}) // codigo,descricao,posicao
	EndIf
	*/
	
	//������������������������������������������������������������������������Ŀ
	//� Verifica se existe um codigo de evento e se o campo                    �
	//� ZL8_MODEDI esta igual a 'S', ou seja, este campo podera                �
	//� aparecer como um evento visivel na tela de eventos manuais do Fretista.�
	//��������������������������������������������������������������������������
	//If !Empty(AllTrim(aStructFrt[i,4])) .And. aStructFrt[i,7] == "S"
	If !Empty(AllTrim(aStructFrt[i,4]))
		aAdd(aCmpFrt,{aStructFrt[i,4],aStructFrt[i,1],i}) // codigo,descricao,posicao
	EndIf
Next i

If Len(aCmpFrt) <= 0
	xMagHelpFis("INFORMA��O","N�o existem eventos para manuten��o.","Favor comunicar o respons�vel pelo m�dulo leite.")
	Return
EndIf

//���������������������������������������������������������������������Ŀ
//� Tela de edicao                                                      �
//�����������������������������������������������������������������������
DEFINE MSDIALOG oDlgEdit FROM 0,0 TO 375,450 PIXEL TITLE 'TELA PARA EDI��O DE EVENTOS'
@ 05,05 TO 023,215
//@ 25,127 TO 085,210
@ 25,05 TO 085,210

@ 10,nPos1 + 05 say "Fretista:" Pixel Of oDlgEdit
@ 10,nPos2      say LEFT(TRF->TRF_DESCRI,30) Pixel Of  oDlgEdit

oScroll:= TScrollBox():New(oDlgEdit,25,05,140,210,.T.,.F.,.T.)

@ 005,nPos1 Say "Evento" Pixel Of oScroll
@ 005,nPos2 Say "Valor Total" Pixel Of oScroll

//���������������������������������������������������������������������Ŀ
//� Criando objetos de MSGET para cada campo dinamico (evento)          �
//�����������������������������������������������������������������������
nLin := 15
If ncont<=len(aCmpFrt)
	oTitulo01:=aCmpFrt[ncont,2]
	nTotal01:=IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg01:= Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo01 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal01 Var nTotal01 PICTURE "@E 9,999,999.99"  WHEN bPerg01  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo02:=aCmpFrt[ncont,2]
	//nTotal02:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal02:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg02 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo02 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal02 Var nTotal02 PICTURE "@E 9,999,999.99"  WHEN bPerg02  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo03:=aCmpFrt[ncont,2]
	//nTotal03:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal03:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg03 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo03 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal03 Var nTotal03 PICTURE "@E 9,999,999.99"  WHEN bPerg03  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo04:=aCmpFrt[ncont,2]
	//nTotal04:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal04:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg04 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo04 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal04 Var nTotal04 PICTURE "@E 9,999,999.99"  WHEN bPerg04  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo05:=aCmpFrt[ncont,2]
	//nTotal05:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal05:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg05 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo05 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal05 Var nTotal05 PICTURE "@E 9,999,999.99"  WHEN bPerg05  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo06:=aCmpFrt[ncont,2]
	//nTotal06:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal06:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg06 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo06 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal06 Var nTotal06 PICTURE "@E 9,999,999.99"  WHEN bPerg06  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo07:=aCmpFrt[ncont,2]
	//nTotal07:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal07:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg07 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo07 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal07 Var nTotal07 PICTURE "@E 9,999,999.99"  WHEN bPerg07  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo08:=aCmpFrt[ncont,2]
	//nTotal08:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal08:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg08 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo08 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal08 Var nTotal08 PICTURE "@E 9,999,999.99"  WHEN bPerg08  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

If ncont<=len(aCmpFrt)
	oTitulo09:=aCmpFrt[ncont,2]
	//nTotal09:=aDados[nLinPos,aCmpFrt[ncont,3]]
	nTotal09:= IIF(aDados[nLinPos,aCmpFrt[ncont,3]] < 0, aDados[nLinPos,aCmpFrt[ncont,3]] * -1, aDados[nLinPos,aCmpFrt[ncont,3]])
	bPerg09 := Iif(Posicione("ZL8",1,xFilial("ZL8")+aCmpFrt[ncont,1],"ZL8_ALTERA")=="S",.T.,.F.)
	@ nLin,nPos1 Say   oTitulo09 Pixel Of oScroll
	@ nLin,nPos2 MsGet oTotal09 Var nTotal09 PICTURE "@E 9,999,999.99"  WHEN bPerg09  SIZE 50,7 Pixel Of oScroll
	nLin += 13
EndIf
ncont++

//TButton():New(160,005, 'Confirmar', oDlgEdit,{|| grvFrt(TRF->TRF_FILIAL,TRF->TRF_COD,TRF->TRF_LOJA,aDados[nLinPos,4],aDados,nLinPos,aCmpFrt,aStructFrt),close(oDlgEdit)  },50,10,,,,.T.)

//��������������������������������������������������������������������������Ŀ
//� O codigo abaixo foi comentado pois a EMPRESA nao paga o frete por Linha. �
//����������������������������������������������������������������������������
//@ 170,005 BMPBUTTON TYPE 01 ACTION Eval({|| close(oDlgEdit),grvFrt(TRF->TRF_FILIAL,TRF->TRF_COD,TRF->TRF_LOJA,aDados[nLinPos,4],aDados,nLinPos,aCmpFrt,aStructFrt)})
@ 170,005 BMPBUTTON TYPE 01 ACTION Eval({|| close(oDlgEdit),grvFrt(TRF->TRF_FILIAL,TRF->TRF_COD,TRF->TRF_LOJA,PADL("",6," "),aDados,nLinPos,aCmpFrt,aStructFrt)})
@ 170,035 BMPBUTTON TYPE 02 ACTION close(oDlgEdit)

ACTIVATE MSDIALOG oDlgEdit CENTERED

RestArea(aArea)
Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � grvFrt      � Autor � TOTVS                 � Data da Criacao  � 13/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Obtem dados lancados na edicao dos eventos do Fretista para gravar na ZLF              						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cpFilial,cpFretis,cpLoja,cpLinha,aDados,nLinPos,aCmpFrt,aStructFrt 											���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function grvFrt(cpFilial,cpFretis,cpLoja,cpLinha,aDados,nLinPos,aCmpFrt,aStructFrt)

Local nTotDbt := 0
Local nTotCrd := 0
Local cEvento := ""

// --------------------------
// Le os campos da edicao
// --------------------------
For i:=1 to 15
	
	If &("bPerg"+strzero(i,2))
		
		aDados[nLinPos,aCmpFrt[i,3]]:=&("nTotal"+strzero(i,2))
		nForm:=aDados[nLinPos,aCmpFrt[i,3]]
		// -------------------
		// Grava Evento na ZLF
		// -------------------
		cEvento:=aCmpFrt[i,1]
		
		dbSelectArea("ZL8")
		dbSetOrder(1)
		If dbSeek(xFilial("ZL8") + cEvento)
			
			//������������������������������������������������������������������������������Ŀ
			//� Se for Credito e o campo rateio for igual a Sim rateia entre os produtores	 �
			//� Se for Debito grava apenas um registro ao fretista					         �
			//��������������������������������������������������������������������������������
			If ZL8->ZL8_DEBCRE == "C"
				/*
				//�������������������������������������������������������������������������Ŀ
				//�Caso seja necessario efetuar o rateamento do evento entre os produtores  �
				//�que o transportador efetuou o transporte de leite, rateamento por volume.�
				//���������������������������������������������������������������������������
				*/
				If FieldPos("ZL8_RATEIO") > 0 .and. ZL8->ZL8_RATEIO == 'S'
					
					If gEvtFrtRat(cpFilial,NumMix,cVersao,cSetIni,cpLinha,;
						ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
						cpFretis,cpLoja,"",ZL8->ZL8_DESCRI,ZL8->ZL8_FORMUL,.F.,.F.,nForm)
					EndIf
					/*
					//����������������������������������������������������������
					//�Caso n�o seja necessario efetuar o rateamento do evento.�
					//����������������������������������������������������������
					*/
				Else
					
					If gEvtFrt(cpFilial,NumMix,cVersao,cSetIni,cpLinha,;
						ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
						cpFretis,cpLoja,nForm,;
						"","","",ZL8->ZL8_NREDUZ,"")
					EndIf
					
				EndIf
				/*
				//����������������������������������Ŀ
				//�Evento de debito do transportador.�
				//������������������������������������
				*/
			Else
				/*
				//�������������������������������������������������������������������������������Ŀ
				//�Para que o valor do evento ja seja incluso como negativo nos eventos de debito.�
				//���������������������������������������������������������������������������������
				*/
				aDados[nLinPos,aCmpFrt[i,3]]:= (&("nTotal"+strzero(i,2))) * -1
				
				// ---------------------------------------------
				// Converte para positivo para gravacao
				// ---------------------------------------------
				If nForm < 0
					nForm:= nForm * -1
				EndIf
				
				If gEvtFrt(cpFilial,NumMix,cVersao,cSetIni,cpLinha,;
					ZL8->ZL8_COD,ZL8->ZL8_DEBCRE,ZL8->ZL8_MIX,;
					cpFretis,cpLoja,nForm,;
					"","","",ZL8->ZL8_NREDUZ,"")
				EndIf
			EndIf
			
		EndIf
		
	EndIf
	
next i

// --------------------------------------
// recalcula valores do array (browse)
// --------------------------------------
For i:=1 To Len(aStructFrt)
	
	If !Empty(AllTrim(aStructFrt[i,4]))
		If aStructFrt[i,5] == "C"
			nTotCrd += aDados[nLinPos,i]
		Else
			nTotDbt += aDados[nLinPos,i]
		EndIf
	EndIf
	If aStructFrt[i,1] == "Total Bruto"
		aDados[nLinPos,i] := nTotCrd
	EndIf
	If aStructFrt[i,1] == "Total Liquido"
		aDados[nLinPos,i] := nTotCrd+nTotDbt
	EndIf
	
Next i


Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � gEvtFrtRat  � Autor � TOTVS                 � Data da Criacao  � 13/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Grava Evento do Fretista rateando por Produtor                                         						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpFretis,cpLoja,nForm						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function gEvtFrtRat(cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpFretis,cpLoja,;
_cDescFret,_cDescEven,_cFormulEv,lApagar,_lFormula,nForm)

Local aArea     := GetArea()
Local bRet      := .F.
Local nTotParc  := 0
Local nQtdPrd   := 0
Local nVolume   := 0
Local nCalc     := 0
Local _cAliasRat:= GetNextAlias()

//���������������������������������������������Ŀ
//�Variaveis utilizadas em formulas dos eventos.�
//�����������������������������������������������
Private _cTributac:= ""
Private	_cCodAssoc:= ""
Private	_cLojAssoc:= ""

//����������������������������������������������������������������Ŀ
//� Alteracao efetuada, pois a ultima tela de                      �
//� aprofundamento do transportador nao tera mais                  �
//� a exibicao de seus dados por linha e sim agora somente por     �
//� transportador e loja, mas os lancamentos dos eventos           �
//� continuarao a serem feitos para o transportador por linha.     �
//������������������������������������������������������������������

If Len(AllTrim(cpLinha)) > 0
	
	cQuery := "SELECT"
	cQuery += " ZLD.ZLD_FILIAL AS FILIAL,"
	cQuery += " ZLD.ZLD_RETIRO AS COD,"
	cQuery += " ZLD.ZLD_RETILJ AS LOJA,"
	cQuery += " ZLD.ZLD_TRIBUT,"
	cQuery += " SUM(ZLD.ZLD_QTDBOM) AS VOLUME,"
	cQuery += " MAX(ZL2.ZL2_DESCRI) DESCSETOR,"
	cQuery += " MAX(ZL3.ZL3_DESCRI) DESCLINHA,"
	cQuery += " MAX(SA2.A2_NOME) DESCRETIRO "
	cQuery += "FROM "  + RetSqlName("ZLD") + " ZLD"
	cQuery += " JOIN " + RetSqlName("ZL2") + " ZL2 ON ZL2.ZL2_FILIAL = ZLD.ZLD_FILIAL AND ZL2.ZL2_COD = ZLD.ZLD_SETOR"
	cQuery += " 		AND ZL2.D_E_L_E_T_ = ' ' "
	cQuery += " JOIN " + RetSqlName("ZL3") + " ZL3 ON ZL3.ZL3_FILIAL = '" +xFilial("ZL3")+ "' AND ZL3.ZL3_COD = ZLD.ZLD_GRPRC "
	cQuery += " 		AND ZL3.D_E_L_E_T_ = ' '"
	cQuery += " JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ  "
	cQuery += " 		AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' '"
	cQuery += "WHERE"
	cQuery += " ZLD.ZLD_FILIAL = '" + cpFilial			+ "'"
	cQuery += " AND ZLD.ZLD_SETOR  = '" + cpSetor     	  	+ "'"
	cQuery += " AND ZLD.ZLD_GRPRC = '" + cpLinha  			+ "'"
//	cQuery += " AND ZLD.ZLD_LINROT = '" + cpLinha  			+ "'"
	cQuery += " AND ZLD.ZLD_FRETIS = '" + cpFretis 			+ "'"
	cQuery += " AND ZLD.ZLD_LJFRET = '" + cpLoja   			+ "'"
	cQuery += " AND ZLD.ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' "
	cQuery += " AND ZLD.D_E_L_E_T_ = ' '"
	cQuery += "GROUP BY"
	cQuery += " ZLD.ZLD_FILIAL,ZLD.ZLD_RETIRO,ZLD.ZLD_RETILJ,ZLD.ZLD_TRIBUT"
	
Else
	
	cQuery := "SELECT"
	cQuery += " ZLD.ZLD_FILIAL AS FILIAL,"
	cQuery += " ZLD.ZLD_RETIRO AS COD,"
	cQuery += " ZLD.ZLD_RETILJ AS LOJA,"
	cQuery += " A2_L_TRIBUT AS ZLD_TRIBUT,"
	cQuery += " SUM(ZLD.ZLD_QTDBOM) AS VOLUME,"
	cQuery += " MAX(ZL2.ZL2_DESCRI) DESCSETOR,"
	cQuery += " MAX(SA2.A2_NOME) DESCRETIRO "
	cQuery += "FROM "  + RetSqlName("ZLD") + " ZLD"
	cQuery += " JOIN " + RetSqlName("ZL2") + " ZL2 ON ZL2.ZL2_FILIAL = ZLD.ZLD_FILIAL AND ZL2.ZL2_COD = ZLD.ZLD_SETOR"
	cQuery += " 					AND ZL2.D_E_L_E_T_ = ' '"
	cQuery += " JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ  AND SA2.A2_L_ASMIX <> 'N' "
	cQuery += " 	AND SA2.D_E_L_E_T_ = ' '"
	cQuery += "WHERE"
	cQuery += " ZLD.ZLD_FILIAL = '" + cpFilial			+ "'"
	cQuery += " AND ZLD.ZLD_SETOR  = '" + cpSetor     	  	+ "'"
	cQuery += " AND ZLD.ZLD_FRETIS = '" + cpFretis 			+ "'"
	cQuery += " AND ZLD.ZLD_LJFRET = '" + cpLoja   			+ "'"
	cQuery += " AND ZLD.ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "' "
	cQuery += " AND ZLD.D_E_L_E_T_ = ' ' "
	cQuery += "GROUP BY"
	cQuery += " ZLD.ZLD_FILIAL,ZLD.ZLD_RETIRO,ZLD.ZLD_RETILJ,A2_L_TRIBUT"
	
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), _cAliasRat, .T., .F. )

dbSelectArea(_cAliasRat)
(_cAliasRat)->(dbgotop())

If (_cAliasRat)->(Eof())
	
	xMagHelpFis("Falha",;
	"Evento: " + cpEvento + " nao pode ser gerado porque o Transportador: " + cpFretis + "/" + cpLoja +;
	" nao possui produtores de leite no grupo " + cpLinha + " para realizar o rateio.",;
	"Verifique porque o Tranportador nao possui movimentacao!")
EndIf

Begin Transaction
/*
//�����������������������������������������������������������������������Ŀ
//�Caso se deseje realizar o rateamento dos eventos entre os produtores   �
//�atraves de uma formula e nao atraves de seu volume, todo evento lancado�
//�manualmente tem o seu rateamento efetuado pelo volume dos produtores.  �
//�������������������������������������������������������������������������
*/
If _lFormula
	
	//���������������������������������������������������������������������Ŀ
	//� Le os produtores para gerar ZLF rateada                             �
	//�����������������������������������������������������������������������
	while !(_cAliasRat)->(Eof())
		
		If Len(AllTrim(cpLinha)) > 0
			
			_cDescLinha:= (_cAliasRat)->DESCLINHA
			
		else
			
			_cDescLinha:= ""
			
		EndIf
		
		/*
		//���������������������������������������������Ŀ
		//�Variaveis utilizadas em formulas dos eventos.�
		//�����������������������������������������������
		*/
		_cTributac:= (_cAliasRat)->ZLD_TRIBUT
		_cCodAssoc:= (_cAliasRat)->COD
		_cLojAssoc:= (_cAliasRat)->LOJA
		
		//���������������������������������������������������������������������Ŀ
		//� Executa formula                                                     �
		//�����������������������������������������������������������������������
		If !lApagar
			nForm := &(_cFormulEv)
		EndIf
		
		If Empty(nForm) .or. lApagar
			nForm := 0
		EndIf
		
		dbSelectArea("ZLF")
		dbsetorder(5) //ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_RETIRO+ZLF_RETILJ+ZLD_TRIBUT
		If dbSeek(cpFilial + cpMix + cVersao + cSetIni + cpLinha + cpEvento + cpFretis + cpLoja + _cCodAssoc + _cLojAssoc + _cTributac)
			
			/*
			//�������������������������������Ŀ
			//�Caso o status esteja em aberto.�
			//���������������������������������
			*/
			If ZLF->ZLF_STATUS == "A"
				
				Reclock("ZLF", .F.)
				ZLF->ZLF_TOTAL  := nForm
				ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
				
				If nForm == 0
					dbDelete()
				EndIf
				
				MsUnlock()
				bRet:=.t.
				
			EndIf
			
		else
			
			If nForm != 0 .and. isOpen(cpFilial,cpSetor,cpLinha,cpFretis,cpLoja)
				
				dbSelectArea(_cAliasRat)
				
				Reclock("ZLF", .T.)
				
				ZLF->ZLF_FILIAL := cpFilial
				ZLF->ZLF_CODZLE := cpMix
				ZLF->ZLF_VERSAO := cVersao
				ZLF->ZLF_SETOR  := cpSetor
				ZLF->ZLF_LINROT := cpLinha
				ZLF->ZLF_RETIRO := _cCodAssoc
				ZLF->ZLF_RETILJ := _cLojAssoc
				ZLF->ZLF_A2COD	:= cpFretis
				ZLF->ZLF_A2LOJA	:= cpLoja
				ZLF->ZLF_EVENTO := cpEvento
				ZLF->ZLF_ENTMIX := cpEveMix
				ZLF->ZLF_DEBCRED:= cpEveDC
				ZLF->ZLF_DTINI  := dt1
				ZLF->ZLF_DTFIM  := dt2
				ZLF->ZLF_ORIGEM := "M"
				//ZLF->ZLF_QTDBOM := U_volLeiTr(cpFilial,cpSetor,cpLinha,TRC->COD,TRC->LOJA,dt1,dt2,TRC->ZLD_TRIBUT)
				ZLF->ZLF_QTDBOM := (_cAliasRat)->VOLUME
				ZLF->ZLF_TOTAL  := nForm
				ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
				ZLF->ZLF_SEQ	:= u_getSeqZLF(cpMix,cpEvento,_cCodAssoc,_cLojAssoc)
				ZLF->ZLF_ACERTO := "N"
				ZLF->ZLF_TP_MIX := "F"
				ZLF->ZLF_TIPO   := "F"
				ZLF->ZLF_STATUS := "A"
				// obtendo descricoes
				
				//Codigo abaixo comentado em detrimento do codigo Abaixo para melhorar a performance
				//ZLF->ZLF_DCRSET := Posicione("ZL2",1,xFilial("ZL2")+cpSetor,"ZL2_DESCRI")
				//ZLF->ZLF_DCRLIN := Posicione("ZL3",1,xFilial("ZL3")+cpLinha,"ZL3_DESCRI")
				//ZLF->ZLF_A2NOME := Posicione("SA2",1,xFilial("SA2")+cpFretis+cpLoja,"A2_NOME")
				//ZLF->ZLF_DCRRET := Posicione("SA2",1,xFilial("SA2")+TRC->COD+TRC->LOJA,"A2_NOME")
				//ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NREDUZ")
				
				ZLF->ZLF_DCRSET  := (_cAliasRat)->DESCSETOR
				ZLF->ZLF_DCRLIN  := _cDescLinha
				ZLF->ZLF_A2NOME  := _cDescFret
				ZLF->ZLF_DCRRET  := (_cAliasRat)->DESCRETIRO
				ZLF->ZLF_DCREVE  := _cDescEven
				
				ZLF->ZLF_TRIBUT := _cTributac
				
				MsUnlock()
				
				bRet:= .T.
			EndIf
			
		EndIf
		
		(_cAliasRat)->(dbskip())
		
	EndDo
	/*
	//������������������������������������������������������������������Ŀ
	//�Caso se deseje efetuar o rateamento do valor inserido manualmente �
	//�pelo volume dos produtores.                                       �
	//��������������������������������������������������������������������
	*/
Else
	
	nTotParc := 0
	nQtdPrd  := 0
	nVolume  := 0
	nCalc    := 0
	
	/*
	//�����������������������������Ŀ
	//�Pega a descricao do fretista.�
	//�������������������������������
	*/
	If Len(AllTrim(_cDescFret)) == 0
		
		_cDescFret:= Posicione("SA2",1,xFilial("SA2") + cpFretis + cpLoja,"SA2->A2_NOME")
		
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Calcula valor total do volume dos produtores                        �
	//�����������������������������������������������������������������������
	while (_cAliasRat)->(!eof())
		
		nQtdPrd++
		nVolume += (_cAliasRat)->VOLUME
		
		(_cAliasRat)->(dbskip())
	enddo
	
	dbSelectArea(_cAliasRat)
	(_cAliasRat)->(dbGoTop())
	
	//���������������������������������������������������������������������Ŀ
	//� Le os produtores para gerar ZLF rateada                             �
	//�����������������������������������������������������������������������
	while (_cAliasRat)->(!eof())
		
		If Len(AllTrim(cpLinha)) > 0
			
			_cDescLinha:= (_cAliasRat)->DESCLINHA
			
		else
			
			_cDescLinha:= ""
			
		EndIf
		
		nCalc++
		
		dbSelectArea("ZLF")
		dbsetorder(5) //ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_RETIRO+ZLF_RETILJ+ZLF_TRIBUT
		If dbSeek(cpFilial + cpMix + cVersao + cSetIni + cpLinha + cpEvento + cpFretis + cpLoja + (_cAliasRat)->COD + (_cAliasRat)->LOJA + (_cAliasRat)->ZLD_TRIBUT)
			
			If ZLF->ZLF_STATUS == "A"
				
				Reclock("ZLF", .F.)
				ZLF->ZLF_TOTAL  := iif(nQtdPrd==nCalc,nForm-nTotParc,round(nForm*((_cAliasRat)->VOLUME/nVolume),2)) // rateia
				ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
				//���������������������������������������������������������������������Ŀ
				//� Vai somando parcialmente p/ jogar restante no ultimo produtor       �
				//�����������������������������������������������������������������������
				nTotParc += round(nForm*((_cAliasRat)->VOLUME/nVolume),2)
				If nForm == 0
					dbDelete()
				EndIf
				MsUnlock()
				bRet:=.t.
			EndIf
			
		else
			
			If nForm != 0 .and. isOpen(cpFilial,cpSetor,cpLinha,cpFretis,cpLoja)
				
				Reclock("ZLF", .T.)
				ZLF->ZLF_FILIAL := cpFilial
				ZLF->ZLF_CODZLE := cpMix
				ZLF->ZLF_VERSAO := cVersao
				ZLF->ZLF_SETOR  := cpSetor
				ZLF->ZLF_LINROT := cpLinha
				ZLF->ZLF_RETIRO := (_cAliasRat)->COD
				ZLF->ZLF_RETILJ := (_cAliasRat)->LOJA
				ZLF->ZLF_A2COD	:= cpFretis
				ZLF->ZLF_A2LOJA	:= cpLoja
				ZLF->ZLF_EVENTO := cpEvento
				ZLF->ZLF_ENTMIX := cpEveMix
				ZLF->ZLF_DEBCRED:= cpEveDC
				ZLF->ZLF_DTINI  := dt1
				ZLF->ZLF_DTFIM  := dt2
				ZLF->ZLF_ORIGEM := "M"
				ZLF->ZLF_QTDBOM := (_cAliasRat)->VOLUME
				ZLF->ZLF_TOTAL  := iif(nQtdPrd==nCalc,nForm-nTotParc,round(nForm*((_cAliasRat)->VOLUME/nVolume),2)) // rateia
				ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
				ZLF->ZLF_SEQ	:= u_getSeqZLF(cpMix,cpEvento,(_cAliasRat)->COD,(_cAliasRat)->LOJA)
				ZLF->ZLF_ACERTO := "N"
				ZLF->ZLF_TP_MIX := "F"
				ZLF->ZLF_TIPO   := "F"
				ZLF->ZLF_STATUS := "A"
				// obtendo descricoes
				
				//Codigo abaixo comentado para melhorar a performance
				//ZLF->ZLF_DCRSET := Posicione("ZL2",1,xFilial("ZL2")+cpSetor,"ZL2_DESCRI")
				//ZLF->ZLF_DCRLIN := Posicione("ZL3",1,xFilial("ZL3")+cpLinha,"ZL3_DESCRI")
				//ZLF->ZLF_A2NOME := Posicione("SA2",1,xFilial("SA2")+cpFretis+cpLoja,"A2_NOME")
				//ZLF->ZLF_DCRRET := Posicione("SA2",1,xFilial("SA2")+TRC->COD+TRC->LOJA,"A2_NOME")
				//ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NREDUZ")
				
				ZLF->ZLF_DCRSET  := (_cAliasRat)->DESCSETOR
				ZLF->ZLF_DCRLIN  := _cDescLinha
				ZLF->ZLF_A2NOME  := _cDescFret
				ZLF->ZLF_DCRRET  := (_cAliasRat)->DESCRETIRO
				ZLF->ZLF_DCREVE  := _cDescEven
				
				ZLF->ZLF_TRIBUT := (_cAliasRat)->ZLD_TRIBUT
				
				nTotParc += round(nForm*((_cAliasRat)->VOLUME/nVolume),2)
				MsUnlock()
				bRet:=.t.
			EndIf
		EndIf
		
		(_cAliasRat)->(dbskip())
	enddo
	
EndIf

End Transaction

/*
//�����������������������������������������������������������Ŀ
//�Finaliza a area criada anteriormente para efetuar o Rateio.�
//�������������������������������������������������������������
*/
dbSelectArea(_cAliasRat)
(_cAliasRat)->(dbGoTop())

RestArea(aArea)

Return bRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � gEvtFrt     � Autor � TOTVS                 � Data da Criacao  � 13/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Grava Evento do Fretista                                                               						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpFretis,cpLoja,nForm						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function gEvtFrt(cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpForn,cpLoja,nForm,;
_cDesSetor,_cDesLinha,_cDesFret,_cDesEvent,_cTribut)

Local aArea:=GetArea()
Local bRet:=.F.

//��������������������������������������������������������������������������������������������������Ŀ
//� A transacao foi inserida mediante constatacao que                                                �
//� ao tentar gravar um novo evento sao chamadas funcoes                                             �
//� para alimentar determinados campos caso ouvesse erro em alguma destas funcoes o evento           �
//� era gravado na ZLF com os dados dos campos posteriores a funcao que houve o erro zerados.        �
//����������������������������������������������������������������������������������������������������
Begin Transaction

dbSelectArea("ZLF")
//Codigo+Setor+Evento+Fretista+Loja+Produtor+Loja
//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_RETIRO+ZLF_RETILJ
dbSetOrder(5)
dbSeek(cpFilial + cpMix + cVersao + cSetIni + cpLinha + cpEvento + cpForn + cpLoja )

If Found()
	If ZLF->ZLF_STATUS == "A"
		RecLock("ZLF", .F.)
		ZLF->ZLF_TOTAL  := nForm
		ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
		If nForm == 0
			dbDelete()
		EndIf
		MsUnLock()
		bRet:=.T.
	EndIf
Else
	If nForm != 0 .And. isOpen(cpFilial,cpSetor,cpLinha,cpForn,cpLoja) //Veririca se existem registros diferentes de aberto na ZLF
		RecLock("ZLF", .T.)
		ZLF->ZLF_FILIAL := cpFilial
		ZLF->ZLF_CODZLE := cpMix
		ZLF->ZLF_VERSAO := cVersao
		ZLF->ZLF_SETOR  := cpSetor
		ZLF->ZLF_LINROT := cpLinha
		ZLF->ZLF_A2COD	:= cpForn
		ZLF->ZLF_A2LOJA	:= cpLoja
		ZLF->ZLF_RETIRO := ""
		ZLF->ZLF_RETILJ := ""
		ZLF->ZLF_EVENTO := cpEvento
		ZLF->ZLF_ENTMIX := cpEveMix
		ZLF->ZLF_DEBCRED:= cpEveDC
		ZLF->ZLF_DTINI  := dt1
		ZLF->ZLF_DTFIM  := dt2
		ZLF->ZLF_QTDBOM :=  U_VolFret(cpFilial,cpSetor,cpLinha,cpForn,cpLoja,dt1,dt2,1)
		ZLF->ZLF_TOTAL  := nForm
		ZLF->ZLF_VLRLTR := Round((ZLF->ZLF_TOTAL/ZLF->ZLF_QTDBOM),_nRound)
		ZLF->ZLF_ORIGEM := "M"
		ZLF->ZLF_ACERTO := "N"
		ZLF->ZLF_TP_MIX := "F"
		ZLF->ZLF_TIPO   := "F"
		ZLF->ZLF_SEQ	:= U_GetSeqZLF(cpMix,cpEvento,cpForn,cpLoja)
		ZLF->ZLF_STATUS := "A"
		
		// obtendo descricoes
		If Len(AllTrim(_cDesSetor)) == 0
			ZLF->ZLF_DCRSET := Posicione("ZL2",1,xFilial("ZL2")+cpSetor,"ZL2_DESCRI")
		Else
			ZLF->ZLF_DCRSET :=	_cDesSetor
		EndIf
		
		If Len(AllTrim(_cDesLinha)) == 0
			
			If Len(AllTrim(cpLinha)) > 0
				ZLF->ZLF_DCRLIN := Posicione("ZL3",1,xFilial("ZL3")+cpLinha,"ZL3_DESCRI")
			Else
				ZLF->ZLF_DCRLIN := ""
			EndIf
			
		Else
			ZLF->ZLF_DCRLIN:= _cDesLinha
		EndIf
		
		If Len(AllTrim(_cDesFret)) == 0
			ZLF->ZLF_A2NOME := Posicione("SA2",1,xFilial("SA2")+cpForn+cpLoja,"A2_NOME")
		Else
			ZLF->ZLF_A2NOME := _cDesFret
		EndIf
		
		If Len(AllTrim(_cDesEvent)) == 0
			ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NREDUZ")
		Else
			ZLF->ZLF_DCREVE := _cDesEvent
		EndIf
		
		ZLF->ZLF_TRIBUT := _cTribut
		
		//ZLF->ZLF_FILENT := U_GetFilEnt(cpForn,cpLoja,dt2)//Filial de entrega da linha do produtor
		
		MsUnLock()
		bRet:= .T.
		
	EndIf
EndIf

End Transaction

RestArea(aArea)

Return bRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � gEvtPrd     � Autor � TOTVS                 � Data da Criacao  � 13/01/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Grava Evento do Produtor                                                               						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpFretis,cpLoja,nForm						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function gEvtPrd(cpFilial,cpMix,cVersao,cpSetor,cpLinha,cpEvento,cpEveDC,cpEveMix,cpForn,cpLoja,nForm,_cDesSetor,_cDesLinha,_cDesProd,_cDesEvent,_cTribut)

Local bRet:=.F.
Local aArea := GetArea()

_cTribut := 'I'

_pnVLEITE := U_VolLeite(cpFilial,dt1,dt2,cpSetor,cpLinha,cpForn,cpLoja,"") // BUSCA VOLUME DE LEITE DO SETOR
//��������������������������������������������������������������������������������������������������Ŀ
//� A transacao foi inserida mediante constatacao                                                    �
//� que ao tentar gravar um novo evento sao chamadas funcoes                                         �
//� para alimentar determinados campos caso ouvesse erro em alguma destas funcoes o evento           �
//� era gravado na ZLF com os dados dos campos posteriores a funcao que houve o erro zerados.        �
//����������������������������������������������������������������������������������������������������
Begin Transaction

dbSelectArea("ZLF")
dbSetOrder(3) // ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_SETOR+ZLF_LINROT+ZLF_EVENTO+ZLF_A2COD+ZLF_A2LOJA+ZLF_TRIBUT
dbGoTop()
dbSeek(cpFilial+cpMix+cVersao+cpSetor+cpLinha+cpEvento+cpForn+cpLoja+_cTribut)
If Found()
	If ZLF->ZLF_STATUS == "A"
		RecLock("ZLF", .F.)
		ZLF->ZLF_TOTAL  := nForm
		ZLF->ZLF_QTDBOM := _pnVLEITE
		ZLF->ZLF_VLRLTR := Round((nForm/_pnVLEITE),_nRound)
		If nForm == 0
			dbDelete()
		EndIf
		ZLF->(DbCommit())
		MsUnLock()
		bRet:=.T.
	EndIf
Else
	If nForm != 0 .And. isOpen(cpFilial,cpSetor,cpLinha,cpForn,cpLoja)   
//	If (nForm != 0 .Or. (nForm == 0 .And. !Empty(ZL8->ZL8_NNEUTR))) .And. isOpen(cpFilial,cpSetor,cpLinha,cpForn,cpLoja)
		RecLock("ZLF", .T.)
		ZLF->ZLF_FILIAL := cpFilial
		ZLF->ZLF_CODZLE := cpMix
		ZLF->ZLF_VERSAO := cVersao
		ZLF->ZLF_SETOR  := cpSetor
		ZLF->ZLF_LINROT := cpLinha
		ZLF->ZLF_RETIRO := cpForn
		ZLF->ZLF_RETILJ := cpLoja
		ZLF->ZLF_A2COD  := cpForn
		ZLF->ZLF_A2LOJA := cpLoja
		ZLF->ZLF_EVENTO := cpEvento
		ZLF->ZLF_ENTMIX := cpEveMix
		ZLF->ZLF_DEBCRED:= cpEveDC
		ZLF->ZLF_DTINI  := dt1
		ZLF->ZLF_DTFIM  := dt2
		ZLF->ZLF_ORIGEM := "M"
		ZLF->ZLF_QTDBOM := U_VolLeite(cpFilial,dt1,dt2,cpSetor,cpLinha,cpForn,cpLoja,"") // BUSCA VOLUME DE LEITE DO SETOR
		//ZLF->ZLF_QTDBOM := U_volLeiTr(xFilial("ZLD"),cpSetor,cpLinha,cpForn,cpLoja,dt1,dt2,_cTribut)
		ZLF->ZLF_TOTAL  := nForm
		ZLF->ZLF_VLRLTR := Round((nForm/ZLF->ZLF_QTDBOM),_nRound)
		ZLF->ZLF_ACERTO := "N"
		ZLF->ZLF_TP_MIX := "L"
		ZLF->ZLF_TIPO   := "L"
		ZLF->ZLF_STATUS := "A"
		ZLF->ZLF_SEQ	:= U_GetSeqZLF(cpMix,cpEvento,cpForn,cpLoja)
		
		// obtendo descricoes
		If Len(AllTrim(_cDesSetor)) == 0
			ZLF->ZLF_DCRSET := Posicione("ZL2",1,xFilial("ZL2")+cpSetor,"ZL2_DESCRI")
		Else
			ZLF->ZLF_DCRSET :=	_cDesSetor
		EndIf
		
		If Len(AllTrim(_cDesLinha)) == 0
			ZLF->ZLF_DCRLIN := Posicione("ZL3",1,xFilial("ZL3")+cpLinha,"ZL3_DESCRI")
		Else
			ZLF->ZLF_DCRLIN:= _cDesLinha
		EndIf
		
		If Len(AllTrim(_cDesProd)) == 0
			ZLF->ZLF_A2NOME := Posicione("SA2",1,xFilial("SA2")+cpForn+cpLoja,"A2_NOME")
		Else
			ZLF->ZLF_A2NOME := _cDesProd
		EndIf
		
		If .F. //nForm == 0
			ZLF->ZLF_DCREVE := "" //Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NNEUTR")   
		ElseIf Len(AllTrim(_cDesEvent)) == 0
			ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NREDUZ")    
		Else
			ZLF->ZLF_DCREVE := _cDesEvent			
		EndIf

/*		If Len(AllTrim(_cDesEvent)) == 0
			ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFilial("ZL8")+cpEvento,"ZL8_NREDUZ")
		Else
			ZLF->ZLF_DCREVE := _cDesEvent
		EndIf */

		ZLF->ZLF_TRIBUT := _cTribut
		
		//ZLF->ZLF_FILENT := U_GetFilEnt(cpForn,cpLoja,dt2)//Filial de entrega da linha do produtor
		ZLF->(DbCommit())		
		MsUnLock()
		bRet:=.T.
	EndIf
EndIf

End Transaction

RestArea(aArea)

Return bRet

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � Export      � Autor � TOTVS                 � Data da Criacao  � 20/02/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Converte Tabela Temporaria em arquivo XML                                              						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cAlias,aRotulos=Array dos Rotulos                                                     						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function Export(cAlias,aRotulos,_aDados)

Local aTabela := {}
Local aLinha  := {}
Local oFile
Local oDlgExp

Local x

cFileName := Padr("c:\Mix"+dtos(dDatabase)+"-"+strtran(time(),":","")+".xml",200)

If cAlias <> 'ARRAY'
	
	For y:=1 To Len(aRotulos)
		aAdd(aLinha,aRotulos[y,1])
	Next y
	
	aAdd(aTabela,aLinha)
	
	
	(cAlias)->(dbGoTop())
	While !(cAlias)->(Eof())
		aLinha := {}
		For nContador := 1 To FCount()
			aAdd(aLinha,(cAlias)->&(FieldName(nContador)))
		Next nContador
		aAdd(aTabela,aLinha)
		(cAlias)->(dbSkip())
	EndDo
	(cAlias)->(dbGoTop())
	
Else
	
	For y:=1 To Len(aRotulos)
		aAdd(aLinha,aRotulos[y])
	Next y
	
	aAdd(aTabela,aLinha)
	
	For x:=1 to Len(_aDados)
		
		aLinha := {}
		
		For nContador := 1 To Len(_aDados[x])
			
			aAdd(aLinha,_aDados[x,nContador])
			
		Next nContador
		
		aAdd(aTabela,aLinha)
		
	Next x
	
EndIf


//���������������������������������������������������������������������Ŀ
//� Mostra Tela de Exportacao de Dados p/ XML (Excel)                   �
//�����������������������������������������������������������������������
@ 00,00 To 150,300 Dialog oDlgExp Title "Exportar Dados"
@ 00,00 To 220,300 Pixel Of oDlgExp
oPanCon := TPanel()	:New(00,00, "", oDlgExp, Nil, .T., .F., Nil, Nil, 200,300, .T., .F. )
@ 10,010 say "Essa rotina ir� exportar os dados para o formato XML," Pixel Of oPanCon
@ 20,010 say "que � reconhecido pelo Microsoft Excel.              " Pixel Of oPanCon
@ 43,010 say "Arquivo:" Pixel Of oPanCon
@ 40,040 MsGet oFile Var cFileName F3 "DIR" WHEN .T. valid (VldFileName()) Size 80,10 Pixel Of oPanCon
@ 60,050 BmpButton Type 1 Action Processa( {|| ProcRegua(2),VldFileName(),IncProc(),U_RayToXml(aTabela,cFileName),IncProc(),U_AbreExcel(cFileName),close(oDlgExp) })
@ 60,080 BMPBUTTON TYPE 2 ACTION close(oDlgExp)
Activate Dialog oDlgExp Center

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � VldFileName � Autor � TOTVS                 � Data da Criacao  � 20/02/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Valida caminho e nome do arquivo XML da funcao Export                                  						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                                                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function VldFileName()

Local lRet

If ".xml" $ cFileName .or. ".XML" $ cFileName
	Return .T.
Else
	cFileName:=AllTrim(cFileName)+".xml"
	Return .T.
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � ShowVals    � Autor � TOTVS                 � Data da Criacao  � 20/02/2009             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Mostra valores totais dos eventos                                                      						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cTab - Tabela Temporaria (TRS,TRL,TRP)                                                						���
���Parametros� lagroup - Verdadeiro se modo agrupado                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
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
Static Function ShowVals(cTab,lagroup)

Local nPos1 := 10
Local nPos2 := 40
Local nPos3 := 120
Local nLin  :=0
Local nCount:=0
Local nTit01,nTit02,nTit03,nTit04,nTit05,nTit06,nTit07,nTit08,nTit09,nTit10,nTit11,nTit12,nTit13,nTit14,nTit15
Local oGet01,oGet02,oGet03,oGet04,oGet05,oGet06,oGet07,oGet08,oGet09,oGet10,oGet11,oGet12,oGet13,oGet14,oGet15
Local oTot01,oTot02,oTot03,oTot04,oTot05,oTot06,oTot07,oTot08,oTot09,oTot10,oTot11,oTot12,oTot13,oTot14,oTot15
Local aDados:={}
Local nAux1 :=0
Local nAux2 :=0

Local _aArea:= GetArea()

Private nZ  := 1

If !ShowLtr
	xMagHelpFis("Modo de Visualizacao",;
	"Opcao disponivel somente no modo de Valores por Litro.",;
	"Entre novamente usando modo de visualizacao em Valores por Litro.")
	Return
EndIf

For i:=1 To Len(aStruct2)
	
	nAux1:=Round(&(aStruct2[i,1]),_nRound)
	nAux2:=Round(nAux1*(cTab)->&(cTab+"_VOL"),2)
	If cTab=="TRS"
		nAux2:= U_GetTotGp((cTab)->&(cTab+"_FILIAL"),aStruct2[i,5],(cTab)->&(cTab+"_COD"),,,,NumMix,,cVersao)
	ElseIf cTab == "TRL"
		If lagroup
			If 'TOTAL' $ Upper((cTab)->&(cTab+"_DESCRI"))
				nAux2:=Round(nAux1*(cTab)->&(cTab+"_VOL"),2)
			else
				nAux2:= U_GetTotGp((cTab)->&(cTab+"_FILIAL"),aStruct2[i,5],cSetIni,(cTab)->&(cTab+"_COD"),,,NumMix,,cVersao)
			EndIf
		Else
			If 'TOTAL' $ Upper((cTab)->&(cTab+"_DESCRI"))
				nAux2:=Round(nAux1*(cTab)->&(cTab+"_VOL"),2)
			Else
				nAux2:= U_GetTotEv((cTab)->&(cTab+"_FILIAL"),aStruct2[i,5],cSetIni,(cTab)->&(cTab+"_COD"),,,NumMix,cVersao)
			EndIf
		EndIf
	EndIf
	
	If nAux1 != 0 .Or. nAux2 != 0
		
		aAdd(aDados,{aStruct2[i,6],nAux1,nAux2})
		
	EndIf
	
Next i

If Len(aDados) > 0
	
	//���������������������������������������������������������������������Ŀ
	//� Tela de edicao                                                      �
	//�����������������������������������������������������������������������
	DEFINE MSDIALOG oDlgVals FROM 0,0 TO 350,450 PIXEL TITLE 'Valores'
	@ 05,05 TO 023,210
	@ 25,127 TO 085,210
	
	@ 10,nPos1 SAY (cTab)->&(cTab+"_COD") Pixel Of  oDlgVals
	@ 10,nPos2 SAY LEFT((cTab)->&(cTab+"_DESCRI"),30) Pixel Of  oDlgVals
	@ 10,nPos3 SAY TRANSFORM((cTab)->&(cTab+"_VOL"),"@E 999,999,999")+" Litros" Pixel Of  oDlgVals
	
	oBrowse := VCBrowse():New(25,05,210,120,,{'Evento','Valor p/Litro','Total'},{100,50,50}, oDlgVals, ,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
	oBrowse:SetArray(aDados)
	oBrowse:bLine := {||{;
	aDados[oBrowse:nAt,01],;
	aDados[oBrowse:nAt,02],;
	aDados[oBrowse:nAt,03] } }
	
	TButton():New(160,005, 'Fechar', oDlgVals,{|| Processa({|| close(oDlgVals) })  },50,10,,,,.T.)
	ACTIVATE MSDIALOG oDlgVals CENTERED
	
Else
	
	MsgInfo("N�o existe lan�amento de eventos!")
	
EndIf

restArea(_aArea)

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AdcMerc     � Autor � TOTVS                 � Data da Criacao  � 22/04/2010             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina para atualizar o valor do Adicional de Mercado no cadastro de cliente e na tela do MIX.               ���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       �                                                                   											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum                               			                                                        	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                               			                                                        	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
Static Function AdcMerc()

Local aArea   := GetArea()
Local nOpc    := 0
Local aBotoes := {"Cancelar","A L T E R A R","Restaurar"}
Local cTexto  := "O que voc� deseja fazer, Alterar o valor do Pre�o Negociado ou restaurar o �ltimo valor negociado ?"+Chr(10)+Chr(13)+;
"Clique no bot�o Alterar para que o Pre�o Negociado possa ser aumentado ou diminuido."+Chr(10)+Chr(13)+;
"Use o bot�o Restaurar, para que o sistema atualize o Pre�o Negociado com o �ltimo valor usado nesse campo."+Chr(10)+Chr(13)+;
"Esta rotina, tem influ�ncia direta no evento Adicional de Mercado, conhecido como TETO."

nOpc := AVISO("Preco Negociado", cTexto, aBotoes, 3)

If nOpc == 2//Altera o valor
	
	AjustSX1()
	If !Pergunte(cPerg2,.T.)
		Return(.F.)
	EndIf
	
	Begin Transaction
	dbSelectArea("SA2")
	dbSetOrder(1)
	If Empty(MV_PAR01)
		dbSeek(xFilial("SA2")+"P00001")
	Else
		dbSeek(xFilial("SA2")+MV_PAR01)
	EndIf
	
	ProcRegua(RecCount(),"Aguarde...")
	
	While SA2->(!Eof()) .And. xFilial("SA2")==SA2->A2_FILIAL .And. SA2->A2_COD >= MV_PAR01 .And. SA2->A2_COD <= MV_PAR02
		
		IncProc("Produtor: "+SA2->A2_NOME)
		
		//Loja do Produtor
		If SA2->A2_LOJA < MV_PAR03 .Or. SA2->A2_LOJA > MV_PAR04
			SA2->(dbSkip())
			Loop
		EndIf
		
		//Linha/Rota do Produtor
		If SA2->A2_L_LI_RO < MV_PAR05 .Or. SA2->A2_L_LI_RO > MV_PAR06
			SA2->(dbSkip())
			Loop
		EndIf
		
		//Valor do Adicional de Mercado
		If SA2->A2_L_ADICI < MV_PAR07 .Or. SA2->A2_L_ADICI > MV_PAR08
			SA2->(dbSkip())
			Loop
		EndIf
		
//		If SA2->A2_L_ADICI > 0
			
			//Grava o novo valor no cadastro do produtor
			RecLock("SA2",.F.)
			SA2->A2_L_BKPAD := SA2->A2_L_ADICI
			SA2->A2_L_ADICI += MV_PAR09

			MsUnLock()
//		EndIf
		
		SA2->(dbSkip())
	EndDo
	
	//��������������������������������������������������������������������
	//� Chama funcao para recalcular o Adicional de Mercado e Incentivo. �
	//��������������������������������������������������������������������
//	Recalc(MV_PAR01,MV_PAR02,MV_PAR03,MV_PAR04,MV_PAR05,MV_PAR06)
	End Transaction
	
ElseIf nOpc == 3//Restaurar valor
	If MsgNoYes("Voc� tem certeza que deseja retaurar o Valor Negociado?")
		
		AjustSX1()
		If !Pergunte(cPerg2,.T.)
			MsgInfo("A oper��o foi  C A N C E L A D A,  logo o Valor Negociado  N � O  sofreu nenhuma altera��o.")
			Return(.F.)
		EndIf
		
		Begin Transaction
		dbSelectArea("SA2")
		dbSetOrder(1)
		If Empty(MV_PAR01)
			dbSeek(xFilial("SA2")+"P00001")
		Else
			dbSeek(xFilial("SA2")+MV_PAR01)
		EndIf
		
		ProcRegua(RecCount(),"Aguarde...")
		
		While SA2->(!Eof()) .And. xFilial("SA2")==SA2->A2_FILIAL .And. SA2->A2_COD >= MV_PAR01 .And. SA2->A2_COD <= MV_PAR02
			
			IncProc("Produtor: "+SA2->A2_NOME)
			
			//Loja do Produtor
			If SA2->A2_LOJA < MV_PAR03 .Or. SA2->A2_LOJA > MV_PAR04
				SA2->(dbSkip())
				Loop
			EndIf
			
			//Linha/Rota do Produtor
			If SA2->A2_L_LI_RO < MV_PAR05 .Or. SA2->A2_L_LI_RO > MV_PAR06
				SA2->(dbSkip())
				Loop
			EndIf
			
			//Valor do Adicional de Mercado
			If SA2->A2_L_ADICI < MV_PAR07 .Or. SA2->A2_L_ADICI > MV_PAR08
				SA2->(dbSkip())
				Loop
			EndIf
			
			//Grava o novo valor no cadastro do produtor
			RecLock("SA2",.F.)
			SA2->A2_L_ADICI := SA2->A2_L_BKPAD
			MsUnLock()
			
			SA2->(dbSkip())
		EndDo
		
		//��������������������������������������������������������������������
		//� Chama funcao para recalcular o Adicional de Mercado e Incentivo. �
		//��������������������������������������������������������������������
		Recalc(MV_PAR01,MV_PAR02,MV_PAR03,MV_PAR04,MV_PAR05,MV_PAR06)
		End Transaction
	Else
		MsgInfo("A oper��o foi  C A N C E L A D A,  logo o Valor Negociado  N � O  sofreu nenhuma altera��o.")
		Return(.F.)
	EndIf
Else
	MsgInfo("A oper��o foi  C A N C E L A D A,  logo o Valor Negociado  N � O  sofreu nenhuma altera��o.")
	Return(.F.)
EndIf

RestArea(aArea)
Return(.T.)

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � Recalc      � Autor � TOTVS                 � Data da Criacao  � 08/04/2010             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Atualiza os eventos de Adicional de Mercado e Incentivo ICMS sempre que alterado o valor negociado.          ���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Alteracao ou recuperacao do valor negociado (Adicional de Mercado).										    ���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� ExpC01 - Produtor De                                                                   						���
���          � ExpC02 - Produtor Ate                                                                  						���
���          � ExpC03 - Loja De                                                                                             ���
���          � ExpC04 - Loja Ate                                                                                            ���
���          � ExpC05 - Linha De                                                                                            ���
���          � ExpC06 - Linha Ate                                                                                           ���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
Static Function Recalc(cProDe,cProAte,cLjDe,cLjAte,cLinDe,cLinAte)

Local aArea    := GetArea()
Local cAux     := ""
Local aBrowAux := {{.F.,.F.,"","",0}}
Local aSetAux  := {}
Local nVlrInc  := 0
Local nVlrAdc  := 0

//���������������������������������������������������������������������Ŀ
//� Cria array com Setores que poderao ser executados                   �
//�����������������������������������������������������������������������
cAux:=AllTrim(Posicione("ZLU",1,xFilial("ZLU")+Padr(cUserName,25),"ZLU_SETOR"))
dbSelectArea("ZL2")
dbSetOrder(1)
dbGoTop()
While !Eof()
	//Tratamento quando o cadastro de setor esta compartilhado
	If Empty(xFilial("ZL8"))
		If ZL2->ZL2_COD $ cAux
			aAdd(aSetAux,{.T.,ZL2_COD,ZL2_DESCRI})
		EndIf
	ElseIf LEFT(ZL2_COD,2)==xFilial("ZL8")
		If ZL2->ZL2_COD $ cAux
			aAdd(aSetAux,{.T.,ZL2_COD,ZL2_DESCRI})
		EndIf
	EndIf
	dbSkip()
EndDo

//���������������������������������������������������������������������������Ŀ
//� Preenche os parametros com o codigo do Produtor antes de chamar a funcao. �
//�����������������������������������������������������������������������������
dbSelectArea("SX1")
dbSetOrder(1)
dbSeek(cPerg1)

While SX1->(!Eof()) .And. AllTrim(SX1->X1_GRUPO) == AllTrim(cPerg1)
	
	If SX1->X1_ORDEM == "01"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cProDe    //Produtor De
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "02"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cLjDe     //Loja De
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "03"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cProAte   //Produtor Ate
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "04"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cLjAte    //Loja Ate
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "05"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := Space(6)  //Fretista De
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "06"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := Space(2)  //Loja De
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "07"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := "ZZZZZZ"  //Fretista Ate
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "08"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := "ZZ"      //Loja Ate
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "09"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cLinDe    //Linha De
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "10"
		RecLock("SX1",.F.)
		SX1->X1_CNT01 := cLinAte   //Linha Ate
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "11"
		RecLock("SX1",.F.)
		SX1->X1_PRESEL := 1        //NAO - Filtra Donos de Tanque
		MsUnLock()
		
	ElseIf SX1->X1_ORDEM == "12"
		RecLock("SX1",.F.)
		SX1->X1_PRESEL := 1        //NAO - Filtra Usuarios de Tanque
		MsUnLock()
	EndIf
	dbSkip()
EndDo

Pergunte(cPerg1,.F.)

Processa({|| RunFormulas(aSetAux,aBrowAux,NumMix,"",.F.) })

RestArea(aArea)
Return()

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �fMarkAll  �Autor  � TOTVS              � Data �  00/00/00   ���
�������������������������������������������������������������������������͹��
���Desc.     � Funcao para marcar e desmarcar todos os registros.         ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Generico                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function fMarkAll(aEvt)

Local nProc := 0
Local lMark := If(aEvt[1][1],.F.,.T.)

If Len(aEvt) > 0
	For nProc := 1 To Len(aEvt)
		aEvt[nProc][1] := lMark
	Next
EndIf

Return

/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AjustSX1    � Autor � TOTVS                 � Data da Criacao  � 27/04/2010             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Criacao dos parametros para a rotina de ajuste do valor do adicional de mercado.       						���
���          �                                 							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Generico.                                                         											���
���          � 	 							                                                                                ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros�                                                                                      						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum					                                                                                  	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   �															                             						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite	                                                                       						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������Ĺ��
���          �          �                    							   �                                  � 			���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
*/
Static Function AjustSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//����������������������������������������������������������������������������������Ŀ
//� Gravacao do novo grupo de perguntas, usado na alteracao do Adicional de Mercado. �
//������������������������������������������������������������������������������������
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Produtor. Voce pode')
Aadd( aHelpPor, 'informar de " " a ZZZZZZ, para         ')
Aadd( aHelpPor, 'considerar todos.                      ')
U_xPutSx1(cPerg2,"01","Produtor de?","Produtor de?","Produtor de?","mv_ch1","C",6,0,0,"G",,"SA2_L9","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg2,"02","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch2","C",6,0,0,"G",,"SA2_L9","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg2,"03","Loja de?","Loja de?","Loja de?","mv_ch3","C",4,0,0,"G",,"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg2,"04","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch4","C",4,0,0,"G",,"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Grupo Pre�o inicial ')
U_xPutSx1(cPerg2,"05","Grupo de?","Rota/Linha de?","Rota/Linha de?","mv_ch5","C",6,0,0,"G",,"ZL3_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Grupo Pre�o final.  ')
U_xPutSx1(cPerg2,"06","Grupo Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_ch6","C",6,0,0,"G",,"ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o valor do Adicional de Mercado inicial ')
U_xPutSx1(cPerg2,"07","Valor De?","Valor De?","Valor De?","mv_ch7","N",8,4,0,"G",,"","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o valor do Adicional de Mercado inicial ')
U_xPutSx1(cPerg2,"08","Valor Ate?","Valor Ate?","Valor Ate?","mv_ch8","N",8,4,0,"G",,"","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o valor do indice de reajuste  ')
Aadd( aHelpPor, 'em centavos.                           ')
U_xPutSx1(cPerg2,"09","Reajuste de:","Reajuste de:","Reajuste de:","mv_ch9","N",8,4,0,"G","","","","","MV_PAR09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PesqProdut� Autor � TOTVS              � Data �  06/05/11   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao usada para realizar uma pesquisa do produtor + Loja ���
���          � na tela de produtores do mix facilitando desta a localiza- ���
���          � cao do produtor para insercao manual de eventos.           ���
�������������������������������������������������������������������������͹��
���Parametros�oBrowse3 - Browse da tela de Produtores    				  ���
���          �_cAlias  - Alias dos dados dos Produtores					  ���
�������������������������������������������������������������������������͹��
���Uso       � GENERICO                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function PesqProdut(oBrowse3,_cAlias)

Local oButton1
Local oGCodProd
Local cGCodProd := SPACE(06)
Local oGLjProd
Local cGLjProd  := SPACE(04)
Local oSay1
Local oSay2

Private oDlgPesq

DEFINE MSDIALOG oDlgPesq TITLE "PESQUISAR PRODUTOR" FROM 000, 000  TO 110, 380 COLORS 0, 16777215 PIXEL

@ 008, 013 SAY oSay1 PROMPT "CODIGO" SIZE 031, 006 OF oDlgPesq COLORS 0, 16777215 PIXEL
@ 015, 013 MSGET oGCodProd VAR cGCodProd SIZE 060, 010 OF oDlgPesq PICTURE "X99999" COLORS 0, 16777215 F3 "SA2_L4" PIXEL
@ 008, 118 SAY oSay2 PROMPT "LOJA" SIZE 025, 007 OF oDlgPesq COLORS 0, 16777215 PIXEL
@ 015, 118 MSGET oGLjProd VAR cGLjProd SIZE 060, 010 OF oDlgPesq PICTURE "9999" COLORS 0, 16777215 PIXEL
@ 035, 141 BUTTON oButton1 PROMPT "Pesquisar" SIZE 037, 012 OF oDlgPesq ACTION pesqProUsr(oBrowse3,_cAlias,cGCodProd,cGLjProd) PIXEL

ACTIVATE MSDIALOG oDlgPesq CENTERED

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �pesqProUsr� Autor � TOTVS              � Data �  06/05/11   ���
�������������������������������������������������������������������������͹��
���Descricao � Posiciona no codigo + loja do produtor informado na tela   ���
���          � de pesquisa de produtores.								  ���
���          � 													          ���
�������������������������������������������������������������������������͹��
���Parametros� oBrowse3  - Browse da tela de Produtores    				  ���
���          � _cAlias   - Alias dos dados dos Produtores	   			  ���
���			 � _cCodProd - Codigo do Produtor para pesquisa				  ���
���			 � _cLojProd - Loja do Produtor para pesquisa 				  ���
�������������������������������������������������������������������������͹��
���Uso       � GENERICO                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function pesqProUsr(oBrowse3,_cAlias,_cCodProd,_cLojProd)

dbSelectArea(_cAlias)
(_cAlias)->(dbSetOrder(1))

If !(_cAlias)->(MsSeek(_cCodProd + _cLojProd,.T.))
	MsgBox("Produtor n�o encontrado, favor verificar o c�digo fornecido.","ATENCAO","INFO")
	(_cAlias)->(dbGotop())
Else
	oDlgPesq:End()
EndIf

oBrowse3:DrawSelect()
oBrowse3:Refresh(.T.)

Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �LimpaZLF  �Autor  �Guilherme Franca    � Data �  17/06/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Seleciona produtores que estao sem leite na ZLD para apagar���
���          � registros que possam estar na ZLF.                         ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static function LimpaZLF(_dDtIni, _dDtFim)

Local _cFiltro := "%  '"+DTOS(_dDtIni)+"' AND  '"+DTOS(_dDtFim)+"'  %"

If Select("TUPD") <> 0
	TUPD->(DbCloseArea())
EndIf	

BeginSql alias "TUPD"
	SELECT
	ZLD_RETIRO COD, ZLD_RETILJ LOJA, SUM(ZLD_QTDBOM) AS QTD
	FROM
	%table:ZLD% ZLD
	WHERE
	ZLD.%notDel%
	AND ZLD_DTCOLE BETWEEN %exp:_cFiltro%
	GROUP BY ZLD_RETIRO, ZLD_RETILJ HAVING SUM(ZLD_QTDBOM) < 1
EndSql


DbSelectArea("TUPD")
TUPD->(DbGoTop())

While !TUPD->(Eof())
	DelZLF(TUPD->COD,TUPD->LOJA)
	TUPD->(DbSkip())
EndDo

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �DelZLF    �Autor  �Guilherme Franca    � Data �  17/06/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Deleta registros da ZLF no MIX posicionado para produtores ���
���          � sem movimento de leite.                                    ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function	DelZLF(xcCod,xcLoja)

Local cQry := ""
Local lSqlOk := .t.

cQry := "DELETE FROM"
cQry += " " + RETSQLNAME("ZLF")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLF_FILIAL = '" + xFilial("ZLF") 	+ "'"
cQry += " AND ZLF_CODZLE = '" + NumMix			+ "'"
cQry += " AND ZLF_A2COD  = '"+ xcCod +"'"
cQry += " AND ZLF_A2LOJA = '"+ xcLoja +"'"

lSqlOk := !(TCSqlExec(cQry) < 0)

If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf
        
If !lSqlOk
	xMagHelpFis("NAO CONFORMIDADE 12 - NO DELETE",;
	TcSqlError(),;
	"Verifique a Sintaxe da Query de DELETE que limpa registros de produtores sem leite.")
EndIf

Return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �AtualizaGrupo �Autor �Guilherme Franca � Data �  26/09/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Atualiza campo ZLD_GRPRC com o conteudo do A2_L_LI_RO     r���
���          � para evitar divergencias de volume e preco.                ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AtualizaGrupo(_dDtIni,_dDtFim)

Local cQry := ""
Local lSqlOk := .t.

If (TcGetDB() == 'ORACLE')
	cQry := " UPDATE "
	cQry += " " + RETSQLNAME("ZLD")	
	cQry += " SET ZLD_GRPRC = (SELECT " + RETSQLNAME("SA2")+".A2_L_LI_RO FROM " + RETSQLNAME("SA2")
	cQry += " 	WHERE "+ RETSQLNAME("SA2")+".A2_COD = "+RETSQLNAME("ZLD")+".ZLD_RETIRO "
	cQry += " 	AND " + RETSQLNAME("SA2")+".A2_LOJA = "+RETSQLNAME("ZLD")+".ZLD_RETILJ "
	cQry += " 	AND " + RETSQLNAME("SA2")+".A2_L_LI_RO <> ' ' "
	cQry += " 	AND " + RETSQLNAME("SA2")+".D_E_L_E_T_ = ' ') "
	cQry += " WHERE "+RETSQLNAME("ZLD")+".ZLD_FILIAL = '"+xFilial("ZLD")+"' " 
	cQry += " AND "+RETSQLNAME("ZLD")+".ZLD_DTCOLE BETWEEN '"+DTOS(_dDtIni)+"' AND  '"+DTOS(_dDtFim)+"' "   
	cQry += " AND "+RETSQLNAME("ZLD")+".D_E_L_E_T_ = ' ' "

Else
	cQry := "UPDATE "
	cQry += " " + RETSQLNAME("ZLD")
	cQry += " SET ZLD_GRPRC = A2.A2_L_LI_RO "
	cQry += " FROM " + RETSQLNAME("ZLD")+" LD "
	cQry += " JOIN " + RETSQLNAME("SA2")+" A2 ON A2_COD = ZLD_RETIRO AND A2_LOJA = LD.ZLD_RETILJ "
	cQry += " AND A2.A2_L_LI_RO <> ' ' AND A2.A2_L_LI_RO <> LD.ZLD_GRPRC "
	cQry += " AND A2.D_E_L_E_T_ = ' ' "
	cQry += " WHERE LD.ZLD_FILIAL = '"+xFilial("ZLD")+"' AND ZLD_DTCOLE BETWEEN '"+DTOS(_dDtIni)+"' AND  '"+DTOS(_dDtFim)+"'  AND LD.D_E_L_E_T_ = ' ' "
EndIf
	
lSqlOk := !(TCSqlExec(cQry) < 0)
     
If lSqlOk .and.  (TcGetDB() == 'ORACLE')
	lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
EndIf

If !lSqlOk
	xMagHelpFis("UPDATE ZLD - GRUPO PRECO",;
	TcSqlError(),;
	"Verifique a Sintaxe da Query de UPDATE que regulariza os grupos de precos.")
EndIf

Return


