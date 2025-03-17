#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
#INCLUDE "PROTHEUS.CH"
#Include 'TOTVS.CH'
#include 'fileio.ch'
#Include 'TbiConn.ch'
	
//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT022  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 16/06/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Realiza integra็ใo com Coletor de Daodos. Esta rotina lerah os dados gravados nas tabelas criadas e          บฑฑ
ฑฑบ          ณ alimentadas pelos coletores(rotina dos coletores)                                    				        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Integracao com coletores de dados                                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                      						บฑฑ
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
ฑฑบ          ณ          ณ                                                  ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

User Function TEST22SKD
	u_MGLT22SKD({cEmpAnt,cFilAnt})
Return



User Function MGLTSKD22( aParam ) 
//Private cPerg := "MGLT022"
Local cEmp		:= aParam[1]
Local cFil		:= aParam[2]
Local lEnd 		:= .T.
//Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.) Gera erro no Schedule variable does not exist CFILANT on SUPERGETMV(MATXFUNA.PRX) 
//

RPCSetType(3)


PREPARE ENVIRONMENT EMPRESA cEmp FILIAL cFil FUNNAME "MGLT22SKD" TABLES "ZX1,SD3,SA2,ZL4,ZL2,Z19" MODULO "SIGAESP2"

ConOut("---------------------------------------------------------------")      
ConOut("------------- INICIANDO A ROTINA COLETA LEITE " + FUNNAME() + xFilial() +"-------------")      
ConOut("---------------------------------------------------------------")     

//If lHabilita == .T.
ImpDados(@lEnd)

RESET ENVIRONMENT

ConOut("-----------------------------------------------------------------")
ConOut("------------- FINALIZANDO A ROTINA COLETA LEITE " + FUNNAME() + xFilial()   + "-------------")
ConOut("-----------------------------------------------------------------") 


return



User Function MGLT022(cticket,cviagemm, nTD)
Private cPerg := "MGLT022"
Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.)

//GUมXUPE
//MSGSTOP("CFILIALS => "+cFilAnt)


//Chama funcao para gerar txt
 IF lHabilita == .T.
	IF cFilAnt == "0106" 
		ValPer01()
		if !Pergunte(cPerg,.T.)
			return
		endif
		msginfo("Importa็ใo Manual apenas Filial 0106 - Guaxup้ ")
		Processa( {|lEnd| ImpDados(@lEnd,cticket,MV_PAR01, nTD)},"Aguarde","Importando dados Recep็ใo de Leite...",.T.)
	Else
		Processa( {|lEnd| ImpDados(@lEnd,cticket,cviagemm, nTD)},"Aguarde","Importando dados Recep็ใo de Leite...",.T.)
	EndIF
 ELSE
	xMagHelpFis("Mensagem","Aten็ใo, Integra็ใo com Coleta Desabilitada verifique o parametro MV_XATIVCO")
 ENDIF
return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณImpDados  บAutor  ณMicrosiga           บ Data ณ  03/04/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao responsavel por gerar arquivo txt com informacoes daบฑฑ
ฑฑบ          ณ notas fiscais emitidas para produtores                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Envio de arquivo para AF                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ImpDados(lEnd,cticket,cviagemm, nTD)
local aAreaZL2 := ZL2->(getArea())
local aAreaZL3 := ZL3->(getArea())
local aAreaSA2 := SA2->(getArea())
local lErro := .F.
local aMovInternos := {} //Armazena os valores para gerar movimentacao interna {cFilial,cTicket,nTotBom}
Local cDataImp := AllTrim(SuperGetMv("MV_XDTCOL", .F. ,"19990101"))	
Local _cTpFor	:= ""//U_GETRELA1("2","ZL1_PLEITE") //#LETRAS

Local aLastQuery	:= {}
Local cLastQuery
Local cQryAux  := ""
Local aZ19	   := {}
Private lHabilita := SuperGetMv("MV_XATIVCO", .F. ,.F.)

//Verifica parametros para criar filtros
//cFiltro := "%"
//Filtra Data Recebimento
//if !empty(mv_par01) .and. !empty(mv_par02)
//	cFiltro += " WHERE DT_COLETA BETWEEN '" + dtos(mv_par01) + "' AND '" + dtos(mv_par02) + "' "
//endif

//cFiltro += "%"

//msginfo(cticket + cviagemm + "Caique Teste")

cAlias := "TRBCOL"

if Select(cAlias) > 0
	dbSelectArea(cAlias)
	dbCloseArea(cAlias)
endif

/*
//Busca Notas Fiscais
BeginSql alias cAlias
	SELECT
		ZX1.ZX1_DATA,ZX1.ZX1_HORA,ZX1.ZX1_FAZEND,ZX1.ZX1_CAMINH,ZX1.ZX1_VIAGEM,SA2.A2_L_LI_RO,
		SUM(ZX1.ZX1_QUANT) AS ZX1_QUANT
	FROM
		%table:ZX1% ZX1
		JOIN %table:SA2% SA2 ON SA2.A2_L_IDFAZ = ZX1.ZX1_FAZEND
	WHERE
		ZX1.%notDel% AND ZX1.ZX1_FILIAL  = %xFilial:ZX1%
		AND SA2.%notDel% AND SA2.A2_FILIAL  = %xFilial:SA2%
		AND ZX1_IMPZLD <> 'S'
		%Exp:cFiltro%
	GROUP BY
		ZX1.ZX1_DATA,ZX1.ZX1_HORA,ZX1.ZX1_FAZEND,ZX1.ZX1_CAMINH,SA2.A2_L_LI_RO,ZX1.ZX1_VIAGEM
	ORDER BY
		ZX1.ZX1_DATA,ZX1.ZX1_CAMINH,ZX1.ZX1_VIAGEM,SA2.A2_L_LI_RO
EndSql
*/

