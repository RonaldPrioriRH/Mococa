#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLT054  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 04/07/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Relatorio para listagem do Padrao de Pagamento da Qualidade.    						                        บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ 	Usado para conferencia da qualidade do leite do produtor.                                                   บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ 	MV_PAR01 = Setor:      																						บฑฑ
ฑฑบ			 ณ	MV_PAR02 = Mix de:																						    บฑฑ
ฑฑบ			 ณ	MV_PAR03 = Mix ate:														                                    บฑฑ
ฑฑบ          ณ 	MV_PAR04 = Produtor de:																						บฑฑ
ฑฑบ			 ณ	MV_PAR05 = Produtor ate:						   				                       						บฑฑ
ฑฑบ			 ณ	MV_PAR06 = Loja de:																							บฑฑ
ฑฑบ			 ณ	MV_PAR07 = Loja ate:														                                บฑฑ
ฑฑบ			 ณ	                                            						                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Totvs / Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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
User Function RGLT054()

Local cDtIni := ""
Local cDtFIM := ""
Local cMasc1 := "@E 999.99"
Local cMasc2 := "@E 9,999,999"
Local cMasc3 := "@E 999,999,999.99"
Local nLinha := 0

Private oSA2
Private oReport
Private cPerg  := "RGLT054   "
Private cAlias := GetNextAlias()
Private cData  := ""
Private nProt  := 0
Private nGord  := 0
Private nCBT   := 0
Private nCCS   := 0
Private nVol   := 0
Private nVlr   := 0
Private cFXCBT := ALLTRIM(GetMv("LT_ANACBT")) //Cod. da analise de CBT no Tipo de Faixa    - 000004
Private cFXCCS := ALLTRIM(GetMv("LT_ANACCS")) //Cod. da analise de CCS no Tipo de Faixa    - 000003
Private cFXGOR := ALLTRIM(GetMv("LT_ANAGORD"))//Cod. da analise de Gordura no Tp. de Faixa - 000001
Private cFXPRO := ALLTRIM(GetMv("LT_ANAPROT"))//Cod. da analise de Proteina no Tp de Faixa - 000002
Private aOrd   := {"Codigo+Loja","Linha+Codigo+Loja","Linha+Nome","Nome"}

AjustaSX1()
If !Pergunte(cPerg,.T.)
	Return()
EndIf

cDtIni := DTOC(MV_PAR02)
cDtFIM := DTOC(MV_PAR03)

DEFINE REPORT oReport NAME "RGLT054" TITLE "Padrใo de Pagamento por Qualidade - De "+cDtIni+" ate "+cDtFim PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)
dbSelectArea("SA2")
dbSetOrder(1)

DEFINE SECTION oSA2 OF oReport TITLE "PADRAO DE PAGTO POR QUALIDADE" TABLES "SA2","ZLB","ZLD","ZLF" ORDERS aOrd
DEFINE CELL NAME "A2_COD"     OF oSA2 ALIAS "SA2" TITLE "Produtor" BLOCK{|| (cAlias)->A2_COD     }
DEFINE CELL NAME "A2_LOJA"    OF oSA2 ALIAS "SA2" TITLE "Loja"     BLOCK{|| (cAlias)->A2_LOJA    }
DEFINE CELL NAME "A2_NOME"    OF oSA2 ALIAS "SA2" TITLE "Nome"     BLOCK{|| (cAlias)->A2_NOME    }
DEFINE CELL NAME "A2_L_LI_RO" OF oSA2 ALIAS "SA2" TITLE "Linha"    BLOCK{|| (cAlias)->A2_L_LI_RO }

DEFINE CELL NAME "ZLB_DATA"   OF oSA2 ALIAS "ZLB" TITLE "Data"         PICTURE "@R 99/9999" BLOCK{|| cData    }
DEFINE CELL NAME "PROTEINA"	  OF oSA2 ALIAS "ZLB" TITLE "% Prot."      PICTURE cMasc1 BLOCK{|| nProt          }
DEFINE CELL NAME "GORDURA"	  OF oSA2 ALIAS "ZLB" TITLE "% Gord."      PICTURE cMasc1 BLOCK{|| nGord          }
DEFINE CELL NAME "CBT" 	      OF oSA2 ALIAS "ZLB" TITLE "Qtde. CBT"    PICTURE cMasc2 BLOCK{|| nCBT           }
DEFINE CELL NAME "CCS" 	      OF oSA2 ALIAS "ZLB" TITLE "Qtde. CCS"    PICTURE cMasc2 BLOCK{|| nCCS           }
DEFINE CELL NAME "ZLD_QTDBOM" OF oSA2 ALIAS "ZLB" TITLE "Qtde. Litros" PICTURE cMasc2 BLOCK{|| (cAlias)->QTDE }
DEFINE CELL NAME "ZLF_TOTAL"  OF oSA2 ALIAS "ZLB" TITLE "Valor"        PICTURE cMasc3 BLOCK{|| nVlr           }

