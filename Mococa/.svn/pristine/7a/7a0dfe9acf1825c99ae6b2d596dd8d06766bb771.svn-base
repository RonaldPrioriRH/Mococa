#INCLUDE "totvs.ch"
#INCLUDE "fileio.ch"
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFATR003  บAutor  ณTarcisio Silva MirandaบDataณ  07/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Relat๓rio de Rastreabilidade de Ids, Faturados. 			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Utilizado para Rastrear os fauturamentos atrav้z do Id.    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RFATR003()

// Declaracao de Variaveis
Local aArea 		:= GetArea()
Local cQry        	:= ""
Local cEol        	:= chr(13)+chr(10)
Local cProdDe		:= ""	
Local cProdAte		:= ""	
Local cPedDe		:= ""	
Local cPedAte		:= ""	
Local cFilEstDe 	:= ""	
Local cFilEstAte	:= ""	
Local cFilIntDe 	:= ""	
Local cFilIntAte	:= ""	
Local cCliDe		:= ""	
Local cCliAte		:= ""	
Local cVendDe		:= "" 	
Local cVendAte		:= ""	
Local dDtEntDe 		:= StoD("")
Local dDtEntAte 	:= StoD("")
Local dEmissDe  	:= StoD("")
Local dEmissAte 	:= StoD("")
Local nMovEst		:= 0
Local nMovFin		:= 0
////////////////////////////////////////////////////////////////////////
///Outras Variaveis
////////////////////////////////////////////////////////////////////////
Private cLocFile    := ""
Private cPerg       := "RFATR003"

////////////////////////////////////////////////////////////////////////
///Cria as perguntas no SX1
////////////////////////////////////////////////////////////////////////
ValPer01()

if !Pergunte(cPerg,.t.)
	return
endif

cProdDe     	:= mv_par01
cProdAte    	:= mv_par02
cPedDe 	 		:= mv_par03
cPedAte	 		:= mv_par04
cFilEstDe   	:= mv_par05
cFilEstAte     	:= mv_par06
cFilIntDe		:= mv_par07
cFilIntAte		:= mv_par08
cCliDe  		:= mv_par09
cCliAte 		:= mv_par10  
cVendDe  		:= mv_par11
cVendAte		:= mv_par12
dDtEntDe  		:= dtos(mv_par13)
dDtEntAte 		:= dtos(mv_par14)  
dEmissDe  		:= dtos(mv_par15)
dEmissAte  		:= dtos(mv_par16)
nMovEst			:= mv_par17
nMovFin			:= mv_par18
cTpProdDe 	    := mv_par19
cTpProdAte 	    := mv_par20
cLocFile 	    := mv_par21



