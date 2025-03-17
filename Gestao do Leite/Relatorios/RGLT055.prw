#INCLUDE "PROTHEUS.CH"
#INCLUDE "REPORT.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ RGLT055  º Autor ³ TOTVS                 º Data da Criacao  ³ 20/07/2011                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Relatorio para Analise de percentual do produtor.             						                        º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ 	Usado para avaliar as movimentacoes do produtor e seus gastos versus receita.                               º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ 	MV_PAR01 = Setor:      																						º±±
±±º			 ³	MV_PAR02 = Mix de:																						    º±±
±±º			 ³	MV_PAR03 = Mix ate:														                                    º±±
±±º          ³ 	MV_PAR04 = Produtor de:																						º±±
±±º			 ³	MV_PAR05 = Produtor ate:						   				                       						º±±
±±º			 ³	MV_PAR06 = Loja de:																							º±±
±±º			 ³	MV_PAR07 = Loja ate:														                                º±±
±±º			 ³	                                            						                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±º			 ³														                                   						º±±
±±º			 ³														                                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Totvs / Microsiga											                             					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite                                                                          					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                   							   ³                                  ³  	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RGLT055()

Local cDtIni := ""
Local cDtFIM := ""
Local cMasc1 := "@E 9,999,999"
Local cMasc2 := "@E 999.9999"
Local cMasc3 := "@E 999,999,999.99"
Local cMasc4 := "@E 99,999.99"
Local nLinha := 1

Local nCorBranc := 0
Local nCorCinza := 205205205