//Processa Linha e retorna se vai ou nao imprimir a mesma
oSA2:SetLineCondition({|| ProcLin((cAlias)->A2_COD,(cAlias)->A2_LOJA,(cAlias)->COLETA) })

//Desenha as bordas das celulas
For nI := 1 To 11
	//Monta as bordas
	oSA2:Cell(nI):SetBorder("LEFT")
	oSA2:Cell(nI):SetBorder("TOP")
	oSA2:Cell(nI):SetBorder("RIGHT")
	oSA2:Cell(nI):SetBorder("BOTTOM")
	//Alinha as bordas
	oSA2:Cell(nI):SetHeaderAlign("CENTER")
	oSA2:Cell(nI):SetAlign("CENTER")
Next nI

//Define as cores das celulas
oSA2:OnPrintLine({|| SetCor() })

DEFINE FUNCTION FROM oSA2:Cell("ZLD_QTDBOM") FUNCTION SUM
DEFINE FUNCTION FROM oSA2:Cell("ZLF_TOTAL" ) FUNCTION SUM

oReport:PrintDialog()
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ PrintReport บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para filtrar os dados do relatorio.                    บฑฑ
ฑฑบ          ณ                                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                            บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function PrintReport(oReport)

Local cFiltro1 := "%"
Local cFiltro2 := "%"
Local cFiltro3 := "%"
Local nOrdem  := 1
Local cOrdem  := ""

//Define o filtro de acordo com os parametros digitados
cFiltro1 += " AND SA2.A2_COD BETWEEN     '" + MV_PAR04 + "' AND '" + MV_PAR05 + "'"
cFiltro1 += " AND SA2.A2_LOJA BETWEEN    '" + MV_PAR06 + "' AND '" + MV_PAR07 + "'"
cFiltro1 += "%"

cFiltro2 += " AND ZLD.ZLD_DTCOLE BETWEEN '" + DTOS(MV_PAR02) + "' AND '" + DTOS(MV_PAR03) + "'"
cFiltro2 += " AND ZLD.ZLD_LINROT BETWEEN '" + MV_PAR08 + "' AND '" + MV_PAR09 + "'"
cFiltro2 += "%"

cFiltro3 += " SUBSTRING(ZLB_DATA,1,6) =  '" + SUBSTR(DTOS(MV_PAR02),1,6) + "'   %"

//Tratamento para montar a ordem de impressao do relatorio
nOrdem := oSA2:GetOrder()

If nOrdem == 1//Codigo+Loja
	cOrdem := "%A2_COD,A2_LOJA,A2_NOME,COLETA%"
ElseIf nOrdem == 2//Linha+Codigo+Loja
	cOrdem := "%A2_L_LI_RO,A2_COD,A2_LOJA,COLETA%"
ElseIf nOrdem == 3//Linha+Nome
	cOrdem := "%A2_L_LI_RO,A2_NOME,COLETA%"
Else//Nome
	cOrdem := "%A2_NOME,COLETA%"
EndIf

