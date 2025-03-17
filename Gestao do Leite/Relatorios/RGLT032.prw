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
ฑฑบPrograma  ณ RGLT032  บ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 05/08/2014                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio de emissmao notas promissorias.                                                                    บฑฑ
ฑฑบ          ณ Utilizado na rotina acerto de debitos AGLT044 e Emprestimos AGLT012                            				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Cliente, Data de Emissao, Forma de Ordenacao  			                               						บฑฑ
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

User Function RGLT032(xMatricula,xNum,xPrefixo)

Private _cPerg := "RGLT032"
Private _cMatricula := ""
Private _cPrefixo	:= ""
Private _cNro := ""

DEFAULT  xMatricula := ""
DEFAULT xPrefixo := ""
DEFAULT xNum := ""

AjustaSX1(_cPerg)

_cMatricula := xMatricula
_cPrefixo	:= xPrefixo
_cNro := xNum


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Ajusta pergunta de parametros                                        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Empty(_cMatricula) .and. Empty(_cPrefixo) .and. Empty(_cNro)
	
	If !Pergunte(_cPerg,.T.)
		Return
	EndIf
	_cMatricula := MV_PAR01
    _cPrefixo	:= MV_PAR02
	_cNro       := MV_PAR03
Else
 	MV_PAR001 := _cMatricula
  	MV_PAR002 := _cPrefixo
  	MV_PAR003 := _cNro
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
ฑฑบPrograma  ณRGLT032NEWบAutor  ณMicrosiga           บ Data ณ  08/05/14   บฑฑ
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
Private _oCab
Private _nCasas := 87

oReport := TReport():NEW("RGLT032" ,"Relatorio de Promissorias" ,_cPerg,{|oReport|PrintReport(oReport)} ,"")

//oReport:nFontBody	:= 14            // Define o tamanho da fonte do relatorio.
oReport:nLineHeight	:= 50            // Define a altura da linha.
//oReport:CFONTBODY   := "Courier New" // Define a fonte do relatorio
oReport:lParamPage		:= .F.
oReport:lHeaderVisible 	:= .F.
oReport:lFooterVisible 	:= .F.
oReport:SetPortrait(.T.)
oReport:lParamPage := .F.
oReport:GetOrientation(1)
oReport:SetTotalInLine(.F.)



Return oReport


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT032NEWบAutor  ณMicrosiga           บ Data ณ  08/05/14   บฑฑ
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

Local oFont12 		:= TFont():New("COURIER NEW",12,12,,.F.,,,,.T.,.F.)
Local oFont12N		:= TFont():New("COURIER NEW",12,12,,.T.,,,,.T.,.F.)
Local oFont14N		:= TFont():New("COURIER NEW",14,14,,.T.,,,,.T.,.F.)
Local oFont16N		:= TFont():New("COURIER NEW",16,16,,.T.,,,,.T.,.F.)
Local _nCont := 0


	BeginSql Alias _cAlias
		SELECT SE1.E1_SALDO+SE1.E1_SDACRES-SE1.E1_SDDECRE AS VALOR
		, SE1.E1_CLIENTE
		, SE1.E1_LOJA
		, SA1.A1_NOME
		, SA1.A1_CGC
		, SE1.E1_VENCTO
	   //	, SE2.E2_C_AVALI
		//, SE2.E2_C_CGCAV
		FROM %table:SE1% SE1
			JOIN %table:SA1% SA1 ON 
			SA1.A1_COD = %Exp:_cMatricula%
	     	AND	SA1.A1_COD = SE1.E1_CLIENTE
			AND SA1.A1_LOJA = SE1.E1_LOJA
	 		AND SA1.%NotDel%
	   	WHERE 
		SE1.E1_FILIAL = %xFilial:SE1%
		AND SE1.E1_NUM = %Exp:_cNro%
		AND SE1.E1_PREFIXO = %Exp:_cPrefixo%
		AND SE1.E1_SALDO > 0
		AND SE1.%NotDel%
		
		GROUP BY SE1.E1_CLIENTE
			  , SE1.E1_LOJA
		      ,  SA1.A1_NOME
		      ,  SA1.A1_CGC
			  ,  SE1.E1_SALDO
			  ,  SE1.E1_SDACRES
			  ,  SE1.E1_SDDECRE
			  ,  SE1.E1_VENCTO
			  ,  SE1.E1_PARCELA
		ORDER BY SE1.E1_PARCELA
	EndSql

	

oReport:StartPage()
oReport:ThinLine()
oReport:SkipLine(1)

While !(_cAlias)->(Eof())
	
	If _nCont == 3 //oReport:Row() >= oReport:PageHeight() - 80
		oReport:EndPage()
		oReport:StartPage()
		oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02," ",oFont12N)
		oReport:SkipLine(1)
		oReport:ThinLine()
		_nCont := 0
	EndIf
