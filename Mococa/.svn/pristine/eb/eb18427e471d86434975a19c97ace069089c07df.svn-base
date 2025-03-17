#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
#DEFINE CRLF CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT030  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 18/05/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina para gerar arquivo tipo csv para uso dos dados na planilha da Instrucao Normativa 51/2002.            บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gerar dados para serem copiados e colados na planilha da Instrucao Normativa.      						    บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ TOTVS - Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ00/00/00  ณ                                         		   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MGLT030

Private cPerg := PADR("MGLT030",10)

Processa({|| GeraTxt() },"Gerando arquivo para Instrucao Normativa 51/2002. Aguarde...")

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GeraTxt  บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GeraTxt()

Local aArea	:= GetArea()
Local cLin	:= ""
Local cArq  := ""
Local cQuery:= ""
Local nReg  := 0
Local dDtIni:= CTOD("")
Local dDtFim:= CTOD("")

Local _cTpFor	:= ""//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

ValidPerg()
If !Pergunte(cPerg,.T.)
	Return
EndIf

If Empty(MV_PAR01)
	MsgAlert("Informe o diretorio e nome do arquivo.")
	Return
Else
	cArq := MV_PAR01
	If At('.',cArq) == 0
		cArq := ALLTRIM(cArq)+'.CSV'
	EndIf
EndIf

If Empty(MV_PAR02)
	MsgAlert("Informe a filial para geracao do arquivo.")
	Return
EndIf	

If (nHandle := FCreate(cArq))== -1
	MsgAlert("Erro na criacao do arquivo! " + cArq)
	Return
EndIf

dbSelectArea("ZLE")
dbSetOrder(1)
dbSeek(xFILIAL("ZLE")+MV_PAR03)
dDtIni := ZLE->ZLE_DTINI
dDtFim := ZLE->ZLE_DTFIM

//Grava Cabecalho do arquivo
cLin := "Nome;Media;"  + CRLF
FWrite(nHandle,cLin,Len(cLin))

cQuery := "SELECT A2_COD,A2_LOJA,A2_NOME,ZL3_FILENT,A2_L_LI_RO FROM "
cQuery += RetSqlName("SA2") + " SA2 JOIN "+RetSqlName("ZL3")+" ZL3 ON SA2.A2_L_LI_RO = ZL3.ZL3_COD"
cQuery += " WHERE ZL3.D_E_L_E_T_ = ' '"
cQuery += " AND SA2.D_E_L_E_T_ = ' '"
cQuery += " AND ZL3.ZL3_FILIAL = '"+xFILIAL("ZL3")+"'"
cQuery += " AND SA2.A2_FILIAL = '"+xFILIAL("SA2")+"'"
 cQuery += " AND A2_L_TPFOR IN ('P','G')" //#LETRAS
//cQuery += " AND A2_C_TPFOR IN " + U_ajusSQL(_cTpFor) + " "//#LETRAS
cQuery += " AND SA2.A2_COD BETWEEN '" + MV_PAR04 + "' AND '" + MV_PAR05 + "' "
cQuery += " AND SA2.A2_LOJA BETWEEN '" + MV_PAR06 + "' AND '" + MV_PAR07 + "' "
cQuery += " AND SA2.A2_L_LI_RO BETWEEN '" + MV_PAR08 + "' AND '" + MV_PAR09 + "' "
If MV_PAR10 == 1 //Bloqueados
	cQuery += " AND SA2.A2_MSBLQL = '1' "
ElseIf MV_PAR10 == 2//Nao Bloqueados
	cQuery += " AND SA2.A2_MSBLQL <> '1' "
EndIf
cQuery += " ORDER BY A2_FILIAL,A2_NOME"