BEGIN REPORT QUERY oReport:Section(1)
BeginSql alias cAlias
	SELECT
	A2_L_LI_RO,A2_COD,A2_LOJA,A2_NOME,SUM(ZLD_QTDBOM) AS QTDE,SUBSTRING(ZLD_DTCOLE,1,6) AS COLETA
	FROM
	%table:SA2% SA2
   		JOIN %table:ZLD% ZLD ON ZLD.ZLD_FILIAL = %xfilial:ZLD% 
   		AND ZLD.ZLD_RETIRO = SA2.A2_COD AND ZLD.ZLD_RETILJ = SA2.A2_LOJA 
   		%exp:cFiltro2% AND ZLD.%notDel% 
	WHERE
	SA2.A2_FILIAL = %xfilial:SA2% AND SA2.%notDel%
	%exp:cFiltro1%
	GROUP BY A2_L_LI_RO,A2_COD,A2_LOJA,A2_NOME,SUBSTRING(ZLD_DTCOLE,1,6)

	UNION ALL
	SELECT
	A2_L_LI_RO,A2_COD,A2_LOJA,A2_NOME, 0 AS QTDE,SUBSTRING(ZLB_DATA,1,6) AS COLETA
	 FROM %table:SA2% SA2
		JOIN %table:ZM3% M3 ON ZM3_CODIGO = SA2.A2_L_CODAS AND ZM3_QUALID = 'S' AND M3.D_E_L_E_T_ = ' ' 
		JOIN %table:ZLB% LB ON ZLB_RETIRO = A2_COD AND ZLB_RETILJ = A2_LOJA AND %Exp:cFiltro3%
	WHERE  
	SA2.A2_FILIAL = %xfilial:SA2% AND SA2.%notDel%
	%exp:cFiltro1%
	GROUP BY A2_L_LI_RO,A2_COD,A2_LOJA,A2_NOME,SUBSTRING(ZLB_DATA,1,6)

	ORDER BY %exp:cOrdem%
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
Static Function ProcLin()

Local dDtFim := LastDay( STOD((cAlias)->COLETA+"01") )

cData := Substr((cAlias)->COLETA,5,2)+Substr((cAlias)->COLETA,1,4)
nGord := U_GetIndice(xFILIAL("ZL8"),MV_PAR01,(cAlias)->A2_COD,(cAlias)->A2_LOJA,cFXGOR,"A",dDtFim,'M')
nProt := U_GetIndice(xFILIAL("ZL8"),MV_PAR01,(cAlias)->A2_COD,(cAlias)->A2_LOJA,cFXPRO,"A",dDtFim,'M')
nCCS  := U_GetIndice(xFILIAL("ZL8"),MV_PAR01,(cAlias)->A2_COD,(cAlias)->A2_LOJA,cFXCCS,"A",dDtFim,'M')
nCBT  := U_GetIndice(xFILIAL("ZL8"),MV_PAR01,(cAlias)->A2_COD,(cAlias)->A2_LOJA,cFXCBT,"A",dDtFim,'M')
nVlr  := U_TotQual(MV_PAR01,(cAlias)->A2_COD,(cAlias)->A2_LOJA,(cAlias)->COLETA)

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ SetCor   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Seta as cores das celulas.                                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function SetCor()

Local nCorBranc := oSA2:Cell("A2_COD"):ClrBack()
Local nCorVerde := 2551650
Local nCorAmare := 2552550
Local nCorLaran := 1272550
Local nCorRed   := 2556095
Local nCorAzul  := 15995159
Local nCorOrqui := 15350205

/*
//TESTE DE CORES
oSA2:Cell("PROTEINA"  ):SetClrBack(nCorVerde)
oSA2:Cell("GORDURA"   ):SetClrBack(nCorAmare)
oSA2:Cell("CBT"       ):SetClrBack(nCorLaran)
oSA2:Cell("CCS"       ):SetClrBack(nCorAzul)
oSA2:Cell("ZLD_QTDBOM"):SetClrBack(nCorOrqui)
*/

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica em qual Faixa a Proteina se encontra. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cTipoFX := RetTpFx(nProt,cFXPRO)

If cTipoFX == "Min"
	//Quando o valor da analise se encaixar na faixa de minima premiacao a celula deve ficar na cor LARANJA.
	oSA2:Cell("PROTEINA"):SetClrBack(nCorLaran)
ElseIf cTipoFX == "Max"
	//Quando o valor da analise se encaixar na faixa de maxima premiacao a celula deve ficar na cor VERDE.
	oSA2:Cell("PROTEINA"):SetClrBack(nCorVerde)
ElseIf cTipoFX == "Int"
	//Quando o valor da analise se encaixar na faixa intermediaria a celula deve ficar na cor AMARELO.
	oSA2:Cell("PROTEINA"):SetClrBack(nCorAmare)
ElseIf cTipoFX == "Sem"
	//Quando o produtor nao tiver analise no mes em questao, usa-se a media dos ultimos tres meses e a celula deve ficar na cor AZUL.
	oSA2:Cell("PROTEINA"):SetClrBack(nCorAzul)
