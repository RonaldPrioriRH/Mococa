#Include 'Protheus.ch'

User Function AGLT041()
//Nao usado fonte novo AGLT043
// #########################################################################################
// Projeto:
// Modulo : Gestão de Leite
// Fonte  : AGLT041
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor  Eliane     | Descricao Exportação de Rotas
// ---------+-------------------+-----------------------------------------------------------
// 12/03/13 | TOTVS Developer Studio | Gerado pelo Assistente de Código
// ---------+-------------------+-----------------------------------------------------------

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} novo
Montagem da tela de processamento

@author    TOTVS Developer Studio - Gerado pelo Assistente de Código
@version   1.xx
@since     12/03/2013
/*

Private cPerg := "AGLT041"

AjustaSX1(cPerg)

If Pergunte(cPerg,.T.)

	cArqTxt := Alltrim(mv_par03) 
	
	//--< cria o arquivo de saida >-------------------------------------------------------------
	nHdl := fCreate(cArqTxt)
	if nHdl == -1
		msgAlert("Não foi possível criar o arquivo de saída."+chr(13)+"Favor verificar parâmetros.", "Atenção!")
	else
		Processa({|| GeraTxt(nHdl) }, "Aguarde. Gerando Txt...")

		MsgAlert("[AGLT041] - Exportação de Rotas - Terminou.","INFO")    

	endif
	//--< encerramento >------------------------------------------------------------------------
	fClose(nHdl)


Endif

Return

// perguntas
Static Function AjustaSX1

aHelpPor := {}
aAdd(aHelpPor, "Data inicial")
PutSx1(cPerg,"01","Data Inicial ? ","","","mv_ch1","D",8,0,0,"G","","","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,{},{})
aHelpPor := {}
aAdd(aHelpPor, "Data final")
PutSx1(cPerg,"02","Data Final ? ","","","mv_ch2","D",8,0,0,"G","","","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,{},{})
aHelpPor := {}
aAdd(aHelpPor, "Caminho e nome do arquivo")
PutSx1(cPerg,"03","Gerar Arquivo ? ","","","mv_ch3","C",50,0,0,"G","","","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,{},{})

Return

// funcao para gerar arquivo TXT
Static Function GeraTXT

Local cQry := ""
local cLin, cCpo
local cEOL := chr(13) + chr(10)

cQry := " SELECT A2_L_CDPRD, A2_L_CDPRP, AVG(ZLD_QTDBOM+ZLD_QTDACI) AS MEDIA "
cQry += " FROM "+RetSQLTab("ZLD")
cQry += " INNER JOIN "+RetSQLTab("SA2")
cQry += " 	ON ( A2_FILIAL = '"+xFilial("SA2")+"' AND A2_COD = ZLD_RETIRO AND A2_LOJA = ZLD_RETILJ ) "
cQry += " WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' "
cQry += " AND ZLD_DTCOLE BETWEEN '"+dtos(mv_par01)+"' AND '"+dtos(mv_par02)+"'  "
cQry += " AND SA2.A2_L_TPFOR == 'C' "
cQry += " AND ZLD.D_E_L_E_T_ = ' ' "
cQry += " AND SA2.D_E_L_E_T_ = ' ' "

cQry += " GROUP BY A2_L_CDPRD, A2_L_CDPRP "

// Verifica area aberta
If Select("QRY") <> 0
	QRY->(DBCLOSEAREA())
EndIF
// Executa o SQL
cQry := ChangeQuery(cQry)
dbUseArea( .T., "TOPCONN", TCGENQRY(,,cQry),"QRY", .F., .T.)

QRY->(DBGOTOP())
ProcRegua(QRY->(RecCount()))

While !QRY->(eof())
	// posiciona na SA2
	SA2->(DbOrderNickName("PRODUTOR"))
	SA2->(dbSeek(xFilial("SA2")+QRY->A2_L_CDPRD+QRY->A2_L_CDPRP))
	
	
	cLin := Alltrim(QRY->A2_L_CDPRD)+";"
	cLin += Alltrim(QRY->A2_L_CDPRP)+";"
	cLin += Alltrim(STR(Round(QRY->MEDIA,0)))+"-"
	cLin += Alltrim(STR(Posicione("ZLS",1,xFilial("ZLS")+SA2->A2_L_TANQ,"ZLS_CAPACI")))+";"
	cLin += Alltrim(SA2->A2_L_DIAPI)+";"
	cLin += Alltrim(SA2->A2_NOME)+";"
	cLin += Alltrim(SA2->A2_L_SIGSI)

	cLin := cLin + cEOL

	IF fWrite(nHdl, cLin, len(cLin)) != len(cLin)
		IF !msgAlert("Ocorreu um erro na gravacao do arquivo. Continua?","Atenção!")
			Exit
		EndIF
	EndIF

	QRY->(dbSkip())
Enddo    
*/

Return