cQry+=" SELECT C5_XFILEST,C5_XFILINT,C5_XIDTRI,C5_FILIAL,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_TIPO,C5_TIPOCLI,C5_TRANSP,C5_EMISSAO,C5_CONDPAG,C5_MOEDA,C5_VEND1,C5_VEND2, 	" +cEOL
cQry+="     C5_VEND3,C5_VEND4,C5_VEND5,C6_FILIAL,C6_NUM,C6_PRODUTO,C6_DESCRI,C6_OP,C6_TES,C6_QTDVEN,C6_PRUNIT,C6_VALDESC,C6_VALOR,C6_ITEM,C6_PRCVEN,C6_CLI,C6_LOJA, 	" +cEOL
cQry+="     C6_ENTREG,C6_LOCAL,C6_QTDENT,C6_BLQ,C9_FILIAL,C9_PEDIDO,C9_ITEM,C9_NFISCAL,C9_BLEST,C9_BLCRED,C9_PRODUTO,SUM(C9_QTDLIB) C9_QTDLIB,F4_FILIAL,F4_DUPLIC, 		" +cEOL
cQry+="     F4_CODIGO,C5_ACRSFIN,C5_XCARGA   																																		" +cEOL        
cQry+=" FROM " + RetSqlName("SC5") 
cQry+=" LEFT JOIN " + RetSqlName("SC6")+" ON SC6010.D_E_L_E_T_<> '*' AND C6_FILIAL = C5_FILIAL AND C5_NUM = C6_NUM 														" +cEOL
cQry+=" LEFT JOIN " + RetSqlName("SC9")+" ON SC9010.D_E_L_E_T_<> '*' AND C9_FILIAL = C5_FILIAL AND C9_PEDIDO = C5_NUM AND C9_ITEM = C6_ITEM AND C9_PRODUTO = C6_PRODUTO " +cEOL
cQry+=" LEFT JOIN " + RetSqlName("SF4")+" ON SF4010.D_E_L_E_T_<> '*' AND F4_FILIAL = C6_FILIAL AND F4_CODIGO = C6_TES 													" +cEOL
cQry+=" LEFT JOIN " + RetSqlName("SB1")+" ON SB1010.D_E_L_E_T_ <> '*' AND B1_COD = C6_PRODUTO  " +cEOL
cQry+=" LEFT JOIN " + RetSqlName("SA1")+" ON SA1010.D_E_L_E_T_ <> '*' AND A1_COD = C5_CLIENTE AND A1_LOJA = C5_LOJACLI " +cEOL
cQry+=" WHERE SC6010.D_E_L_E_T_     <> '*'  			" +cEOL 
cQry+="     AND C6_QTDVEN-C6_QTDENT > 0  				" +cEOL
cQry+="     AND C6_BLQ             <> 'R'  				" +cEOL
//cQry+="     AND C9_QTDLIB           > 0 				" +cEOL //->REMOVER
//cQry+="     AND C9_NFISCAL          = ' '  				" +cEOL //->C6_NOTA
cQry+="     AND C6_NOTA	            = ' '  				" +cEOL
//cQry+="     AND F4_DUPLIC           = 'S'  				" +cEOL
cQry+="     AND C6_PRODUTO          >= '"+cProdDe+"' 	" +cEOL //->F4_DUPLIC = 'S'
cQry+="     AND C6_PRODUTO          <= '"+cProdAte+"'	" +cEOL //FILTRAR POR TPO =F 
cQry+="     AND C6_ENTREG           >= '"+dDtEntDe+"'	" +cEOL 
cQry+="     AND C6_ENTREG           <= '"+dDtEntAte+"' 	" +cEOL 
cQry+="     AND C5_EMISSAO          >= '"+dEmissDe+"' 	" +cEOL 
cQry+="     AND C5_EMISSAO          <= '"+dEmissAte+"' 	" +cEOL 
cQry+="     AND C6_NUM              >= '"+cPedDe+"' 	" +cEOL 
cQry+="     AND C6_NUM              <= '"+cPedAte+"' 	" +cEOL 
cQry+="     AND C5_XFILEST          >= '"+cFilEstDe+"' 	" +cEOL
cQry+="     AND C5_XFILEST          <= '"+cFilEstAte+"' " +cEOL 
cQry+="     AND C5_XFILINT          >= '"+cFilIntDe+"' 	" +cEOL
cQry+="     AND C5_XFILINT          <= '"+cFilIntAte+"' " +cEOL
cQry+="     AND C5_CLIENTE          >= '"+cCliDe+"'		" +cEOL
cQry+="     AND C5_CLIENTE          <= '"+cCliAte+"' 	" +cEOL
cQry+="     AND C5_VEND1         	>= '"+cVendDe+"' 	" +cEOL
cQry+="     AND C5_VEND1           	<= '"+cVendAte+"' 	" +cEOL
cQry+=" 	AND B1_TIPO BETWEEN '"+cTpProdDe+"' AND '"+cTpProdAte+"' 								" +cEOL
cQry+=" 	AND A1_CGC NOT IN ('52502507006269','52502507006269','52502507000309','52502507006854', " +cEOL
cQry+=" 	'52502507001208','52502507006692','52502507000813','26687598000122','52502507001895',	" +cEOL
cQry+=" 	'52502507001623','52502507002271','52502507001976','52502507000147','52502507001380',	" +cEOL
cQry+=" 	'26687598000203','26687598000475','26687598000394','52502507000651')					" +cEOL

	if nMovFin == 1
		cQry+=" AND F4_DUPLIC = 'S' 						" +cEOL
	elseif nMovFin == 2
		cQry+=" AND F4_DUPLIC = 'N' 						" +cEOL
	endif
	
	if nMovEst == 1
		cQry+=" AND F4_ESTOQUE = 'S' 						" +cEOL
	elseif nMovEst == 2
		cQry+=" AND F4_ESTOQUE = 'N' 						" +cEOL
	endif