//Desse jeito nใo carrega tabela do Eduar BEGINSQL
//Busca a3clcoleta Tabela Eduardo
/*
BeginSql alias cAlias
	SELECT * FROM 
		%table:a3clcoleta% 
		//JOIN %table:SA2% SA2 ON SA2.A2_COD||SA2.A2_LOJA = A3C.A2_COD||A3C.A2_LOJA
	WHERE
		//ZX1.%notDel% AND ZX1.ZX1_FILIAL  = %xFilial:ZX1%
		//SA2.%notDel%
		//AND ZX1_IMPZLD <> 'S'
		%Exp:cFiltro%

EndSql
*/
//ZX1.%notDel% AND ZX1.ZX1_FILIAL  = %xFilial:ZX1%
	cQryAux := " "
	//cQryAux += "SELECT * FROM ZX1010 WHERE zx1010.d_e_l_e_t_ = ' '  AND   ZX1_FILIAL = '0102' AND ZX1_STATUS NOT IN  ('I','C') AND ZX1_VIAGEM IN ('20210118113807','20210118110219')  ORDER BY  ZX1_VIAGEM, ZX1_ITEM "		+ STR_PULA
	cQryAux += "SELECT * FROM ZX1010 WHERE zx1010.d_e_l_e_t_ = ' '  AND   ZX1_FILIAL = '"+ xFilial("ZX1") +"' AND ZX1_STATUS NOT IN  ('I','C') "		+ STR_PULA
	If cFilAnt == "0106"
		//Teste SCHEDULE Pegar datas para importar
		if FUNNAME()  == 'MGLT22SKD' .AND. lHabilita == .T. 
		//cQryAux += "        AND  ZX1_DTCOLE = '20210209' "		+ STR_PULA
		cQryAux += "        AND  ZX1_DTCOLE >= '"+ Alltrim(cDataImp) +"'  "		+ STR_PULA

		ELSEIF FUNNAME()  == 'MGLT22SKD' .AND. lHabilita == .F.

		cQryAux += "        AND  ZX1_DTCOLE = '19990101'  "		+ STR_PULA

		Else
		//Importa Viagem MENU com n๚mero da Viagem	
		cQryAux += "         AND ZX1_VIAGEM IN '"+ Alltrim(MV_PAR01) +"'  "		+ STR_PULA
		EndIf	
	Else
		cQryAux += "         AND ZX1_VIAGEM IN '"+ Alltrim(cviagemm) +"'  "		+ STR_PULA
	EndIF
	cQryAux += "         ORDER BY  ZX1_VIAGEM, ZX1_ITEM"		+ STR_PULA
	
	//"AND G1_FILIAL = '"+ xFilial("SG1") +"' "
	//'"+ xFilial("SG1") +"' "
	//20201223170145
/*
	cQryAux := ""
	cQryAux += "SELECT   ZL2_FILIAL,"		+ STR_PULA
	cQryAux += "         TO_CHAR(DT_COLETA, 'YYYYMMDD') DTNOVA ,"		+ STR_PULA
	cQryAux += "         ZLW_SETOR,"		+ STR_PULA
	cQryAux += "         ZLW_COD,"		+ STR_PULA
	cQryAux += "         ZLW_VERSAO,"		+ STR_PULA
	cQryAux += "         ZLW_DESCRI,"		+ STR_PULA
	cQryAux += "         A2_COD,"		+ STR_PULA
	cQryAux += "         A2_LOJA,"		+ STR_PULA
	cQryAux += "         A2_COD_TRANSP,"		+ STR_PULA
	cQryAux += "         A2_LOJA_TRANSP,"		+ STR_PULA
	cQryAux += "         ZL4_COD,"		+ STR_PULA
	cQryAux += "         ZL0_NOME,"		+ STR_PULA
	cQryAux += "         ZL0_COD ,"		+ STR_PULA
	cQryAux += "         NR_ITEM,"		+ STR_PULA
	cQryAux += "         NR_LITRAGEM,"		+ STR_PULA
	cQryAux += "         CT_ENVIO_TIPO,"		+ STR_PULA
	cQryAux += "         NR_REG_ID_VIAGEM      "		+ STR_PULA
	cQryAux += "         "		+ STR_PULA
	cQryAux += "  FROM   A3CLCOLETA"		+ STR_PULA
	//cQryAux += cFiltro  + STR_PULA
*/	
	MemoWrite("C:\temp\zx1150121.sql",cQryAux)

	cQryAux := ChangeQuery(cQryAux)
	
	//Executando consulta e setando o total da r้gua
	TCQuery cQryAux New Alias "TRBCOL"

dbSelectArea("TRBCOL")
//nReg := 0
//Count To nReg

ProcRegua(TRBCOL->(RecCount()))
//ProcRegua(nReg)
dbGoTop()

BEGIN TRANSACTION
//Grava Recepcao na ZLD

cAux := " "
cLinhaAux := " "

//If TRBCOL->(eof())
	//MsgAlert("Nใo existem Viagens para serem importadas")
//EndIf
	IF lHabilita == .F.
		ConOut("------------- ROTINA DE INTEGRAวรO DESABILITADA VERIFIQUE O PARAMETRO MV_XATIVCO " + FUNNAME() +   "-------------")
	ENDIF

	if TRBCOL->(EOF())
		MSGInfo("Nใo foram encontrados registros de viagem para importa็ใo.","Recep็ใo Leite")	
	endif
	