ElseIf cTipoFX == "Des"
	//Quando o valor da analise for desclassificada a celula deve ficar na cor ORQUIDEA
	oSA2:Cell("PROTEINA"):SetClrBack(nCorOrqui)
ElseIf cTipoFX == "Red"
	//Quando o valor da analise for redutor a celula deve ficar na cor VERMELHO
	oSA2:Cell("PROTEINA"):SetClrBack(nCorRed)
Else
	//Quando o valor da analise se encaixar na faixa neutra a celula deve ficar na cor BRANCO
	oSA2:Cell("PROTEINA"):SetClrBack(nCorBranc)
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica em qual Faixa a Gordura se encontra.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cTipoFX := RetTpFx(nGord,cFXGOR)

If cTipoFX == "Min"
	//Quando o valor da analise se encaixar na faixa de minima premiacao a celula deve ficar na cor LARANJA.
	oSA2:Cell("GORDURA"):SetClrBack(nCorLaran)
ElseIf cTipoFX == "Max"
	//Quando o valor da analise se encaixar na faixa de maxima premiacao a celula deve ficar na cor VERDE.
	oSA2:Cell("GORDURA"):SetClrBack(nCorVerde)
ElseIf cTipoFX == "Int"
	//Quando o valor da analise se encaixar na faixa intermediaria a celula deve ficar na cor AMARELO.
	oSA2:Cell("GORDURA"):SetClrBack(nCorAmare)
ElseIf cTipoFX == "Sem"
	//Quando o produtor nao tiver analise no mes em questao, usa-se a media dos ultimos tres meses e a celula deve ficar na cor AZUL.
	oSA2:Cell("GORDURA"):SetClrBack(nCorAzul)
ElseIf cTipoFX == "Des"
	//Quando o valor da analise for desclassificada a celula deve ficar na cor ORQUIDEA
	oSA2:Cell("GORDURA"):SetClrBack(nCorOrqui)
ElseIf cTipoFX == "Red"
	//Quando o valor da analise for redutor a celula deve ficar na cor VERMELHO
	oSA2:Cell("GORDURA"):SetClrBack(nCorRed)
Else
	//Quando o valor da analise se encaixar na faixa neutra a celula deve ficar na cor BRANCO
	oSA2:Cell("GORDURA"):SetClrBack(nCorBranc)
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica em qual Faixa a CBT se encontra.      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cTipoFX := RetTpFx(nCBT,cFXCBT)

If cTipoFX == "Min"
	//Quando o valor da analise se encaixar na faixa de minima premiacao a celula deve ficar na cor LARANJA.
	oSA2:Cell("CBT"):SetClrBack(nCorLaran)
ElseIf cTipoFX == "Max"
	//Quando o valor da analise se encaixar na faixa de maxima premiacao a celula deve ficar na cor VERDE.
	oSA2:Cell("CBT"):SetClrBack(nCorVerde)
ElseIf cTipoFX == "Int"
	//Quando o valor da analise se encaixar na faixa intermediaria a celula deve ficar na cor AMARELO.
	oSA2:Cell("CBT"):SetClrBack(nCorAmare)
ElseIf cTipoFX == "Sem"
	//Quando o produtor nao tiver analise no mes em questao, usa-se a media dos ultimos tres meses e a celula deve ficar na cor AZUL.
	oSA2:Cell("CBT"):SetClrBack(nCorAzul)
ElseIf cTipoFX == "Des"
	//Quando o valor da analise for desclassificada a celula deve ficar na cor ORQUIDEA
	oSA2:Cell("CBT"):SetClrBack(nCorOrqui)
ElseIf cTipoFX == "Red"
	//Quando o valor da analise for redutor a celula deve ficar na cor VERMELHO
	oSA2:Cell("CBT"):SetClrBack(nCorRed)
Else
	//Quando o valor da analise se encaixar na faixa neutra a celula deve ficar na cor BRANCO
	oSA2:Cell("CBT"):SetClrBack(nCorBranc)
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica em qual Faixa a CCS se encontra.      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cTipoFX := RetTpFx(nCCS,cFXCCS)

If cTipoFX == "Min"
	//Quando o valor da analise se encaixar na faixa de minima premiacao a celula deve ficar na cor LARANJA.
	oSA2:Cell("CCS"):SetClrBack(nCorLaran)
