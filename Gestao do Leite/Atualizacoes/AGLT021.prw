#INCLUDE "PROTHEUS.CH"
#DEFINE LINHAS 999
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT021  � Autor � TOTVS                 � Data da Criacao  � 11/06/2010                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina desenvolvida para possibilitar incluir eventos manuais no mix leite.                                  ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Edita eventos por produtor.    						                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function AGLT021()
local aQuery     := {}
local cCondicao  := " "
local bFiltraBrw := {|| NIL }

private aRotina    := MenuDef()
private cCadastro  := OemToAnsi("Eventos por Produtor")
private cAlias     := "ZLF"
private bVisualiza := {|| GLT021UPD('ZLF',ZLF->(recno()),2)}
private bEdita     := {|| GLT021UPD('ZLF',ZLF->(recno()),4)}
private bVldCpo	   := {|| vldCpo() }

private cPerg      := "AGLT021"

//���������������������������������������������������������������������Ŀ
//� Chama funcao para criar os parametros caso nao existam.             �
//�����������������������������������������������������������������������
AjustaSX1()

//���������������������������������������������������������������������Ŀ
//� Chama a tela para preenchimento dos parametros.                     �
//�����������������������������������������������������������������������
If !Pergunte(cPerg,.T.)
	Return()
EndIf

cTpMix := if(mv_par02 == 1,"L","F")
cCondicao  := "ZLF_CODZLE == '" + mv_par01 + "' .AND. ZLF_TP_MIX == '" + cTpMix + "' "

//���������������������������������������������������������������������Ŀ
//� Posiciona no cadastro do MIX.                                       �
//�����������������������������������������������������������������������
/*dbSelectArea("ZLE")
DbSetOrder(1)
If DbSeek(xFILIAL("ZLE")+MV_PAR01)
dbSelectArea("ZLF")
DbSetOrder(1)
DbSeek(xFILIAL("ZLF")+ZLE->ZLE_COD,.T.)
Else
MsgAlert("Codigo de MIX n�o encontrado!","Alerta")
Return
EndIf

*/

//��������������������������������������������������������������Ŀ
//� Verifica se o Arquivo Esta Vazio                             �
//����������������������������������������������������������������
If !ChkVazio(cAlias)
	Return( NIL )
Endif

//������������������������������������������������������������������������Ŀ
//�Realiza o Filtro                                                        �
//��������������������������������������������������������������������������
bFiltraBrw := {|| FilBrowse(cAlias,@aQuery,@cCondicao) }
Eval(bFiltraBrw)

//��������������������������������������������������������������Ŀ
//� Endereca a funcao de BROWSE                                  �
//����������������������������������������������������������������
dbSelectArea(cAlias)
mBrowse( 6, 1,22,75,cAlias,,cCondicao,,,,)

//������������������������������������������������������������������������Ŀ
//�Encerra o filtro da tabela.                                             �
//��������������������������������������������������������������������������
EndFilBrw(cAlias,aQuery)




Return( NIL )

