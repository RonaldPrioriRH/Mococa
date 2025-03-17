#INCLUDE 'RWMAKE.CH'
#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'TOPCONN.CH'


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMLCB002   บAutor  ณIrenio S. Oliveira  บ Data ณ  20/10/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGera็ใo do arquivo TXT para exporta็ใo do portal de convenioบฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User function MGLT046()

LOCAL nOpca := 0
Local aSays:={}, aButtons:={}
Local cFunction:= "MGLT046"
Local cTitle:= "Imp. Arq. TXT - Portal Convenio - GLT"
Local bProcess:= {|oSelf|U_MGLT046P(oSelf)}
Local cDescription:= "Rotina com o objetivo de gerar um arquivo TXT para exporta็ใo de dados para o portal!"

Private	cperg := "MGLT046"
PRIVATE cCadastro 	:= "Imp. Arq. TXT - Portal Convenio - GLT"

PRIVATE aRotina := MenuDef()
PRIVATE lCabecalho

validperg()


tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg )


return

//Defini็ใo do menu
Static Function MenuDef()
Local aRotina:={ 	{ "Localizar","AxPesqui" , 0 , 1},;  //"Localizar"
{ "Incluir","Axinclui" , 0 , 3}}  //"Classificar"
Return(aRotina)


User function MGLT046P(oSelf)


//Empty(cSetor) .Or. Empty(cConven) .Or. Empty(cLjConv) .Or. Empty(dData) .Or. Empty(dVcto)  .Or. Empty(cEvento)

Local aEstru := {}
Local aArq2
Private cSeq      := Soma1(ZLL->ZLL_SEQ)
Private dData     := MV_PAR03
Private nMesLcto  := Month(dData)
Private nAno	  := Year(dData)
Private dVcto	  := CtoD("//")
Private cConven   := Space(06)
Private cRetiro   := Space(06)
Private cLjReti   := Space(02)
Private cLjConv   := Space(02)
Private cNome     := Space(30)
Private cSetor    := ALLTRIM(GetMv("LT_CODSETO"))//Codigo default do setor
Private cEvento   := ALLTRIM(GetMv("LT_CONVEXT"))//Codigo default do convenio externo
Private nAcresc   := 0
Private nTxAdm    := 0
Private nPAdm     := 0
Private cResult1  := Space(01)
Private nValTot   := 0
Private nDiaVcto  := GetMV("LT_VENCONV") //Parametro que indica o dia de vencimento dos convenios por cada filial.

dtaux := ddatabase
ddatabase := ddata


aadd(aEstru,{"TRB_FORNEC"  ,'C',06,0})
aadd(aEstru,{"TRB_LOJA"    ,'C',02,0})
aadd(aEstru,{"TRB_PRODUT"  ,'C',06,0})
aadd(aEstru,{"TRB_LOJAP"   ,'C',02,0})
aadd(aEstru,{"TRB_VALOR"   ,'N',14,2})
aadd(aEstru,{"TRB_DATAV"  ,'D',08,0})

If MV_PAR04 > MV_PAR05
	xMagHelpFis("Mensagem","Vencimento Incorreto!","O vencimento deve ser maior ou igual a Emissao.")
	return
EndIf

If !(vldEvento())
	return
Endif

aArq2 := CriaTrab(aEstru,.T.)
If Select("TRB") <> 0
	TRB->(dbCloseArea())
EndIf
Use &aArq2 Alias TRB NEW
Index on TRB_FORNEC+TRB_LOJA To &aArq2

msgrun("Aguarde... Preparando arquivo temporแrio...",,{||cursorwait(),learqt(),cursorarrow()})

dbselectarea('TRB')
oSelf:SetRegua1(lastrec())
TRB->(dbgotop())
_CFORNEC := TRB->(TRB_PRODUT+TRB_LOJAP)
_nvalort := 0
cParcela 	:=  ' '
cIPrd 		:= TRB->TRB_PRODUT
cIPrdLj 	:= TRB->TRB_LOJAP
cNatNDF  	:= POSICIONE("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_NATPRD")
cPrefixo 	:= POSICIONE("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_PREFIX")
cConven 	:= TRB->TRB_FORNEC
cLjConv 	:= TRB->TRB_LOJA
cNome   	:= SA2->A2_NOME
cLjConv 	:= SA2->A2_LOJA
cObs    	:= SA2->A2_NOME
cIDescri 	:= ""
cIStat 		:= "A"   
cCod 		:= getNewNum()
cISeq 		:=  '000'
nVlrTotal	:= 0
While !TRB->(EOF())  //FACA ENQUANTO NAO FOR FIM DE ARQUIVO
	
	
	// Capturar dados
	oSelf:IncRegua1("Processando Registro: ...")
	dbselectarea('SA2')
	If SA2->(dbseek(XFILIAL('SA2')+TRB->(TRB_PRODUT+TRB_LOJA)))