ElseIf cTipoFX == "Max"
	//Quando o valor da analise se encaixar na faixa de maxima premiacao a celula deve ficar na cor VERDE.
	oSA2:Cell("CCS"):SetClrBack(nCorVerde)
ElseIf cTipoFX == "Int"
	//Quando o valor da analise se encaixar na faixa intermediaria a celula deve ficar na cor AMARELO.
	oSA2:Cell("CCS"):SetClrBack(nCorAmare)
ElseIf cTipoFX == "Sem"
	//Quando o produtor nao tiver analise no mes em questao, usa-se a media dos ultimos tres meses e a celula deve ficar na cor AZUL.
	oSA2:Cell("CCS"):SetClrBack(nCorAzul)
ElseIf cTipoFX == "Des"
	//Quando o valor da analise for desclassificada a celula deve ficar na cor ORQUIDEA
	oSA2:Cell("CCS"):SetClrBack(nCorOrqui)
ElseIf cTipoFX == "Red"
	//Quando o valor da analise for redutor a celula deve ficar na cor VERMELHO
	oSA2:Cell("CCS"):SetClrBack(nCorRed)
Else
	//Quando o valor da analise se encaixar na faixa neutra a celula deve ficar na cor BRANCO
	oSA2:Cell("CCS"):SetClrBack(nCorBranc)
EndIf


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ RetTpFx  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para verificar o tipo da faixa.                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetTpFx(nAnalis,cCodFx)

Local cRet       := ""//Retorna se a analise da qualidade eh Desqualificada ou Neutra ou Nao existe analise ou Minima ou Maxima ou Intermediaria
Local cMaiorSeq  := ""//Codigo da maior sequencia para comparar com a sequencia achada
Local cMenorSeq  := ""//Codigo da menor sequencia para comparar com a sequencia achada
Local cSeqAchada := 0 //Sequencia a qual a analise pertence, dentro das faixas
Local nVlrAchado := 0 //Valor pago para a analise, se for zero retorna Neutro
Local nVlrAnali  := If(cCodFx $ (cFXCCS+"#"+cFXCBT),nAnalis*1000,nAnalis)//Tratamento para CCS e CBT, pois elas sao lidas como milhar e impressas sem milhar

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica se tem analise no mes ou nao.                 ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
/*
cQuery := " SELECT ZLB_DESQUA FROM " + RetSqlName("ZLB") + " ZLB "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLB_FILIAL = '"+xFILIAL("ZLB")+"'  "
cQuery += " AND ZLB_SETOR  = '"+MV_PAR01+"'  "
cQuery += " AND ZLB_RETIRO = '"+(cAlias)->A2_COD+"'  "
cQuery += " AND ZLB_RETILJ = '"+(cAlias)->A2_LOJA+"'  "
cQuery += " AND ZLB_TIPOFX = '"+cCodFx+"'  "
cQuery += " AND SUBSTRING(ZLB_DATA,1,6) = '"+(cAlias)->COLETA+"'"
*/
If Select("TFX1") <> 0
	TFX1->(dbCloseArea("TFX1"))
EndIf
BeginSql alias "TFX1"
	SELECT ZLB_DESQUA FROM %Table:ZLB% ZLB 
	WHERE 
	ZLB_FILIAL = %XFILIAL:ZLB%
	AND ZLB_SETOR  = %Exp:MV_PAR01%
	AND ZLB_RETIRO = %Exp:(cAlias)->A2_COD%
	AND ZLB_RETILJ = %Exp:(cAlias)->A2_LOJA%
	AND ZLB_TIPOFX = %Exp:cCodFx%
	AND SUBSTRING(ZLB_DATA,1,6) = %Exp:(cAlias)->COLETA%
	AND ZLB.%NotDel%
EndSql
//dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TFX1", .T., .F. )

