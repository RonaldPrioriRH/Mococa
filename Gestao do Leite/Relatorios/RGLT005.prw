#include "protheus.ch"
#include "report.ch"

/*苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯送屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯送屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � RGLT005  � Autor � TOTVS                 � Data da Criacao  � 29/09/2008                						罕�
北掏屯屯屯屯拓屯屯屯屯屯释屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯释屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Relacao de Produtores.									                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	Tabela SA2 - Fornecedores - (PRODUTORES)				                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篜arametros� 	mv_par01 = Filial de:																						罕�
北�			 �	mv_par02 = Filial ate:						   					                       						罕�
北�			 �	mv_par03 = Produtor de:																						罕�
北�			 �	mv_par04 = Produtor ate:													                                罕�
北�			 �	mv_par05 = com Movimento?																					罕�
北�			 �	mv_par07 = Periodo de:																						罕�
北�			 �	mv_par08 = Periodo ate:																						罕�
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
User Function RGLT005()

Local oSA2
Private cPerg := "RGLT005   "
Private QRYSA2
Private oReport

ValidPerg()
Pergunte(cPerg,.F.)

DEFINE REPORT oReport NAME "RGLT005" TITLE "RELA敲O DE PRODUTORES" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)

DEFINE SECTION oSA2 OF oReport TITLE "Produtores" TABLES "SA2"

If MV_PAR05 == 1
	DEFINE CELL NAME "ZLD_RETIRO" 		OF oSA2 ALIAS "ZLD" TITLE "Cod"
	DEFINE CELL NAME "ZLD_RETILJ" 		OF oSA2 ALIAS "ZLD" TITLE "Loja"
Else
	DEFINE CELL NAME "A2_COD" 			OF oSA2 ALIAS "SA2" TITLE "Cod"
	DEFINE CELL NAME "A2_LOJA" 			OF oSA2 ALIAS "SA2" TITLE "Loja"
EndIf

DEFINE CELL NAME "A2_NOME" 				OF oSA2 ALIAS "SA2" TITLE "Nome"
DEFINE CELL NAME "A2_MUN" 				OF oSA2 ALIAS "SA2" TITLE "Cidade"
DEFINE CELL NAME "A2_EST" 				OF oSA2 ALIAS "SA2" TITLE "UF"

If MV_PAR05 <> 3
	DEFINE CELL NAME "ZLD_DTCOLE"     	OF oSA2 ALIAS "ZLD" TITLE "Data"
EndIf

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
If !Empty(alltrim(mv_par03)) .and. !Empty(alltrim(mv_par04))
	_cFiltro += " AND SA2.A2_COD BETWEEN '" + alltrim(mv_par03) + "' AND '" + alltrim(mv_par04) + "'"
EndIf

//verifica se vai filtrar por loja do Fornecedor/Produtor
If !Empty(alltrim(mv_par01)) .and. !Empty(alltrim(mv_par02))
	_cFiltro += " AND SA2.A2_LOJA BETWEEN '" + alltrim(mv_par01) + "' AND '" + alltrim(mv_par02) + "'"
EndIf

//verifica se vai filtrar por Data de Entrada do Leite.
If !Empty(alltrim(mv_par06)) .and. !Empty(alltrim(mv_par07)) .AND. MV_PAR05 <> 3
	_cFiltro += " AND ZLD.ZLD_DTCOLE BETWEEN '" + alltrim(mv_par06) + "' AND '" + alltrim(mv_par07) + "'"
EndIf

If Len(alltrim(_cFiltro)) == 0
	_cFiltro := "%%"
Else
	_cFiltro += "%"
EndIf

BEGIN REPORT QUERY oReport:Section(1)
If MV_PAR05 == 1
	BeginSql alias "QRYSA2"
		SELECT
		ZLD.ZLD_RETIRO, ZLD.ZLD_RETILJ, SA2.A2_NOME, SA2.A2_MUN, SA2.A2_EST, ZLD.ZLD_DTCOLE
		FROM
		%table:ZLD% ZLD
		JOIN %table:SA2% SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ
		WHERE
		ZLD.ZLD_FILIAL     = %xfilial:ZLD% AND ZLD.%notDel%
		AND SA2.A2_FILIAL  = %xfilial:SA2% AND SA2.%notDel%
		%exp:_cFiltro%
		GROUP BY
		ZLD.ZLD_RETIRO, ZLD.ZLD_RETILJ, SA2.A2_NOME, SA2.A2_MUN, SA2.A2_EST, ZLD.ZLD_DTCOLE
		ORDER BY
		ZLD.ZLD_RETIRO, ZLD.ZLD_RETILJ
	EndSql
EndIf
BeginSql alias "QRYSA2"
	SELECT
	SA2.A2_COD, SA2.A2_LOJA, SA2.A2_NOME, SA2.A2_MUN, SA2.A2_EST
	FROM
	%table:SA2% SA2
	WHERE
	SA2.A2_FILIAL  = %xfilial:SA2% AND SA2.%notDel%
	%exp:_cFiltro%
	ORDER BY
	SA2.A2_COD, SA2.A2_LOJA
EndSql
END REPORT QUERY oReport:Section(1)

oReport:Section(1):SetParentQuery()
oReport:Section(1):Print(.T.)

Return


/*
苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯屯退屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯退屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � ValidPerg   � Autor � Marcelo Sanches       � Data da Criacao  � 29/09/2008             						罕�
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
aAdd(aRegs,{cPerg,"01","Filial de:    ","","","mv_ch1" ,"C", 2,0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"02","Filial ate:   ","","","mv_ch2" ,"C", 2,0,0,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"03","Produtor de:  ","","","mv_ch3" ,"C", 6,0,0,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"04","Produtor ate: ","","","mv_ch4" ,"C", 6,0,0,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"05","Com Movimento?","","","mv_ch5" ,"N", 1,0,0,"C","","mv_par05","Sim","","","","","Nao","","","","","Ambos","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"06","Periodo de:   ","","","mv_ch6" ,"D", 8,0,0,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"07","Periodo ate:  ","","","mv_ch7" ,"D", 8,0,0,"G","","mv_par07","","","","","","","","","","","","","","","","","","","","","","","","","",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+space(10-Len(cPerg))+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			EndIf
		Next
		MsUnlock()
	EndIf
Next

Return