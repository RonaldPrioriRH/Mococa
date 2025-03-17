#include "protheus.ch"
#include "report.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT004  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 24/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para gerar relatorio de recepcao de leite diario por produtor apresentando a diferenca   บฑฑ
ฑฑบ          ณ entre o total apontado e total recebido                                                       				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao de Leite                 						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 	mv_par01 = De Frestista							        													บฑฑ
ฑฑบ			 ณ	mv_par02 = Loja       						   					                       						บฑฑ
ฑฑบ			 ณ	mv_par03 = Ate Fretista 																					บฑฑ
ฑฑบ			 ณ	mv_par04 = Loja         		     										                                บฑฑ
ฑฑบ			 ณ	mv_par05 = Ano                                				                                        		บฑฑ
ฑฑบ			 ณ	mv_par06 = Mes                    																			บฑฑ
ฑฑบ			 ณ	mv_par07 = De Quinzena   																					บฑฑ
ฑฑบ			 ณ	mv_par08 = Ate Quinzena                                                              						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

user function RGLT004()
private oReport
private oZLD
private oZLDA
private cPerg := "RGLT004   "
private QRYZLD
private aValores := {} //:= getaVal()
private nTot1 := 0
private nTot2 := 0
private nTot3 := 0
//private cSinal := ""
private cDiaIni := " "
private cDiaFim := " "
private nColSize := 0
private cMasc := " "
private aRegs := {}
private nLinha := 1

ValidPerg()
pergunte(cPerg,.F.)

DEFINE REPORT oReport NAME "RGLT004" TITLE "MAPA DAS LINHAS" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

//Seta Padrao de impressao Paisagem.
oReport:HideParamPage()
oReport:SetLandscape()
oReport:SetTotalInLine(.F.)

nColSize := 8
cMasc := "@E 9999999"

DEFINE SECTION oZLD OF oReport TITLE "Recebimentos" TABLES "ZLD"
DEFINE CELL NAME "ZLD_FRETIS" 		OF oZLD ALIAS "ZLD" TITLE "Fretista" 
DEFINE CELL NAME "A2_NOME"   		OF oZLD ALIAS "SA2" TITLE "Nome" 



DEFINE SECTION oZLDa OF oZLD TITLE "Detalhes" TABLES "ZLD"