while TRBCOL->(!eof())  
	IF FUNNAME() <> 'MGLT22SKD'
	incProc()
	ENDIF
	
	//Posiciona no Cadastro de Fazenda
	//dbSelectArea("SZ0")
	//dbSetOrder(1)//Filial + Cod. Fazenda
	//dbSeek(xFILIAL("SZ0")+TRBCOL->ZX1_FAZEND)
	
	//Posiciona no Cadastro de Fornecedor/Produtor
	//dbSelectArea("SA2")
	//dbOrderNickName("GLT_SA2002")//Busca Produtor pelo codigo da fazenda
	//dbOrderNickName("GLT_SA2001")//Busca Produtor pelo codigo antigo
	  
	
	//if empty(TRBCOL->ZX1_FAZEND) 
	//		xMagHelpFis("Fazenda","Encontrado registro nos dados do coletor com fazenda em branco.","Favor verificar com administrador do sistema")
		
		//loop
	//	msgAlert("O processo serแ abortado.")
		
	//	lErro := .T.
	//	exit
//	endif
	
	//Se caso nao encontrar produtor amarrado retorna msg de help e passa pro proximo no loop
	/*
	If !dbSeek(xFILIAL("SA2")+TRBCOL->ZX1_FAZEND)
		//If !dbSeek(xFILIAL("SA2")+SZ0->Z0_FORNECE+SZ0->Z0_LOJA)
		xMagHelpFis("Produtor",;
		"O produtor "+SZ0->Z0_FORNECE+"-"+SZ0->Z0_LOJA+" nao foi encontrado, consequentemente seus lancamentos nao serao importados!",;
		"Verifique se o codigo desse produtor existe no cadastro de produtores, no campo Codigo Antigo.")
		
		//loop
		msgAlert("O processo serแ abortado. Favor cadastrar fornecedor vinculado เ fazenda: " + TRBCOL->ZX1_FAZEND + ".")
		
		lErro := .T.
		exit
		
	EndIf
	*/

	/*if !SA2->A2_L_TPFOR $ "P/G/T"  //#LETRAS
	//if SA2->A2_C_TPFOR $ _cTpFor //#LETRAS
	xMagHelpFis("Produtor",;
		"O produtor "+SZ0->Z0_FORNECE+"-"+SZ0->Z0_LOJA+" nao foi encontrado, consequentemente seus lancamentos nao serao importados!",;
		"Verifique se o codigo desse produtor existe no cadastro de produtores, no campo Codigo Antigo.")
		
		//loop
		msgAlert("O processo serแ abortado. Favor cadastrar fornecedor vinculado เ fazenda: " + TRBCOL->ZX1_FAZEND + ".")
		
		lErro := .T.
		exit
		
	endif
	*/

	cRetiro 	:= TRBCOL->ZX1_RETIRO
	cRetLj		:= TRBCOL->ZX1_RETILJ	
	cVeicul		:= TRBCOL->ZX1_VEICUL //ZL3->ZL3_VEICUL


	dbSelectArea("SA2")
	dbSetOrder(1)
	dbSeek(xFilial("SA2")+cRetiro+cRetLj)
	cGrpPreco	:= SA2->A2_L_LI_RO
	cNomeA2		:= SA2->A2_NOME

	//Posiciona na ZL3 - Linha Rota para buscar fretista
	//Caique Grupo do Pre็o
	dbSelectArea("ZL3")
	dbSetOrder(1)
	//dbSeek(xFilial("ZL3")+SA2->A2_L_LI_RO + SA2->A2_L_TP_LR)
	dbSeek(xFilial("ZL3")+cGrpPreco) //Campo Grupo Pre็o 
	
	//Caique Cadastro de Veiculo
	//Tenta posicionar no Veiculo atraves do codigo antigo do veiculo
	dbSelectArea("ZL4")
	dbSetOrder(4)
	if dbSeek(xFilial("ZL4")+cVeicul)
	else
		//Posiciona na ZL4 - Veiculo
		dbSelectArea("ZL4")
		dbSetOrder(1)
		dbSeek(xFilial("ZL4")+cVeicul)
	endif
	

	
	//Alimenta Variaveis
	//Erros 
	cFilEntr	:= TRBCOL->ZX1_FILIAL//U_GetFilEnt(cRetiro,cRetLj,TRBCOL->DT_COLETA) //Filial de entrega do leite --- serve para gerar movimentacao interna do estoque na filial apontada neste campo

