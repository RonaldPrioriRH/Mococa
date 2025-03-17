#INCLUDE "PROTHEUS.CH"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AGLT022  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 13/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina desenvolvida para buscar valores do frete na ZLD e gerar eventos de credito na ZLF para Fretistas     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Fechamento do Frete.           						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
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

user function AGLT022()
local aArea       := getArea()
local aFretes     := {}
private cPerg     := "AGLT022"
private dDataIni  := dDatabase
private dDataFim  := dDatabase

//------------------------------------------------- 
//	Rotina desabilitada por Abrahao em 29/12/08  
//-------------------------------------------------
if 1==1
	return
endif

validPerg()

if !Pergunte(cPerg,.T.)
	return
endif

if empty(mv_par09) .or. empty(mv_par10)
	xmaghelpfis("Atencao ","C๓digo e Tipo do Mix devem ser informados.","Favor informar C๓digo e Tipo do Mix. ")
	return
endif

//Posiciona na ZLE - Cabecalho do Mix
dbSelectArea("ZLE")
dbSetOrder(1)
dbSeek(xFilial("ZLE")+mv_par09)

dDataIni := ZLE->ZLE_DTINI
dDataFim := ZLE->ZLE_DTFIM
cTpMix 	 := if(mv_par10 == 1,"L","F")

//Posiciona na ZL8 - Eventos
dbSelectArea("ZL8")
dbSetOrder(1)

//Busca valores dos fretes
aFretes := getValores()

//Inicia protecao via TTS
BEGIN TRANSACTION

Processa({|lEnd| insZLF(aFretes,@lEnd) },"Fechamento Frete","Iniciando...",.T.)

END TRANSACTION

restArea(aArea)
return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetValoresบ Autor ณ Jeovane               บ Data da Criacao  ณ 13/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Busca total de frete agrupado por setor/fretista/linha da tabela de recepcao de leite(ZLD)                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Fechamento do Frete.           						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
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
static function getValores()
local aArea := getArea()
local cQuery := ""
local cAlias := "TRBZLD"
local aRet := {} //SETOR,DESCRICAO SETOR,LINHA,TIPO LINHA,DESCRICAO LINHA,FRETISTA,LOJA,NOME FRETISTA,VALOR FRETE,TOTAL BOM,TOTAL ACI,


cQuery += " SELECT SUM(A.ZLD_VFREPR) AS VALOR,SUM(A.ZLD_QTDBOM)AS QTDBOM,SUM(A.ZLD_QTDACI) AS QTDACI, "
cQuery += " A.ZLD_SETOR,A.ZLD_LINROT,A.ZLD_TP_RL,A.ZLD_FRETIS,A.ZLD_LJFRET,B.ZL2_DESCRI,C.ZL3_DESCRI,D.A2_NOME "
cQuery += " FROM " + retSqlName("ZLD") + " A "
cQuery += " JOIN " + retSqlName("ZL2") + " B ON A.ZLD_SETOR = B.ZL2_COD AND A.ZLD_FILIAL = B.ZL2_FILIAL "
cQuery += " JOIN " + retSqlName("ZL3") + " C ON A.ZLD_LINROT = C.ZL3_COD AND A.ZLD_TP_RL = C.ZL3_TIPO  AND A.ZLD_FILIAL = C.ZL3_FILIAL "
cQuery += " JOIN " + retSqlName("SA2") + " D ON A.ZLD_FRETIS = D.A2_COD AND A.ZLD_LJFRET = D.A2_LOJA "
cQuery += " WHERE A.D_E_L_E_T_ = ' ' "
cQuery += " AND B.D_E_L_E_T_ = ' ' "
cQuery += " AND C.D_E_L_E_T_ = ' ' "
cQuery += " AND D.D_E_L_E_T_ = ' ' "
cQuery += " AND A.ZLD_DTCOLE BETWEEN '" + dtos(mv_par01) + "' AND '" + dtos(mv_par02) + "' "
cQuery += " AND A.ZLD_SETOR BETWEEN  '" + mv_par03 + "' AND '" + mv_par04 + "' "
cQuery += " AND A.ZLD_FRETIS BETWEEN '" + mv_par05 + "' AND '" + mv_par07 + "' "
cQuery += " AND A.ZLD_LJFRET BETWEEN '" + mv_par06 + "' AND '" + mv_par08 + "' "
cQuery += " GROUP BY A.ZLD_SETOR,A.ZLD_LINROT,A.ZLD_TP_RL,A.ZLD_FRETIS,A.ZLD_LJFRET,B.ZL2_DESCRI,C.ZL3_DESCRI,D.A2_NOME "