//DEFINE CELL NAME "SINAL"  	OF oZLDa ALIAS  " " TITLE " "   SIZE 2 BLOCK{|| alltrim(cSinal)}
DEFINE CELL NAME "01" 		OF oZLDa ALIAS "ZLD" TITLE "01" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[1,2] }
DEFINE CELL NAME "02" 		OF oZLDa ALIAS "ZLD" TITLE "02" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[2,2] }
DEFINE CELL NAME "03" 		OF oZLDa ALIAS "ZLD" TITLE "03" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[3,2] }
DEFINE CELL NAME "04" 		OF oZLDa ALIAS "ZLD" TITLE "04" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[4,2] }
DEFINE CELL NAME "05" 		OF oZLDa ALIAS "ZLD" TITLE "05" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[5,2] }
DEFINE CELL NAME "06" 		OF oZLDa ALIAS "ZLD" TITLE "06" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[6,2] }
DEFINE CELL NAME "07" 		OF oZLDa ALIAS "ZLD" TITLE "07" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[7,2] }
DEFINE CELL NAME "08" 		OF oZLDa ALIAS "ZLD" TITLE "08" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[8,2] }
DEFINE CELL NAME "09" 		OF oZLDa ALIAS "ZLD" TITLE "09" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[9,2] }
DEFINE CELL NAME "10" 		OF oZLDa ALIAS "ZLD" TITLE "10" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[10,2] }
DEFINE CELL NAME "11" 		OF oZLDa ALIAS "ZLD" TITLE "11" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[11,2] }
DEFINE CELL NAME "12" 		OF oZLDa ALIAS "ZLD" TITLE "12" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[12,2] }
DEFINE CELL NAME "13" 		OF oZLDa ALIAS "ZLD" TITLE "13" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[13,2] }
DEFINE CELL NAME "14" 		OF oZLDa ALIAS "ZLD" TITLE "14" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[14,2] }
DEFINE CELL NAME "15" 		OF oZLDa ALIAS "ZLD" TITLE "15" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[15,2] }
DEFINE CELL NAME "T1" 		OF oZLDa ALIAS "ZLD" TITLE "Total" SIZE nColSize PICTURE cMasc BLOCK{|| nTot1 }
DEFINE CELL NAME "16" 		OF oZLDa ALIAS "ZLD" TITLE "16" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[16,2] }
DEFINE CELL NAME "17" 		OF oZLDa ALIAS "ZLD" TITLE "17" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[17,2]}
DEFINE CELL NAME "18" 		OF oZLDa ALIAS "ZLD" TITLE "18" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[18,2] }
DEFINE CELL NAME "19" 		OF oZLDa ALIAS "ZLD" TITLE "19" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[19,2] }
DEFINE CELL NAME "20" 		OF oZLDa ALIAS "ZLD" TITLE "20" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[20,2] }
DEFINE CELL NAME "21" 		OF oZLDa ALIAS "ZLD" TITLE "21" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[21,2] }
DEFINE CELL NAME "22" 		OF oZLDa ALIAS "ZLD" TITLE "22" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[22,2] }
DEFINE CELL NAME "23" 		OF oZLDa ALIAS "ZLD" TITLE "23" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[23,2] }
DEFINE CELL NAME "24" 		OF oZLDa ALIAS "ZLD" TITLE "24" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[24,2] }
DEFINE CELL NAME "25" 		OF oZLDa ALIAS "ZLD" TITLE "25" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[25,2] }
DEFINE CELL NAME "26" 		OF oZLDa ALIAS "ZLD" TITLE "26" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[26,2] }
DEFINE CELL NAME "27" 		OF oZLDa ALIAS "ZLD" TITLE "27" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[27,2] }
DEFINE CELL NAME "28" 		OF oZLDa ALIAS "ZLD" TITLE "28" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[28,2] }
DEFINE CELL NAME "29" 		OF oZLDa ALIAS "ZLD" TITLE "29" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[29,2] }
DEFINE CELL NAME "30" 		OF oZLDa ALIAS "ZLD" TITLE "30" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[30,2] }
DEFINE CELL NAME "31" 		OF oZLDa ALIAS "ZLD" TITLE "31" SIZE nColSize PICTURE cMasc BLOCK{|| aValores[31,2] }
DEFINE CELL NAME "T2" 		OF oZLDa ALIAS "ZLD" TITLE "Total" SIZE nColSize PICTURE cMasc BLOCK{|| nTot2 }
DEFINE CELL NAME "T3" 		OF oZLDa ALIAS "ZLD" TITLE "Total M๊s" SIZE nColSize PICTURE cMasc BLOCK{|| nTot3 }
  



//Processa Linha e retorna se vai ou nao imprimir a mesma
//oZLD:SetLineCondition({|| procLinha(QRYZLD->ZLD_FRETIS,QRYZLD->ZLD_LJFRET,mv_par09,mv_par10,if(mv_par11 > "01","16","01"),if(mv_par12 > "01","31","15"))})
//oZLD:SetLineCondition({|| procLinha(aRegs[nLinha,1],aRegs[nLinha,2],aRegs[nLinha,3])})


//Alinha titulos a direita
for i := 1 to 34
	oZLDa:Cell(i):SetHeaderAlign("RIGHT")
next i


//oZLD:LoadOrder() //Carrega os indices padroes
oZLD:SetPageBreak(.T.) //Seta para cada quebra de secao saltar pagina
oZLDa:SetTotalInLine(.F.) //Seta para imprimir totais em coluna e nao no fim do report

//oZLDa:SetTotalText("DIFERENวA") //seta texto padrao que sera impresso



//Define funcoes de soma
for i := 1 to 34
	DEFINE FUNCTION FROM oZLDa:Cell(i)   FUNCTION SUM 
next i


oReport:PrintDialog()
Return






/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณPrintReportบ Autor ณ Jeovane               บ Data da Criacao  ณ 24/09/2008                                      บฑฑ
ฑฑฬออออออออออุอออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Printa o relatorio                                                                                             บฑฑ
ฑฑบ          ณ                     												                               			      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณRGLT004                          						                                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               					      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               					      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						  บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						  บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor          บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	          บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ---------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			  บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ---------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
static function PrintReport(oReport)

Local cFiltro := "%"

//Define o filtro de acordo com os parametros digitados

