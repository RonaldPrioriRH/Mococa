#include "protheus.ch"
#include "report.ch"

/*苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯送屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯送屯屯屯屯屯屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � RGLT002  � Autor � TOTVS                 � Data da Criacao  � 25/09/2008                						罕�
北掏屯屯屯屯拓屯屯屯屯屯释屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯释屯屯屯屯屯屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Relatorio dos Lancamentos dos Convenios.					                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						罕�
北�			 �	Tabela SA2 - Fornecedores - (CONVENIOS)				                                   						罕�
北�          � 															                               						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篜arametros� 	mv_par01 = Filial de:																						罕�
北�			 �	mv_par02 = Filial ate:						   					                       						罕�
北�			 �	mv_par03 = Convenio de:																						罕�
北�			 �	mv_par04 = Convenio ate:													                                罕�
北�			 �	mv_par05 = Loja de:																							罕�
北�			 �	mv_par06 = Loja ate:													                                	罕�
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
User Function RGLT002()

Local oReport
Local oSA1
Local oSA2
Local oZLL
Private cPerg := "RGLT002   "
Private QRYSD2

ValidPerg()
pergunte(cPerg,.F.)

DEFINE REPORT oReport NAME "RGLT002" TITLE "RELA敲O DOS LAN茿MENTOS DOS CONV蔔IOS" PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

//Seta Padrao de impressao Paisagem.
//oReport:SetLandscape()
oReport:SetTotalInLine(.F.)

DEFINE SECTION oSA2 OF oReport TITLE "Conv阯ios" TABLES "SA2"
DEFINE CELL NAME "A2_COD" 		OF oSA2 ALIAS "SA2" TITLE "Cod" 
DEFINE CELL NAME "A2_NOME" 		OF oSA2 ALIAS "SA2" TITLE "Nome" 
DEFINE CELL NAME "A2_LOJA" 		OF oSA2 ALIAS "SA2" TITLE "Filial" 
DEFINE CELL NAME "A2_SETOR" 	OF oSA2 ALIAS "SA2" TITLE "Setor" 

DEFINE SECTION oZLL OF oSA2    TITLE "Detalhes" TABLES "ZLL","SA1"
DEFINE CELL NAME "ZLL_COD" 		OF oZLL ALIAS "ZLL" TITLE "Codigo"
DEFINE CELL NAME "ZLL_SEQ" 		OF oZLL ALIAS "ZLL" TITLE "Seq"
DEFINE CELL NAME "ZLL_DATA"     OF oZLL ALIAS "ZLL" TITLE "Data"
DEFINE CELL NAME "SA2_NOME"     OF oSA2 ALIAS "SA2" TITLE "Retiro"
DEFINE CELL NAME "ZLL_RETILJ"   OF oZLL ALIAS "ZLL" TITLE "Loja"
DEFINE CELL NAME "ZLL_DCRRET"   OF oZLL ALIAS "ZLL" TITLE "Descri玢o"
DEFINE CELL NAME "ZLL_VALOR" 	OF oZLL ALIAS "ZLL" TITLE "Valor"  		PICTURE "@E 999,999,999.99" 
DEFINE CELL NAME "ZLL_STATUS" 	OF oZLL ALIAS "ZLL" TITLE "Status"

oZLL:SetTotalInLine(.F.)
oZLL:SetTotalText("Total conv阯io:")

DEFINE FUNCTION FROM oZLL:Cell("ZLL_VALOR")	FUNCTION SUM  

oReport:PrintDialog()
Return




/*
苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯屯退屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯退屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � PrintReport � Autor � Marcelo Sanches       � Data da Criacao  � 25/09/2008             						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯褪屯屯屯拖屯屯屯屯屯屯屯屯屯屯屯褪屯屯屯屯屯屯屯屯屯贤屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篋escricao � Funcao estatica que faz os filtros do relatorio.			                               						罕�
北�			 �														                                   						罕�
北�          � 															                               						罕�
北掏屯屯屯屯拓屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯贡�
北篣so       � 	Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						罕�
北�			 �	Tabela SA2 - Fornecedores - (CONVENIOS)				                                   						罕�
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
//verifica se vai filtrar filial
//_cFiltro += " AND ZLL.ZLL_FILIAL = '" + XFILIAL("ZLL")+ "'"

_cFiltro += " AND ZLL.ZLL_CONVEN >= '" + mv_par01 + "' "
_cFiltro += " AND ZLL.ZLL_CONVEN <= '" + mv_par02 + "' "

//_cFiltro += " AND ZLL.ZLL_DATA BETWEEN '" +dtos(mv_par03) + "' AND '" + dtos(mv_par04) + "'"

//_cFiltro += " AND ZLL.ZLL_RETIRO BETWEEN '" + alltrim(mv_par05) + "' AND '" + alltrim(mv_par06) + "'"

_cFiltro += " AND ZLL.ZLL_SETOR = '" + alltrim(mv_par07) + "' "

if len(alltrim(_cFiltro)) == 0 
   _cFiltro := "%%"
   else
   _cFiltro += "%"
endif     

	BEGIN REPORT QUERY oReport:Section(1)
	
   	BeginSql alias "QRYZLL"
   	    SELECT
   	    	ZLL.ZLL_COD, ZLL.ZLL_CONVEN, ZLL.ZLL_LJCONV, ZLL.ZLL_RETIRO, ZLL.ZLL_RETILJ, ZLL.ZLL_DCRRET, ZLL.ZLL_VALOR, ZLL.ZLL_STATUS,
   	    	ZLL.ZLL_SETOR, SA2.A2_COD, SA2.A2_NOME, SA2.A2_LOJA
   	    FROM 
			%table:ZLL% ZLL
			JOIN %table:SA2% SA2 ON SA2.A2_COD = ZLL.ZLL_CONVEN AND SA2.A2_LOJA = ZLL.ZLL_LJCONV
		WHERE 
		    ZLL.ZLL_FILIAL	  = %xfilial:ZLL% AND ZLL.%notDel%  
		    AND SA2.A2_FILIAL = %xfilial:SA2% AND SA2.%notDel%  
		    %exp:_cFiltro%
		ORDER BY 
		SA2.A2_COD, SA2.A2_LOJA
	EndSql
	END REPORT QUERY oReport:Section(1)

	oReport:Section(1):Section(1):SetParentQuery()
	oReport:Section(1):Section(1):SetParentFilter({|cParam| QRYZLL->A2_COD + QRYZLL->A2_LOJA == cParam },{|| QRYZLL->A2_COD + QRYZLL->A2_LOJA})       
    oReport:Section(1):Print(.T.)
RETURN




/*
苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘苘�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北赏屯屯屯屯脱屯屯屯屯屯屯退屯屯屯脱屯屯屯屯屯屯屯屯屯屯屯退屯屯屯屯屯屯屯屯屯淹屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯槐�
北篜rograma  � ValidPerg   � Autor � Marcelo Sanches       � Data da Criacao  � 25/09/2008             						罕�
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
aAdd(aRegs,{cPerg,"01","Do Fornecedor ","","","mv_ch1" ,"C", 6,0,0,"G","","mv_par01","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"02","Ao Fornecedor ","","","mv_ch2" ,"C", 6,0,0,"G","","mv_par02","","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"03","Periodo de:   ","","","mv_ch3" ,"D", 8,0,0,"G","","mv_par03","","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"04","Periodo ate:  ","","","mv_ch4" ,"D", 8,0,0,"G","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"05","Prod/Trans de:","","","mv_ch5" ,"C", 6,0,0,"G","","mv_par05","","","","","","","","","","","","","","","","","","","","","","","","","SA2_L6",""})
aAdd(aRegs,{cPerg,"06","Prod/Trans ate","","","mv_ch6","C", 6,0,0,"G","","mv_par06","","","","","","","","","","","","","","","","","","","","","","","","","SA2_L6",""})
aAdd(aRegs,{cPerg,"07","Setor         ","","","mv_ch7","C", 6,0,0,"G","U_ValSetPar()","mv_par07","","","","","","","","","","","","","","","","","","","","","","","","","ZL2_01",""})

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
RETURN