If Select("TMP1") <> 0
	TMP1->(dbCloseArea("TMP1"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMP1", .T., .F. )
Count To nReg

dbSelectArea("TMP1")
ProcRegua(nReg)

dbSelectArea("TMP1")
dbGoTop()

While TMP1->(!Eof())
	
	//Posiciona no cadastro de Rota/Linha
	If !Empty(TMP1->A2_L_LI_RO)
		//Se a filial do parametro eh igual a filial da linha, adiciona no CSV
		If (MV_PAR02 == TMP1->ZL3_FILENT)
			cLin := ALLTRIM(TMP1->A2_NOME) + ";" + ALLTRIM(STR(U_MediaDia(TMP1->A2_COD,TMP1->A2_LOJA,dDtIni,dDtFim))) + ";"
			cLin += CRLF
			FWrite(nHandle,cLin,Len(cLin))
		EndIf
	Else
		MsgAlert("Produtor "+ALLTRIM(TMP1->A2_COD+"/"+TMP1->A2_LOJA+"-"+TMP1->A2_NOME)+" nao tem Rota/Linha informada no cadastro.")
	EndIf
	
	IncProc("Produtor: "+ALLTRIM(TMP1->A2_NOME))
	TMP1->(dbSkip())
EndDo


FClose(nHandle)
MsgInfo("Exportacao gerada com sucesso.","Concluido",{"Ok"})

RestArea(aArea)
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ GeraTxt  บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria os parametros (SX1) caso nao existam.                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg()

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

//Arquivo
aHelpPor := {}
Aadd( aHelpPor, 'Informe o nome do arquivo que sera gerado')
U_xPutSx1(cPerg,"01","Arquivo"," "," ","mv_ch1","C",60,0,0,"G","","DIR","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Filial para o SIF
aHelpPor := {}
Aadd( aHelpPor, 'Informe a filial para gerar o arquivo.    ')
Aadd( aHelpPor, 'Cada filial deve ter um arquivo diferente.')
U_xPutSx1(cPerg,"02","Filial"," "," ","mv_ch2","C",2,0,0,"G","","SM0","","","mv_par02","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera utili-')
Aadd( aHelpPor, 'zado para o Fechamento.                ')
Aadd( aHelpPor, 'ATENCAO: Escolha um MIX aberto e com   ')
Aadd( aHelpPor, 'periodo correto.                       ')
U_xPutSx1(cPerg,"03","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch3","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","mv_par03","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto. Vc pode informar')
Aadd( aHelpPor, 'de " " a ZZZZZZ, para considerar todos ')
Aadd( aHelpPor, 'ou entao do P00001 ao P00001 para      ')
Aadd( aHelpPor, 'considerar apenas este produtor.       ')
U_xPutSx1(cPerg,"04","Produtor de?","Produtor de?","Produtor de?","mv_ch4","C",6,0,0,"G",,"SA2_L9","","","mv_par04","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo do Produtor para ser  ')
Aadd( aHelpPor, 'considerado no Acerto.                 ')
U_xPutSx1(cPerg,"05","Produtor Ate?","Produtor Ate?","Produtor Ate?","mv_ch5","C",6,0,0,"G",,"SA2_L9","","","mv_par05","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg,"06","Loja de?","Loja de?","Loja de?","mv_ch6","C",2,0,0,"G",,"","","","mv_par06","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Loja do Produtor.  ')
U_xPutSx1(cPerg,"07","Loja Ate?","Loja Ate?","Loja Ate?","mv_ch7","C",2,0,0,"G",,"","","","mv_par07","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha inicial ')
U_xPutSx1(cPerg,"08","Rota/Linha de?","Rota/Linha de?","Rota/Linha de?","mv_ch8","C",6,0,0,"G",,"ZL3_01","","","mv_par08","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

aHelpPor := {}
aHelpSpa := {}
aHelpEng := {}
Aadd( aHelpPor, 'Informe o Codigo da Rota/Linha final.  ')
U_xPutSx1(cPerg,"09","Rota/Linha Ate?","Rota/Linha Ate?","Rota/Linha Ate?","mv_ch9","C",6,0,0,"G",,"ZL3_01","","","mv_par09","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

//Tipo Produtores - Ativos/Inativos/Ambos
aHelpPor := {}
Aadd( aHelpPor, 'Informe o Status dos produtores.      ')
U_xPutSx1(cPerg,"10","Produtores","Produtores","Produtores","mv_cha","C",1,0,0,"C","","","","","MV_PAR10","Bloqueados","","","","Nao Bloqueados","","","Ambos","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return