/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MGLT008  º Autor ³ TOTVS                 º Data da Criacao  ³ 03/11/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Gera cadastros iniciais de Grupo de Eventos, Eventos e Setores                                               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Implantacao da Gestao do Leite 						                                                        º±±
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
±±º          ³00/00/0000³                               				   ³00-000000 -                       ³ TI	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß

OBS: ESTA ROTINA DEVE SER PERSONALIZADA PARA CADA CLIENTE. 
OS REGISTROS ABAIXO SAO APENAS EXEMPLOS CRIADOS PELA TOTVS TRIANGULO MINEIRO E ALTO PARANAIBA 


/*/
User Function MGLT008
Static bEvent := .f.
	if MsgYesNo("Gravar Grupos e Eventos?")
		Processa({|| gravaGrp() })      
		bEvent := .t.
	endif
	if MsgYesNo("Gravar Setores?")
		Processa({|| gravaSet() })      
	endif
return

Static Function gravaGrp()
Local aDados:={}

aAdd(aDados,{'  ','000001','Leite Base','Leite Base','C'})
aAdd(aDados,{'  ','000002','Bonificacoes','Bonif.','C'})
aAdd(aDados,{'  ','000003','Frete','Frete','D'})
aAdd(aDados,{'  ','000004','Convenio','Convenio','D'})
aAdd(aDados,{'  ','000005','Emprestimos','Emprest.','D'})

for i:=1 to len(aDados)
	dbselectarea("ZL7")
	dbsetorder(1)	
	wProcura := dbseek(aDados[i,1]+aDados[i,2])
	RECLOCK("ZL7",if(wProcura,.f.,.t.))
	ZL7->ZL7_FILIAL := aDados[i,1]
	ZL7->ZL7_COD 	:= aDados[i,2]
	ZL7->ZL7_DESCRI := aDados[i,3]
	ZL7->ZL7_NREDUZ	:= aDados[i,4]
	ZL7->ZL7_DEBCRE	:= aDados[i,5]
	MSUNLOCK()
next i

return

Static Function gravaEve(cpFilial,cpEst)
Local aDados:={}

// FILIAL,CODIGO,DESCRICAO,TIPO_DO_EVENTO,IMP_NF,CALC_BASE_INSS,SB1_COD,PREFIXO,MIX,NREDUZ,GRUPO,DEB/CRED
if cpEst == "G" .or. cpEst == "S" // filial 1 ou filial 2 
	aAdd(aDados,{cpFilial,'000001','LEITE COTA','L','S','S','','','S','LEITE COTA','000001','C'})
	aAdd(aDados,{cpFilial,'000002','ADICIONAL DE TANQUE','L','S','S','','','S','ADIC.TANQUE','000001','C'})
	aAdd(aDados,{cpFilial,'000003','ADICIONAL DE LATAO','L','S','S','','','S','ADIC.LATAO','000001','C'})
	aAdd(aDados,{cpFilial,'000004','BONIFIFACAO DE LEITE','L','S','S','','','S','ADIC.LATAO','000002','C'})
	aAdd(aDados,{cpFilial,'000005','FRETE POR KM','L','S','N','','','S','FRETE KM','000003','D'})
	aAdd(aDados,{cpFilial,'000006','FRETE POR LITROS','L','S','N','','','S','FRETE LTS','000003','D'})
	aAdd(aDados,{cpFilial,'000007','FRETE POR VIAGEM','L','S','N','','','S','FRETE VIAGEM','000003','D'})
endif

if cpEst == "R" //filial 3
	aAdd(aDados,{cpFilial,'000001','LEITE QUENTE','L','S','S','','','S','LEITE QUENTE','000001','C'})
	aAdd(aDados,{cpFilial,'000002','LEITE GELADO','L','S','S','','','S','LEITE GELADO','000001','C'})
	aAdd(aDados,{cpFilial,'000003','BONIFIFACAO DE LEITE','L','S','S','','','S','ADIC.LATAO','000002','C'})
	aAdd(aDados,{cpFilial,'000005','FRETE POR KM','L','S','N','','','S','FRETE KM','000003','D'})
	aAdd(aDados,{cpFilial,'000006','FRETE POR LITROS','L','S','N','','','S','FRETE LTS','000003','D'})
	aAdd(aDados,{cpFilial,'000007','FRETE POR VIAGEM','L','S','N','','','S','FRETE VIAGEM','000003','D'})
endif

for x:=1 to len(aDados)
	dbselectarea("ZL8")
	dbsetorder(1)	
	wProcura := dbseek(aDados[x,1]+aDados[x,2])
	RECLOCK("ZL8",if(wProcura,.f.,.t.))
	ZL8->ZL8_FILIAL := aDados[x,1]
	ZL8->ZL8_COD 	:= aDados[x,2]
	ZL8->ZL8_DESCRI := aDados[x,3]
	ZL8->ZL8_TPEVEN	:= aDados[x,4]
	ZL8->ZL8_IMPNF	:= aDados[x,5]
	ZL8->ZL8_BASINS	:= aDados[x,6]
	ZL8->ZL8_SB1COD	:= aDados[x,7]
	ZL8->ZL8_PREFIX	:= aDados[x,8]
	ZL8->ZL8_MIX	:= aDados[x,9]
	ZL8->ZL8_NREDUZ	:= aDados[x,10]
	ZL8->ZL8_GRUPO	:= aDados[x,11]
	ZL8->ZL8_DEBCRE	:= aDados[x,12]
	MSUNLOCK()
next x

return


Static Function gravaSet()
Local aDados:= {}

aAdd(aDados,{'01','010001','SETOR 1','03'})
aAdd(aDados,{'01','010002','SETOR 2','G7'})
aAdd(aDados,{'01','010003','SETOR 3','G9'})
aAdd(aDados,{'01','010004','SETOR 4','G3'})
aAdd(aDados,{'01','010005','SETOR 5','G2'})


for i:=1 to len(aDados)
	dbselectarea("ZL2")
	dbsetorder(1)	
	wProcura := dbseek(aDados[i,1]+aDados[i,2])
	RECLOCK("ZL2",if(wProcura,.f.,.t.))
	ZL2->ZL2_FILIAL := aDados[i,1]
	ZL2->ZL2_COD 	:= aDados[i,2]
	ZL2->ZL2_DESCRI := aDados[i,3]
	ZL2->ZL2_LOCAL 	:= aDados[i,4]
	MSUNLOCK()
	if bevent
		gravaEve(aDados[i,1],left(aDados[i,4],1))
	endif
next i

      
return