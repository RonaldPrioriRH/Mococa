#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT053  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 07/01/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relacao de Emprestimo e Adiantamento.                           						                        บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 	Tabela ZLM				                               						                                บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 	MV_PAR01 = Entidade de:																						บฑฑ
ฑฑบ			 ณ	MV_PAR02 = Entidade ate:						   				                       						บฑฑ
ฑฑบ			 ณ	MV_PAR03 = Loja de:																							บฑฑ
ฑฑบ			 ณ	MV_PAR04 = Loja ate:														                                บฑฑ
ฑฑบ			 ณ	MV_PAR05 = Data de:																						    บฑฑ
ฑฑบ			 ณ	MV_PAR06 = Data ate:														                                บฑฑ
ฑฑบ			 ณ	MV_PAR07 = Tipo                             						                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Totvs / Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                   							   ณ                                  ณ  	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RGLT053()

Private oZLM
Private oReport
Private cPerg    := PadR("PRGLT053",10)
Private cMasc1   := "@E 999,999.99"
Private cMasc2   := "@E 999,999,999.99"
Private cAlias   := GetNextAlias()
Private aOrd     := {"Codigo","Produtor+Loja","Nome","Vlr.Parcela","Data"}
Private nParcPag := 0

AjustaSX1()
If !Pergunte(cPerg,.T.)
	Return
EndIf

DEFINE REPORT oReport NAME "RGLT053" TITLE "RELACAO EMPRESTIMO/ADIANTAMENTO" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)
oReport:GetOrientation(2)
oReport:SetLandscape(.T.)// ou SetPortrait() - SetLandscape()
dbSelectArea("ZLM")
dbSetOrder(1)

DEFINE SECTION oZLM OF oReport TITLE "Emprestimo/Adiantamento" TABLES "ZLM" ORDERS aOrd
DEFINE CELL NAME "ZLM_COD" 		OF oZLM ALIAS "ZLM" TITLE "Codigo"     SIZE 10
DEFINE CELL NAME "ZLM_SA2COD"	OF oZLM ALIAS "ZLM" TITLE "Produtor"   SIZE 12
DEFINE CELL NAME "ZLM_SA2LJ" 	OF oZLM ALIAS "ZLM" TITLE "Lj"
DEFINE CELL NAME "ZLM_SA2NOM"	OF oZLM ALIAS "ZLM" TITLE "Nome"       SIZE 30
DEFINE CELL NAME "ZLM_VENCTO"	OF oZLM ALIAS "ZLM" TITLE "1o Vencto"
DEFINE CELL NAME "ZLM_VLRPAR" 	OF oZLM ALIAS "ZLM" TITLE "Vlr Parc"   PICTURE cMasc1
DEFINE CELL NAME "ZLM_PARC" 	OF oZLM ALIAS "ZLM" TITLE "Qtd Par"
DEFINE CELL NAME "PARCPAG" 	    OF oZLM ALIAS "ZLM" TITLE "Pagas"      PICTURE "@E 999" BLOCK {|| nParcPag }
DEFINE CELL NAME "PARCRES" 	    OF oZLM ALIAS "ZLM" TITLE "Restante"   PICTURE "@E 999" BLOCK {|| (cAlias)->ZLM_PARC - nParcPag }
DEFINE CELL NAME "ZLM_TOTAL"	OF oZLM ALIAS "ZLM" TITLE "Emprestado" PICTURE cMasc2
DEFINE CELL NAME "PAGOPARC" 	OF oZLM ALIAS "ZLM" TITLE "Recebido"   PICTURE cMasc2 BLOCK {|| (cAlias)->ZLM_VLRPAR * nParcPag }
DEFINE CELL NAME "SALDOPARC" 	OF oZLM ALIAS "ZLM" TITLE "A Receber"  PICTURE cMasc2 BLOCK {|| ((cAlias)->ZLM_PARC - nParcPag)*(cAlias)->ZLM_VLRPAR }
DEFINE CELL NAME "ZLM_TIPO" 	OF oZLM ALIAS "ZLM" TITLE "Tipo"       
DEFINE CELL NAME "ZLM_STATUS" 	OF oZLM ALIAS "ZLM" TITLE "Status"
 

//Processa Linha e retorna se vai ou nao imprimir a mesma
oZLM:SetLineCondition({|| ProcLin((cAlias)->ZLM_COD) })

