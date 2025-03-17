#include "PROTHEUS.CH"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT017  º Autor ³ TOTVS                 º Data da Criacao  ³ 13/07/2009                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Exportacao de Cadastros do Leite                                                                             º±±
±±º          ³                        									                               				        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Gestao do Leite                                                                                              º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ Gestao do Leite.                                                                        						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                                                  ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT017
Private dDataIni := dDataBase
Private dDataFim := dDataBase
Private aTabelas:={}
Private odt1,odt2
Private cSetor
Private cXFilial := xfilial("ZL0")
Private cArquivo := "c:\teste.txt"
Private nArquivo
Private aCmpSA2 := {"A2_COD","A2_LOJA","A2_NOME"}
// obtem parametros
// ????


nArquivo := fCreate(cArquivo)

aAdd(aTabelas,{"ZL0","Motorista "})
//aAdd(aTabelas,{"ZL2","Setor     "})
//aAdd(aTabelas,{"ZL3","Linha     "})
//aAdd(aTabelas,{"ZL4","Veiculo   "})

@ 00,00 To 200,350 Dialog oDlgImport Title "Periodo"
@ 10,010 say "Exportacao de Cadastros do Leite" Pixel Of oDlgImport
@ 30,010 say "Periodo Inicial" Pixel Of oDlgImport
@ 30,050 MsGet odt1 Var dDataIni Picture "99/99/99"  Pixel Of oDlgImport
@ 45,010 SAY "Periodo Final" Pixel Of oDlgImport
@ 45,050 MsGet odt2 Var dDataFim Picture "99/99/99"  Pixel Of oDlgImport
@ 60,010 SAY "Filial" Pixel Of oDlgImport
@ 60,050 MsGet oFil Var cXFilial Pixel Of oDlgImport
@ 85,005 BmpButton Type 1 Action Processa( {|| gerFiles(),close(oDlgImport) } )
@ 85,050 BmpButton Type 2 Action close(oDlgImport)
Activate Dialog oDlgImport Center   

Return

/*
	GERA ARQUIVO
*/
Static Function GerFiles()                   
Local cAlias
Local oAlias:=GetNextAlias()
Local aCampos:={}

ProcRegua(len(aTabelas)+2)

for i:=1 to len(aTabelas)

	cAlias:=aTabelas[i,1]
	incProc("Exportando "+aTabelas[i,2]+"...")

	DbSelectArea("SX3")
	DbSetOrder(1)
	DbGotop()
	DbSeek(cAlias)
	While !Eof().and.(x3_arquivo==cAlias)
		aAdd(aCampos,x3_campo)
		dbSkip()
	EndDo
	
	cQuery:=" SELECT * FROM "+RETSQLNAME(cAlias)+" "+cAlias+" "	
	cQuery+=" WHERE "+cAlias+"_FILIAL = '"+cXFilial+"' "
	DbUseArea(.t.,"TOPCONN",TCGenQry(,,alltrim(upper(cQuery))),oAlias,.f.,.t.)
	While (oAlias)->(!eof())
		cLinha:=cAlias+";"
		For y:=1 to len(aCampos)
			cLinha+=(oAlias)->&(aCampos[y])+";"
		next y
		cLinha+=char(10)+char(13)
		fWrite(nArquivo,cLinha,len(cLinha))
		(oAlias)->(dbskip())
	Enddo
	(oAlias)->(dbclosearea())
	aCampos:={}

next i


// Transportadores                   
cAlias:="SA2"
cQuery:=" SELECT A2_COD,A2_LOJA FROM "+RETSQLNAME(cAlias)+" "+cAlias+" "	
cQuery+=" JOIN "+RETSQLNAME("ZL0")+" ZL0 "	
cQuery+=" ON ZL0_FRETIS = A2_COD AND ZL0_FRETLJ = A2_LOJA AND ZL0_FILIAL = '"+cXFilial+"' "	
cQuery+=" GROUP BY A2_COD,A2_LOJA "
cQuery+=" ORDER BY A2_COD,A2_LOJA "
DbUseArea(.t.,"TOPCONN",TCGenQry(,,alltrim(upper(cQuery))),oAlias,.f.,.t.)
While (oAlias)->(!eof())

    incProc("Gerando Transportadores ...")

	DbSelectArea("SA2")
	DbSetOrder(1)
	DbSeek(xfilial("SA2")+(oAlias)->A2_COD+(oAlias)->A2_LOJA)

	cLinha:=cAlias+";"
	For y:=1 to len(aCmpSA2)
		cLinha+=SA2->&(aCmpSA2[y])+";"
	next y
	cLinha+=char(10)+char(13)
	fWrite(nArquivo,cLinha,len(cLinha))
	(oAlias)->(dbskip())
Enddo
(oAlias)->(dbclosearea())



// Produtores
cAlias:="SA2"
cQuery:=" SELECT * FROM "+RETSQLNAME(cAlias)+" "+cAlias+" "	
cQuery+=" WHERE SUBSTRING(A2_L_LI_RO,1,2) = '"+cXFilial+"' "
DbUseArea(.t.,"TOPCONN",TCGenQry(,,alltrim(upper(cQuery))),oAlias,.f.,.t.)
While (oAlias)->(!eof())

    incProc("Gerando Produtores ...")

	cLinha:=cAlias+";"
	For y:=1 to len(aCmpSA2)
		cLinha+=(oAlias)->&(aCmpSA2[y])+";"
	next y
	cLinha+=char(10)+char(13)
	fWrite(nArquivo,cLinha,len(cLinha))

	(oAlias)->(dbskip())
Enddo
(oAlias)->(dbclosearea())

FClose(nArquivo)
                       
return