/*
	if empty(cFilEntr) 
			xMagHelpFis("Produtor",;
		"O produtor "+SA2->A2_COD+"-"+SA2->A2_LOJA+" nao tem uma filial de entrega relacionada!",;
		"Por favor Verifique esta pendencia antes de prosseguir.")
		
		//loop
		msgAlert("O processo serแ abortado.")
		
		lErro := .T.
		exit
	endif
*/
	//Caique Passando os dados da tabela Eduardo 
	cFilPosto	:= TRBCOL->ZX1_FILIAL
	dDtColeta	:= sToD(TRBCOL->ZX1_DTCOLE)//Stod(TRBCOL->DT_COLETA)
	cHora		:= SubStr(TRBCOL->ZX1_HORA, 1, 5)
	cSetor		:= TRBCOL->ZX1_SETOR
	//cLinRot		:= SA2->A2_L_LI_RO //Passou grupo de pre็o ?
	//cTipLR   	:= SA2->A2_L_TP_LR // Nใo existe esse campo 
	cItem		:= TRBCOL->ZX1_ITEM

	//If(TRBCOL->ZX1_ITEM = "001")
	cCabLinRot	:= TRBCOL->ZX1_LINROT
	cCabDescLin	:= TRBCOL->ZX1_DESLIN
	//EndIF
	cLinRot		:= TRBCOL->ZX1_LINROT // Caique teste
	cVersao		:= TRBCOL->ZX1_VERSAO
	cDescLin	:= TRBCOL->ZX1_DESLIN
	nTemp		:= TRBCOL->ZX1_TEMP
	nRegua		:= TRBCOL->ZX1_REGUA	
	cFretist	:= TRBCOL->ZX1_FRETIS
	cLjFret 	:= TRBCOL->ZX1_LJFRET
	cMotor		:= TRBCOL->ZX1_MOTOR
	nTotKm  	:= 0
	cUser		:= UsrRetName(RetCodUsr())//"caique.mercadante"//CriaVar("ZLD_USER")
	nQtdBom		:= TRBCOL->ZX1_QTDBOM
	//cNomeA2		:= TRBCOL->ZX1_DCRRET Errado 
	cViagem		:= TRBCOL->ZX1_VIAGEM
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณData Coleta maior que a data da Recepcao no laticinioณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		
	//If (Month(dDtColeta) > Month(dDataBase))
	//	xMagHelpFis("Data da Recepcao",;
	//	"Data da Recepcao nao permitida!",;
	//	"Favor verificar o m๊s da recep็ใo")

	//	exit
	//EndIf
		
		
		aZ19 := getTotLte(dDtColeta,cVeicul	,cViagem,cFilPosto, nTD)
		nTotBom  := aZ19[1]
		cTicketPort := aZ19[2]
		
		// Filial 0102 Tem ticket de pesagem 
	if nTotBom == 0 .And. Empty(cTicketPort) .And. cFilPosto == '0102'
			
		msgAlert("Favor cadastrar peso do dia " + ALLTRIM(DTOC(dDtColeta)) + " para caminhใo " + cVeicul + " Viagem: " + cViagem + "Lan็ar o Ticket de Pesagem" )
		//lErro := .T.
		msgAlert("O processo serแ abortado. Nใo realiza importa็ใo da Viagem ")
		//exit
		//estava finalizando no primeiro registro que encontrado que nใo tinha ticekt com viagem amarrada e finalizava opera็ใo
	Else
	
	//Verifica para saber se eh nova viagem ou dia para gerar novo ticket
	//Caique
	//if cAux != TRBCOL->ZX1_DATA + TRBCOL->ZX1_CAMINH + Alltrim(str(TRBCOL->ZX1_VIAGEM))
	//cAux := TRBCOL->ZX1_DATA + TRBCOL->ZX1_CAMINH + Alltrim(str(TRBCOL->ZX1_VIAGEM))
			//(TRBCOL->NR_REG_VIAGEM+RBCOL->ZL0_COD+TRBCOL->ZL4_COD)
	if cAux <> (cViagem+cMotor+cVeicul)//(dToc(TRBCOL->DT_COLETA)+TRBCOL->ZL4_COD)   //ZX1_VIAGE
		cAux := (cViagem+cMotor+cVeicul)//(dToc(TRBCOL->DT_COLETA)+TRBCOL->ZL4_COD)   //ZX1_VIAGE
		//cLinhaAux := TRBCOL->A2_L_LI_RO
		cLinhaAux := cMotor
		//Gera Codigo de Recebimento
		//ZX7_FILIAL+ZX7_CAMINH+ZX7_VIAGEM+ZX7_DATA
		
		//Desabilitei Caique
		//nTotBom := int(getTotLte(sToD(TRBCOL->ZX1_DATA),TRBCOL->ZX1_CAMINH,TRBCOL->ZX1_VIAGEM))
		//nTotBom := int(getTotLte(TRBCOL->DT_COLETA,TRBCOL->ZL4_COD,TRBCOL->NR_REG_VIAGEM))
		/*
		aZ19 := getTotLte(dDtColeta,cVeicul	,cViagem)
		nTotBom  := aZ19[1]
		cTicketPort := aZ19[2]
		
		//nTotBom := 15000 //Teste Caique
		if nTotBom == 0 .And. Empty(cTicketPort)
			
			msgAlert("Favor cadastrar peso do dia " + ALLTRIM(DTOC(dDtColeta)) + " para caminhใo " + cVeicul + " Viagem: " + cViagem + "Lan็ar o Ticket de Pesagem" )
			lErro := .T.
			msgAlert("O processo serแ abortado. Nใo realiza importa็ใo da Viagem ")
			exit

		endif
		//	Caique
		*/
		cCodRec := getNumRec(cFilPosto)  //Estแ com Xfilial
		cTicket := getNwTicket(cFilPosto,cSetor) // Estแ com Xfilial parei aqui
		
		
		nPosFil := ascan(aMovInternos,{|x| x[1] == cFilEntr .AND. x[2] == cTicket})
		//aMovInternos {cFilial,cTicket,nTotBom,DataColeta} jแ estava comentado
		if nPosFil == 0
			aadd(aMovInternos,{cFilEntr,cTicket,nTotBom,dDtColeta,cCodRec})
		else
			aMovInternos[nPosFil][3] += nTotBom
		endif	

		
		//Verifica se eh linha diferente, para gerar novo codigo de recepcao
	elseif cLinhaAux <> cMotor//TRBCOL->A2_L_LI_RO
		cLinhaAux := cMotor//TRBCOL->A2_L_LI_RO
		cCodRec := getNumRec(cFilPosto)
	endif
	
	//grvZLD(cRetiro,cRetLj,dDatabase,dDtColeta,cSetor,cLinRot,cTipLR,cFretist,cLjFret,cVeicul,cMotor,nTotKm,cUser,nTotBom,cNomeA2,cTicket,cCodRec,nQtdBom)
	grvZLD(cFilPosto,cRetiro,cRetLj,cItem,dDatabase,dDtColeta,cHora,cSetor,cLinRot,cVersao,cDescLin,nTemp,nRegua,cFretist,cLjFret,cVeicul,cMotor,nTotKm,cUser,nTotBom,cNomeA2,cTicket,cCodRec,nQtdBom,cCabLinRot,cCabDescLin,cGrpPreco,cTicketPort)
	EndIF //Caique nใo gravar 

	TRBCOL->(dbSkip())