cQry+=" GROUP BY C5_XFILEST, C5_XFILINT, C5_XIDTRI,C5_FILIAL,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_TIPO,C5_TIPOCLI,C5_TRANSP,C5_EMISSAO,C5_CONDPAG,C5_MOEDA,C5_VEND1, 	" +cEOL
cQry+="    C5_VEND2, C5_VEND3,C5_VEND4,C5_VEND5,C6_FILIAL,C6_NUM,C6_PRODUTO,C6_DESCRI,C6_OP,C6_TES,C6_QTDVEN,C6_PRUNIT,C6_VALDESC,C6_VALOR,C6_ITEM,C6_PRCVEN, 		" +cEOL
cQry+="    C6_CLI,C6_LOJA,C6_ENTREG,C6_LOCAL,C6_QTDENT,C6_BLQ,C9_FILIAL,C9_PEDIDO,C9_ITEM,C9_NFISCAL,C9_BLEST,C9_BLCRED,C9_PRODUTO,F4_FILIAL,F4_DUPLIC, 			" +cEOL
cQry+="    F4_CODIGO,C5_ACRSFIN ,C5_XCARGA   																																	" +cEOL           
cQry+=" ORDER BY C5_FILIAL,C5_NUM																																	" +cEOL
    

MemoWrite("C:\temp\RFINR003.sql",cQry)

cQry := ChangeQuery(cQry)

if Select("TRB") > 0
	TRB->(DbCloseArea())
endif

TcQuery cQry New Alias "TRB"

dbSelectArea("TRB")
TRB->(dbGoTop())


Processa( {|| SPCPR01Excel() }, "Aguarde...", "Gerando planilha eletronica com as informa็๕es...",.F.)


TRB->(DbCloseArea())
RestArea(aArea)
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValPer01  บAutor  ณTarcisio Silva MirandaบDataณ  07/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria Pergunta na Sx1. 									  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 															  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ValPer01()
_sAlias	:=	Alias()
dbSelectArea("SX1")
dbSetOrder(1)
cPerg 	:=	PADR(cPerg,10)