//		Sleep(100)
		
		// ----------------------------
		// INCLUSAO - Gera SE2 e ZLL
		// ----------------------------
		
		cIPrd 		:= TRB->TRB_PRODUT
		cIPrdLj 	:= TRB->TRB_LOJAP
		cObs    	:= SA2->A2_NOME
		cSetor    	:= Posicione('ZL3',1,XFILIAL('ZL3')+SA2->A2_L_LI_RO,'ZL3_SETOR')
		nIVlr		:= TRB->TRB_VALOR   
		cISeq		:= soma1(cISeq,3)
		
		If U_Inc_SE2(cPrefixo,cCod+cISeq,cParcela,"NDF",cIPrd,cIPrdLj,cNatNDF,dData,dVecto,nIVlr,0,0,cConven+cLjConv,cObs)
			U_Inc_ZLL(cCod,cISeq,cIPrd,cIPrdLj,cIDescri,nIVlr,cIStat,,,,,,,,,,,cObs)
			nVlrTotal += nIVlr
		Else
			lDeuErro := .T.
		EndIf
		
		_nvalort += TRB->TRB_VALOR
	Endif
	
	TRB->(dbskip())   //pr๓ximo registro no arquivo txt
	
	If TRB->(EOF()) .OR. TRB->(TRB_FORNEC+TRB_LOJA) <> _CFORNEC
		oSelf:IncRegua1("Processando Registro: ...")
		_CFORNEC := TRB->(TRB_FORNEC+TRB_LOJA)
		If SA2->(dbseek(XFILIAL('SA2')+TRB->(_CFORNEC)))
			//Sleep(500)
			cConven 	:= SA2->A2_COD
			cNome   := SA2->A2_NOME
			cLjConv := SA2->A2_LOJA
			cObs    := SA2->A2_NOME
			If !U_Inc_SE2(cPrefixo,cCod+"000",cParcela,"NF ",cConven,cLjConv,cNatNF,dData,dVecto,nVlrTotal,nAcresc,nTxAdm,"",cObs)
				lDeuErro := .T.
			EndIf
			cCod 		:= getNewNum()
			cISeq 		:=  '000'
			nVlrTotal	:= 0
		Endif
	ENDIF
EndDo

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Cria arquivo principal...                                                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
MsgInfo("Processo finalizado")
Return Nil


static function learqt()

Private cArqTxt := TRIM(MV_PAR01)

If !File(cArqTxt)
	MsgAlert("Arquivo texto: "+cArqTxt+" nใo localizado",cCadastro)
	Return(.f.)
Endif

FT_FUSE(cArqTxt)  //ABRIR
FT_FGOTOP() //PONTO NO TOPO
_ncont := 0

While !FT_FEOF()  //FACA ENQUANTO NAO FOR FIM DE ARQUIVO
	
	
	// Capturar dados
	cBuffer := FT_FREADLN() //LENDO LINHA
	_ncont += 1
	
	//cMsg := "Filial: "		+SubStr(cBuffer,01,02) + Chr(13)+Chr(10)
	//123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
	//[    0   ][   10   ][   20   ][   30   ][   40   ][   50   ][   60   ][   70   ][   80   ]
	//FFFFFF LL PPPPPP LL DD/DD/DDDD 9999999999999999
	dbselectarea('TRB')
	reclock('TRB',.T.)
	TRB_FORNEC	:= SubStr(cBuffer,01,06)
	TRB_LOJA	:= SubStr(cBuffer,08,02)
	TRB_PRODUT	:= SubStr(cBuffer,11,06)
	TRB_LOJAP	:= SubStr(cBuffer,18,02)
	TRB_VALOR	:= val(SubStr(cBuffer,32,15))/100
	TRB_DATAV	:= ctod(SubStr(cBuffer,21,10))
	TRB->(msunlock())
	
	FT_FSKIP()   //pr๓ximo registro no arquivo txt