enddo
//Fim Wile

//Desabilitado Caique Teste Inclusใo Apenas
//Gera Movimentos Interno
		//ticket errado,3,   
//gerMI(cCod,noption,nTotBom,dDtColeta,cSetor,cFilEntr)    Passar Filial Entrada 
for i := 1 to len(aMovInternos)
	if ! (gerMI(aMovInternos[i][2],3,aMovInternos[i][3],aMovInternos[i][4],"000001",aMovInternos[i][1],aMovInternos[i][5]) )//Incluir //alterado Caique
		lErro := .T.
	Else
	//Caique Teste
	lSqlOk := .T.

	cQueryUpd := ""
	cQueryUpd += "UPDATE ZX1010 SET ZX1_STATUS = 'I' , ZX1_TICKET = ' '"		+ STR_PULA
	cQueryUpd += " WHERE   ZX1010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQueryUpd += "         AND   ZX1_FILIAL"		+ STR_PULA
	cQueryUpd += "            || ZX1_ITEM"		+ STR_PULA
	cQueryUpd += "            || ZX1_DTCOLE"		+ STR_PULA
	cQueryUpd += "            || ZX1_SETOR"		+ STR_PULA
	cQueryUpd += "            || ZX1_RETIRO"		+ STR_PULA
	cQueryUpd += "            || ZX1_RETILJ"		+ STR_PULA
	cQueryUpd += "            || ZX1_QTDBOM"		+ STR_PULA
	cQueryUpd += "            || ZX1_LINROT"		+ STR_PULA
	cQueryUpd += "            || ZX1_VERSAO"		+ STR_PULA
	cQueryUpd += "            || ZX1_VEICUL"		+ STR_PULA
	cQueryUpd += "            || ZX1_MOTOR IN"		+ STR_PULA
	cQueryUpd += "                  (SELECT      ZLD_FILIAL"		+ STR_PULA
	cQueryUpd += "                            || ZLD_ITEM"		+ STR_PULA
	cQueryUpd += "                            || ZLD_DTCOLE"		+ STR_PULA
	cQueryUpd += "                            || ZLD_SETOR"		+ STR_PULA
	cQueryUpd += "                            || ZLD_RETIRO"		+ STR_PULA
	cQueryUpd += "                            || ZLD_RETILJ"		+ STR_PULA
	cQueryUpd += "                            || ZLD_QTDBOM"		+ STR_PULA
	cQueryUpd += "                            || ZLD_LINROT"		+ STR_PULA
	cQueryUpd += "                            || ZLD_VERSAO"		+ STR_PULA
	cQueryUpd += "                            || ZLD_VEICUL"		+ STR_PULA
	cQueryUpd += "                            || ZLD_MOTOR"		+ STR_PULA
	cQueryUpd += "                     FROM   ZLD010"		+ STR_PULA
	cQueryUpd += "                    WHERE       ZLD010.D_E_L_E_T_ = ' '"		+ STR_PULA
	cQueryUpd += "                            AND ZLD_TICKET = '" +aMovInternos[i][2]+"'"		+ STR_PULA
	cQueryUpd += "                            AND ZLD_FILIAL = '" +aMovInternos[i][1]+"')"		+ STR_PULA

	MemoWrite("C:\temp\ZX1STATUS_update.sql",cQueryUpd)

	lSqlOk := !(TCSQLExec(cQueryUpd) < 0)
	if lSqlOk .and. (TcGetDB() == 'ORACLE')
		lSqlOk := !(TCSQLExec("COMMIT") <0)
		MSGInfo("Processo concluido com sucesso UPDATE ZX1 Importado." + aMovInternos[i][2] )
	endif
	
	If !lSqlOk
		msginfo("ERRO QUERY UPDATE ZX1")
		msginfo(TCSQLError())
		msginfo("Verifiquei a Sintaxe da Query.")
	endif

	endif

next i

//pergunte(cPerg,.F.)

END TRANSACTION

//Restaura Areas
ZL2->(restArea(aAreaZL2))
ZL3->(restArea(aAreaZL3))
SA2->(restArea(aAreaSA2))

return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณvalidPerg บ Autor ณ Jeovane               บ Data da Criacao  ณ 04/03/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณFuncao usada para validar se pergunta MGLT022 existe no dicionario de dados, caso nao existe cria as perguntasบฑฑ
ฑฑบ          ณ usadas neste relatorio   										                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MGLT022                         						                                                        บฑฑ
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
static function ValPer01()