//verifica se vai filtrar fretista
if !empty(alltrim(mv_par01)) .and. !empty(alltrim(mv_par03))
	cFiltro += " AND A.ZLD_FRETIS BETWEEN '" + alltrim(mv_par01) + "' AND '" + alltrim(mv_par03) + "'"
endif

//verifica se vai filtrar loja fretista
if !empty(alltrim(mv_par02)) .and. !empty(alltrim(mv_par04))
	cFiltro += " AND A.ZLD_LJFRET BETWEEN '" + alltrim(mv_par02) + "' AND '" + alltrim(mv_par04) + "'"
endif

//Filtra Data
cDiaIni := if(mv_par07 > "01","16","01")
cDiaFim := if(mv_par08 > "01","31","15")
cFiltro += " AND A.ZLD_DTCOLE BETWEEN '" + alltrim(mv_par05) + alltrim(mv_par06) + cDiaIni + "' AND '" + alltrim(mv_par05) + alltrim(mv_par06) + cDiaFim + "' "

if !empty(alltrim(mv_par09))
	cFiltro += " AND A.ZLD_SETOR = '"+alltrim(mv_par09)+"' "
endif

cFiltro += "%"

BEGIN REPORT QUERY oReport:Section(1)
BeginSql alias "QRYZLD"   	
   	SELECT DISTINCT  
		A.ZLD_FRETIS,A.ZLD_LJFRET,B.A2_NOME
	FROM 
		%table:ZLD% A
		JOIN %table:SA2% B
		ON A.ZLD_FRETIS = B.A2_COD AND A.ZLD_LJFRET = B.A2_LOJA					
	WHERE 
	    A.ZLD_FILIAL    = %xfilial:ZLD% AND A.%notDel%  
	    AND B.A2_FILIAL = %xFilial:SA2% AND B.%notDel%
	    %Exp:cFiltro%
	ORDER BY 
	    A.ZLD_FRETIS,A.ZLD_LJFRET
EndSql
END REPORT QUERY oReport:Section(1)

dbSelectArea("QRYZLD")
dbGoTop()

//Percorre query principal e busca informacao de cada fretista
oReport:Section(1):Init()
oReport:Section(1):PrintLine()
while QRYZLD->(!eof())       
	oReport:Section(1):Section(1):Init()	
	aValores := procLinha("+",QRYZLD->ZLD_FRETIS,QRYZLD->ZLD_LJFRET,mv_par09)	                                                                 
	oReport:Section(1):Section(1):PrintLine()

	
	//aValores := procLinha("-",QRYZLD->ZLD_FRETIS,QRYZLD->ZLD_LJFRET,mv_par09)
	//oReport:Section(1):Section(1):PrintLine()

	oReport:Section(1):Section(1):Finish()
	QRYZLD->(dbSkip())
	oReport:Section(1):PrintLine()
enddo
oReport:Section(1):Finish()

return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณprocLinha บ Autor ณ Jeovane               บ Data da Criacao  ณ 24/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao chamada no linecondition da secao do relatorio, atualiza variavel privada aValores com respectivos    บฑฑ
ฑฑบ          ณ valores da linha    												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ RGLT004                         						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cProdutor, cLoja, cFretista,cLjFret,cAno,cMes,cDiaIni,cDiaFim                         						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Saldo do produtor no dia especificado                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
static function procLinha(cSinal,cFretista,cLjFret,cpSetor)
local cQuery := ""
Local aArea   := GetArea()
nTot1 	:= 0
nTot2 	:= 0
nTot3 	:= 0
cAno  	:= mv_par05
cMes  	:= mv_par06
cLastDay := alltrim(str(day(lastday(stod(cAno+cMes+"01")))))
cDiaIni	:= if(mv_par07 > "01","16","01") //Quinzena Inicial
cDiaFim	:= if(mv_par08 > "01",cLastDay,"15") //Quinzena Final
//cSinal := cOper

aValores := getaVal()
if cSinal == "-"
	cQuery += " SELECT SUBSTRING(ZLD_DTCOLE,7,2) AS DIA, COALESCE(SUM(ZLD_QTDBOM+ZLD_QTDACI),0)*-1 AS TOTAL "
	cQuery += " FROM " + retSqlName("ZLD") + " WHERE D_E_L_E_T_ = ' ' "
	cQuery += " AND ZLD_DTCOLE BETWEEN '" + cAno+cMes+cDiaIni + "' AND '" + cAno+cMes+cDiaFim + "' "
	cQuery += " AND ZLD_FRETIS = '" + cFretista + "' AND ZLD_LJFRET = '" + cLjFret + "' "
	cQuery += " AND ZLD_SETOR = '"+cpSetor+"' "
	cQuery += " GROUP BY SUBSTRING(ZLD_DTCOLE,7,2) "
