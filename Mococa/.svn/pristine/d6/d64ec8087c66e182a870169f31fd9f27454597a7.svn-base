// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : RGLT067
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor Cláudio Gonçalves| Relatorio Frequencia Anormal de Coleta de Leite
// ---------+-------------------+-----------------------------------------------------------
// 10/05/13 | TOTVS Developer Studio | Gerado pelo Assistente de Código
// ---------+-------------------+-----------------------------------------------------------

#include "rwmake.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} novo
Montagem da tela de processamento

Impressão do histórico do pedido com itens controlados
/*/
//------------------------------------------------------------------------------------------
user function RGLT099

Private cPerg				:= "RGLT099"

AjustaSX1(cPerg)

Pergunte(cPerg,.F.)

oReport := ReportDef()
	
oReport:PrintDialog()

Return

Static Function ReportDef()

Private oReport
Private oSec1
Private aTam			:={}

oReport := TReport():NEW("RGLT099" ,"Frequencia Anormal de Coleta de Leite" ,cPerg,{|oReport|PrintReport(oReport)} ,"Este relatorio imprime o historico de Frequencia Anormal de Coleta de Leite.")

oReport:nFontBody	:= 8// Define o tamanho da fonte.
oReport:nLineHeight	:= 45 // Define a altura da linha.
oReport:CFONTBODY:="Courier New"

oSec1 := TRSection():new(oReport,"Coletas",{""})
TRCELL():NEW(oSec1,"CODIGO"			,,"Código"								,	,10	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"PRODUTOR"		,,"Produtor"  							,	,30	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"LOJA"			,,"Fazenda"  							,	,6	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"TIPO"			,,"Tipo	"  							,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"VOLUME"			,,"Volume (l)"						,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"COLETA"			,,"Coletado em"  						,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"TEMPO"			,,"Tempo desde coleta anterior"		,	,50	,,,"LEFT",	,"LEFT",,,,,,.F.)
TRCELL():NEW(oSec1,"RESPONSAVEL"	,,"Responsável"  						,	,20	,,,"LEFT",	,"LEFT",,,,,,.F.)


oReport:lParamPage := .F.
oReport:GetOrientation(1)
oReport:SetTotalInLine(.F.)


Return oReport

Static Function PrintReport(oReport)

Private oSec1			:= oReport:Section(1)
Private cQuery			:= ""

//oSec2:SetLeftMargin(5)

cQuery := " SELECT  ZLD.ZLD_RETIRO, SA2.A2_NOME, ZLD.ZLD_RETILJ, ZLD_DTCOLE, ZLD_QTDBOM, ZLD_USER "
cQuery += "  FROM "+RetSqlName("ZLD")+" ZLD, "
cQuery += " WHERE ZLD_DTCOLE BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"' "
cQuery += " AND ZLD.ZLD_RETIRO BETWEEN '"+mv_par03+"' AND '"+mv_par04+"' "
cQuery += " AND ZLD.D_E_L_E_T_ = ' ' "
cQuery += " ORDER BY ZLD.ZLD_RETIRO ASC, ZLD_DTCOLE DSC "

// Verifica area aberta
If Select("QRY") <> 0
	QRY->(DBCLOSEAREA())
EndIF

cQuery := ChangeQuery(cQuery)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQuery),"QRY",.F.,.T.)

//DbSelectArea("QRY")
QRY->(dbGoTop())

cPedido := ""
oSec1:Init()

While QRY->(!Eof())
		
		
		oSec1:Cell("CODIGO"):SetValue(QRY->ZLD_RETIRO)
		cCli := Posicione("SA2",1,xFilial("SA2")+QRY->ZLD_RETIRO+QRY->ZLD_RETILJ,"A2_NOME")
		oSec1:Cell("PRODUTOR"):SetValue(cCli)
		oSec1:Cell("LOJA"):SetValue(QRY->ZLD_RETILJ)
		oSec1:Cell("VOLUME"):SetValue(cValToChar(QRY->ZLD_QTDBOM))
		oSec1:Cell("COLETA"):SetValue(stod(QRY->ZLD_DTCOLE))
		oSec1:Cell("RESPONSAVEL"):SetValue(UsrFullName(QRY->ZLD_USER))
		
Enddo

oSec1:Finish()
QRY->(dbCloseArea())

Return oReport

Static Function AjustaSX1(cPerg)

aHelpPor := {} 
aTam	:= TamSX3("ZLD_DTCOLE")
aAdd(aHelpPor, "Informe a Data Inicio" )
U_xPutSx1(cPerg,"01","Data de Emissao de ?  ","","","mv_ch1",aTam[3],aTam[1],aTam[2],0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {} 
aAdd(aHelpPor, "Informe a Data Final" )
U_xPutSx1(cPerg,"02","Data de Emissão ate ?  ","","","mv_ch2",aTam[3],aTam[1],aTam[2],0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aTam	:= TamSX3("ZLD_RETIRO")
aHelpPor := {}
aAdd( aHelpPor, "Do Produtor")
U_xPutSx1(cPerg, "03","Pedido de ? ","","","mv_ch3",aTam[3],aTam[1],aTam[2],0,"G","","SA2","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,{},{})

aHelpPor := {}
aAdd( aHelpPor, "Ao Produtor")
U_xPutSx1(cPerg, "04","Pedido ate ? ","","","mv_ch4",aTam[3],aTam[1],aTam[2],0,"G","","SA2","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,{},{})

Return