//DEFINE BREAK oBreak OF oZLM WHEN {|| (cAlias)->ZLM_TIPO }
DEFINE FUNCTION FROM oZLM:Cell("ZLM_VLRPAR") FUNCTION SUM
DEFINE FUNCTION FROM oZLM:Cell("ZLM_TOTAL" ) FUNCTION SUM
DEFINE FUNCTION FROM oZLM:Cell("PAGOPARC"  ) FUNCTION SUM
DEFINE FUNCTION FROM oZLM:Cell("SALDOPARC" ) FUNCTION SUM

oReport:PrintDialog()
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PrintReport บ Autor ณ TOTVS                 บ Data da Criacao  ณ 29/09/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao estatica que faz os filtros do relatorio.			                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 	Tabela ZLM				                               						                                บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 	Objeto oReport																								บฑฑ
ฑฑบ			 ณ												   					                       						บฑฑ
ฑฑบ			 ณ																												บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Totvs / Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                   							   ณ                                  ณ  	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport)

Local _cFiltro := "%"
Local nOrdem   := 1
Local cOrdem   := ""

//Define o filtro de acordo com os parametros digitados
_cFiltro += " AND ZLM_SA2COD BETWEEN '"+ MV_PAR01 + "' AND '" + MV_PAR02 + "'"
_cFiltro += " AND ZLM_SA2LJ  BETWEEN '"+ MV_PAR03 + "' AND '" + MV_PAR04 + "'"
_cFiltro += " AND A2_L_LI_RO BETWEEN '"+ MV_PAR05 + "' AND '" + MV_PAR06 + "'"
_cFiltro += " AND ZLM_DATA   BETWEEN '"+ DtoS(MV_PAR07) + "' AND '" + DtoS(MV_PAR08) + "'"

If MV_PAR09 == 1//Adiantamento
	_cFiltro += " AND ZLM_TIPO = 'A'"
ElseIf MV_PAR09 == 2//Emprestimo
	_cFiltro += " AND ZLM_TIPO = 'E'"
EndIf

If MV_PAR10 == 1//Aberto
	_cFiltro += " AND ZLM_STATUS = '1'"
ElseIf MV_PAR10 == 2//Aprovado
	_cFiltro += " AND ZLM_STATUS = '2'"
ElseIf MV_PAR10 == 3//Reprovado
	_cFiltro += " AND ZLM_STATUS = '3'"	
ElseIf MV_PAR10 == 4//Efetivado
	_cFiltro += " AND ZLM_STATUS = '4'"		
EndIf


If Len(AllTrim(_cFiltro)) == 0
	_cFiltro := "%%"
Else
	_cFiltro += "%"
EndIf

//Tratamento para montar a ordem de impressao do relatorio
nOrdem := oZLM:GetOrder()

If nOrdem == 1//Codigo
	cOrdem := "%ZLM_FILIAL,ZLM_COD%"
ElseIf nOrdem == 2//Produtor+Loja
	cOrdem := "%ZLM_FILIAL,ZLM_SA2COD,ZLM_SA2LJ%"
ElseIf nOrdem == 3//Nome
	cOrdem := "%ZLM_FILIAL,ZLM_SA2NOM%"
ElseIf nOrdem == 4//Vlr.Parcela
	cOrdem := "%ZLM_FILIAL,ZLM_VLRPAR%"
Else//Data
	cOrdem := "%ZLM_FILIAL,ZLM_DATA%"	
EndIf

BEGIN REPORT QUERY oReport:Section(1)
BeginSql alias cAlias
	SELECT
	ZLM_COD,ZLM_SA2COD,ZLM_SA2LJ,ZLM_SA2NOM,ZLM_VENCTO,ZLM_TOTAL,ZLM_PARC,ZLM_VLRPAR,ZLM_TIPO,ZLM_STATUS,A2_L_LI_RO
	FROM
	%table:ZLM% ZLM, %table:SA2% SA2
	WHERE
	ZLM_FILIAL = %xfilial:ZLM% AND ZLM.%notDel%
	AND A2_FILIAL = %xfilial:SA2% AND SA2.%notDel%
	AND A2_COD  = ZLM_SA2COD
	AND A2_LOJA = ZLM_SA2LJ
	%exp:_cFiltro%
	ORDER BY
	%exp:cOrdem%
EndSql
END REPORT QUERY oReport:Section(1)