if select(cAlias) > 0
	dbSelectArea(cAlias)
	dbCloseArea(cAlias)
endif

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), cAlias, .T., .F. )

while TRBZLD->(!eof())
	aadd(aRet,{TRBZLD->ZLD_SETOR,TRBZLD->ZL2_DESCRI,TRBZLD->ZLD_LINROT,TRBZLD->ZLD_TP_RL,TRBZLD->ZL3_DESCRI,TRBZLD->ZLD_FRETIS,TRBZLD->ZLD_LJFRET,TRBZLD->A2_NOME,TRBZLD->VALOR,TRBZLD->QTDBOM,TRBZLD->QTDACI})
	TRBZLD->(dbSkip())
enddo

dbSelectArea(cAlias)
dbCloseArea(cAlias)
restArea(aArea)
return aRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณinsZLF    บ Autor ณ Jeovane               บ Data da Criacao  ณ 13/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Insere valores na ZLF - Itens do Mix                                                                         บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Fechamento do Frete.           						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ aRegs = Registros a serem inseridos, lEnd = Se usuario cancelou operacao                                 	บฑฑ
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
static function insZLF(aRegs,lEnd)
local aArea := getArea()
local aZL8Area := ZL8->(getArea())
local aZL3Area := ZL3->(getArea())
local cEveLitro := SuperGetMv("LT_EVELTR")
local cEveKm	:= SuperGetMv("LT_EVEKM")
local cEveDia	:= SuperGetMv("LT_EVEDIA")



ProcRegua(len(aRegs))


//Atualiza Registro na ZLF
for i := 1 to len(aRegs)
	incProc("Inserindo registro " + alltrim(str(i)) + " de " + alltrim(str(len(aRegs))) )
	
	//Posiciona na Linha Rota
	dbSelectArea("ZL3")
	dbSetOrder(1)
	if !ZL3->(dbSeek(xFilial("ZL3")+aRegs[i,3]+aRegs[i,4]))
		xmaghelpfis("Atencao ","C๓digo da linha/rota nใo existe","Favor verificar linha/rota " + aRegs[i,3]+ " Tipo: " + aRegs[i,4])
		DisarmTransaction()
		return
	endif
	
	
	
	//Verifica tipo de Pagamento da Linha e rota
	//L=Litro;K=KM;F=Fixo;V=Viagem
	if ZL3->ZL3_FRMPG == "L"
		cEvento := cEveLitro
	elseif ZL3->ZL3_FRMPG == "K"
		cEvento := cEveKm
	elseif ZL3->ZL3_FRMPG == "F"
		cEvento := cEveDia
	endif
	
	//Posiciona no Setor de acordo com parametro e tipo de pagamento da linha e rota
	dbSelectArea("ZL8")
	dbSetOrder(1)
	if !ZL8->(dbSeek(xFilial("ZL8")+cEvento))
		xmaghelpfis("Atencao ","C๓digo do evento informado no param๊tro nใo existe","Favor verificar param๊tros: LT_EVELTR,LT_EVEKM,LT_EVEDIA")
		DisarmTransaction()
		return
	endif
	
	recLock("ZLF",.T.)
	ZLF->ZLF_FILIAL	:= xFilial("ZLF")
	ZLF->ZLF_CODZLE	:= mv_par09
	ZLF->ZLF_DTINI 	:= dDataIni
	ZLF->ZLF_DTFIM	:= dDataFim
	ZLF->ZLF_SETOR	:= aRegs[i,1]
	ZLF->ZLF_DCRSET	:= aRegs[i,2]
	ZLF->ZLF_LINROT	:= aRegs[i,3]
	ZLF->ZLF_TP_RL	:= aRegs[i,4]
	ZLF->ZLF_DCRLIN	:= aRegs[i,5]
	ZLF->ZLF_RETIRO	:= aRegs[i,6]
	ZLF->ZLF_RETILJ	:= aRegs[i,7]
	ZLF->ZLF_DCRRET	:= aRegs[i,8]
	ZLF->ZLF_EVENTO	:= ZL8->ZL8_COD
	ZLF->ZLF_DCREVE	:= ZL8->ZL8_DESCRI
	ZLF->ZLF_DEBCRE	:= ZL8->ZL8_DEBCRE
	ZLF->ZLF_QTDBOM	:= aRegs[i,10]
	ZLF->ZLF_QTDACI	:= aRegs[i,11]
	ZLF->ZLF_VLRLTR	:= aRegs[i,9]/(aRegs[i,10]+aRegs[i,11])
	ZLF->ZLF_TOTAL	:= aRegs[i,9]
	ZLF->ZLF_ORIGEM	:= "R"
	ZLF->ZLF_ACERTO	:= "N"
	ZLF->ZLF_TP_MIX	:= cTpMix
	msUnlock()
	
	if lEnd
		DisarmTransaction()
		exit
	endif