_sAlias	:=	Alias()
dbSelectArea("SX1")
dbSetOrder(1)
cPerg 	:=	PADR(cPerg,10)

U_xPutSx1(cPerg,"01","Informe a Viagem ","","","mv_CH1","C",14,0,0,"G",""," ","","","MV_PAR01","","","","","","","","","","","","","","","","")
dbSelectArea(_sAlias)

	
return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT022   บAutor  ณMicrosiga           บ Data ณ  06/16/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Grava informacoes na ZLD - Recpcao de Leite                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

//static function grvZLD(cRetiro,cRetLj,dData,dDtColeta,cSetor,cLinRot,cTipLR,cFretist,cLjFret,cVeicul,cMotor,nTotKm,cUser,nTotBom,cNomeA2,cTicket,cCodRec,nQtdBom)
static function grvZLD(cFilPosto,cRetiro,cRetLj,cItem,dData,dDtColeta,cHora,cSetor,cLinRot,cVersao,cDescLin,nTemp,nRegua,cFretist,cLjFret,cVeicul,cMotor,nTotKm,cUser,nTotBom,cNomeA2,cTicket,cCodRec,nQtdBom,cCabLinRot,cCabDescLin,cGrpPreco,cTicketPort)

//cCodRec := getNumRec()
//cTicket := getNwTicket(cSetor)
dbSelectArea("ZLD")
RecLock("ZLD",.T.)
ZLD->ZLD_FILIAL		:= cFilPosto//xFilial("ZLD")
ZLD->ZLD_CODREC		:= cCodRec
ZLD->ZLD_TICKET		:= cTicket
ZLD->ZLD_ITEM		:= cItem
ZLD->ZLD_DTLANC		:= dData     //"20201221"DtColeta
ZLD->ZLD_DTCOLE		:= dDtColeta //dDtColeta
ZLD->ZLD_HORA		:= cHora
ZLD->ZLD_HORDESC	:= SubStr(Time(),1,5)
ZLD->ZLD_SETOR 		:= cSetor
ZLD->ZLD_LINROT		:= cLinRot
ZLD->ZLD_ROTCAB		:= cCabLinRot //Conferir porque existem mais de uma rota  exemplo ticket  002560
ZLD->ZLD_VERSAO		:= cVersao
ZLD->ZLD_DESLIN		:= cDescLin
ZLD->ZLD_DESCAB		:= cCabDescLin  //LinRot Conferir porque existem mais de uma rota exemplo ticket  002560
//ZLD->ZLD_HORA		:= cHora
ZLD->ZLD_TEMP		:= nTemp
ZLD->ZLD_REGUA		:= nRegua
//ZLD->ZLD_TP_RL		:= cTipLR //Nใo existe esse campo ZLD_TP_RL
ZLD->ZLD_RETIRO		:= cRetiro 
ZLD->ZLD_RETILJ		:= cRetLj
ZLD->ZLD_FRETIS		:= cFretist
ZLD->ZLD_LJFRET		:= cLjFret
ZLD->ZLD_VEICUL		:= cVeicul
ZLD->ZLD_DCRRET		:= cNomeA2
ZLD->ZLD_MOTOR		:= cMotor
ZLD->ZLD_KM			:= nTotKm
ZLD->ZLD_STATUS		:= " "
ZLD->ZLD_USER 		:= cUser
ZLD->ZLD_TOTBOM		:= nTotBom
ZLD->ZLD_QTDBOM		:= nQtdBom
ZLD->ZLD_LOTE		:= (cFilPosto+cTicket)
ZLD->ZLD_IMPORT		:= "I" //Importado
ZLD->ZLD_GRPRC		:= cGrpPreco
ZLD->ZLD_TKPESO		:= cTicketPort
//Caique Removi esse cara pergunta Marcos
//ZLD->ZLD_FILENT		:= U_GetFilEnt(cRetiro,cRetLj,dDtColeta)
ZLD->(MsUnlock())

return



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetNumRec บ Autor ณ Totvs                 บ Data da Criacao  ณ 16/06/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para pegar numero maximo de recebimento                                                         บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function getNumRec(cFilPosto)
Local cRet 	  := ""
Local cQuery  := ""
Local aArea   := GetArea()


cQuery := "SELECT MAX(ZLD_CODREC) AS ULTIMO FROM "
cQuery += RetSqlName("ZLD") + " WHERE D_E_L_E_T_ = ' ' "
//cQuery += "  AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"
cQuery += "  AND ZLD_FILIAL = '" + cFilPosto + "'"
If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	cRet := soma1(TRB->ULTIMO)
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

RestArea(aArea)

Return cRet




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetNwTicket Autor ณ Totvs                 บ Data da Criacao  ณ 16/06/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para pegar numero maximo do Ticket                                                              บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
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
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function getNwTicket(cFilPosto,cSetor)
Local cRet := ""
Local aArea   := GetArea()


dbSelectArea("ZL2")
dbSetOrder(1)
//if SBZ->(DbSeek(SD1->D1_FILIAL+SD1->D1_COD))
dbSeek(cFilPosto+cSetor)
If Found() .AND. cFilPosto+cSetor == ZL2->ZL2_FILIAL+ZL2->ZL2_COD
	cRet:=ZL2->ZL2_TICKET
	If Empty(alltrim(cRet))
		cRet:=StrZero(1,6)
	EndIf
	RecLock("ZL2",.f.)
	ZL2->ZL2_TICKET:=soma1(cRet)
	MsUnLock()
	cTicket := cRet
Else
	xmaghelpfis("Setor","Setor nao encontrado!","Selecione um Setor vแlido!")