oReport:Section(1):SetParentQuery()
oReport:Section(1):Print(.T.)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ ProcLin  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para processar os registros do relatorio, para cada บฑฑ
ฑฑบ          ณ produtor impresso, esta funcao atualiza as variaveis de    บฑฑ
ฑฑบ          ณ acordo com os dados do produtor em questao.                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ProcLin(cCodEmp)

Local cSeek    := ""

//Limpa a variavel
nParcPag := 0

//Posiciona no emprestimo
dbSelectArea("ZLM")
dbSetOrder(1)//ZLM_FILIAL+ZLM_COD
dbSeek(xFilial("ZLM")+cCodEmp)
If ZLM->ZLM_STATUS == "4"
	// -----------------------------------------
	// Obtendo Parametos dos EMPRESTIMOS
	// -----------------------------------------
	If ZLM->ZLM_TIPO == "E"
		cSeek := xFilial("SE1")+"GLE"+cCodEmp
	EndIf
	
	// -----------------------------------
	// Obtendo Parametos dos ADIANTAMENTOS
	// -----------------------------------
	If ZLM->ZLM_TIPO == "A"
		cSeek := xFilial("SE2")+"GLA"+cCodEmp
	EndIf
	
	dbSelectArea("SE1")
	dbSetOrder(1)
	dbSeek(cSeek,.T.)
	
	While SE1->(!Eof()) .And. cSeek == SE1->(E1_FILIAL+E1_PREFIXO+E1_NUM)
		
		If ZLM->(ZLM_SA2COD+ZLM_SA2LJ) == SE1->(E1_CLIENTE+E1_LOJA)
			If !Empty(SE1->E1_BAIXA)
				nParcPag++
			EndIf
		EndIf
		
		SE1->(dbSkip())
	EndDo
EndIf

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ AjustaSX1บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AjustaSX1()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
U_xPutSX1(cPerg,"01","Produtor de?","Produtor de?","Produtor de?","mv_ch1","C",6,0,0,"G",,"SA2_L9","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no relatorio.              ')
U_xPutSX1(cPerg,"02","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch2","C",6,0,0,"G",,"SA2_L9","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSX1(cPerg,"03","Loja de?","Loja de?","Loja de?","mv_ch3","C",2,0,0,"G",,"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSX1(cPerg,"04","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch4","C",2,0,0,"G",,"","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Da Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo inicial do grupo   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSX1(cPerg,"05","Do Grp.Pre็o"," "," ","mv_ch5","C",6,0,0,"G","","ZL3_01","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate a Rota
aHelpPor := {}
Aadd( aHelpPor, 'Informe o codigo final   do pre็o   ')
Aadd( aHelpPor, 'que deseja filtrar.                 ')
U_xPutSX1(cPerg,"06","Ate Grp.Pre็o"," "," ","mv_ch6","C",6,0,0,"G","","ZL3_01","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial para sele็ใo dos')
Aadd( aHelpPor, 'emprestimos/adiantamentos nesse periodo')
U_xPutSX1(cPerg,"07","Da Data "," "," ","mv_ch7","D",8,0,0,"G",'',"","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final para sele็ใo dos  ')
Aadd( aHelpPor, 'emprestimos/adiantamentos nesse periodo')
U_xPutSX1(cPerg,"08","Ate Data "," "," ","mv_ch8","D",8,0,0,"G",'',"","","","MV_PAR08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o tipo de informa็ใo para ser  ')
Aadd( aHelpPor, 'impresso no relatorio. Ecolha entre    ')
Aadd( aHelpPor, 'Adt.Parcelado ou adiantamento.            ')
U_xPutSX1(cPerg,"09","Tipo","Tipo","Tipo","mv_ch9","C",1,0,0,"C",'',"","","","MV_PAR09","Adiantamentos","","","","Adt.Parcelado","","","Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Indique o Status dos emprestimos, ou   ')
Aadd( aHelpPor, 'seja, se estใo em aberto ou aprovado ou')
Aadd( aHelpPor, 'reprovado ou efetivado ou todos.       ')
U_xPutSX1(cPerg,"10","Status","Status","Status","mv_cha","C",1,0,0,"C",'',"","","","MV_PAR10","Aberto","","","","Aprovado","","","Reprovado","","","Efetivado","","","Ambos","","",aHelpPor,aHelpEng,aHelpSpa)


Return