//Se encontrou analise de qualidade no mes
If TFX1->(!Eof())
	If TFX1->ZLB_DESQUA == "S"
		cRet := "Des" //Analise desqualificada
	Else
		cQuery := "SELECT ZLA_SEQ,ZLA_FXINI,ZLA_FXFIM,ZLA_VALOR FROM " + RetSqlName("ZLA") + " ZLA "
		cQuery += " WHERE D_E_L_E_T_ = ' '"
		cQuery += " AND ZLA_FILIAL = '"+xFILIAL("ZLA")+"'  "
		cQuery += " AND ZLA_SETOR = '"+MV_PAR01+"'  "
		cQuery += " AND ZLA_COD = '"+cCodFx+"'  "
		cQuery += " ORDER BY ZLA_SEQ"
		
		If Select("TFX2") <> 0
			TFX2->(dbCloseArea("TFX2"))
		EndIf
		
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TFX2", .T., .F. )
		
		//Processa a tabela de faixas
		dbSelectArea("TFX2")
		dbGoTop()
		
		While TFX2->(!Eof())
			
			//Verifica em qual faixa o valor da analise se encontra
			If nVlrAnali >= TFX2->ZLA_FXINI .And. nVlrAnali <= TFX2->ZLA_FXFIM
				cSeqAchada := TFX2->ZLA_SEQ
				nVlrAchado := TFX2->ZLA_VALOR
			EndIf
			
			//Verifica qual a menor faixa
			If TFX2->ZLA_VALOR > 0 .And. Empty(cMenorSeq)
				cMenorSeq := TFX2->ZLA_SEQ
			EndIf
			
			//Armazena a maior faixa
			cMaiorSeq := TFX2->ZLA_SEQ
			
			TFX2->(dbSkip())
		EndDo
		TFX2->(dbCloseArea())
		
		If nVlrAchado == 0
			cRet := "Neu" //Neutro
		ElseIf nVlrAchado < 0 //Redutor
			cRet := "Red" //Redutor
		Else
			//Para gordura e proteina a maior sequencia eh a melhor
			//ja para CBT e CCS a maior sequencia eh a pior
			If cCodFx $ (cFXGOR+"#"+cFXPRO)
				If cSeqAchada == cMenorSeq
					cRet := "Min" //Faixa Minima
				ElseIf cSeqAchada == cMaiorSeq
					cRet := "Max" //Faixa Maxima
				Else
					cRet := "Int" //Faixa Intermediaria
				EndIf
			Else
				If cSeqAchada == cMenorSeq
					cRet := "Max" //Faixa Maxima
				ElseIf cSeqAchada == cMaiorSeq
					cRet := "Min" //Faixa Minima
				Else
					cRet := "Int" //Faixa Intermediaria
				EndIf
			EndIf
		EndIf
	EndIf
Else
	cRet := "Sem" //Sem analise
EndIf

TFX1->(dbCloseArea("TFX1"))
Return(cRet)

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
Aadd( aHelpPor, 'Informe o codigo do Setor')
Aadd( aHelpPor, 'que deseja filtrar.      ')
U_xPutSx1(cPerg,"01","Setor"," "," ","mv_ch01","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial para sele็ใo das')
Aadd( aHelpPor, 'analises de qualidade que serao usadas ')
Aadd( aHelpPor, 'no relatorio.                          ')
U_xPutSx1(cPerg,"02","Da Data "," "," ","mv_ch2","D",8,0,0,"G",'',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final para sele็ใo das  ')
Aadd( aHelpPor, 'analises de qualidade que serao usadas ')
Aadd( aHelpPor, 'no relatorio.                          ')
U_xPutSx1(cPerg,"03","Ate Data "," "," ","mv_ch3","D",8,0,0,"G",'',"","","","MV_PAR03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
U_xPutSx1(cPerg,"04","Produtor de?","Produtor de?","Produtor de?","mv_ch4","C",6,0,0,"G",,"SA2_L9","","","MV_PAR04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no relatorio.              ')
U_xPutSx1(cPerg,"05","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch5","C",6,0,0,"G",,"SA2_L9","","","MV_PAR05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg,"06","Loja de?","Loja de?","Loja de?","mv_ch6","C",2,0,0,"G",,"","","","MV_PAR06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg,"07","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch7","C",2,0,0,"G",,"","","","MV_PAR07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha inicial ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha inicial ')
U_xPutSx1(cPerg,"08","Rota/Linha de?","Rota/Linha de?","Rota/Linha de?","mv_ch8","C",6,0,0,"G",,"ZLW_01","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpSpa, 'Informe o Codigo da Rota/Linha final.  ')
Aadd( aHelpEng, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(cPerg,"09","Rota/Linha Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_ch9","C",6,0,0,"G",,"ZLW_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return