EndIf

dbCloseArea("ZL2")
RestArea(aArea)
Return cRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณGERMI     บ Autor ณ TOTVS                 บ Data da Criacao  ณ 07/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para gravar o movimento interno no estoque                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function gerMI(cTicket,noption,nTotBom,dDtColeta,cSetor,cFilEntr,cCod)
Local _aAutoSD3 := {}
Local cTm := getmv("LT_ENTTM")//Cod.do TM do Mov.Interno do Recto de Leite
Local cProduto := getmv("LT_ENTPRO")//Cod. do Produto do Mov.Interno do Recto de Leite
Local cLocal:=""
Local nVlrMix := POSICIONE("ZL2",1,XFILIAL("ZL2")+cSetor,"ZL2_ULTMIX")
Local bProc
Local bret:=.t.
Local _cLote	:=	""
Local _cArmaz	:=	""
local cFilAux := cFilAnt

cFilAnt := cFilEntr //Atualiza Filial com filial de entrega

If nVlrMix <= 0
	xmaghelpfix("Erro","O valor do custo nao foi preenchido no Cadastro de Setores!","Preencha o valor do custo de entrada no estoque no Cadastro de Setores!")
	Return .f.
EndIf

_cArmaz	:=	POSICIONE("ZL2",1,XFILIAL("ZL2")+cSetor,"ZL2_LOCAL")
//_cLote	:=	SUBSTR(POSICIONE("ZA4",1,XFILIAL("ZA4")+_cArmaz,"ZA4_DESC"),1,9)
//_cLote	:=	SUBSTR(POSICIONE("ZG0",1,xFILIAL("ZG0")+_cArmaz,"ZG0_DESCR"),1,9)
cProduto:=  POSICIONE("SB1",1,XFILIAL("SB1")+cProduto,"B1_COD")

nModulo := 4
cModulo := "EST"

// Se nao existir amazem, entao cria.
cLocal:= POSICIONE("ZL2",1,XFILIAL("ZL2")+cSetor,"ZL2_LOCAL")
dbSelectArea("SB2")
dbSetOrder(1)
If !dbSeek(xfilial("SB2")+cProduto+cLocal)
	CriaSB2(cProduto,cLocal)
EndIf

If !Empty(cTm) .and. !Empty(cProduto) .and. nOption == 3 // incluir
	
	AAdd( _aAutoSD3,{"D3_FILIAL"   , xFilial("SD3")		, nil } )	// Tipo do Movimento Interno	: Obrigatorio
	AAdd( _aAutoSD3,{"D3_TM"		, cTm 				, nil } )	// Tipo do Movimento Interno	: Obrigatorio
	AAdd( _aAutoSD3,{"D3_COD"		, cProduto			, nil } )	// Codigo do Produto			: Obrigatorio
	AAdd( _aAutoSD3,{"D3_UM"		, "L"				, nil } )	// Unidade de Medida			: Obrigatorio
	AAdd( _aAutoSD3,{"D3_QUANT"	    , nTotBom       	, nil } )	// Quantidade de Leite
	AAdd( _aAutoSD3,{"D3_LOCAL"	    , POSICIONE("ZL2",1,XFILIAL("ZL2")+cSetor,"ZL2_LOCAL"), nil } )	// Almoxarifado					: Obrigatorio
	AAdd( _aAutoSD3,{"D3_EMISSAO"	, dDtcoleta			, nil } )	// Data de Emissao				: Obrigatorio
	//AAdd( _aAutoSD3,{"D3_DOC"	    , GetSxeNum("SD3","D3_DOC"), nil } )	// Documento
	//AAdd( _aAutoSD3,{"D3_DOC"	    , "GLTCAIQUE", nil } )	// Documento
	AAdd( _aAutoSD3,{"D3_DOC"	    , "GLT"+cTicket, nil } )	// Documento
	AAdd( _aAutoSD3,{"D3_CUSTO1"	, (nVlrMix*ntotbom)	, nil } )	// Custo (na Moeda 1)
	If getMv("MV_RASTRO") == "S"
		//AAdd( _aAutoSD3,{"D3_LOTECTL"	, _cLote			, nil } )	// Lote
	EndIf
	//AAdd( _aAutoSD3,{"D3_L_ORIG"	, cCod + "-" + cFilEntr  			, nil } )	// Origem do documento - ticket   + filial do produtor Acreido que esteja aqui nใo ้
	AAdd( _aAutoSD3,{"D3_L_ORIG"	, cCod  			, nil } )	// Origem do documento - ticket   + filial do produtor Acreido que esteja aqui nใo ้

	AAdd( _aAutoSD3,{"D3_L_SETOR"	, cSetor  			, nil } )	// Origem do documento - ticket
	lMsErroAuto := .F.
	
	//Altera็ใo Caique
		//Erro ao excluir SD3
	If !existMi(cCod,cSetor,cFilEntr)
		Pergunte("MTA240",.F.)
		MSExecAuto({|x,y| Mata240(x,y)},_aAutoSD3,3)
		Pergunte("AGLT003",.F.)
	EndIf
	
	
	
	If lMsErroAuto .OR. !existMi(cCod,cSetor,cFilEntr)
		mostraerro()
		xmaghelpfis("Erro","Erro ao gravar Recepcao de Leite devido a um erro ocorrido ao gerar Estoque!","Tente novamente, se o erro persistir comunique urgentemente ao Suporte!")
		//ACSendMail(GetMv("MV_WFAUTUS"), GetMv("MV_WFAUTSE"), GetMv("MV_WFPOP3"), "Workflow", "sistema@laticinio.com.br", "Gestao De Leite - Erro!", "Nao foi possivel gerar estoque! Entrada "+cTicket)
		bret:=.f.
	EndIf
	