/*/
���������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Programa  � MenuDef  � Autor � Microsiga             � Data �00/00/0000���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Utilizacao de Menu Funcional                               ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
���Retorno   � Array com opcoes da rotina                                 ���
�������������������������������������������������������������������������Ĵ��
���Parametros�Array aRotina:                                              ���
���          �                                                            ���
���          �1. Nome a aparecer no cabecalho                             ���
���          �2. Nome da Rotina associada                                 ���
���          �3. Reservado                                                ���
���          �4. Tipo de Transa��o a ser efetuada:                        ���
���          � 	  1 - Pesquisa e Posiciona em um Banco de Dados           ���
���          �    2 - Simplesmente Mostra os Campos                       ���
���          �    3 - Inclui registros no Bancos de Dados                 ���
���          �    4 - Altera o registro corrente                          ���
���          �    5 - Remove o registro corrente do Banco de Dados        ���
���          �5. Nivel de acesso                                          ���
���          �6. Habilita Menu Funcional                                  ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MenuDef()

private aRotina	:=  {{OemToAnsi("Pesquisar"),"AxPesqui", 0,1,0,.F.},;
{OemToAnsi("Visualizar"),'Eval(bVisualiza)' , 0 , 2,0,nil},;
{OemToAnsi("Editar"),'Eval(bEdita)' , 0 , 4,0,nil}}

Return (aRotina)




/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � AGLT021  � Autor � Jeovane               � Data da Criacao  � 11/11/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Atualiza,visualiza eventos por produtor                                                                      ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � MIX Leie                                     		                                                        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� cAlias=Alias a ser editado,nReg=Registro corrente do alias,nOpc=3=Incluir,2=Visualizar,4=Editar           	���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �00/00/0000�                               				   �00-000000 -                       � TI	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
Static Function GLT021UPD(cAlias,nReg,nOpc)
local aArea := getArea()
local cTitulo    := "Eventos por Produtor"
local aObjects 	 := {}
local aPosObj    := {}
local aSize    	 := MsAdvSize()
local aInfo    	 := {aSize[1],aSize[2],aSize[3],aSize[4],3,3}
local aNoFields	 := {"ZLF_FILIAL","ZLF_CODZLE","ZLF_DTINI","ZLF_DTFIM","ZLF_STATUS","ZLF_SETOR","ZLF_DCRSET","ZLF_LINROT","ZLF_TP_RL","ZLF_DCRFIN","ZLF_RETIRO","ZLF_RETILJ","ZLF_DCRREF","ZLF_QTDBOM","ZLF_QTDACI","ZLF_VLRLTR","ZLF_DCRLIN","ZLF_DCRRET","ZLF_ACERTO"}
local aYesFields := {"ZLF_EVENTO","ZLF_DCREVE","ZLF_DEBCRE","ZLF_TOTAL","ZLF_ORIGEM"}
local aAlter 	 := {"ZLF_EVENTO","ZLF_TOTAL","ZLF_ORIGEM"}
local nOffSet    := 0

private cSeek     := xFilial("ZLF")+mv_par01+ZLF->ZLF_RETIRO+ZLF->ZLF_RETILJ
private bSeekFor  := {|| ZLF->ZLF_CODZLE == mv_par01  }
private bSeekWhile:= {|| ZLF->ZLF_FILIAL + ZLF->ZLF_CODZLE+ZLF->ZLF_RETIRO+ZLF->ZLF_RETILJ } //Condicao While para montar o aCols
private cMIX      := ZLE->ZLE_COD
private dDataIni  := ZLE->ZLE_DTINI
private dDataFim  := ZLE->ZLE_DTFIM
private cSetor	  := ZLF->ZLF_SETOR
private cDescSet  := ZLF->ZLF_DCRSET
private cLinRot	  := ZLF->ZLF_LINROT
private cDcrLR    := ZLF->ZLF_DCRLIN
private cTipoLR   := ZLF->ZLF_TP_RL
private cProdutor := ZLF->ZLF_RETIRO
private cLoja	  := ZLF->ZLF_RETILJ
private cNome	  := ZLF->ZLF_DCRRET
private nQtdBom   := ZLF->ZLF_QTDBOM
private nQtdAci   := ZLF->ZLF_QTDACI
private nVlrLtr   := ZLF->ZLF_VLRLTR
private nVlrTot   := ZLF->ZLF_QTDBOM*ZLF->ZLF_VLRLTR
private nVlrCre   := 0
private nVlrDeb   := 0
private nSldLiq   := 0
private bVldLin	  := {|| GLTlinOK()}
private bVldTela  := {|| GLTtudoOk()}
private bDelLinha := {|| DelLinha()}
private lFlat     := .F.
private aButtons  := if(Type("aButtons") == "U", {}, aButtons)
private nPosEvento,nPosOrigem,nPosDebCre,nPosDcrEve,nPosTpMix,nPosTotal
private oDlg,oLteBom,oLteAci,oSetor,oLinRota,oDif
private aHeader[0]
private aCols[0]
private aColsAux[0] //Serve pra controle de alteracao do aCols
private lConfirmou := .T.



//������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
//� Sintaxe da FillGetDados( nOpcx, cAlias, nOrder, cSeekKey, bSeekWhile, uSeekFor, aNoFields, aYesFields, lOnlyYes, cQuery, bMontCols, lEmpty, aHeaderAux, aColsAux, bAfterCols, bBeforeCols, bAfterHeader, cAliasQry )   |
//��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
//Inclusao
if nOpc == 3
	FillGetDados(nOpc,cAlias,1,,,,,aYesFields,,,,.T.,,,,,,)
else //Alteracao,Visualizacao,Exclusao
	FillGetDados(nOpc,cAlias,1,cSeek,bSeekWhile,bSeekFor,aNoFields,,,,,,,,,)
endif



//Armazena uma copia da aCols para controle de alteracao e exclusao
getAcols()



AADD(aObjects,{100,055,.T.,.F.,.T.})
AADD(aObjects,{100,100,.T.,.T.})
AADD(aObjects,{100,002,.T.,.F.})


nPosOrigem	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_ORIGEM"})
nPosEvento	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_EVENTO"})
nPosDebCre	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_DEBCRE"})
nPosDcrEve	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_DCREVE"})
nPosTpMix	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_TP_MIX"})
nPosTotal	:= ascan(aHeader,{|x| alltrim(x[2]) == "ZLF_TOTAL"})

aPosObj     := MsObjSize(aInfo,aObjects)
nSldLiq     := nVlrCre - nVlrDeb

//���������������������������Ŀ
//�Tratamento para tema "Flat"�
//�����������������������������
If "P10" $ oApp:cVersion
	If (Alltrim(GetTheme()) == "FLAT") .Or. SetMdiChild()
		lFlat := .T.
		nOffSet := 7
	EndIf
EndIf

DEFINE MSDIALOG oDlg TITLE cTitulo OF oMainWnd PIXEL FROM aSize[7],0 TO aSize[6],aSize[5]

@ 1.6,00.7 SAY "MIX"
@ 1.5,04.7 MSGET cMIX Picture PesqPict("ZLE","ZLE_COD") Valid CheckSX3("ZLE_COD") .And.  VldUser('ZLE_COD') WHEN .F.
@ 1.6,09.5 SAY "Data Inicio"
@ 1.5,13.2 MSGET dDataIni Valid CheckSX3("ZLE_DTINI") .And. VldUser('ZLE_DTINI') WHEN .F.
@ 1.6,20.0 SAY "Data Fim"
@ 1.5,23.5 MSGET dDataFim Valid CheckSX3("ZLE_DTFIM") .And. VldUser('ZLE_DTFIM') WHEN .F.

@ 2.6,00.7 SAY "Produtor"
@ 2.5,04.7 MSGET cProdutor Valid CheckSX3("ZLF_RETIRO") .And.  VldUser('ZLF_RETIRO') WHEN .F.
@ 2.5,09.4 MSGET cLoja     Valid CheckSX3("ZLF_RETILJ") .And.  VldUser('ZLF_RETILJ') WHEN .F.
@ 2.5,13.2 MSGET cNome WHEN .F.

@ 3.6,00.7 SAY "Linha/Rota"
@ 3.5,04.7 MSGET oLinRota var cLinRot WHEN .F.
@ 3.5,09.4 MSGET cDcrLR WHEN .F.
@ 3.6,34.5 SAY "Tipo"
@ 3.5,36.4 MSGET cTipoLR WHEN .F.

@ 4.6,00.5 SAY "Setor"
@ 4.5,04.7 MSGET oSetor var cSetor  WHEN .F.
@ 4.5,09.4 MSGET cDescSet  WHEN .F.

@ aPosObj[3,1]-nOffSet,005 SAY "Leite Bom" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,030 	MSGET nQtdBom Picture "@E 999,999"      WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,090 SAY "Vlr. Litro" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,120 MSGET nVlrLtr Picture "@E 999,999.9999" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,175 SAY "Total Leite" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,200 MSGET nVlrTot Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,260 SAY "Creditos" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,290 MSGET nVlrCre Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,375 SAY "Debitos" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,405 MSGET nVlrDeb Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,490 SAY "Saldo" OF oDlg PIXEL
@ aPosObj[3,1]-nOffSet,520 MSGET nSldLiq Picture "@E 999,999.99" WHEN .F. SIZE 50,7 OF oDlg PIXEL

oGet := MSGetDados():New(aPosObj[2,1]+10,aPosObj[2,2],aPosObj[2,3]-10,aPosObj[2,4],if(nOpc==2,nOpc,3),"Eval(bVldLin)","Eval(bVldTela)","",((nOpc == 3) .or. (nOpc == 4)),NIL,NIL,NIL,LINHAS,"Eval(bVldCpo)",,,"Eval(bDelLinha)",)


ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| if(nOpc!=5,lConfirmou := GLTtudoOk(),lConfirmou := .T.) ,if(lConfirmou,oDlg:End(),)},{||oDlg:End()},,aButtons)


if lConfirmou
	updZLF(aCols)
endif



restArea(aArea)
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTlinOK  � Autor �Jeovane                � Data � 12.11.08 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validacao da linha do Acols.                   ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTlinOK()
local lRet := .T.
local nCont := 0

if aTail(aCols[n])	 //Verifica se item esta deletado
	return lRet
endif



//Verifica se ja nao inclui evento
if aCols[n,nPosOrigem] == "A"
	cEvento := aCols[n,nPosEvento]
	for x := 1 to len(aCols)
		if !aTail(aCols[x])
			//Nao pode repetir evento
			if cEvento == aCols[x,nPosEvento]
				ncont ++
			endif
		endif
	next x	
	lRet := nCont == 1
endif

if !lRet
	xmaghelpfis("Atencao ","Este evento j� foi lan�ado para este Produtor/Fretista.","Favor escolher outro evento. ")
	return lRet
endif



if acols[n,nPosOrigem] == "A"
	cTpEvento := Posicione("ZL8",1,xFilial("ZL8")+aCols[n,nPosEvento],"ZL8_TPEVEN")
	lRet := cTpEvento == "A"
endif

if !lRet
	xmaghelpfis("Atencao ","Tipo de evento diferente de 'Avulso'","Escolha um evento do tipo 'Avulso'. ")
	return lRet
endif



Return lRet

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Funcao    �GLTtudoOk � Autor �Jeovane                � Data � 12.11.08 ���
�������������������������������������������������������������������������Ĵ��
���Descricao � Funcao para validacao da tela.                             ���
���          �                                                            ���
�������������������������������������������������������������������������Ĵ��
��� Uso      � AGLT001()                                                  ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function GLTtudoOk()
local lRet := .T.

lRet := GLTlinOK()


Return lRet


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � AjustaSX1� Autor � Jeovane            � Data �  12/11/08   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para criacao das perguntas caso elas nao existam.   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function AjustaSX1()

local aHelpPor := {}
local aHelpSpa := {}
local aHelpEng := {}

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Altera��o.                ')
PutSx1(cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Tipo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Altera��o.                ')
PutSx1(cPerg,"02","Tipo do MIX ?","Tipo do MIX ","","mv_ch2","C",1,0,0,"C",'',"","","","mv_par02","Leite","","","","Frete","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return




/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � DelLinha � Autor � Jeovane            � Data �  12/11/08   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao para validar exclusao da linha do Acols             ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
static function delLinha()
local lRet := .T.

lRet := aCols[n,nPosOrigem] == "A"

if !lRet
	xmaghelpfis("Atencao ","Exclus�o n�o permitida!","Este registro foi gerado por outra rotina e n�o ser� exclu�do.")
endif


return lRet


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �getaCols  � Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para atualizar variavel private aColsAux, que eh usada para controle de alteracao/exclusao      ���
���          � do registro da ZLD   											                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � array com cores da legenda                                                            						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/

static function getaCols()
local aArea := getArea()

if type("aCols") != "U"
	aColsAux := aClone(aCols)
endif


restArea(aArea)
return


/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  �InsZLD    � Autor � Jeovane               � Data da Criacao  � 11/09/2008                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Funcao usada para inserir registros na ZLF                                                                   ���
���          �                  												                               				���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Implantacao das rotinas referente a Gestao do Leite.                						                    ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� aRegs - Matriz com registros a serem inseridos na ZLF                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum                                                                                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                               				   �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
static function updZLF(aRegs)

dbSelectArea("ZLF")
dbSetOrder(1)   //ZLF_FILIAL+ZLF_CODZLE+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO


//Primeiro verifica registros que foram apagados do banco
for i := 1 to len(aRegs)
	if aRegs[i,nPosOrigem]== "A"
		if aTail(aRegs[i])	 //Verifica se item esta deletado		
			//Verifica se existe item no banco, caso verdadeiro apaga o mesmo
			if ZLF->(dbSeek(xFilial("ZLF")+mv_par01+cProdutor+cLoja+aRegs[i,nPosEvento]))
				recLock("ZLF",.F.)
				ZLF->(dbDelete())
				ZLF->(msUnlock())
			endif		
		endif
	endif
next i




//Sincroniza aCols com Banco de Dados
for i := 1 to len(aRegs)
	//So altera ou insere registros do tipo avulso
	if aRegs[i,nPosOrigem]== "A"
		if !aTail(aRegs[i])	 //Verifica se item esta deletado
			if ZLF->(dbSeek(xFilial("ZLF")+mv_par01+cProdutor+cLoja+aRegs[i,nPosEvento]))
				lNovo := .F.
			else
				lNovo := .T.
			endif			
			//Atualiza Registro na ZLD
			recLock("ZLF",lNovo)
			ZLF->ZLF_FILIAL	:= xFilial("ZLF")
			ZLF->ZLF_CODZLE	:= mv_par01
			ZLF->ZLF_DTINI 	:= dDataIni
			ZLF->ZLF_DTFIM	:= dDataFim
			ZLF->ZLF_SETOR	:= cSetor
			ZLF->ZLF_DCRSET	:= cDescSet
			ZLF->ZLF_LINROT	:= cLinRot
			ZLF->ZLF_TP_RL	:= cTipoLR
			ZLF->ZLF_DCRLIN	:= cDcrLR
			ZLF->ZLF_RETIRO	:= cProdutor
			ZLF->ZLF_RETILJ	:= cLoja
			ZLF->ZLF_DCRRET	:= cNome
			ZLF->ZLF_EVENTO	:= aRegs[i,nPosEvento]
			ZLF->ZLF_DCREVE	:= aRegs[i,nPosDcrEve]
			ZLF->ZLF_DEBCRE	:= aRegs[i,nPosDebCre]
			ZLF->ZLF_QTDBOM	:= nQtdBom
			ZLF->ZLF_QTDACI	:= nQtdAci
			ZLF->ZLF_VLRLTR	:= nVlrLtr
			ZLF->ZLF_TOTAL	:= aRegs[i,nPosTotal]
			ZLF->ZLF_ORIGEM	:= "A"
			ZLF->ZLF_ACERTO	:= "N"
			ZLF->ZLF_TP_MIX	:= aRegs[i,nPosTpMix]
			msUnlock()
		endif
	endif
next i


//Sincroniza Base com aCols, caso usuario tenha alterado codigo de evento
dbSelectArea("ZLF")
dbSetOrder(1) //ZLF_FILIAL+ZLF_CODZLE+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO
dbSeek(xFilial("ZLF")+mv_par01+cProdutor+cLoja)

while ZLF->(!eof()) .and. ZLF->ZLF_FILIAL == xFilial("ZLF") .and. ZLF->ZLF_RETIRO == cProdutor .and. ZLF->ZLF_RETILJ == cLoja
	nIndex := ascan(aRegs,{|x|  x[nPosEvento] == ZLF->ZLF_EVENTO })
	//Se nao achou no aCols entao apaga no banco
	if nIndex == 0
		recLock("ZLF",.F.)
		dbDelete()
		msUnlock()
	endif
	
	ZLF->(dbSkip())
enddo

return


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Funcao    � vldCpo   � Autor � Jeovane            � Data �  12/11/08   ���
�������������������������������������������������������������������������͹��
���Descricao � Funcao usada para preencher valor padrao para ZLD_ORIGEM   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
static function vldCpo()
local lRet := .T.

if empty(aCols[n,nPosOrigem])
	aCols[n,nPosOrigem] := "A"
endif



return lRet