U_xPutSx1(cPerg,"01","Produto De ?","."     ,"."       ,"mv_CH1","C",15,0,0,"G","","SB1","","","MV_PAR01","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"02","Produto At้ ?","."     ,"."       ,"mv_CH2","C",15,0,0,"G","","SB1","","","MV_PAR02","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"03","Pedido De ?","."     ,"."       ,"mv_CH3","C",06,0,0,"G","","SC5","","","MV_PAR03","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"04","Pedido Ate?","."     ,"."       ,"mv_CH4","C",06,0,0,"G","","SC5","","","MV_PAR04","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"05","Filial de Estoque De ?","."     ,"." ,"mv_CH5","C",04,0,0,"G","","SM0","","","MV_PAR05","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"06","Filial de Estoque At้ ?","."     ,".","mv_CH6","C",04,0,0,"G","","SM0","","","MV_PAR06","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"07","Filial Intermediแria De ?","."     ,".","mv_CH7","C",04,0,0,"G","","SM0","","","MV_PAR07","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"08","Filial Intermediแria At้ ?","."     ,".","mv_CH8","C",04,0,0,"G","","SM0","","","MV_PAR08","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"09","Cliente De ?","."     ,"."       ,"mv_CH9","C",06,0,0,"G","","SA1","","","MV_PAR09","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"10","Cliente At้ ?","."     ,"."       ,"mv_CHA","C",06,0,0,"G","","SA1","","","MV_PAR10","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"11","Vendedor De ?","."     ,"."       ,"mv_CHB","C",06,0,0,"G","","SA3","","","MV_PAR11","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"12","Vendedor At้ ?","."     ,"."       ,"mv_CHC","C",06,0,0,"G","","SA3","","","MV_PAR12","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"13","Entrega De ?","."     ,"."       ,"mv_CHD","D",08,0,0,"G","","","","","MV_PAR13","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"14","Entrega At้ ?","."     ,"."       ,"mv_CHE","D",08,0,0,"G","","","","","MV_PAR14","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"15","Emissใo de ?","."     ,"."       ,"mv_CHF","D",08,0,0,"G","","","","","MV_PAR15","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"16","Emissใo At้ ?","."     ,"."       ,"mv_CHG","D",08,0,0,"G","","","","","MV_PAR16","","","","","","","","","","","","","","","","")

U_xPutSx1(cPerg,"17","Tes Movimenta Estoque ?","."     ,"."       ,"mv_CHH","N",01,0,0,"C","","","","","MV_PAR17","Sim","Sim","Sim","Nใo","Nใo","Nใo","Ambas","Ambas","Ambas","","","",,,)
U_xPutSx1(cPerg,"18","Tes Movimenta Financeiro ?","."     ,"."       ,"mv_CHI","N",01,0,0,"C","","","","","MV_PAR18","Sim","Sim","Sim","Nใo","Nใo","Nใo","Ambas","Ambas","Ambas","","","",,,)

U_xPutSx1(cPerg,"19","Tipo De Produto De ?","."     ,"."       ,"mv_CHJ","C",02,0,0,"G","","02","","","MV_PAR19","","","","","","","","","","","","","","","","")
U_xPutSx1(cPerg,"20","Tipo De Produto At้ ?","."     ,"."       ,"mv_CHK","C",02,0,0,"G","","02","","","MV_PAR20","","","","","","","","","","","","","","","","")


U_xPutSx1(cPerg,"21","Salvar Em ?","."     ,"."       ,"mv_CHL","C",50,0,0,"G","","","","","MV_PAR21","","","","","","","","","","","","","","","","")
	
dbSelectArea(_sAlias)

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValPer01  บAutor  ณTarcisio Silva MirandaบDataณ  07/01/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Gera Planilha Eletronica. 			     				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ  														  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function SPCPR01Excel()
Local oFWMSExcel := FWMSExcel():New()
Local oMsExcel
Local aCells
Local cType
Local cColumn
Local cFile
Local cFileTMP
//Local cPicture
Local lTotal
Local nRow
Local nRows
Local nField
Local nFields
Local nAlign
Local nFormat
Local uCell
Local _aHeadXls :={}
Local _aColsXls :={}

Local cWorkSheet := "Relat๓rio de Rastreabilidade "
Local cTable     := "Relat๓rio de Rastreabilidade "+DtoC(Date())+" as "+Time()
//Local lTotalize  := .F.
//Local lPicture   := .F.

dbSelectArea("TRB")
TRB->(dbGoTop())

ProcRegua(TRB->(Reccount()) )

_aHeadXls := {"Fil.Estoque", "Fil.Intermediแria",'Id.Rastreabilidade','Filial',"Pedido","Cod.Cliente", "Lj.Cliente", "Tp. de Pedido",;
			  	  "Tp. de Cliente", "Cod.Transp","Dt.Emissใo","Cond.Pagto","Moeda", "Vendedor", "Cod.Produto","Descri็ใo","Opera็ใo","Tes","Qtd.Vendida",;
			  	  "Prc.Unitแrio","Valor Total", "Vlr.Desconto","Item Pv","Dt.Entrega", "Armazem", "Carga"}
			  	  
While !TRB->(Eof())
	
	IncProc("Processando Relat๓rio: " + TRB->C5_NUM + "-" + TRB->C5_XIDTRI)
	
aAdd(_aColsXls,{TRB->C5_XFILEST,TRB->C5_XFILINT,TRB->C5_XIDTRI,TRB->C5_FILIAL,TRB->C5_NUM,TRB->C5_CLIENTE,TRB->C5_LOJACLI,TRB->C5_TIPO,;
				TRB->C5_TIPOCLI,TRB->C5_TRANSP, STOD(TRB->C5_EMISSAO),TRB->C5_CONDPAG,TRB->C5_MOEDA,TRB->C5_VEND1,TRB->C6_PRODUTO,TRB->C6_DESCRI,TRB->C6_OP,;
				TRB->C6_TES,TRB->C6_QTDVEN,TRB->C6_PRUNIT,TRB->C6_VALOR,TRB->C6_VALDESC,TRB->C6_ITEM,STOD(TRB->C6_ENTREG),;
				TRB->C6_LOCAL,TRB->C5_XCARGA})	


TRB->(DbSkip())
	
End

If Len(_aColsXls) > 0
	
	BEGIN SEQUENCE
	
	oFWMSExcel:AddworkSheet(cWorkSheet)
	oFWMSExcel:AddTable(cWorkSheet,cTable)
	
	nFields := Len( _aHeadXls )
	For nField := 1 To nFields
		cType   := "C"
		cType := ValType(_aColsXls[1][nField])
		nAlign  := IF(cType=="C",1,IF(cType=="N",3,2))
		nFormat := IF(cType=="D",4,IF(cType=="N",2,1))
		cColumn := _aHeadXls[nField]
		lTotal  := .F. // ( lTotalize .and. cType == "N" )
		oFWMSExcel:AddColumn(@cWorkSheet,@cTable,@cColumn,@nAlign,@nFormat,@lTotal)
	Next nField
	
	oFWMSExcel:CBGCOLOR2LINE := '#FFFFFF'
	oFWMSExcel:CBGCOLORLINE  := '#FFFFFF'
	
	aCells := Array(nFields)
	nRows  := Len( _aColsXls )
	For nRow := 1 To nRows
		IncProc("Gerando planilha.. [Linha: "+TRANSFORM(nRow,"@E 999999")+" de "+TRANSFORM(Len(_aColsXls),"@E 999999")+" ]    ")
		For nField := 1 To nFields
			uCell := _aColsXls[nRow][nField]
			If Valtype(uCell) == "D" .AND. EMPTY(uCell)
				aCells[nField] := space(8)
			Else
				aCells[nField] := uCell
			Endif
		Next nField
		oFWMSExcel:AddRow(@cWorkSheet,@cTable,aClone(aCells))
	Next nRow
	oFWMSExcel:Activate()
	
	cFile := ( CriaTrab( NIL, .F. ) + ".xls" )
	
	While File( cFile )
		cFile := ( CriaTrab( NIL, .F. ) + ".xls" )
	End While
	
	oFWMSExcel:GetXMLFile( cFile )
	oFWMSExcel:DeActivate()
	
	IF .NOT.( File( cFile ) )
		MsgStop("Falha ao tentar criar arquivo "+cFile)
		cFile := ""
		BREAK
	EndIF
	
	cLocFile := AllTrim(cLocFile)
	if SubStr(cLocFile,Len(cLocFile),1) <> '\'
		cLocFile += '\'
	endif
	
	cFileTMP := ( cLocFile + cFile )
	IF .NOT.( __CopyFile( cFile , cFileTMP ) )
		MsgStop("Falha ao tentar salvar arquivo em "+cLocFile)
		fErase( cFile )
		cFile := ""
		BREAK
	EndIF
	
	fErase( cFile )
	
	cFile := cFileTMP
	
	IF .NOT.( File( cFile ) )
		MsgStop("Falha ao tentar salvar arquivo em "+cLocFile)
		cFile := ""
		BREAK
	EndIF
	
	IF .NOT.( ApOleClient("MsExcel") )
		MsgStop("Falha ao tentar abrir arquivo "+cFile+". Excel n?o instalado!")
		BREAK
	EndIF
	
	oMsExcel:= MsExcel():New()
	oMsExcel:WorkBooks:Open( cFile )
	oMsExcel:SetVisible( .T. )
	oMsExcel:= oMsExcel:Destroy()
	END SEQUENCE
	
	oFWMSExcel := FreeObj( oFWMSExcel )
	
	
else
	MsgInfo("Nใo hแ dados para serem impressos!","VERIFIQUE OS PARAMETROS")
endif

Return()