//	oReport:SkipLine(1)	
	
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "NOTAS PROMISSORIAS",oFont16N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.65	, "Vencimento em " + DtExtenso(STOD((_cAlias)->E1_VENCTO)),oFont14N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.80	, "R$ " + LTrim(TRANSFORM((_cAlias)->VALOR,"@E 999,999,999.99")) ,oFont16N)
	oReport:SkipLine(2)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02  , "Dia "+DtExtenso(STOD((_cAlias)->E1_VENCTO))+" pagarei por esta ๚nica via de",oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.52	, "Nota Promiss๓ria"	,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "เ "+Alltrim(SM0->M0_NOMECOM)+" - CNPJ: "+Transform(SM0->M0_CGC,"@r 99.999.999/9999-99")+"  ,", oFont12)	
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "ou a sua ordem a quantia de", oFont12)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, Extenso((_cAlias)->VALOR)	,oFont12N)	
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "em moeda corrente deste paํs."	,oFont12)			
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	, "Pagแvel na pra็a de "+Alltrim(SM0->M0_CIDCOB)	,oFont12)			
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.70	,Alltrim(SM0->M0_CIDCOB)+", " + DtExtenso(DDATABASE)		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	,"Codigo:" 	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	,(_cAlias)->E1_CLIENTE		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	,"Nome:" 	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	,(_cAlias)->A1_NOME		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	,"CPF/CNPJ:" 	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	,GetCGC((_cAlias)->A1_CGC)		,oFont12N)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	,"Endere็o:" 	,oFont12)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	,GetEndFor((_cAlias)->E1_CLIENTE,(_cAlias)->E1_LOJA)		,oFont12N)	
	oReport:SkipLine(1)
	oReport:SkipLine(1)
	oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50	,"______________________________________________",oFont12N)
    oReport:SkipLine(1)
	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50	,(_cAlias)->A1_NOME		,oFont12N)
   

   //oReport:SkipLine(2)
   //	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.02	,"Avalista:" 	,oFont12)
   //	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.10	,(_cAlias)->E2_C_AVALI		,oFont12N)
   //	oReport:SkipLine(1)
   //	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.33	,"CPF:" 	,oFont12)
   //	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.37	,GetCGC((_cAlias)->E2_C_CGCAV)		,oFont12N)
   //	oReport:Say(oReport:Row(),oReport:PageWidth() * 0.50	,"______________________________________________",oFont12N)


	oReport:SkipLine(2)
	oReport:ThinLine()
	oReport:SkipLine(1)
	
	_nCont++
	
	(_cAlias)->(DbSkip())
EndDo

oReport:EndPage()

Return




//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Funcao que monta a configuracao dos parametros(Perguntas)            ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Static Function AjustaSX1()

//Filtro de fornecedor
aHelpPor := {}
aAdd(aHelpPor, "Informe o codigo do cooperado." )                //tipo  //tamanho
U_xPutSX1(_cPerg,"01","Matricula ?  ","","","mv_ch1","C",6,0,0,"G","","SA1","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})

//Prefixo do titulo
aHelpPor := {}
aAdd(aHelpPor, "Informe prefixo do titulo" )                //tipo  //tamanho
U_xPutSX1(_cPerg,"02","Prefixo ?  ","","","mv_ch2","C",3,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})

//Numero do titulo
aHelpPor := {}
aAdd(aHelpPor, "Informe numero do titulo" )                //tipo  //tamanho
U_xPutSX1(_cPerg,"03","Numero ?  ","","","mv_ch3","C",9,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,{},{})


Return

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Funcao que a data por extenso ex.: 01 de janeiro de 1870             ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Static Function DtExtenso(cData)
Local _Ret := SubStr(DTOS(cData),7,2)
Local _Mes := SubStr(DTOS(cData),5,2)

DO CASE
	case _Mes = "01"
		_Ret += " de janeiro de "
	case _Mes = "02"
		_Ret += " de fevereiro de "
	case _Mes = "03"
		_Ret += " de mar็o de "
	case _Mes = "04"
		_Ret += " de abril de "
	case _Mes = "05"
		_Ret += " de maio de "
	case _Mes = "06"
		_Ret += " de junho de "
	case _Mes = "07"
		_Ret += " de julho de "
	case _Mes = "08"
		_Ret += " de agosto de "
	case _Mes = "09"
		_Ret += " de setembro de "
	case _Mes = "10"
		_Ret += " de outubro de "
	case _Mes = "11"
		_Ret += " de novembro de "
	case _Mes = "12"
		_Ret += " de dezembro de "
endcase

_Ret += SubStr(DTOS(cData),1,4)

Return _Ret

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT032NEWบAutor  ณMicrosiga           บ Data ณ  08/04/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao que monta o endere็o validando se tem numero, cidade e estado  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetEnd(cEnd, cNR, cBairro, cCidade, cUF)
Local _End := ""

_End += Trim(cEnd)

if Trim(cNR) <> ""
	_End += ", " + Trim(cNR)
endif

if Trim(cBairro)<> ""
	_End += " - " + Trim(cBairro)
endif

if Trim(cCidade) <> ""
	_End += " - " + Trim(cCidade)
endif

if Trim(cUF) <> ""
	_End += "-" + Trim(cUF)
endif
Return _End

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT032NEWบAutor  ณMicrosiga           บ Data ณ  08/04/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao que retorna CPF ou CNPJ ja mascarado                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetCGC(cCGC)
Local _Ret := ""

if LEN(TRIM(cCGC)) = 11
	_Ret := TRANSFORM(cCGC,"@R 999.999.999-99")
else
	_Ret := TRANSFORM(cCGC,"@R 99.999.999/9999-99")
endif
Return _Ret

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRGLT032NEWบAutor  ณMicrosiga           บ Data ณ  08/04/14   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao que busca o endereco do fornecedor                   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetEndFor(cFornec,cLoja)
Local _EndFor  := ""
Local _cAlias9 := GetNextAlias()

BeginSql Alias _cAlias9
	SELECT SA1.A1_END
	, SA1.A1_END
	, SA1.A1_BAIRRO
	, SA1.A1_EST
	, SA1.A1_MUN
	FROM %table:SA1% SA1
	WHERE SA1.A1_COD = %Exp:cFornec% AND SA1.A1_LOJA = %Exp:cLoja%
	AND SA1.%NotDel%
EndSql

if !(_cAlias9)->(EOF())
	_EndFor := PADR(GetEnd((_cAlias9)->A1_END,(_cAlias9)->A1_END,(_cAlias9)->A1_BAIRRO,(_cAlias9)->A1_MUN,(_cAlias9)->A1_EST),90)
endif
Return _EndFor