else
	cQuery += " SELECT DISTINCT SUBSTRING(ZLD_DTCOLE,7,2)AS DIA, ZLD_FRETIS,ZLD_LJFRET,(ZLD_TOTACI+ZLD_TOTBOM) AS TOTAL "
	cQuery += " FROM " + retSqlName("ZLD")
	cQuery += " WHERE ZLD_DTCOLE BETWEEN '" + cAno+cMes+cDiaIni + "' AND '" + cAno+cMes+cDiaFim + "' "
	cQuery += " AND ZLD_FRETIS = '" + cFretista + "' AND ZLD_LJFRET = '" + cLjFret + "' "
	cQuery += " AND ZLD_SETOR = '"+cpSetor+"' "
endif

if Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
endif

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

//Atualiza valores na matriz de acordo com query
while TRB->(!Eof())
	nIndex := ascan(aValores,{|x| x[1] == TRB->DIA})
  	aValores[nIndex,2] += TRB->TOTAL
	TRB->(dbSkip())
enddo


//Atualiza Variaveis de totalizadores de quinzena
for i := 1 to 15
nTot1 += aValores[i,2]
next i

for i := 16 to 31
nTot2 += aValores[i,2]
next i

nTot3 += nTot1 + nTot2


dbSelectArea("TRB")
dbCloseArea("TRB")


restArea(aArea)
return  aValores




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณvalidPerg บ Autor ณ Jeovane               บ Data da Criacao  ณ 24/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณFuncao usada para validar se pergunta RGLT004 existe no dicionario de dados, caso nao existe cria as perguntasบฑฑ
ฑฑบ          ณ usadas neste relatorio   										                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ RGLT004                         						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
static function validPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Do Fretista
Aadd( aHelpPor, 'Informe o codigo inicial do fretista')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"01","Do Fretista"," "," ","mv_ch1","C",6,0,0,"G","","SA2_L1","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe loja inicial do fretista  ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"02","Da Loja "," "," ","mv_ch2","C",2,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//Ate Fretista
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final do fretista')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"03","Ate Fretista"," "," ","mv_ch3","C",6,0,0,"G","","SA2_L1","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe loja final do fretista  ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSx1(cPerg,"04","Ate a Loja "," "," ","mv_ch4","C",2,0,0,"G","","","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//Ano
aHelpPor := {}
Aadd( aHelpPor, 'Informe o ano que deseja filtrar ')
U_xPutSx1(cPerg,"05","Ano "," "," ","mv_ch05","C",4,0,0,"G","","","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//Mes
aHelpPor := {}
Aadd( aHelpPor, 'Informe o m๊s que deseja filtrar ')
U_xPutSx1(cPerg,"06","M๊s "," "," ","mv_ch06","C",2,0,0,"G","","","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//De quinzena
aHelpPor := {}
Aadd( aHelpPor, 'Informe a quinzena inicial que deseja filtrar ')
U_xPutSx1(cPerg,"07","De Quinzena "," "," ","mv_ch07","C",2,0,0,"G","","","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
//Ate quinzena
aHelpPor := {}
Aadd( aHelpPor, 'Informe a quinzena final que deseja filtrar ')
U_xPutSx1(cPerg,"08","Ate Quinzena "," "," ","mv_ch08","C",2,0,0,"G","","","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Do Setor 
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.      ')
U_xPutSx1(cPerg,"09","Setor   "," "," ","mv_ch9","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetaVal   บ Autor ณ Jeovane               บ Data da Criacao  ณ 24/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณFuncao usada para preencher vetor aValores com valores padrao                                                 บฑฑ
ฑฑบ          ณ                                  								                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ RGLT004                         						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Array com valores padroes para aValores                                              						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/0000ณ                               				   ณ00-000000 -                       ณ TI	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
static function getaVal()
local aRet := {}

//Preenche Matriz a Valores default
for i := 1 to 31
	aadd(aRet,{strzero(i,2),0})
next i

return aRet