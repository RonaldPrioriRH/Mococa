#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"
#include "report.ch"
#INCLUDE "TOTVS.CH"
#include "rwmake.ch"
#INCLUDE "RPTDEF.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT068  บ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 12/07/2016                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio de emissao das etiquetas para envelopes do fechamento do leite baseado nas notas fiscais.         บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ MIX                                           			                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Financeiro                                                                           						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                                			       ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function RGLT068()

Private _cPerg := "RGLT068"


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Ajusta pergunta de parametros                                        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
AjustaSX1(_cPerg)

If !Pergunte(_cPerg,.T.)
	Return
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Funcao que retorna o report montado com as configuraoes do relatorio ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oReport := ReportDef(_cPerg)
oReport:PrintDialog()

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT068NEWบAutor  ณMicrosiga           บ Data ณ  08/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao que retorna o report montado com as configuraoes do relatorio บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ReportDef()

Private oReport


oReport := TReport():NEW("RGLT068" ,"Relatorio de Etiquetas" ,_cPerg,{|oReport|PrintReport(oReport)} ,"")

//oReport:nFontBody	:= 14            // Define o tamanho da fonte do relatorio.
oReport:nLineHeight	:= 45            // Define a altura da linha.
//oReport:CFONTBODY   := "Courier New" // Define a fonte do relatorio
oReport:lParamPage		:= .F.
oReport:lHeaderVisible 	:= .F.
oReport:lFooterVisible 	:= .F.
oReport:SetPortrait(.T.)
oReport:lParamPage := .F.
oReport:GetOrientation(1)
oReport:SetTotalInLine(.F.)
//oReport:SetPaperSize(1) nใo funciona em TReport

/*
0 - Tamanho customizavel pelo usuario, informado em nHeight/nWidth. Aplicavel apenas em impressoes do tipo PDF.
1 - Letter   216mm x 279mm  637 x 823
3 - Tabloid  279mm x 432mm  823 x 1275
7 - Executive 184mm x 267mm  543 x 788
8 - A3     297mm x 420mm  876 x 1240
9 - A4     210mm x 297mm  620 x 876
*/


Return oReport


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT068NEWบAutor  ณMicrosiga           บ Data ณ  08/05/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao que executa impressao do relatorio                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport)

Local _cAlias := GetNextAlias()
Local _cMix := MV_PAR01
Local oFont10 		:= TFont():New("COURIER NEW",10,11,,.F.,,,,.T.,.F.)
Local oFont10N		:= TFont():New("COURIER NEW",10,11,,.T.,,,,.T.,.F.)
Local oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Local oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
Local _nCont := 1
Local _nCol := 0
Local _nLin := 12
Local _cCol1 := ""
Local _cCol2 := ""
Local _cCol3 := ""


BeginSql Alias _cAlias
	
	SELECT F1_DOC, F1.F1_FORNECE+'-'+F1.F1_LOJA AS CODIGO, 
		A2.A2_NOME AS NOME,
		CASE WHEN A2.A2_L_TPPAG = 'C' THEN 'CHEQUE' ELSE 'BANCO' END AS PGTO,
		A2.A2_END AS ENDERECO, 
		A2.A2_MUN AS MUNICIPIO, 
		A2.A2_CEP AS CEP,
		L3.ZL3_DESCRI AS LINHA
	FROM SF1010 F1 
		JOIN SA2010 A2 ON A2_COD = F1_FORNECE AND A2.A2_LOJA = F1.F1_LOJA AND A2.D_E_L_E_T_ = ' '
		JOIN ZL3010 L3 ON L3.ZL3_COD = A2.A2_L_LI_RO AND L3.D_E_L_E_T_ = ' '
	WHERE F1_FILIAL = %Exp:xFilial("SF1")% AND F1_L_MIX = %Exp:_cMix% AND F1.%NotDel%
	ORDER BY F1_DOC

EndSql

oReport:StartPage()
//oReport:ThinLine()
//oReport:SkipLine(1)

While !(_cAlias)->(Eof())
	
	If _nCont == 31 //oReport:Row() >= oReport:PageHeight() - 80
		oReport:EndPage()
		oReport:StartPage()
//		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont10N)
		_nLin := 12//100
//		oReport:ThinLine()
		_nCont := 1
	EndIf


// Configura็ใo etiquetas MAXPRINT 20 etiquetas (2 X 10)
/*	If Mod(_nCont,2)<>0
		_nCol := 0.05
		_nLin += 100
	Else
		_nCol := 0.52	
		_nLin -= 200
	EndIf
*/

//Configura็a๕ etiquetas PIMACO 30 etiquetas (3 x 10)
_cCol1 := "01/04/07/10/13/16/19/22/25/28"
_cCol2 := "02/05/08/11/14/17/20/23/26/29"
_cCol3 := "03/06/09/12/15/18/21/24/27/30"

If StrZero(_nCont,2) $ _cCol1
		_nCol := 0.03
		_nLin += 100
ElseIf StrZero(_nCont,2) $ _cCol2	
		_nCol := 0.40
		_nLin -= 200
ElseIf StrZero(_nCont,2) $ _cCol3	
		_nCol := 0.78
		_nLin -= 200
EndIf
// Fim - Pimaco

//	oReport:Say(_nLin ,oReport:PageWidth() * _nCol	, "Codigo: "+(_cAlias)->CODIGO+"           "+(_cAlias)->PGTO,oFont10)
	oReport:Say(_nLin ,oReport:PageWidth() * _nCol	, "Codigo: "+(_cAlias)->CODIGO,oFont10)
	_nLin += 50
	oReport:Say(_nLin ,oReport:PageWidth() * _nCol	, SubStr(Alltrim((_cAlias)->NOME),1,28),oFont10N)
	_nLin += 50
	oReport:Say(_nLin ,oReport:PageWidth() * _nCol	, Alltrim((_cAlias)->ENDERECO),oFont10)
	_nLin += 50
	oReport:Say(oReport:Row() + _nLin ,oReport:PageWidth() * _nCol	, Alltrim((_cAlias)->MUNICIPIO)+"  CEP: "+ Transform((_cAlias)->CEP,"@r 99999-999") ,oFont10)
	_nLin += 50
//	oReport:Say(oReport:Row() + _nLin ,oReport:PageWidth() * _nCol	, Alltrim((_cAlias)->LINHA),oFont10)


	_nCont++
	
	(_cAlias)->(DbSkip())
EndDo

oReport:EndPage()

Return




//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Funcao que monta a configuracao dos parametros(Perguntas)            ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Static Function AjustaSX1()


Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}
	
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para filtrar os produtores.         ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


Return

