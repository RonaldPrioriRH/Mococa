#include "protheus.ch"
#include "report.ch"

/*苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯送屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯送屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � RGLT010  � Autor � TOTVS                 � Data da Criacao  � 21/10/2008                						罕�
北掏屯屯屯屯拓屯屯屯屯屯释屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯释屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Relacao de Produtores por tanque.                           						                            罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	Tabela SA2 - Fornecedores - (PRODUTORES)				                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篜arametros� 	mv_par01 = Produtor de:																						罕�
北�			 �	mv_par02 = Produtor ate:						   				                       						罕�
北�			 �	mv_par03 = Loja de:																							罕�
北�			 �	mv_par04 = Loja ate:														                                罕�
北�			 �	mv_par05 = Tanque de:																						罕�
北�			 �	mv_par06 = Tanque ate:														                                罕�
北�			 �	mv_par07 = Classificacao: [Individual/Coletivo/Usuario TC]                             						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篟etorno   � Nenhum						  							                               						罕�
北�			 �														                                   						罕�
北�			 �														                                   						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣suario   � Totvs / Microsiga											                             					罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篠etor     � Gestao do Leite                                                                          					罕�
北掏屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北�            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						罕�
北掏屯屯屯屯脱屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯贡�
北篈utor     � Data     � Motivo da Alteracao  				               砋suario(Filial+Matricula+Nome)    砈etor        罕�
北耗哪哪哪哪呐哪哪哪哪哪拍哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪呐哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪拍哪哪哪哪哪哪罕�
北�          �          �                   							   �                                  �  	        罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北�          �          �                    							   �                                  � 			罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北韧屯屯屯屯拖屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯急�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌�
*/
User Function RGLT010()

//Local oReport
Local oSA2
Private cPerg := "RGLT010   "
Private QRYSA2
Private oReport

ValidPerg()
pergunte(cPerg,.F.)

DEFINE REPORT oReport NAME "RGLT010" TITLE "RELA敲O DE PRODUTORES POR TANQUE" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)
dbSelectArea("SA2")
dbSetOrder(1)
cEndereco := SubStr(A2_END,1,15)

DEFINE SECTION oSA2 OF oReport TITLE "Produtores por tanque" TABLES "QRYSA2"
DEFINE CELL NAME "A2_COD" 		OF oSA2 ALIAS "SA2" TITLE "Cod"
DEFINE CELL NAME "A2_LOJA" 		OF oSA2 ALIAS "SA2" TITLE "Loja"
DEFINE CELL NAME "A2_NREDUZ" 	OF oSA2 ALIAS "SA2" TITLE "Nome"
DEFINE CELL NAME "A2_MUN"		OF oSA2 ALIAS "SA2" TITLE "Cidade"
DEFINE CELL NAME "A2_EST" 		OF oSA2 ALIAS "SA2" TITLE "UF"
DEFINE CELL NAME "A2_TEL"		OF oSA2 ALIAS "SA2" TITLE "Fone" SIZE 21
DEFINE CELL NAME "A2_L_TANQ" 	OF oSA2 ALIAS "SA2" TITLE "Tanque"
DEFINE CELL NAME "ZLS_DESCRI" 	OF oSA2 ALIAS "SA2" TITLE "Nome Tanque"
// DEFINE CELL NAME "A2_L_LI_RO" 	OF oSA2 ALIAS "SA2" TITLE "Linha/Rota"
// DEFINE CELL NAME "A2_L_TP_LR" 	OF oSA2 ALIAS "SA2" TITLE "Tipo"


oReport:PrintDialog()
Return




/*
苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯屯退屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯退屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � PrintReport � Autor � Marcelo Sanches       � Data da Criacao  � 29/09/2008             						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯褪屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯褪屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Funcao estatica que faz os filtros do relatorio.			                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	Tabela SA2 - Fornecedores - (PRODUTORES)				                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篜arametros� 	Objeto oReport																								罕�
北�			 �												   					                       						罕�
北�			 �																												罕�
北�			 �														                                   						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篟etorno   � Nenhum						  							                               						罕�
北�			 �														                                   						罕�
北�			 �														                                   						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣suario   � Totvs / Microsiga											                             					罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篠etor     � Gestao do Leite                                                                          					罕�
北掏屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北�            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						罕�
北掏屯屯屯屯脱屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯贡�
北篈utor     � Data     � Motivo da Alteracao  				               砋suario(Filial+Matricula+Nome)    砈etor        罕�
北耗哪哪哪哪呐哪哪哪哪哪拍哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪呐哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪拍哪哪哪哪哪哪罕�
北�          �          �                   							   �                                  �  	        罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北�          �          �                    							   �                                  � 			罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北韧屯屯屯屯拖屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯急�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌�
*/
Static Function PrintReport(oReport)

Local _cFiltro := "%"

//Define o filtro de acordo com os parametros digitados
//verifica se vai filtrar Fornecedor/Produtor
If !Empty(AllTrim(MV_PAR01)) .And. !Empty(AllTrim(MV_PAR02))
	_cFiltro += " AND SA2.A2_COD BETWEEN '" + AllTrim(MV_PAR01) + "' AND '" + AllTrim(MV_PAR02) + "'"