Private oSA2
Private oReport
Private cPerg  := "RGLT055   "
Private cAlias := GetNextAlias()
Private aOrd   := {"% Tot. Gasto","Saldo Produtor","Nome Produtor"}`

AjustaSX1()
If !Pergunte(cPerg,.T.)
	Return()
EndIf

cDtIni := DTOC(MV_PAR02)
cDtFIM := DTOC(MV_PAR03)

DEFINE REPORT oReport NAME "RGLT055" TITLE "Analise de percentual do produtor - De "+cDtIni+" ate "+cDtFim PARAMETER cPerg ACTION {|oReport| PrintReport(oReport)}

oReport:SetTotalInLine(.F.)
dbSelectArea("SA2")
dbSetOrder(1)

DEFINE SECTION oSA2 OF oReport TITLE "DADOS PRODUTOR" TABLES "SA2","ZLB","ZLD","ZLF" ORDERS aOrd
DEFINE CELL NAME "A2_COD"	  OF oSA2 ALIAS "SA2" TITLE "Produtor" BLOCK{|| (cAlias)->A2_COD }
DEFINE CELL NAME "A2_LOJA" 	  OF oSA2 ALIAS "SA2" TITLE "Loja"     BLOCK{|| (cAlias)->A2_LOJA }
DEFINE CELL NAME "A2_NOME"	  OF oSA2 ALIAS "SA2" TITLE "Nome"     BLOCK{|| (cAlias)->A2_NOME }

DEFINE CELL NAME "DATA"  OF oSA2 ALIAS "ZLB" TITLE "Mes/Ano"         BLOCK{|| SubStr((cAlias)->ANOMES,5,2)+"/"+SubStr((cAlias)->ANOMES,1,4) }
DEFINE CELL NAME "VOLUM" OF oSA2 ALIAS "ZLB" TITLE "Volume Leite"    PICTURE cMasc1 BLOCK{|| (cAlias)->QTDE    }
DEFINE CELL NAME "MIX"	 OF oSA2 ALIAS "ZLB" TITLE "Prc Medio"       PICTURE cMasc2 BLOCK{|| (cAlias)->PRECO   }
DEFINE CELL NAME "SLD"   OF oSA2 ALIAS "ZLB" TITLE "Saldo Produtor"  PICTURE cMasc3 BLOCK{|| (cAlias)->SALDO   }
DEFINE CELL NAME "RACAO" OF oSA2 ALIAS "ZLB" TITLE "% Racao"         PICTURE cMasc4 BLOCK{|| (cAlias)->PERCRAC }
DEFINE CELL NAME "FCTO"  OF oSA2 ALIAS "ZLB" TITLE "% Emprestimo"    PICTURE cMasc4 BLOCK{|| (cAlias)->PERCEMP }
DEFINE CELL NAME "ADTO"  OF oSA2 ALIAS "ZLB" TITLE "% Adiantamto"    PICTURE cMasc4 BLOCK{|| (cAlias)->PERCADI }
DEFINE CELL NAME "CONV"  OF oSA2 ALIAS "ZLB" TITLE "% Comercio"      PICTURE cMasc4 BLOCK{|| (cAlias)->PERCCOM }
DEFINE CELL NAME "JUROS" OF oSA2 ALIAS "ZLB" TITLE "% Acres. Fin"    PICTURE cMasc4 BLOCK{|| (cAlias)->PERCJUR }
DEFINE CELL NAME "TOTAL" OF oSA2 ALIAS "ZLB" TITLE "% Tot. Gasto"    PICTURE cMasc4 BLOCK{|| (cAlias)->TOTPERC }

//Processa Linha e retorna se vai ou nao imprimir a mesma
oSA2:SetLineCondition({|| ProcLin((cAlias)->A2_COD,(cAlias)->A2_LOJA) })

//Desenha as bordas das celulas
For nI := 1 To 13
	//Monta as bordas
	oSA2:Cell(nI):SetBorder("LEFT")
	oSA2:Cell(nI):SetBorder("TOP")
	oSA2:Cell(nI):SetBorder("RIGHT")
	oSA2:Cell(nI):SetBorder("BOTTOM")
	//Alinha as bordas
	oSA2:Cell(nI):SetHeaderAlign("CENTER")
	oSA2:Cell(nI):SetAlign("CENTER")
Next nI

//Define as cores das celulas (Zebrado)
nCorBranc := oSA2:Cell("A2_COD"):ClrBack()
oSA2:OnPrintLine({||nLinha := 1}) //Retorna variavel nLinha para um para sempre comecar com cor padrao a cada nova quebra da secao
oSA2:SetTotalInLine(.F.)
oSA2:OnPrintLine({|| If(nLinha%2 == 0,SetCor(nCorCinza),SetCor(nCorBranc)),nLinha++}) //Atualiza Variavel do Subtotal

//DEFINE FUNCTION FROM oSA2:Cell("ZLD_QTDBOM") FUNCTION SUM
//DEFINE FUNCTION FROM oSA2:Cell("ZLF_TOTAL" ) FUNCTION SUM

oReport:PrintDialog()
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ PrintReport º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para filtrar os dados do relatorio.                    º±±
±±º          ³                                                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function PrintReport(oReport)

Local cOrdem := ""
Local nOrdem := oReport:Section(1):GetOrder()
Local cGrpInt	:= Alltrim(GetMv("LT_GRPINT")) // grupo dos eventos internos (loja, fabrica, supermercado)
Local cPrefVen   := "" 
Local _aPrefVen	:= {}

DbSelectArea("ZL8")
ZL8->(dbSetOrder(3)) //ZL8_FILIAL+ZL8_GRUPO+ZL8_COD
If ZL8->(dbSeek(xFilial("ZL8")+cGrpInt))
	While !ZL8->(Eof()) .and. ZL8->ZL8_GRUPO == cGrpInt
		AADD(_aPrefVen,ZL8->ZL8_PREFIX)
		ZL8->(DbSkip())
	EndDo
Else
	xMagHelpFis("Gestão Leite","Convenio não encontrado!","Verifique o parametro LT_CONVINT e o cadastro de Eventos")
	Return(aConvenios)
EndIf

For i:= 1 to Len(_aPrefVen)
	cPrefVen += " '"+_aPrefVen[i]+"',"
Next i
cPrefVen += "''"


If nOrdem == 1// % Tot. Gasto
	cOrdem:="%ANOMES,TOTPERC DESC%"
ElseIf nOrdem == 2// Saldo Produtor
	cOrdem:="%ANOMES,SALDO%"
Else//Nome Produtor
	cOrdem:="%ANOMES,A2_NOME%"
EndIf

BEGIN REPORT QUERY oReport:Section(1)
If MV_PAR08 == 1 //Considera Saldo devedor igual a SIM
	BeginSql alias cAlias
		SELECT  ANOMES, A2_COD, A2_LOJA, A2_NOME,SUM(QTDE) QTDE,
		(SUM(EMPRESTIMO)*100) / SUM(RENDIMENTO) AS PERCEMP,
		(SUM(ADIANTAMTO)*100) / SUM(RENDIMENTO) AS PERCADI,
		(SUM(COMERCIO)  *100) / SUM(RENDIMENTO) AS PERCCOM,
		(SUM(RACAO)     *100) / SUM(RENDIMENTO) AS PERCRAC,
		(SUM(JUROS)     *100) / SUM(RENDIMENTO) AS PERCJUR,
		SUM(RENDIMENTO) AS RENDIMENTO,
		SUM(PRECO) AS PRECO,
		SUM(RENDIMENTO)-SUM(RACAO)-SUM(EMPRESTIMO)-SUM(ADIANTAMTO)-SUM(COMERCIO)-SUM(JUROS) AS SALDO,
		((SUM(EMPRESTIMO)*100)/SUM(RENDIMENTO))+((SUM(ADIANTAMTO)*100)/SUM(RENDIMENTO))+((SUM(COMERCIO)*100)/SUM(RENDIMENTO))+((SUM(RACAO)*100)/SUM(RENDIMENTO))+((SUM(JUROS)*100)/SUM(RENDIMENTO)) AS TOTPERC
		FROM
		
		(	SELECT
		SUBSTRING(ZLF_DTINI,1,6) ANOMES, A2_COD, A2_LOJA, A2_NOME, ZLF_EVENTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVELTE" ))%) THEN SUM(ZLF_QTDBOM) ELSE 0 END AS QTDE
		,CASE WHEN ZLF_EVENTO =   %exp:ALLTRIM(GetMv("LT_EVTEMP" ))%  THEN SUM(ZLF_SE2SLD) ELSE 0 END AS EMPRESTIMO
		,CASE WHEN ZLF_EVENTO =   %exp:ALLTRIM(GetMv("LT_EVTADT" ))%  THEN SUM(ZLF_SE2SLD) ELSE 0 END AS ADIANTAMTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVEBONI"))%) THEN SUM(ZLF_VLRLTR) ELSE 0 END AS PRECO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVEBONI"))%) THEN SUM(ZLF_TOTAL)  ELSE 0 END AS RENDIMENTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_CONVEXT"))%) THEN SUM(ZLF_SE2SLD) ELSE 0 END AS COMERCIO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(cPrefVen)%) THEN SUM(ZLF_SE2SLD) ELSE 0 END AS RACAO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_CONVEXT"))%,%exp:ALLTRIM(GetMv("LT_EVTEMP"))%,%exp:ALLTRIM(GetMv("LT_EVTADT"))%,%exp:ALLTRIM(cPrefVen)%) THEN SUM(ZLF_SE2JUR) ELSE 0 END AS JUROS
		FROM
		%table:SA2% SA2
		,%table:ZLF% ZLF
		WHERE
		SA2.A2_COD = ZLF.ZLF_A2COD
		AND SA2.A2_LOJA = ZLF.ZLF_A2LOJA
		AND SA2.%notDel% AND ZLF.%notDel%
		AND ZLF_SETOR = %exp:MV_PAR01%
		AND ZLF_DTINI >= %exp:DTOS(MV_PAR02)%
		AND ZLF_DTFIM <= %exp:DTOS(MV_PAR03)%
		AND SA2.A2_L_TPFOR IN ('C','G')
		AND SA2.A2_COD BETWEEN %exp:MV_PAR04% AND %exp:MV_PAR05%
		AND SA2.A2_LOJA BETWEEN %exp:MV_PAR06% AND %exp:MV_PAR07%
		GROUP BY A2_COD,A2_LOJA,A2_NOME,SUBSTRING(ZLF_DTINI,1,6),ZLF_EVENTO
		) AS TMP
		
		GROUP BY A2_COD,A2_LOJA,A2_NOME,ANOMES
		ORDER BY %exp:cOrdem%
	EndSql
Else
	BeginSql alias cAlias
		SELECT  ANOMES, A2_COD, A2_LOJA, A2_NOME,SUM(QTDE) AS QTDE,
		(SUM(EMPRESTIMO)*100) / SUM(RENDIMENTO) AS PERCEMP,
		(SUM(ADIANTAMTO)*100) / SUM(RENDIMENTO) AS PERCADI,
		(SUM(COMERCIO)  *100) / SUM(RENDIMENTO) AS PERCCOM,
		(SUM(RACAO)     *100) / SUM(RENDIMENTO) AS PERCRAC,
		(SUM(JUROS)     *100) / SUM(RENDIMENTO) AS PERCJUR,
		SUM(RENDIMENTO) AS RENDIMENTO,
		SUM(PRECO) AS PRECO,
		SUM(RENDIMENTO)-SUM(RACAO)-SUM(EMPRESTIMO)-SUM(ADIANTAMTO)-SUM(COMERCIO)-SUM(JUROS) AS SALDO,
		((SUM(EMPRESTIMO)*100)/SUM(RENDIMENTO))+((SUM(ADIANTAMTO)*100)/SUM(RENDIMENTO))+((SUM(COMERCIO)*100)/SUM(RENDIMENTO))+((SUM(RACAO)*100)/SUM(RENDIMENTO))+((SUM(JUROS)*100)/SUM(RENDIMENTO)) AS TOTPERC
		
		FROM
		(	SELECT
		SUBSTRING(ZLF_DTINI,1,6) ANOMES, A2_COD, A2_LOJA, A2_NOME, ZLF_EVENTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVELTE" ))%) THEN SUM(ZLF_QTDBOM) ELSE 0 END AS QTDE
		,CASE WHEN ZLF_EVENTO =   %exp:ALLTRIM(GetMv("LT_EVTEMP" ))%  THEN SUM(ZLF_TOTAL)  ELSE 0 END AS EMPRESTIMO
		,CASE WHEN ZLF_EVENTO =   %exp:ALLTRIM(GetMv("LT_EVTADT" ))%  THEN SUM(ZLF_TOTAL)  ELSE 0 END AS ADIANTAMTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVEBONI"))%) THEN SUM(ZLF_VLRLTR) ELSE 0 END AS PRECO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_EVEBONI"))%) THEN SUM(ZLF_TOTAL)  ELSE 0 END AS RENDIMENTO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_CONVEXT"))%) THEN SUM(ZLF_TOTAL)  ELSE 0 END AS COMERCIO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(cPrefVen)%) THEN SUM(ZLF_TOTAL)  ELSE 0 END AS RACAO
		,CASE WHEN ZLF_EVENTO IN (%exp:ALLTRIM(GetMv("LT_CONVEXT"))%,%exp:ALLTRIM(GetMv("LT_EVTEMP"))%,%exp:ALLTRIM(GetMv("LT_EVTADT"))%,%exp:ALLTRIM(cPrefVen)%) THEN SUM(ZLF_SE2JUR) ELSE 0 END AS JUROS
		FROM
		%table:SA2% SA2
		,%table:ZLF% ZLF
		WHERE
		SA2.A2_COD = ZLF.ZLF_A2COD
		AND SA2.A2_LOJA = ZLF.ZLF_A2LOJA
		AND SA2.%notDel% AND ZLF.%notDel%
		AND ZLF_SETOR = %exp:MV_PAR01%
		AND ZLF_DTINI >= %exp:DTOS(MV_PAR02)%
		AND ZLF_DTFIM <= %exp:DTOS(MV_PAR03)%
		AND SA2.A2_L_TPFOR IN ('P','T') 
		AND SA2.A2_COD BETWEEN %exp:MV_PAR04% AND %exp:MV_PAR05%
		AND SA2.A2_LOJA BETWEEN %exp:MV_PAR06% AND %exp:MV_PAR07%
		GROUP BY A2_COD,A2_LOJA,A2_NOME,SUBSTRING(ZLF_DTINI,1,6),ZLF_EVENTO
		) AS TMP
		
		GROUP BY A2_COD,A2_LOJA,A2_NOME,ANOMES
		ORDER BY ANOMES,SALDO
	EndSql
EndIf
END REPORT QUERY oReport:Section(1)

oReport:Section(1):SetParentQuery()
oReport:Section(1):Print(.T.)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ ProcLin  º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para processar os registros do relatorio, para cada º±±
±±º          ³ produtor impresso, esta funcao atualiza as variaveis de    º±±
±±º          ³ acordo com os dados do produtor em questao.                º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal.                                        º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ProcLin()

Local lRet := .T.

If MV_PAR09 == 1 //So imprime saldo Devedor
	If (cAlias)->SALDO >= 0
		lRet := .F.
	EndIf
ElseIf MV_PAR09 == 2 //So imprime saldo Credor
	If (cAlias)->SALDO < 0
		lRet := .F.
	EndIf
Else//Ambos - Imprime todos
	lRet := .T.
EndIf

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ SetCor   º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Seta as cores das celulas.                                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function SetCor(nCor)

oSA2:Cell("A2_COD" ):SetClrBack(nCor)
oSA2:Cell("A2_LOJA"):SetClrBack(nCor)
oSA2:Cell("A2_NOME"):SetClrBack(nCor)
oSA2:Cell("DATA"   ):SetClrBack(nCor)
oSA2:Cell("VOLUM"  ):SetClrBack(nCor)
oSA2:Cell("MIX"    ):SetClrBack(nCor)
oSA2:Cell("RACAO"  ):SetClrBack(nCor)
oSA2:Cell("FCTO"   ):SetClrBack(nCor)
oSA2:Cell("ADTO"   ):SetClrBack(nCor)
oSA2:Cell("CONV"   ):SetClrBack(nCor)
oSA2:Cell("SLD"    ):SetClrBack(nCor)
oSA2:Cell("JUROS"  ):SetClrBack(nCor)
oSA2:Cell("TOTAL"  ):SetClrBack(nCor)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºFuncao    ³ AjustaSX1º Autor ³ Microsiga          º Data ³  00/00/00   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Funcao para criacao das perguntas caso elas nao existam.   º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Programa principal                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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
Aadd( aHelpPor, 'Informe a data inicial para seleção das')
Aadd( aHelpPor, 'analises de qualidade que serao usadas ')
Aadd( aHelpPor, 'no relatorio.                          ')
U_xPutSx1(cPerg,"02","Da Data "," "," ","mv_ch2","D",8,0,0,"G",'',"","","","MV_PAR02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final para seleção das  ')
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
Aadd( aHelpPor, 'Informe SIM caso queira que o saldo    ')
Aadd( aHelpPor, 'devedor seja considerado na apuracao   ')
Aadd( aHelpPor, 'do consumo do produtor.                ')
U_xPutSx1(cPerg,"08","Considera Sld Devedor?","Considera Sld Devedor?","Considera Sld Devedor?","mv_ch8","C",1,0,0,"C",'',"","","","MV_PAR08","Sim","","","","Nao","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
Aadd( aHelpPor, 'Indique o tipo do saldo dos produtores ')
Aadd( aHelpPor, 'que voce deseja que seja impresso no   ')
Aadd( aHelpPor, 'relatorio.                             ')
U_xPutSx1(cPerg,"09","So imprime Saldo?","So imprime Saldo?","So imprime Saldo?","mv_ch9","C",1,0,0,"C",'',"","","","MV_PAR09","Devedor","","","","Credor","","","Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return