next i

if !lEnd
	msgAlert("Processo concluํdo com ๊xito.")
else
	msgAlert("Processo cancelado pelo usuแrio.")
endif

//Restaura ambiente ZL3 e ZL8
dbSelectArea("ZL3")
dbSetOrder(aZL3Area[2])
dbGoTo(aZL3Area[3])

dbSelectArea("ZL8")
dbSetOrder(aZL8Area[2])
dbGoTo(aZL8Area[3])


restArea(aArea)
return




/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณ validPergบ Autor ณ Jeovane            บ Data ณ  13/11/08   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para criacao das perguntas caso elas nao existam.   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
static function validPerg()

local aHelpPor := {}
local aHelpSpa := {}
local aHelpEng := {}


//De Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data inicial que serแ')
Aadd( aHelpPor, 'usada no filtro                ')
PutSx1(cPerg,"01","De Data"," "," ","mv_ch1","D",8,0,0,"G",'',"","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Data
aHelpPor := {}
Aadd( aHelpPor, 'Informe a data final que serแ')
Aadd( aHelpPor, 'usada no filtro                ')
PutSx1(cPerg,"02","Ate Data"," "," ","mv_ch2","D",8,0,0,"G",'',"","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//De Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o setor inicial que serแ')
Aadd( aHelpPor, 'usado no filtro                ')
PutSx1(cPerg,"03","De Setor"," "," ","mv_ch3","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Ate Setor
aHelpPor := {}
Aadd( aHelpPor, 'Informe o setor final que serแ')
Aadd( aHelpPor, 'usado no filtro                ')
PutSx1(cPerg,"04","Ate Setor"," "," ","mv_ch4","C",6,0,0,"G",'U_ValSetPar()',"ZL2_01","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//De Fretista
aHelpPor := {}
Aadd( aHelpPor, 'Informe o fretista inicial que serแ')
Aadd( aHelpPor, 'usado no filtro                ')
PutSx1(cPerg,"05","De Fretista"," "," ","mv_ch5","C",6,0,0,"G",' ',"FOR","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja inicial que serแ')
Aadd( aHelpPor, 'usada no filtro                ')
PutSx1(cPerg,"06","Loja De"," "," ","mv_ch6","C",2,0,0,"G",'',"","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Ate Fretista
aHelpPor := {}
Aadd( aHelpPor, 'Informe o fretista final que serแ')
Aadd( aHelpPor, 'usado no filtro                ')
PutSx1(cPerg,"07","Ate Fretista"," "," ","mv_ch7","C",6,0,0,"G",' ',"FOR","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Loja
aHelpPor := {}
Aadd( aHelpPor, 'Informe a loja final que serแ')
Aadd( aHelpPor, 'usada no filtro                ')
PutSx1(cPerg,"08","Loja Ate"," "," ","mv_ch8","C",2,0,0,"G",'',"","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)


//Codigo do MIX
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o filtro                ')
PutSx1(cPerg,"09","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch9","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo do MIX
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Tipo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o filtro                ')
PutSx1(cPerg,"10","Tipo do MIX ?","Tipo do MIX ","","mv_ch10","C",1,0,0,"C",'',"","","","mv_par10","Leite","","","","Frete","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return