EndIf

//verifica se vai filtrar por loja do Fornecedor/Produtor
If !Empty(AllTrim(MV_PAR03)) .And. !Empty(AllTrim(MV_PAR04))
	_cFiltro += " AND SA2.A2_LOJA BETWEEN '" + AllTrim(MV_PAR03) + "' AND '" + AllTrim(MV_PAR04) + "'"
EndIf

//verifica se vai filtrar por Tanque
If !Empty(AllTrim(mv_par05)) .And. !Empty(AllTrim(mv_par06))
	_cFiltro += " AND SA2.A2_L_TANQ BETWEEN '" + AllTrim(mv_par05) + "' AND '" + AllTrim(mv_par06) + "'"
EndIf

//verifica se vai filtrar por Classificacao (Individual/Coletivo/Usuario TC).
/*
If mv_par07 == 1 //Individual
	_cFiltro += " AND SA2.A2_L_CLASS = 'I' "
ElseIf mv_par07 == 2//Coletivo
	_cFiltro += " AND SA2.A2_L_CLASS = 'C' "
ElseIf mv_par07 == 3//Usuario TC
	_cFiltro += " AND SA2.A2_L_CLASS = 'U' "
EndIf
*/

If Len(AllTrim(_cFiltro)) == 0
	_cFiltro := "%%"
Else
	_cFiltro += "%"
EndIf

BEGIN REPORT QUERY oReport:Section(1)
BeginSql alias "QRYSA2"     

	SELECT TOP 100 SA2.A2_COD,SA2.A2_LOJA, SA2.A2_NREDUZ, SA2.A2_MUN, SA2.A2_EST, SA2.A2_TEL, SA2.A2_L_TANQ, ZLS_DESCRI
	FROM  %table:SA2% (NOLOCK) SA2 
	 LEFT JOIN %table:ZLS% (NOLOCK) ZLS ON (ZLS.%notDel% AND A2_L_TANQ = ZLS_COD)
	WHERE SA2.A2_FILIAL =  %xfilial:SA2%  AND SA2.%notDel%    AND A2_L_TPFOR = 'P'     
	%exp:_cFiltro%
	ORDER BY SA2.A2_L_TANQ,SA2.A2_NREDUZ
	
EndSql
END REPORT QUERY oReport:Section(1)

oReport:Section(1):SetParentQuery()
oReport:Section(1):Print(.T.)

Return

/*
苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯屯退屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯退屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � ValidPerg   � Autor � Marcelo Sanches       � Data da Criacao  � 21/10/2008             						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯褪屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯褪屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Funcao estatica que cria as perguntas/parametros da tabela SX1.                         						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	SX1 - Tabela de Parametros								                               						罕�
北�          � 															                               						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篜arametros� 	Nenhum																										罕�
北�			 �												   					                       						罕�
北�			 �																												罕�
北�			 �														                                   						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篟etorno   � Nenhum						  							                               						罕�
北�			 �														                                   						罕�
北�			 �														                                   						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣suario   � Totvs / Microsiga											                             					罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篠etor     � Gestao do Leite                                                                          					罕�
北掏屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北�            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU�AO INICIAL                   						罕�
北掏屯屯屯屯脱屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯贡�
北篈utor     � Data     � Motivo da Alteracao  				               砋suario(Filial+Matricula+Nome)    砈etor        罕�
北耗哪哪哪哪呐哪哪哪哪哪拍哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪呐哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪拍哪哪哪哪哪哪罕�
北�          �          �                   							   �                                  �  	        罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北�          �          �                    							   �                                  � 			罕�
北�----------�----------�--------------------------------------------------�----------------------------------�-------------罕�
北韧屯屯屯屯拖屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯急�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌�
*/
Static Function ValidPerg()

Local _sAlias := Alias()
Local aRegs := {}
Local i,j

dbSelectArea("SX1")
dbSetOrder(1)

cPerg := PADR(cPerg,10)

//(sx1) Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05
aAdd(aRegs,{cPerg,"01","Produtor de:  ","","","mv_ch1" ,"C", 6,0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SA2_L9",""})
aAdd(aRegs,{cPerg,"02","Produtor ate: ","","","mv_ch2" ,"C", 6,0,0,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","SA2_L9",""})
aAdd(aRegs,{cPerg,"03","Loja de:      ","","","mv_ch3" ,"C", 2,0,0,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"04","Loja ate:     ","","","mv_ch4" ,"C", 2,0,0,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"05","Tanque de:    ","","","mv_ch5" ,"C", 6,0,0,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","ZLS_01",""})
aAdd(aRegs,{cPerg,"06","Tanque ate:   ","","","mv_ch6" ,"C", 6,0,0,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","ZLS_01",""})
//aAdd(aRegs,{cPerg,"07","Classificacao ","","","mv_ch7" ,"C", 1,0,0,"C","","mv_par07","Individual","","","","","Coletivo","","","","","Usuario TC","","","","","","","","","","","","","","",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+space(10-len(cPerg))+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

Return