EndDo

FT_FUSE() //fecha o arquivo txt

return(.t.)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณVALIDPERG บ Autor ณ AP5 IDE            บ Data ณ  07/04/03   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Verifica a existencia das perguntas criando-as caso seja   บฑฑ
ฑฑบ          ณ necessario (caso nao existam).                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function ValidPerg

Local _sAlias := Alias()
Local aRegs := {}
Local i,j

dbSelectArea("SX1")
dbSetOrder(1)
cPerg := PADR(cPerg,10)

//(sx1) Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05
aAdd(aRegs,{cPerg,"01","Arquivo de retorno ?","","","mv_ch1" ,"C", 60,0,0,"C","","mv_par01"  ,"","","","","","","","","","","","","","","","","","","","","","","","","DIR",""})
aAdd(aRegs,{cPerg,"02","Data Inicio        ?","","","mv_ch2" ,"D", 8,0,0,"G","","mv_par02" ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"03","Data Final         ?","","","mv_ch3" ,"D", 8,0,0,"G","","mv_par03" ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"04","Data Emissao       ?","","","mv_ch4" ,"D", 8,0,0,"G","","mv_par04" ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"05","Data Vencimento    ?","","","mv_ch5" ,"D", 8,0,0,"G","","mv_par05" ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
//aAdd(aRegs,{cPerg,"01","Tipo de exporta็ใo ?","","","mv_ch1" ,"C", 1,0,0,"C","","mv_par01","Fornecedor","","","","","Limite","","","","","","","","","","","","","","","","","","","DIR",""})
//aAdd(aRegs,{cPerg,"02","Do Fornecedor      ?","","","mv_ch2" ,"C", 6,0,0,"G","","mv_par02" ,"","","","","","","","","","","","","","","","","","","","","","","","","SE2",""})
//aAdd(aRegs,{cPerg,"03","Ate Fornecedor     ?","","","mv_ch3" ,"C", 6,0,0,"G","","mv_par03" ,"","","","","","","","","","","","","","","","","","","","","","","","","SE2",""})
//aAdd(aRegs,{cPerg,"05","Arquivo de saida   ?","","","mv_ch5" ,"C", 60,0,0,"C","","mv_par05"  ,"","","","","","","","","","","","","","","","","","","","","","","","","DIR",""})
//aAdd(aRegs,{cPerg,"04","Aglutina Lan็amentos?","","","mv_ch4" ,"C", 1,0,0,"C","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","CT5",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

dbSelectArea(_sAlias)

return





/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณvldEvento บAutor  ณAbrahao             บ Data ณ  09/10/09   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida se evento e financeiro                              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP10                                                       บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function vldEvento()

dbSelectArea("ZL8")
dbSetOrder(1)
If dbSeek(xFILIAL("ZL8")+cEvento)
	If ZL8->ZL8_TPEVEN != "F" .Or. ZL8->ZL8_PREFIX == "" .Or. ZL8->ZL8_DEBCRE != "D"
		xMagHelpFis("Evento Incorreto","O Evento precisa ser Financeiro e de D้bito com Prefixo para ser utilizado!","Selecione um evento tipo Financeiro tipo D้bito com Prefixo!")
		Return .F.
	EndIf
Else
	Return .F.
EndIf

Return .T.


Static Function getNewNum()

Local aArea := GetArea()
Local cRet  := ""

cQuery:=" SELECT MAX(ZLL_COD) AS ULTIMO "
cQuery+=" FROM "+RetSqlName("ZLL")+" ZLL "
cQuery+=" WHERE D_E_L_E_T_ = ' ' "
cQuery+=" AND ZLL_FILIAL = '"+xFILIAL("ZLL")+"' "

If Select("TRB") > 0
	TRB->(dbCloseArea())
EndIf

DbUseArea(.T., "TOPCONN", TCGenQry(,,cQuery), "TRB", .F., .T.)

If !TRB->(Eof())
	cRet := StrZero(Val(TRB->ULTIMO)+1,6)
EndIf
TRB->(dbCloseArea())

RestArea(aArea)
Return cRet