Else
	If !Empty(cTm) .and. !Empty(cProduto) .and. noption == 3
		xmaghelpfis("Erro","Parametros LT_ENTPRO e LT_ENTTM nao foram preenchidos ou ja existe esse Ticket de Recepcao de Leite! Nao foi possivel gerar estoque!","Comunique urgentemente ao Suporte!")
		//ACSendMail(GetMv("MV_WFAUTUS"), GetMv("MV_WFAUTSE"), GetMv("MV_WFPOP3"), "Workflow", "sistema@laticinio.com.br", "Gestao De Leite - Erro!", "Nao foi possivel gerar estoque! Entrada "+cTicket)
		bret:=.f.
	EndIf
EndIf

nModulo := 2
cModulo := "COM"
cFilAnt := cFilAux 


Return bret

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณEXISTMI   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 09/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada verificar se existe um movimento interno relativo a entrada                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum                                                                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
Static Function existMi(cCod,cpSetor,cFilEntr)
Local retorno := .f.

_cQuery := " SELECT"
_cQuery += "  * "
_cQuery += " FROM "+RetSqlName("SD3")+" SD3 "
_cQuery += " WHERE "
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND D3_ESTORNO != 'S'"
_cQuery += " AND D3_L_ORIG  = '"+cCod+"'"
_cQuery += " AND D3_L_SETOR = '"+cpSetor+"'"
_cQuery += " AND D3_FILIAL  = '"+cFilEntr+"'" //incluido Caique

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(_cQuery))),'TRB',.F.,.T.)

While TRB->(!Eof())
	retorno := .t.
	TRB->(dbSkip())
EndDo
TRB->(dbCloseArea())
dbCloseArea("TRB")
Return retorno


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT022   บAutor  ณMicrosiga           บ Data ณ  07/13/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Rotina responsavel por buscar total de leite de determinadoบฑฑ
ฑฑบ          ณ perido/caminhao/viagem                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static function getTotLte(dData,cCaminhao,cViagem,cFilPosto, nTD)
//ZX7_FILIAL+ZX7_CAMINH+ZX7_VIAGEM+ZX7_DATA
local nRet		  := 0
Local cTicketPort := " "
Local aArea   	  := GetArea()
Local cQuery  	  := ""
//local aAreaZX7 := ZX7->(GetArea())
//
cQuery := "SELECT ROUND(((Z19_P1 - Z19_P2)/Z19_DENS),0) AS PESO, Z19_TICKET FROM Z19010 "
cQuery += " WHERE Z19010.D_E_L_E_T_= ' ' "
IF FUNNAME()  == 'MGLT22SKD'
	cQuery += "  AND Z19_STATUS = 'A' AND  Z19_VIAGEM = '" + cViagem + "'"
ELSE
//SUBSTR porque o campo de Viagem ter Filial antes na digita็ใo 
	cQuery += "  AND Z19_STATUS = 'A' AND  SUBSTR(Z19_VIAGEM,5,14) = '" + cViagem + "'"
ENDIF

	cQuery += "  AND Z19_FILIAL = '" + cFilPosto + "'"

//Apenas ticket aberto vai pegar o volume  cuidado 

if Select("TRBTOTLTE") > 0
	dbSelectArea("TRBTOTLTE")
	dbCloseArea("TRBTOTLTE")
endif

MemoWrite("C:\temp\Z19LeiteBom.sql",cQuery)

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBTOTLTE',.F.,.T.)


If TRBTOTLTE->(!Eof())
	nRet 		:= (TRBTOTLTE->PESO)
	cTicketPort		:= (TRBTOTLTE->Z19_TICKET)		

/// Teste 0106  AINDA NรO VALIDA POR COMPLETO
ElseIF cFilPosto == '0106' .And. Empty(TRBTOTLTE->Z19_TICKET)
	// Arrumar para vแrias viagens 
	cQuery := "SELECT  SUM(ZX1_QTDBOM) AS QTDBOM FROM ZX1010"
	cQuery += " WHERE       ZX1010.d_e_l_e_t_ = ' ' "
	cQuery += "  AND ZX1_FILIAL = '" + cFilPosto + "'"
	cQuery += "  AND ZX1_STATUS NOT IN ('I', 'C') "
	cQuery += "  AND ZX1_VIAGEM = '" + cViagem + "'"

	if Select("TRBTQTDBOM") > 0
		dbSelectArea("TRBTQTDBOM")
		dbCloseArea("TRBTQTDBOM")
	endif

	MemoWrite("C:\temp\Z19QTDBom0106.sql",cQuery)

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TRBTQTDBOM',.F.,.T.)

	nRet := TRBTQTDBOM->QTDBOM

ElseIF cFilPosto == '0107'

	nRet := nTD

Else	

	nRet := 0

EndIf
/*
//Tenta localizar na ZX7 - Tabela Conferencia de Peso
dbSelectArea("ZX7")
dbSetOrder(1)
if dbSeek(xFilial("ZX7") + cCaminhao + str(nViagem,2,0) + dTos(dData))
	nRet := (ZX7->ZX7_PCHEIO - ZX7->ZX7_PVAZIO) / 1.03
else
	nRet := 0
endif
*/
//ZX7->(restArea(aAreaZX7))
return  ({nRet,cTicketPort})
