#INCLUDE "PROTHEUS.ch"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "MSGRAPHI.ch"


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT002   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Neste arquivo contem funcoes auxiliares,gatilhos, validacoes. OBS: Seguir padrao do projeto para nomear as   บฑฑ
ฑฑบ          ณ funcoes.          												                               				บฑฑ
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

ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณchkRetir  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar retiro e loja na tela de recepcao de leite                                         บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ ZLD_RETIRO; ZLD_RETILJ; ZLL_RETIRO; ZLL_RETILJ.                                                              บฑฑ
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

User Function ChkRetir()

Local lRet  := .T.
Local aArea := GetArea()
Local cVar  := ALLTRIM(SubStr(ReadVar(),4,10))
Local cLoja := ""      

//RECEPCAO DE LEITE - ZLD
If cVar $ "ZLD_RETIRO/ZLD_RETILJ"

	//Completa com P0000 o numero digitado no GetDados
	If Type("M->ZLD_RETIRO") != "U" .AND. Len(Alltrim(M->ZLD_RETIRO)) < 6
		If Val(soNumeros(M->ZLD_RETIRO)) > 10000 .And. Val(soNumeros(M->ZLD_RETIRO)) < 15000
			M->ZLD_RETIRO := "T" + StrZero(Val(soNumeros(M->ZLD_RETIRO)),TamSX3("ZLD_RETIRO")[1]-1)
		Elseif Val(soNumeros(M->ZLD_RETIRO)) > 0
			M->ZLD_RETIRO := "P" + StrZero(Val(soNumeros(M->ZLD_RETIRO)),TamSX3("ZLD_RETIRO")[1]-1)
		EndIf
	EndIf

	//Completa com 000 o numero digitado no GetDados para loja
	If Type("M->ZLD_RETILJ") != "U"
		If Val(soNumeros(M->ZLD_RETILJ)) > 0
			M->ZLD_RETILJ := StrZero(Val(soNumeros(M->ZLD_RETILJ)),TamSX3("ZLD_RETILJ")[1])
		EndIf
	EndIf

	//Verifica se aCols existe
	If ValType("aCols") != "U"
		cRetiro := aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETIRO" })]
		cLoja 	:= aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETILJ" })]
	EndIf

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If "ZLD_RETIRO" $ cVar  //Se estiver validando ZLD_RETIRO
		If !Empty(cLoja)
			lRet := dbSeek(xFILIAL("SA2")+M->ZLD_RETIRO+cLoja)
		Else
			SA2->(dbOrderNickName("CODANT"))
			lRet := dbSeek(xFILIAL("SA2")+"1"+M->ZLD_RETIRO)
			SA2->(dbSetOrder(1))
			If !lRet 
				lRet := dbSeek(xFILIAL("SA2")+M->ZLD_RETIRO)
			EndIf
		EndIf
	ElseIf "ZLD_RETILJ" $ cVar
		lRet := dbSeek(xFILIAL("SA2")+cRetiro+M->ZLD_RETILJ)
	EndIf

	If lRet
		// SETA NOME E LOJA DO RETIRO NO aCols
		aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DCRRET" })] := SA2->A2_NOME
		aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETIRO" })] := SA2->A2_COD
		aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_RETILJ" })] := SA2->A2_LOJA  

		_aRota := U_RetLinRot(cRetiro, cLoja)  //U_RetLinRot(M->ZLD_RETIRO, cLoja)   
		If Len(_aRota) > 0
			aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_LINROT" })] := _aRota[1]
			aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] := _aRota[2]
			aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN" })] := _aRota[3]
		EndIf
		

		//If SA2->A2_L_ATIVO == "N"
		If SA2->A2_MSBLQL == "1"
			lRet:=.F.
			xMagHelpFis("Mensagem","O produtor selecionado nใo estแ ativo!","Ative o produtor no cadastro de fornecedores ou lance outro produtor!")
		EndIf

	Else
		xMagHelpFis("Mensagem","Aten็ใo, c๓digo de retiro inexistente.","Insira um codigo de retiro existente!")
	EndIf
	//CONVENIOS - ZLL
ElseIf cVar $ "ZLL_RETIRO/ZLL_RETILJ"

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If cVar == "ZLL_RETIRO"
		If Left(M->ZLL_RETIRO,1) == "T" //Val(soNumeros(M->ZLL_RETIRO)) > 10000
			M->ZLL_RETIRO := "T" + StrZero(Val(soNumeros(M->ZLL_RETIRO)),TamSX3("ZLL_RETIRO")[1]-1)//Atualiza o codigo
		ElseIF Val(soNumeros(M->ZLL_RETIRO)) > 0
			M->ZLL_RETIRO := "P" + StrZero(Val(soNumeros(M->ZLL_RETIRO)),TamSX3("ZLL_RETIRO")[1]-1)//Atualiza o codigo
		EndIf
		dbSeek(xFILIAL("SA2")+M->ZLL_RETIRO,.T.)
		If M->ZLL_RETIRO == SA2->A2_COD
			//Completa com P0000 o numero digitado no GetDados
			GdFieldPut("ZLL_RETILJ",SA2->A2_LOJA,n)//Atualiza a Loja
			GdFieldPut("ZLL_DCRRET",SA2->A2_NOME,n)//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	Else
		If dbSeek(xFILIAL("SA2")+GdFieldGet("ZLL_RETIRO",n)+M->ZLL_RETILJ)
			GdFieldPut("ZLL_DCRRET",SA2->A2_NOME,n)//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	EndIf
	//EMPRESTIMO - ZLM
ElseIf cVar $ "ZLM_SA2COD/ZLM_SA2LJ"

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If cVar == "ZLM_SA2COD"
		If Val(soNumeros(M->ZLM_SA2COD)) > 10000
			M->ZLM_SA2COD := "T" + StrZero(Val(soNumeros(M->ZLM_SA2COD)),TamSX3("ZLM_SA2COD")[1]-1)//Atualiza o codigo
		ElseIF Val(soNumeros(M->ZLM_SA2COD)) > 0
			M->ZLM_SA2COD := "P" + StrZero(Val(soNumeros(M->ZLM_SA2COD)),TamSX3("ZLM_SA2COD")[1]-1)//Atualiza o codigo
		EndIf
		dbSeek(xFILIAL("SA2")+M->ZLM_SA2COD,.T.)
		If M->ZLM_SA2COD == SA2->A2_COD
			//Completa com P0000 o numero digitado no GetDados
			M->ZLM_SA2LJ  := SA2->A2_LOJA//Atualiza a Loja
			M->ZLM_SA2NOM := SA2->A2_NOME//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	Else
		If dbSeek(xFILIAL("SA2")+M->ZLM_SA2COD+M->ZLM_SA2LJ)
			M->ZLM_SA2NOM := SA2->A2_NOME//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	EndIf  
//MOVIMENTO PROGRAMA EDUCAMPO 
ElseIf cVar $ "ZP4_CODCOO/ZP4_LJCOO"

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If cVar == "ZP4_CODCOO"
		dbSeek(xFILIAL("SA2")+M->ZP4_CODCOO,.T.)
		If M->ZP4_CODCOO == SA2->A2_COD    
			M->ZP4_LJCOO := SA2->A2_LOJA
			M->ZP4_NOMCOO:= SA2->A2_NOME
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	Else
		If dbSeek(xFILIAL("SA2")+M->ZP4_CODCOO+M->ZP4_LJCOO)
			M->ZP4_NOMCOO:= SA2->A2_NOME//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	EndIf	
//REGISTRO DE INSEMINACOES
ElseIf cVar $ "ZP6_CODCOO/ZP6_LJCOO"

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If cVar == "ZP6_CODCOO"
		dbSeek(xFILIAL("SA2")+M->ZP6_CODCOO,.T.)
		If M->ZP6_CODCOO == SA2->A2_COD    
			M->ZP6_LJCOO := SA2->A2_LOJA
			M->ZP6_NOMCOO:= SA2->A2_NOME
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	Else
		If dbSeek(xFILIAL("SA2")+M->ZP6_CODCOO+M->ZP6_LJCOO)
			M->ZP6_NOMCOO:= SA2->A2_NOME//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	EndIf 
//VISITA TECNICA EDUCAMPO	
ElseIf cVar $ "ZP5_CODCOO/ZP5_LJCOO"

	//Valida Retiro e Loja
	dbSelectArea("SA2")
	dbSetOrder(1)

	If cVar == "ZP5_CODCOO"

		dbSeek(xFILIAL("SA2")+M->ZP5_CODCOO,.T.)
		If M->ZP5_CODCOO == SA2->A2_COD
			//Completa com P0000 o numero digitado no GetDados
			GdFieldPut("ZP5_LJCOO",SA2->A2_LOJA,n)//Atualiza a Loja
			GdFieldPut("ZP5_NOMCOO",SA2->A2_NOME,n)//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	Else
		If dbSeek(xFILIAL("SA2")+GdFieldGet("ZP5_CODCOO",n)+M->ZP5_LJCOO)
			GdFieldPut("ZP5_NOMCOO",SA2->A2_NOME,n)//Atualiza a Descricao
		Else
			lRet := .F.
			xMagHelpFis("Mensagem","Aten็ใo, c๓digo de Produtor inexistente.","Insira um codigo de retiro existente!")
		EndIf
	EndIf
EndIf

RestArea(aArea)
Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณsoNumeros บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para retornar apenas numeros                                                                    บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico - funcao auxiliar                                          						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cTexto						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ cTexto com apenas numero                                                             						บฑฑ
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
Static Function soNumeros(cTexto)

Local cRet := ""
Local i

For i := 1 to len(cTexto)
	If SubStr(cTexto,i,1) $ "1234567890"
		cRet += SubStr(cTexto,i,1)
	EndIf
Next i

Return cRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณchkZLD    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar integridade na tabela ZLD                                                          บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cCampo, cExp                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ True caso possa excluir o registro na ZLD, False caso contratio                                           	บฑฑ
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
User Function ChkZLD(cCampo,cExp)

Local lRet   := .T.
Local cQuery := ""
Local aArea  := GetArea()
Local nCont  := 0

cQuery := " SELECT COUNT(ZLD_CODREC) AS CONT "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND " + cCampo + " = '" + cExp + "' "
cQuery += " AND D_E_L_E_T_ = ' ' "

If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	nCont := TRB->CONT
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

RestArea(aArea)

If nCont > 0
	xMagHelpFis("Mensagem","Aten็ใo, existem lan็amentos de recep็ใo de leite para este registro!","Verifique cadastro de Recep็ใo de Leite.")
	//MsgAlert(+Chr(13)+,"Aten็ใo")
EndIf

Return nCont == 0

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณchkSA2    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar integridade na tabela SA2                                                          บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cCampo e cExp     			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ True caso possa excluir reg. na SA2                                                   						บฑฑ
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
User Function ChkSA2(cCampo,cExp)

Local lRet := .T.
Local cQuery := ""
Local aArea   := GetArea()
Local nCont := 0

cQuery := " SELECT COUNT(*) AS CONT "
cQuery += " FROM " + RetSqlName("SA2")
cQuery += " WHERE " + cCampo + " = '" + cExp + "' "
cQuery += " AND D_E_L_E_T_ = ' '"

If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	nCont := TRB->CONT
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

RestArea(aArea)

If nCont > 0
	xMagHelpFis("Mensagem","Existem fornecedores relacionados com este registro","Verifique os fornecedores relacionados a esse registro!")
EndIf

Return nCont == 0

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณchkZLW    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar integridade na tabela ZL3                                                          บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cCampo e cExp     			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ True caso possa excluir reg.                                                         						บฑฑ
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
User Function ChkZLW(cCampo,cExp)

Local lRet := .T.
Local cQuery := ""
Local aArea   := GetArea()
Local nCont := 0

cQuery := " SELECT COUNT(*) AS CONT "
cQuery += " FROM " + RetSqlName("ZLW")
cQuery += " WHERE " + cCampo + " = '" + cExp + "' "
cQuery += " AND D_E_L_E_T_ = ' '"

If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	nCont := TRB->CONT
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

RestArea(aArea)

If nCont > 0
	xMagHelpFis("Mensagem","Existem Rotas relacionados com este registro","Verifique as Rotas relacionados a esse registro!")
EndIf

Return nCont == 0


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณchkZL4    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para validar integridade na tabela ZL4                                                          บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cCampo e cExp     			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ True caso possa excluir reg.                                                         						บฑฑ
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
User Function ChkZL4(cCampo,cExp)

Local lRet := .T.
Local cQuery := ""
Local aArea   := GetArea()
Local nCont := 0

cQuery := " SELECT COUNT(*) AS CONT "
cQuery += " FROM " + RetSqlName("ZL4")
cQuery += " WHERE " + cCampo + " = '" + cExp + "' "
cQuery += " AND D_E_L_E_T_ = ' '"

If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof())
	nCont := TRB->CONT
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

RestArea(aArea)

If nCont > 0
	xMagHelpFis("Mensagem","Existem Veiculos relacionados com este registro","Verifique os Veiculos relacionados a esse registro!")
EndIf

Return nCont == 0


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณFiltroLR  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 25/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para filtrar consulta padrao de fornecedores usadas na tela de recepcao de leite, filtro pela   บฑฑ
ฑฑบ          ณ linha rota escolhida         									                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Consulta padrao SA2_L2                                             						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ True para registros que se enquadram no filtro                                        						บฑฑ
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
User Function FiltroLR()

Local lRet := .T.

If ValType("cLinRot") != "U"
	lRet := SA2->A2_L_LI_RO == cLinRot
EndIf

Return lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AtuSeq   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 03/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o numero sequencial.                                                                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gatilho no ZLA_SEQ.                                             						                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Alias do campo sequencia.                              						                        บฑฑ
ฑฑบ          ณ ExpN02 - Numero do Indice a ser usado na pesquisa do Alias.               						            บฑฑ
ฑฑบ          ณ ExpC03 - Chave de pesquisa do indice.                         						                        บฑฑ
ฑฑบ          ณ ExpN04 - Nro de registros a se copiar na funcao SubStr(). Ex: 20, SubStr(x,1,20) serao copiados 20 caracteresบฑฑ
ฑฑบ          ณ ExpC01 - Nome do campo Sequencial.                            						                        บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Numero sequencial caracter.                                        						                    บฑฑ
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
User Function AtuSeq(cAlias,nIndice,cSeek,nChv,cCampo)

Local aAreaTMP := (cAlias)->(GetArea())
Local aAreaSIX := SIX->(GetArea())
Local cRet     := "001"
Local cCmps    := " "

dbSelectArea("SIX")
dbSetOrder(nIndice)
dbSeek(cAlias+ALLTRIM(Str(nIndice)))
cCmps := SubStr(SIX->CHAVE,1,nChv) // Retira o campo ZLA_SEQ da chave do indice - ZLA_FILIAL+ZLA_SETOR+ZLA_COD+ZLA_SEQ

dbSelectArea(cAlias)
dbSetOrder(nIndice)
dbSeek(cSeek)

If !Found()
	cRet := "001"
Else
	While (cAlias)->(!Eof()) .And. ALLTRIM(cSeek) == ALLTRIM((cAlias)->(&cCmps))
		(cAlias)->(dbSkip())
	EndDo
	(cAlias)->(dbSkip(-1))
	cRet := SOMA1(ALLTRIM(&cCampo))
EndIf

RestArea(aAreaSIX)
RestArea(aAreaTMP)

Return cRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ DescriBoxบ Autor ณ TOTVS                 บ Data da Criacao  ณ 13/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna a descricao do campo ComboBox.                                                                       บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑบ          ณ Ex: 1) X3_CBOX = S=Sim;N=Nao;T=Talvez					                               						บฑฑ
ฑฑบ          ณ     2) SA1->A1_TESTE = "T"					                               						            บฑฑ
ฑฑบ          ณ     3) U_DescriBox("A1_TESTE",SA1->A1_TESTE)				                               						บฑฑ
ฑฑบ          ณ     4) Retorno da funcao: "Talvez"						                               						บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MGLT005()                                                       						                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Nome do campo ComboBox entre aspas.                                           						บฑฑ
ฑฑบ          ณ ExpC02 - Conteudo do campo ComboBox.                          						                        บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC03 - Descricao do campo ComboBox.                                       						            บฑฑ
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
User Function DescriBox(cCmp,cConteudo)

Local aArea     := GetArea()
Local aSx3Box   := RetSx3Box( Posicione("SX3", 2, cCmp, "X3CBox()" ),,, 1 )
Local cDescList := ALLTRIM( aSx3Box[ASCAN( aSx3Box, { |aBox| aBox[2] = cConteudo } )][3] )

RestArea(aArea)

Return(cDescList)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AddMes   บ Autor ณ TOTVS               บ Data da Criacao  ณ 13/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Recebe uma data e retorna a mesma adiciona de N meses.                                                       บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑบ          ณ Ex: ADDMes(CTOD("31/12/08",2) retorna 28/02/09.                                      						บฑฑ
ฑฑบ          ณ Ex: ADDMes(CTOD("15/06/08",1) retorna 15/07/08.                             						            บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ GENERICO.                                                       						                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpD01 - Data a ser somada.                                                          						บฑฑ
ฑฑบ          ณ ExpN02 - Quantidade de meses a somar na data.                   						                        บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpD01 - Data acrescentada de N meses.                              						                    บฑฑ
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
User Function ADDMes(dData,nMeses)

Local dDataAux := dDataBase
Local aArea    := GetArea()

dDataBase := dData
aE4       := {,str(nMeses+1)+',0,'+Str(Day(dData)), "3"," "," "," "}
//aParc     := AvalCond( 1000, , , , "0",,aE4,"0",aE4,,{0,Day(dData)} )
aParc     := AvalCond( 1000, , , , 0,,aE4,"0",aE4,,{0,Day(dData)} )
dDataBase := dDataAux

RestArea(aArea)
Return(aParc[Len(aParc)][1])

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PutArqCsvบ Autor ณ TOTVS                 บ Data da Criacao  ณ 15/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao chamada p/ abrir uma tela onde vc pode selecionar o diretorio do arquivo a ser importado.             บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamada atraves de Consulta Padrao( F3 - SXB ) personalizada. Ex: U_CSV			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.                                                                              						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC01 - Drive + diretorio + arquivo.     						                                            บฑฑ
ฑฑบ          ณ          Ex: "c:\importacao\imp.csv"						                               						บฑฑ
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
User Function PutArqCsv(cMVPAR)

Local cDir    := ""
Local cType   := "Modelos CSV (*.CSV) |*.csv|"
Local nDir    := 0
Local cArqCsv := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Comando para selecionar um arquivo.                          ณ
//ณ Parametro: GETF_LOCALFLOPPY  - Inclui o floppy drive local.  ณ
//ณ            GETF_LOCALHARD    - Inclui o Harddisk local.      ณ
//ณ            GETF_NETWORKDRIVE - Inclui o mapeamento de rede.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cArqCsv := cGetFile(cType,"Selecione arquivo ", 0,cDir, .F.,GETF_LOCALHARD + GETF_NETWORKDRIVE)
cDir    := { { cArqCsv } }

For nDir := 1 To Len(cDir)

	cArqCsv := cDir[nDir][1]

	If Empty(cArqCsv)
		MsgAlert("Arquivo nao informado " + cArqCsv)
		Return .F.
	EndIf

Next nDir

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza o conteudo do parametro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
&cMVPAR := cArqCsv

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PutArqTxtบ Autor ณ TOTVS                 บ Data da Criacao  ณ 15/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao chamada p/ abrir uma tela onde vc pode selecionar o diretorio do arquivo a ser importado.             บฑฑ
ฑฑบ          ณ                   			   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamada atraves de Consulta Padrao( F3 - SXB ) personalizada. Ex: U_TXT			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.                                                                              						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC01 - Drive + diretorio + arquivo.     						                                            บฑฑ
ฑฑบ          ณ          Ex: "c:\importacao\imp.txt"						                               						บฑฑ
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
User Function PutArqTxt(cMVPAR)

Local cDir    := ""
Local cType   := "Modelos TXT (*.TXT) |*.txt|"
Local nDir    := 0
Local cArqTXT := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Comando para selecionar um arquivo.                          ณ
//ณ Parametro: GETF_LOCALFLOPPY  - Inclui o floppy drive local.  ณ
//ณ            GETF_LOCALHARD    - Inclui o Harddisk local.      ณ
//ณ            GETF_NETWORKDRIVE - Inclui o mapeamento de rede.  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cArqTXT := cGetFile(cType,"Selecione arquivo ", 0,cDir, .F.,GETF_LOCALHARD + GETF_NETWORKDRIVE)
cDir    := { { cArqTXT } }

For nDir := 1 To Len(cDir)

	cArqTXT := cDir[nDir][1]

	If Empty(cArqTXT)
		MsgAlert("Arquivo nao informado " + cArqTXT)
		Return .F.
	EndIf

Next nDir

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Atualiza o conteudo do parametro. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
&cMVPAR := cArqTXT

Return()

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MostraF3 บ Autor ณ TOTVS                 บ Data da Criacao  ณ 15/10/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao chamada p/ abrir uma tela onde vc pode selecionar varios registros em uma tabela.                     บฑฑ
ฑฑบ          ณ Utilizado em parametros, para substituir os campos De/Ate.    						                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamada atraves de Consulta Padrao( F3 - SXB ) personalizada. Ex: U_F301			                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Alias a ser utilizado na montagem da ListBox. Ex: "SM0"                        						บฑฑ
ฑฑบ          ณ ExpC02 - Nome do campo Codigo. Ex: "M0_CODFIL"                                        						บฑฑ
ฑฑบ          ณ ExpC03 - Nome do campo Descricao. Ex: "M0_FILIAL"                                    						บฑฑ
ฑฑบ          ณ ExpC04 - Nome da Descricao da Tela. Ex: "Consulta Filiais"                           						บฑฑ
ฑฑบ          ณ ExpC05 - Nome do Label da tela. Ex: Filiais.                                         						บฑฑ
ฑฑบ          ณ                                                                                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC01 - Codigos selecionados.     						                                                    บฑฑ
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
User Function MostraF3(cAlias,cCpoCod,cCpoDesc,cDescCad,cNomeLabel,cCpoFil)

Local cCadastro := cDescCad
Local cLabel    := cNomeLabel
Local aDados    := {}
Local cVarQ   	:= "  "
Local nOpcA     := 0
Local x         := 0
Local lMarca    := .F.
Local oOk	  	:= LoadBitmap( GetResources(), "LBOK" )
Local oNo	  	:= LoadBitmap( GetResources(), "LBNO" )
Local MvPar     := &(ALLTRIM(ReadVar())) // Carrega Nome da Variavel do Get em Questao  
Local _cLog    	:= &(Alltrim(ReadVar())) 
Local mvRet     := ALLTRIM(ReadVar())    // Iguala Nome da Variavel ao Nome variavel de Retorno
Local oF3
Local oDlg
Local oGet01
Local _cNome	:= ""
DEFAULT cCpoFil := ""

dbSelectArea(cAlias)
(cAlias)->(dbSetOrder(1))
(cAlias)->(DbGoTop())

While (cAlias)->(!Eof())
	If !Empty(&cCpoFil) //Se precisa validar a Filial
		If (cAlias)->&cCpoFil == cFilAnt //Verifica se eh a filial corrente
			aAdd(aDados,{ALLTRIM((cAlias)->&cCpoCod),ALLTRIM((cAlias)->&cCpoDesc),.F.})
		EndIf
	Else //Nao precisa validar a filial, entao pega todas
		aAdd(aDados,{ALLTRIM((cAlias)->&cCpoCod),ALLTRIM((cAlias)->&cCpoDesc),.F.})
	EndIf
	(cAlias)->(dbSkip())
EndDo


aSort(aDados,,,{|x,y| x[2] < y[2] })
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montando o list box          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE MSDIALOG oDlg TITLE cCadastro From 12,1.5 To 35.6,79.5 OF oMainWnd
@ 0.5,0.5 TO 11.2, 38.3 LABEL cLabel OF oDlg

If Len(aDados) > 0 //Verifica se o cadastro de origem jแ foi preenchido
	@ 1.0,1.0 LISTBOX oF3	VAR cVarQ Fields HEADER "",OemToAnsi("Codigo"),OemToAnsi("Descricao");
	COLSIZES 12,GetTextWidth(0,"BBBB"),GetTextWidth(0,"BBBBBBBBBBBBBB");
	SIZE 293,134.5 ON DBLCLICK (aDados:=F3Troca(oF3:nAt,aDados,oGet01,1),oF3:Refresh()) NOSCROLL
	
	oF3:SetArray(aDados)
	oF3:bLine := { || {If(aDados[oF3:nAt,3],oOk,oNo),aDados[oF3:nAt,1],aDados[oF3:nAt,2]}}
	
	DEFINE SBUTTON FROM 163,219.6 TYPE 01 ACTION (nOpca := 1,oDlg:End()) ENABLE OF oDlg
	DEFINE SBUTTON FROM 163,249.6 TYPE 02 ACTION (nOpca := 0,oDlg:End()) ENABLE OF oDlg
	DEFINE SBUTTON FROM 163,279.6 TYPE 11 ACTION (nOpca := 0,F3Troca(oF3:nAt,aDados,oGet01,2)) ENABLE OF oDlg
	
	ACTIVATE MSDIALOG oDlg CENTERED
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Se pressionado Ok retorna os dados no parametro.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If nOpcA == 1
	
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Limpa o conteudo do parametro.    ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		&MvRet := ""
	
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Atualiza o conteudo do parametro. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		For x:=1 To Len(aDados)
			If aDados[x][3]
				&MvRet += ALLTRIM(aDados[x][1]+"/")
			EndIf
		Next x
	EndIf
Else
	dbSelectArea("SX2")
	dbSetOrder(1)
	dbSeek(cAlias)
	_cNome := SX2->X2_NOME
	xMagHelpFis("Registro nใo encontrado","Nenhum registro localizado.",;
				"Antes de prosseguir preencha o cadastro da tabela "+_cNome+".")
	&MvRet := ""
EndIf      

	If Alltrim(FunName()) == "AGLT023"
		oModel 	:= FWModelActive()
		oStruZLU	:= oModel:GetModel('ID_M_FLD_ZLU')
		oStruZLU:LoadValue("ZLU_SETOR", &MvRet)
		Return .t.
	EndIf

   
	If cAlias == "CTH" .OR. cAlias == 'ZB4'
		M->A2_C_PROD := &MvRet  
		_cRet := .T.   
	Else
		//_cRet := &MvRet
	EndIf

Return _cRet

/*/
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณFuncao    ณ F3Troca  ณ Autor ณ TOTVS                 ณ Data ณ 00/00/00 ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao ณ Tela para selecao da TES.                                  ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณParametrosณ ExpN1 - Posicao do Array.                                  ณฑฑ
ฑฑณ          ณ ExpA1 - Array com todas as TES.                            ณฑฑ
ฑฑณ          ณ ExpO1 - Objeto para Refresh.                               ณฑฑ
ฑฑณ          ณ ExpN2 - Opcao:                                             ณฑฑ
ฑฑณ          ณ               1=Marca/Desmarca.                            ณฑฑ
ฑฑณ          ณ               2=Marca Todos/Desmarca Todos.                ณฑฑ
ฑฑณ          ณ                                                            ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณUso       ณ MostraF3                                                   ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
/*/
Static Function F3Troca(nIt,aArray,oGet,nOpc)

Local i      := 0
Local lMarca := If(!aArray[nIt,3],.T.,.F.)

If nOpc == 1 //Marca/Desmarca
	aArray[nIt,3] := !aArray[nIt,3]
Else //Marca Todos/Desmarca Todos
	For i:=1 To Len(aArray)
		aArray[i,3] := lMarca
	Next i
EndIf

If oGet != Nil
	oGet:Refresh()
EndIf

Return aArray

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT003   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 26/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Essa rotina importa dados de analise de leite a partir de um arquivo enviado pelo laboratorio e grava na     บฑฑ
ฑฑบ          ณ tabela de analises											                               			    	บฑฑ
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

User Function MOSTRAME(pTitulo,pErro,pSolucao)
Local aErro		:= {}
Local aSolucao	:= {}
Local nAux:=0
Local nMaxCol:=30

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Montagem da tela de processamento.                                  ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//aErro:=u_ShowMemo(pErro,40)
//aSolucao:=u_ShowMemo(pSolucao,40)

//cTexto := "Log da atualizacao "+CHR(13)+CHR(10)+cTexto
//__cFileLog := MemoWrite(Criatrab(,.F.)+".LOG",cTexto)

DEFINE FONT oFont NAME "Tahoma" SIZE 6,12   //6,15
DEFINE MSDIALOG oMostraMe TITLE pTitulo From 0,0 to 280,270 PIXEL

@ 020,010 GET oMemo VAR pErro MEMO WHEN .F. SIZE 110,50 OF oMostraMe PIXEL
oMemo:oFont:=oFont

@ 080,010 GET oMemo VAR pErro MEMO WHEN .F. SIZE 110,50 OF oMostraMe PIXEL
oMemo:oFont:=oFont

//@ 0,0 TO 280,270 DIALOG oMostraMe TITLE OemToAnsi(pTitulo)
//@ 002,010 TO 080,190

If !Empty(pErro)
	@ 010,008 Say "Mensagem:"
EndIf

If !Empty(pSolucao)
	@ 70,008 Say "Solucao:"
EndIf

@ 120,060 BMPBUTTON TYPE 01 ACTION Close(oMostraMe)
Activate Dialog oMostraMe Centered

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT003   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 26/09/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Essa rotina importa dados de analise de leite a partir de um arquivo enviado pelo laboratorio e grava na     บฑฑ
ฑฑบ          ณ tabela de analises											                               			    	บฑฑ
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
User Function showMemo(ex_string,ex_largura)
Local ex_pos := 0
Local ex_array := {}
Local ex_letra := ""
Local ex_linha := ""
Local ex_aux   := ""
Local ij

ex_string := ALLTRIM(ex_string)

For ij:=1 to len(ex_string)

	ex_letra := SubStr(ex_string,ij,1)
	ex_aux   := SubStr(ex_string,ij,1)

	ex_letra := strtran(ex_letra,char(13),"")
	ex_letra := strtran(ex_letra,char(10),"")

	ex_linha += ex_letra

	ex_pos++
	If ((ex_pos > ex_largura) .Or. (ex_aux == char(13))) .And. (ex_letra == " ")
		Aadd(ex_array,ex_linha)
		ex_linha  := ""
		ex_pos := 0
	EndIf

Next ij
Aadd(ex_array,ex_linha)

Return ex_array

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VolLeite บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna Volume do leite                                                               						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _fll = filial - dt1 = data inicial - dt2 = data final - _nsetor = codigo setor - _LR = cod linha/rota        บฑฑ
ฑฑบ          ณ _For = fornecedor - _loj = loja fornecedor - _lirt = tipo L-inha ou R-ota                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume do leite                                                                                          	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VolLeite(_fll,dt1,dt2,_nsetor,_LR,_for,_loj,_LIRT)

Local cArea := GetArea()
Local cQry2 := ""
Local _TOT  := 0

cQry2  := " SELECT SUM(ZLD_QTDBOM) TBOM, SUM(ZLD_QTDACI) TACI FROM " + RETSQLNAME("ZLD") + " ZLD "
//cQry2  += " WHERE ZLD_FILIAL = '" + _fll + "'"
cQry2 += "JOIN " + RetSqlName("SA2") + " SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ "
cQry2 += " 	AND SA2.A2_L_ASMIX <> 'N' AND SA2.D_E_L_E_T_ = ' ' " // Indica que a associacao que o produtor faz parte, nใo entra no MIX.

cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry2  += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
If !Empty(_nsetor)
	cQry2  += " AND ZLD_SETOR = '"+ _nsetor +"'"
EndIf
If !Empty(_LIRT)
	cQry2  +=  " AND ZLD_TP_RL = '" + _LIRT + "'"
EndIf
If !Empty(_LR)
//	cQry2  += " AND ZLD_LINROT = '" + _LR + "'"
	cQry2  += " AND ZLD_GRPRC = '" + _LR + "'"

EndIf
If !Empty(_for)
	cQry2 += " AND ZLD_RETIRO = '" + _For + "'"
EndIf
If !Empty(_loj)
	cQry2 += " AND ZLD_RETILJ = '" + _loj + "'"
EndIf
cQry2  += " AND ZLD.D_E_L_E_T_ = ' ' "
cQry2 += " HAVING (SUM(ZLD_QTDBOM) > 0) "
If Select("TRAB1") <> 0
	TRAB1->(dbCloseArea("TRAB1"))
EndIf
cQry2 := CHANGEQUERY(cQry2)
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB1", .F., .T.)
If !TRAB1->(Eof())
	_TOT  := TRAB1->TBOM + TRAB1->TACI
EndIf

RestArea(cArea)
Return _TOT

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ _Retiro  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona codigo do fornecedor                                                            						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Codigo do Retiro ( fornecedor )                                                                          	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function Retiro()
If Select("TEMP") <> 0
	Return TEMP->ZLD_RETIRO
Else
	Return
EndIf
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ _lRetiro บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona loja do fornecedor                                                            						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ loja do Retiro ( fornecedor )                                                                            	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function lRetiro()
If Select("TEMP") <> 0
	Return TEMP->ZLD_RETILJ
Else
	Return
EndIf
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetCodN   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o numero maximo de uma tabela                                                						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ loja do Retiro ( fornecedor )                                                                            	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getCodN(cpCampo)
Local _cRet   := StrZero(1,TamSX3(cpCampo)[1])
Local cQuery := ""
Local aArea  := GetArea()
Local cTab	:= LEFT(cpCampo,3)
Local nAux := 0


cQuery := " SELECT MAX("+cpCampo+") AS CODIGO "
cQuery += " FROM " + RetSqlName(cTab) + " "+cTab+" "
cQuery += " WHERE "+cTab+"_FILIAL = '" + xFILIAL(cTab) + "' "
cQuery += " AND D_E_L_E_T_ = ' ' "

If Select("TCO") > 0
	dbSelectArea("TCO")
	TCO->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TCO',.F.,.T.)


_cRet := IIf(TCO->CODIGO<> "NULL",Soma1(TCO->CODIGO),_cRet)
While !MayIUseCode(cpCampo + xFilial(cTab) + _cRet)  //verifica se esta na memoria, sendo usado
	_cRet := Soma1(_cRet)					           // busca o proximo numero disponivel
EndDo


TCO->(dbCloseArea())

RestArea(aArea)
Return _cRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณgetCodN   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o numero maximo de uma tabela                                                						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ loja do Retiro ( fornecedor )                                                                            	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MaxCodigo(cpCampo)
Local Ret   := StrZero(0,TamSX3(cpCampo)[1])
Local cQuery := ""
Local aArea  := GetArea()
Local cTab	:= LEFT(cpCampo,3)
Local nAux := 0

cQuery := " SELECT MAX("+cpCampo+") AS CODIGO "
cQuery += " FROM " + RetSqlName(cTab) + " "+cTab+" "
cQuery += " WHERE "+cTab+"_FILIAL = '" + xFILIAL(cTab) + "' "
cQuery += " AND D_E_L_E_T_ = ' ' "

If Select("TCO") > 0
	dbSelectArea("TCO")
	dbCloseArea("TCO")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TCO',.F.,.T.)

If TCO->(!Eof())
	ret:=TCO->CODIGO
EndIf
TCO->(dbCloseArea())

RestArea(aArea)
Return ret



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ FilSetor บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna condicao para filtrar setores que o usuario pode ter acesso                  						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ cCondicao - expressao da condicao                                                                        	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function FilSetor(cpCampo)

Local aArea     := GetArea()
Local cCondicao := " "
Local nX        := 0

//Retorna array dos setores que podem ser acessados pelo usuario
aSetor := StrToKarr(ALLTRIM(POSICIONE("ZLU",1,xFILIAL("ZLU")+PADR(cUserName,25),"ZLU_SETOR")),"/")

If Len(aSetor) == 0
	cCondicao += cpCampo+" == ''"
EndIf

For nX := 1 To Len(aSetor)

	cCondicao += cpCampo+" == '"+ALLTRIM(aSetor[nX])+"'"

	If nX != Len(aSetor)
		cCondicao += " .Or. "
	EndIf
Next nX

RestArea(aArea)
Return cCondicao


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ valSetor บ Autor ณ TOTVS                 บ Data da Criacao  ณ 12/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Valida setor digitado no campo                                                       						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ cCondicao - expressao da condicao                                                                        	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function valSetor()

Local aArea := GetArea()
Local bret := .F.
Local cpSetor:= ""
Local cTab := "ZL2"
Local cpCampo := "ZL2_COD"


// retorna array dos setores que podem ser acessados pelo usuario
cpSetor:=POSICIONE("ZLU",1,xFILIAL("ZLU")+PADR(cUserName,25),"ZLU_SETOR")

If &(ReadVar()) $ cpSetor
	cQuery := " SELECT "+cpCampo+" "
	cQuery += " FROM " + RetSqlName(cTab) + " "+cTab+" "
	cQuery += " WHERE "+cpCampo+" = '" + &(ReadVar()) + "' "
	cQuery += " AND D_E_L_E_T_ = ' ' "

	If Select("TCO") > 0
		dbSelectArea("TCO")
		dbCloseArea("TCO")
	EndIf

	dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TCO',.F.,.T.)

	If TCO->(!Eof())
		bret := .T.
	EndIf
	TCO->(dbCloseArea())
EndIf

If !bret
	xMagHelpFis("Atencao","O Setor preenchido nao ้ valido!","Verifique se o Setor existe ou se seu usuario possui permissao para esse Setor!")
EndIf

RestArea(aArea)
Return bret
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getNUser บ Autor ณ TOTVS                 บ Data da Criacao  ณ 18/11/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna nome completo do usuario a partir da matricula                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณMatricula                                                                                                     บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nome Completo do usuario                                                                                 	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function getNUser(cpMatric)
Local x

aUsers:=AllUsers()
For x:=1 to len(aUsers)
	//If SubStr(aUsers[x,1,22],3,8) == cpMatric //Matricula do usuario no RH
	If aUsers[x,1,1] == cpMatric //Codigo do usuario no configurador
		Return aUsers[x,1,4]
	EndIf
Next x

Return ""

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VLeite   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 01/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume do leite do produtor (usado nas formulas dos eventos)                  						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cpTipo (Latao ou Tanque); cpTpForn (Produtor ou Fretista); cFilLinha (S=Filtra Linha N=Nao Filtra linha)     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume do leite do produtor                                                                              	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VLeite(cpTipo,cpTpForn,cFilLinha)

Local cArea := GetArea()
Local cQry2
Local _TOT := 0
Local cpFilial := ""

Local _cPLEITE := "P" //U_GETRELA1("1","ZL1_PLEITE") //#LETRAS
Local _cGRANEL := "T/G" //U_GETRELA1("1","ZL1_GRANEL") //#LETRAS

cQry2  := " SELECT SUM(ZLD_QTDBOM) TBOM, SUM(ZLD_QTDACI) TACI FROM " + RETSQLNAME("ZLD") + " ZLD "
//cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZL8") + "'"
cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry2  += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(ZLE->ZLE_DTINI) + "' AND '" + DTOS(ZLE->ZLE_DTFIM) + "'"
cQry2  += " AND ZLD_SETOR = '"+ ZL2->ZL2_COD +"'"
//----------------------------------------------------
// Verifica se o parametro de filtrar esta preenchido
// Se sim, filtra a linha. Se nao, nao filtra
//----------------------------------------------------
If Empty(cFilLinha)
	cQry2  += " AND ZLD_LINROT = '" + ZL3->ZL3_COD + "'"
Else
	If cFilLinha == "S"
		cQry2  += " AND ZLD_LINROT = '" + ZL3->ZL3_COD + "'"
	EndIf
EndIf
//----------------------------------------------------
// Se o parametros do tipo do fornecedor nao estiver
// preenchido filtra o produtor
// Caso contrario filtra pelo PRODUTOR OU FRETISTA
//----------------------------------------------------
If Empty(cpTpForn)
	cQry2  += " AND ZLD_RETIRO = '" + SA2->A2_COD + "'"
	cQry2  += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
Else
	//If cptpForn == "PRODUTOR" .Or. cpTpForn $ "C/G/T"//#LETRAS
	If cptpForn == "PRODUTOR" .Or. cpTpForn $ _cPLEITE //#LETRAS

		cQry2  += " AND ZLD_RETIRO = '" + SA2->A2_COD + "'"

		//----------------------------------------------------
		// Se nao filtrar a linha significa que quer se obter
		// o volume total do produtor.
		// Portanto nao se deve filtrar a Loja tambem
		//----------------------------------------------------
		If Empty(cFilLinha)
			cQry2 += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
		Else
			If cFilLinha == "S"
				cQry2 += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
			EndIf
		EndIf

	EndIf
	//if cptpForn == "FRETISTA" .Or. cpTpForn == "F" //#LETRAS
	If cptpForn == "FRETISTA" .Or. cpTpForn $ _cGRANEL
		cQry2  += " AND ZLD_FRETIS = '" + SA2->A2_COD + "'"
		cQry2  += " AND ZLD_LJFRET = '" + SA2->A2_LOJA + "'"
	EndIf
EndIf
cQry2  += " AND (ZLD.D_E_L_E_T_ = ' ')"
If Select("TRAB1") <> 0
	TRAB1->(dbCloseArea("TRAB1"))
EndIf
cQry2 := CHANGEQUERY(cQry2)
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB1", .F., .T.)
If !TRAB1->(Eof())
	If Empty(cpTipo)
		_TOT  := TRAB1->TBOM + TRAB1->TACI
	Else
		cClassTq := Posicione('ZLT',1,XFILIAL('ZLT')+SA2->A2_L_TANQ,'ZLT_CLASTQ')
		If cpTipo == "TANQUE" .Or. cpTipo == "T"// tanque
			If cClassTq != "N" .And. cClassTq != "L"
				_TOT  := TRAB1->TBOM + TRAB1->TACI
			EndIf
		EndIf
		If cpTipo == "LATAO" .Or. cpTipo == "L" // latao
			If cClassTq == "N" .Or. cClassTq == "L"
				_TOT  := TRAB1->TBOM + TRAB1->TACI
			EndIf
		EndIf
	EndIf
EndIf
RestArea(cArea)
Return _TOT

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VolLteGrpบ Autor ณ TOTVS                 บ Data da Criacao  ณ 27/01/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume do leite dos produtores de determinado grupo de produtores (usado nas formulas dos eventos).   บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.                                                                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Volume do leite do grupo de produtores                                                                       บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VolLteGrp()

Local cArea    := GetArea()
Local cQry1    := ""
Local cQry2    := ""
Local _TOT     := 0
Local cpFilial := ""

cQry1  := " SELECT A2_COD, A2_LOJA FROM " + RETSQLNAME("SA2") + " SA2 "
cQry1  += " WHERE A2_FILIAL = '" + xFILIAL("SA2") + "'"
cQry1  += " AND SA2.D_E_L_E_T_ = ' '"
cQry1  += " AND A2_L_GRUPO  = '" + SA2->A2_L_GRUPO + "'"
If Select("TRAB1") <> 0
	TRAB1->(dbCloseArea("TRAB1"))
EndIf
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry1), "TRAB1", .F., .T.)

If !TRAB1->(Eof())
	While !TRAB1->(Eof())
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Faz o select na ZLD para cada produtor + loja.                                        ณ
		//ณ Nao foi feito um select so pra todos os produtores, porque a loja pode ser diferente. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		cQry2 := " SELECT SUM(ZLD_QTDBOM) TBOM, SUM(ZLD_QTDACI) TACI FROM " + RETSQLNAME("ZLD") + " ZLD "
		cQry2 += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
		cQry2 += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(ZLE->ZLE_DTINI) + "' AND '" + DTOS(ZLE->ZLE_DTFIM) + "'"
		cQry2 += " AND ZLD_SETOR  = '" + ZL2->ZL2_COD +"'"
		cQry2 += " AND ZLD_RETIRO = '" + TRAB1->A2_COD + "'"
		cQry2 += " AND ZLD_RETILJ = '" + TRAB1->A2_LOJA + "'"
		cQry2 += " AND (ZLD.D_E_L_E_T_ = ' ')"

		If Select("TRAB2") <> 0
			TRAB2->(dbCloseArea("TRAB2"))
		EndIf
		cQry2 := CHANGEQUERY(cQry2)
		dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB2", .F., .T.)

		If !TRAB2->(Eof())
			_TOT += TRAB2->TBOM + TRAB2->TACI
		EndIf
		TRAB1->(dbSkip())
	EndDo
EndIf

TRAB1->(dbCloseArea("TRAB1"))
TRAB2->(dbCloseArea("TRAB2"))

RestArea(cArea)
Return _TOT

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getKm    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorn km rodado pelo fretista em determinado periodo                                						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Fretista Loja e periodo                                                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ km rodado pelo fretista no periodo                                                                       	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getkm(cpFilial,cpSetor,cpLinha,cpFretis,cpLjFret,dt1,dt2)
Local cArea := GetArea()
Local nkm := 0

cQuery := "SELECT ZLD_TICKET,MAX(ZLD_KM) AS KM FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' '"
//cQuery += " AND ZLD_FILIAL = '"+cpFilial+"'  "
cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
cQuery += " AND ZLD_SETOR = '"+cpSetor+"'  "
cQuery += " AND ZLD_LINROT = '"+cpLinha+"'  "
If !Empty(cpFretis)
	cQuery += " AND ZLD_FRETIS = '"+cpFretis+"'  "
EndIf
If !Empty(cpLjFret)
	cQuery += " AND ZLD_LJFRET = '"+cpLjFret+"'  "
EndIf
cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
cQuery += " GROUP BY ZLD_TICKET "
/*
RETIRADO 07/01/10 - GERA ERROR.LOG
If !Empty(cpFretis)
cQuery += " ORDER BY ZLD_FRETIS"
EndIf
*/

If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )

While TRB->(!Eof())
	nKm += TRB->KM
	TRB->(dbSkip())
EndDo

RestArea(cArea)
Return nKm
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getNewVersaoบ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna ultima versao do mix incrementado                                              						บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function getNewVersao(cMix)
Local cArea := GetArea()
Local cVerI := " "
Local nVer := 0

cQuery := "SELECT MAX(ZLE_VERSAO) AS VERSAO FROM " + RetSqlName("ZLE") + " ZLE "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLE_COD = '"+cMix+"'"
If Select("TVER") <> 0
	TRB->(dbCloseArea("TVER"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(, ,cQuery), "TVER", .T., .F. )
If TVER->(!Eof())
	cVerI := TVER->VERSAO
EndIf
TVER->(dbCloseArea())

nVer := Val(cVerI)
nVer++
cVerI := ALLTRIM(str(nVer))

RestArea(cArea)
Return cVerI


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GrvZLF	   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 00/00/2000             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Grava ou altera registro na tabela ZLF.                                                						บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MGLT032 - FECHAMENTO FINANCEIRO  - BEN ALIMENTOS                 											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*
User Function GrvZLF(cCodMIX,cEvento,nValor,cSeek,_cSeq,cFunName,cLinha,;
cDebCred,nSE1VLR,nSE1SLD,dSE1VEN,cSE1HIS,nSE1JUR,nSE1ACRES,;
_cCodForn,_cLojForn,cPref,cNum,cParc,cTipo,_cLjSE2)


DbSelectArea("ZLF")
DbSetOrder(4)
If DbSeek(xFilial("ZLF")+cSeek)
	RecLock("ZLF",.F.)
	If ZLF->ZLF_SE1SLD > -(nValor)
		ZLF->ZLF_SE1SLD -= nValor
		ZLF->ZLF_SE1JUR += nSE1JUR
		ZLF->ZLF_VLRPAG += nValor 
    EndIf
	ZLF->(MsUnlock())
	
Else
	_cSeq:= U_GetSeqZLF(cCodMIX,cEvento,_cCodForn,_cLojForn)
	
	RecLock("ZLF", .T.)
	
	ZLF->ZLF_FILIAL := xFilial("ZLF")
	ZLF->ZLF_CODZLE := cCodMIX
	ZLF->ZLF_VERSAO := "1" //_cVersao
	ZLF->ZLF_SETOR  := "000001" //ZL2->ZL2_COD
	ZLF->ZLF_LINROT := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_L_LI_RO")
	ZLF->ZLF_RETIRO := _cCodForn
	ZLF->ZLF_RETILJ := _cLojForn
	ZLF->ZLF_A2COD  := _cCodForn
	ZLF->ZLF_A2LOJA := _cLojForn
	ZLF->ZLF_A2NOME := Posicione("SA2",1,xFILIAL("SA2")+_cCodForn+_cLojForn,"A2_NOME")
	ZLF->ZLF_EVENTO := cEvento
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_DESCRI")
	ZLF->ZLF_ENTMIX := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_MIX")
	ZLF->ZLF_DEBCRED:= cDebCred
	ZLF->ZLF_DTINI  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTINI")
	ZLF->ZLF_DTFIM  := Posicione("ZLE",1,xFILIAL("ZLE")+cCodMIX,"ZLE_DTFIM")
	ZLF->ZLF_ORIGEM := "F"
	ZLF->ZLF_QTDBOM := 0
	ZLF->ZLF_TOTAL  := nValor
	ZLF->ZLF_SE1VLR := nSE1VLR
	ZLF->ZLF_SE1SLD := nSE1SLD //If(!_lSaldoOk, nSE2VLR,  0)
	ZLF->ZLF_SE1JUR := nSE1JUR
	ZLF->ZLF_VLRPAG := nSE1VLR-nSE1SLD//If(_lSaldoOk, nSE2VLR,  nSE2VLR-nSE2SLD)
	ZLF->ZLF_VLRLTR := 0
	ZLF->ZLF_ACERTO := "S"
	ZLF->ZLF_TP_MIX := "L"
	ZLF->ZLF_TIPO   := "L"
	ZLF->ZLF_STATUS := "F"
	ZLF->ZLF_SEQ	:= _cSeq
	ZLF->ZLF_DCRSET := "BEN ALIMENTOS - RIALMA"
	ZLF->ZLF_DCREVE := Posicione("ZL8",1,xFILIAL("ZL8")+cEvento,"ZL8_NREDUZ")
	ZLF->ZLF_TRIBUT := "I" //_cTpTrib 		
	ZLF->ZLF_L_SEEK := cSeek//xFilial("ZLF") + cCodMIX + _cVersao + _cCodForn + _cLojForn + cEvento + "NDF" +
	ZLF->ZLF_SE1PRE := cPref
	ZLF->ZLF_SE1NUM  := cNum
	ZLF->ZLF_SE1PAR := cParc
	ZLF->ZLF_SE1HIS := cSE1HIS
	ZLF->ZLF_SE1VEN := STOD(dSE1VEN)
	
	ZLF->(MsUnLock())
	
EndIf

Return
*/
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getSeqZLF   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna ultimo numero da sequencia da ZLF                                              						บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getSeqZLF(cMix,cEvento,cProd,cLj)
Local cArea := GetArea()
Local cSeq := ""
Local nSeq := 0

cQuery := "SELECT MAX(ZLF_SEQ) AS SEQ FROM " + RetSqlName("ZLF") + " ZLF "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLF_CODZLE = '"+cMix+"'"
cQuery += " AND ZLF_RETIRO = '"+cProd+"'"
cQuery += " AND ZLF_RETILJ = '"+cLj+"'"
If Select("TSEQ") <> 0
	TRB->(dbCloseArea("TSEQ"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TSEQ", .T., .F. )
If TSEQ->(!Eof())
	cSeq := TSEQ->SEQ
EndIf
TSEQ->(dbCloseArea())

nSeq := Val(cSeq)
nSeq++
cSeq := StrZero(nSeq,3)

RestArea(cArea)
Return cSeq



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetDiFrt    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 01/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna quantidade de dias trabalhadas pelo fretista                                   						บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Fretista,Loja,Periodo                                                                						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getDiaFrt(cpFilial,cpSetor,cpLinha,cpFretis,cpLjFret,dt1,dt2)
Local cArea := GetArea()
Local nDias := 0

cQuery := "SELECT ZLD_DTCOLE FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' '"
//cQuery += " AND ZLD_FILIAL = '"+cpFilial+"'  "
cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
cQuery += " AND ZLD_SETOR = '"+cpSetor+"'  "
cQuery += " AND ZLD_LINROT = '"+cpLinha+"'  "
cQuery += " AND ZLD_FRETIS = '"+cpFretis+"'  "
cQuery += " AND ZLD_LJFRET = '"+cpLjFret+"'  "
cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
//RETIRADO 07/01/10 - GERA ERROR.LOG
//cQuery += " GROUP BY ZLD_DTCOLE ORDER BY ZLD_FRETIS"
cQuery += " GROUP BY ZLD_DTCOLE"
If Select("TRB") <> 0
	TRB->(dbCloseArea("TRB"))
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )
While TRB->(!Eof())
	nDias++
	TRB->(dbSkip())
EndDo

RestArea(cArea)
Return nDias

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AjustSet    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Separa os setores por aspas simples e virgula para serem usados no comando IN() do SELECT.					บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Evento de calculo do INSS.                                        											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Codigo dos setores separados por "/".                                          						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC01 - Codigo dos setores, separados por virgula( , ) e aspas simples( ' ).                             	บฑฑ
ฑฑบ          ณ 	 		Exemplo:			                                                                                บฑฑ
ฑฑบ          ณ                  Recebe: 010001/020001/020003/070005                                                         บฑฑ
ฑฑบ          ณ                  Retorna: '010001','020001','020003','070005'                                                บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AjustSet(_cSetores)

Local _cAux   := ""
Local _nPsIni := 1
Local _nPsFim := 1
Local _cLinha := _cSetores
Local _cLin   := _cSetores

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณLe a linha ate encontrar um "/" quando encontrar adiciona na variavel _cAux. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
While _nPsFim > 0
	_cLinha  := SubStr(_cLinha,_nPsIni,Len(_cLinha))
	_nPsFim  := At("/",_cLinha)
	_cString := SubStr(_cLinha,1,_nPsFim-1)
	_nPsIni  := _nPsFim+1
	If !Empty(_cString)
		_cAux    += +"'"+_cString+"',"
	EndIf
EndDo

If !Empty(_cAux) .And. SubStr(_cAux,Len(_cAux),1) == ","
	_cAux := SubStr(_cAux,1,Len(_cAux)-1)
EndIf

Return(_cAux)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VldSetor    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Identifica se o usuario tem acesso a todos os setores escolhidos.                         					บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Rotina de Acerto do Leite, Frete, cancelamento Leite e Frete.   											    บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Codigo dos setores separados por "/".                                          						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpC01 - Codigo dos setores, que o usuario nao tem permissao para acessar.                                	บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VldSetor(_cSetores)
Local _cAux   := ""
Local _nPsIni := 1
Local _nPsFim := 1
Local _cLinha := _cSetores
Local _cLin   := _cSetores
Local aTemp1  := {}
Local a

aTemp1 := strtokarr(_cSetores,"/") // retorna array dos setores

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica quais setores o usuario tem permissao para utilizar. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("ZLU")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLU")+PADR(cUserName,25))

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณObtem setores que nao podem ser acessados pelo usuario                       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	For a:=1 to len(aTemp1)
		If !aTemp1[a] $ ZLU->ZLU_SETOR
			_cAux += " "+aTemp1[a]+"-"+ALLTRIM(POSICIONE("ZL2",1,xFILIAL("ZL2")+aTemp1[a],"ZL2_DESCRI"))
		EndIf
	Next a

Else
	xMagHelpFis("USUARIO LEITE",;
	"Usuario nใo encontrado no cadastro de Acessos GLT.",;
	"Acesse o m๓dulo Configurador e cadastre o usuแrio na rotina Acessos GLT.")
EndIf

Return(_cAux)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetCredPr   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 05/12/2008             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor total de creditos que o produtor possui na ZLF.                        						บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico.                                                         											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Codigo do MIX.                                                              						บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Produtor.                                                                                 บฑฑ
ฑฑบ          ณ ExpC03 - Loja do Produtor.                                                                                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpN01 - Valor total de Creditos da ZLF.                                                 	                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GetCredPr(cMix,cProdutor,cLoja,cSetor,cLinha,cpVersao,lEvt)

Local nValor := 0
Local cQry   := ""
Local cAlias := "GLT555"
Local _cFunrural := Rtrim(GetMv("LT_EVEINSS"))

Local _cPLEITE := "P" //U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

DEFAULT lEvt     := .F.
DEFAULT cpVersao := " "

//Se Evento Adicional Mercado, entao retorna a ZLF em valor por litro, caso contrario retorna em valor total
If lEvt
	cQry := "SELECT ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR,"
	//Alterado devido ao evento de repasse
	/*
	cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'C'"
	cQry += "        THEN ZLF_VLRLTR"
	cQry += "        Else 0"
	cQry += "     END) AS CREDITO,"
	cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'D'"
	cQry += "        THEN ZLF_VLRLTR"
	cQry += "        Else 0"
	cQry += "     END) AS DEBITO"
	*/
	cQry += " SUM(ZLF_TOTAL) AS CREDITO"
	cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8"
	cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQry += " AND ZL8.D_E_L_E_T_ = ' '"
	cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
	cQry += " AND ZL8.ZL8_FILIAL = '" +xFILIAL("ZL8")+ "'"
	cQry += " AND ZL8.ZL8_BASADI = 'S' " //Se considera o evento na base do calculo do Adicional de Mercado
Else
	cQry := "SELECT ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR,"
	//Alterado devido ao evento de repasse
	/*
	cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'C'"
	cQry += "  SUM(CASE WHEN ZL8_DEBCRE IN('C','A')"
	cQry += "        THEN ZLF_TOTAL"
	cQry += "        Else 0"
	cQry += "     END) AS CREDITO,"
	cQry += " SUM(CASE WHEN ZL8_DEBCRE = 'D'"
	cQry += "        THEN ZLF_TOTAL"
	cQry += "        Else 0"
	cQry += "     END) AS DEBITO"
	*/
	cQry += " SUM(ZLF_TOTAL) AS CREDITO"
	cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8  "//+RetSqlName("SA2")+" SA2"
//	cQry += " INNER JOIN "+RetSqlName("SA2")+" SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA AND SA2.D_E_L_E_T_ = ' '"  //#LETRAS
	cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQry += " AND ZL8.D_E_L_E_T_ = ' '"
	cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
	cQry += " AND ZL8.ZL8_FILIAL = '" +xFILIAL("ZL8")+ "'"
EndIf

If !Empty(cSetor) //Se o setor estiver vazio considera todos.
	cQry += " AND ZLF.ZLF_SETOR = '"+cSetor+"'"
EndIf
cQry += " AND ZLF.ZLF_RETIRO = '" + cProdutor +"'"
cQry += " AND ZLF.ZLF_RETILJ = '" + cLoja     +"'"
cQry += " AND ZLF.ZLF_CODZLE = '" + cMix      +"'"
//RETIRADO A LINHA POIS O MESMO PRODUTOR PODE TER LEITE ENTREGUE EM LINHAS DIFERENTES.
/*
If !Empty(cLinha)
	cQry += " AND ZLF.ZLF_LINROT = '" + cLinha      +"'"
EndIf
*/
If !Empty(cpVersao)
	cQry += " AND ZLF.ZLF_VERSAO = '" + cpVersao      +"'"
EndIf
cQry += " AND SUBSTR(ZLF.ZLF_RETIRO,1,1) IN ('P','T')" //#LETRAS
//cQry += " AND SA2.A2_L_TPFOR IN " + U_ajusSQL(_cPLEITE) + " " //#LETRAS

//Alterado devido ao evento de repasse que eh gerado pela rotina de fechamento
//cQry += " AND ZLF.ZLF_ORIGEM <> 'F'"
cQry += " AND ZLF_DEBCRE = 'C'"
cQry += " AND ZLF.ZLF_ACERTO <> 'S'"
cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
cQry += " AND ZL8.ZL8_COD NOT IN ('" + _cFunrural + "')" //Nใo considera evento INSS pois o cแlculo do Funrual ้ padrใo
//cQry += " AND ZL8.ZL8_BASINS = 'S' "
//cQry += " AND (ZL8.ZL8_SB1COD <> ' ' )"
cQry += " GROUP BY ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR,ZLF_LINROT"
cQry += " ORDER BY ZLF_SETOR,ZLF_LINROT,ZLF_RETIRO,ZLF_RETILJ"
cQry := changequery(cQry)
TCQUERY cQry NEW ALIAS (cAlias)
dbSelectArea(cAlias)

If (cAlias)->(!Eof()) .And. (cAlias)->CREDITO > 0
	nValor := (cAlias)->CREDITO
EndIf

//Se Evento Adicional Mercado, entao retorna a ZLF em valor por litro, caso contrario retorna em valor total
If lEvt
	nValor := nValor / U_VLEITE("","","N")
EndIf

dbSelectArea(cAlias)
dbCloseArea(cAlias)

Return(nValor)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VlrIncentบ Autor ณ TOTVS              	บ Data da Criacao  ณ 06/12/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao criada para encontrar o valor do Incentivo.                                                 			บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Foi criada porque a formula p\ encontrar o valor do incentivo eh muito grande e nao cabe no campo ZL8_FORMUL.บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑบ          ณ Esta funcao eh usada no evento de incentivo no campo ZL8_FORMUL e tambem na rotina de MIX AGLT020.           บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Codigo do Mix.                                                                 						บฑฑ
ฑฑบ          ณ Expc02 - Codigo do Fornecedor.                						                                        บฑฑ
ฑฑบ          ณ Expc03 - Loja do Fornecedor.                  						                                        บฑฑ
ฑฑบ          ณ Expc04 - Codigo do Setor.                     						                                        บฑฑ
ฑฑบ          ณ Expc05 - Codigo da Linha.                     						                                        บฑฑ
ฑฑบ          ณ Expc06 - Codigo da Versao.                    						                                        บฑฑ
ฑฑบ          ณ Expc07 - Base de calculo do Incentivo, quando passada nao precisa calcula-la.                                บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                 	                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Logistica                                                                               						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function VlrIncent(cCodMix,cFornece,cLoja,cSetor,cLinha,cVersao,nBase)

Local aArea  := GetArea()
Local nRedut := U_GetRedut(cCodMix,cFornece,cLoja,cSetor,cLinha,cVersao)
Local nValor := 0
Local nFaixa := 0

DEFAULT cVersao := " "
DEFAULT nBase   := 0

dbSelectArea("SA2")
dbSetOrder(1)
dbSeek(xFILIAL("SA2")+cFornece+cLoja)

If nBase > 0
	nValor := nBase - nRedut
Else
	nValor := U_GETCREDPR(cCodMix,cFornece,cLoja,cSetor,cLinha,,.F.) - nRedut
EndIf

If nValor > 0
	//Verifica se o produtor eh optante pelo ICMS
	If SA2->A2_L_ICMS=="S"
		//Busca o percentual do cadastro de faixa
		nFaixa := U_GETFAIXA(XFILIAL("ZL9"),"000001","000006",U_VLEITE("","","N"))
	Else
		nFaixa := U_GETFAIXA(XFILIAL("ZL9"),"000001","000007",U_VLEITE("","","N"))
	EndIf
	//Calcula o valor do Incentivo, Valor dos creditos * Percentual informado na faixa
	nValor := nValor * (nFaixa/100)
EndIf

RestArea(aArea)
Return(nValor)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetRedut    บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2010             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor total dos redutores de qualidade.                       						                บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico.                                                         											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Codigo do MIX.                                                              						บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Produtor.                                                                                 บฑฑ
ฑฑบ          ณ ExpC03 - Loja do Produtor.                                                                                   บฑฑ
ฑฑบ          ณ ExpC04 - Setor.                                                                                              บฑฑ
ฑฑบ          ณ ExpC05 - Linha.                                                                                              บฑฑ
ฑฑบ          ณ ExpC06 - Versao do Mix.                                                                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpN01 - Valor total dos redutores de qualidade da ZLF.                                                 	    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GetRedut(cMix,cProdutor,cLoja,cSetor,cLinha,cpVersao,lEvt)

Local nValor := 0
Local cQry   := ""
Local cAlias := "GLT556"
Local _cFunrural := Rtrim(GetMv("LT_EVEINSS"))
Local _cPLEITE := "P" //U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

DEFAULT cpVersao := " "
DEFAULT lEvt := .F.
cQry := "SELECT ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR, SUM(ZLF_TOTAL) AS DEBITO"
cQry += " FROM "+RetSqlName("ZLF")+" ZLF, "+RetSqlName("ZL8")+" ZL8, "+RetSqlName("SA2")+" SA2 ""
cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
cQry += " AND ZL8.D_E_L_E_T_ = ' '"
cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
cQry += " AND ZL8.ZL8_FILIAL = '" +xFILIAL("ZL8")+ "'"

If !Empty(cSetor) //Se o setor estiver vazio considera todos.
	cQry += " AND ZLF.ZLF_SETOR = '"+cSetor+"'"
EndIf
cQry += " AND ZLF.ZLF_RETIRO = '" + cProdutor +"'"
cQry += " AND ZLF.ZLF_RETILJ = '" + cLoja     +"'"
cQry += " AND ZLF.ZLF_CODZLE = '" + cMix      +"'"
If !Empty(cLinha)
	cQry += " AND ZLF.ZLF_LINROT = '" + cLinha      +"'"
EndIf
If !Empty(cpVersao)
	cQry += " AND ZLF.ZLF_VERSAO = '" + cpVersao      +"'"
EndIf
cQry += " AND ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA AND SA2.D_E_L_E_T_ = ' '"  //#LETRAS
//cQry += " AND SA2.A2_L_TPFOR IN " + U_ajusSQL(_cPLEITE) + " " //#LETRAS
cQry += " AND SA2.A2_L_TPFOR = 'P' " 

cQry += " AND ZLF.ZLF_ORIGEM <> 'F'"
//cQry += " AND ZLF.ZLF_ACERTO <> 'S'"  //RETIRADO SENAO NAO CONSIDERA NO EXTRATO DEPOIS QUE FEZ O ACERTO
cQry += " AND ZLF.ZLF_TP_MIX = 'L'"
cQry += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD"
//cQry += " AND ZL8.ZL8_BASINS = 'N' "
cQry += " AND ZL8.ZL8_TPEVEN = 'R' "//REDUTOR
cQry += " AND (ZL8.ZL8_SB1COD = ' ' OR ZL8.ZL8_PREFIX = ' ')"
//If FunName() == "MGLT009" //No fechamento do leite nใo considera Funrural
	cQry += " AND ZL8.ZL8_COD NOT IN ('" + _cFunrural + "')" //Nใo considera evento INSS pois o cแlculo do Funrual ้ padrใo
//EndIf
If lEvt
	cQry += " AND ZL8.ZL8_BASADI = 'S' " //Se considera o evento na base do calculo do Adicional de Mercado
EndIf
cQry += " GROUP BY ZLF_RETIRO,ZLF_RETILJ,ZLF_SETOR,ZLF_LINROT"
cQry += " ORDER BY ZLF_SETOR,ZLF_LINROT,ZLF_RETIRO,ZLF_RETILJ"
cQry := changequery(cQry)
TCQUERY cQry NEW ALIAS (cAlias)
dbSelectArea(cAlias)

If (cAlias)->(!Eof()) .And. (cAlias)->DEBITO > 0
	nValor := (cAlias)->DEBITO
EndIf

//Se Evento Adicional Mercado, entao retorna a ZLF em valor por litro, caso contrario retorna em valor total
If lEvt
	nValor := nValor / U_VLEITE("","","N")
EndIf


dbSelectArea(cAlias)
dbCloseArea(cAlias)

Return(nValor)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VolFret  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna volume de leite do fretista                                                                          บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
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
User Function VolFret(cpFilial,cpSetor,cpLinha,cpFretis,cpLjFret,dt1,dt2,cpTp)
Local aArea := GetArea()
Local nRet:=0

// VOLUME COLETADO
If cpTp == 1
	cQuery := "SELECT SUM(ZLD_QTDBOM) AS VOLUME FROM " + RetSqlName("ZLD") + " ZLD "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	//cQuery += " AND ZLD_FILIAL = '"+cpFilial+"'  "
	cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
	cQuery += " AND ZLD_SETOR = '"+cpSetor+"'  "
	If !Empty(cpLinha)
		cQuery += " AND ZLD_LINROT = '"+cpLinha+"'  "
	EndIf
	cQuery += " AND ZLD_FRETIS = '"+cpFretis+"'  "
	cQuery += " AND ZLD_LJFRET = '"+cpLjFret+"'  "
	cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
	If Select("TMZ") <> 0
		TMZ->(dbCloseArea("TMZ"))
	EndIf
	cQuery := CHANGEQUERY(cQuery)

	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMZ", .T., .F. )
	While TMZ->(!Eof())
		nRet+=TMZ->VOLUME
		TMZ->(dbSkip())
	EndDo
	TMZ->(dbCloseArea())
EndIf

// VOLUME NO VEICULO (REAL)
If cpTp == 2

	cQuery := "SELECT MAX(ZLD_TOTBOM) AS VOLUME FROM " + RetSqlName("ZLD") + " ZLD "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	//cQuery += " AND ZLD_FILIAL = '"+cpFilial+"'  "
	cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
	cQuery += " AND ZLD_SETOR = '"+cpSetor+"'  "
	If !Empty(cpLinha)
		cQuery += " AND ZLD_LINROT = '"+cpLinha+"'  "
	EndIf
	cQuery += " AND ZLD_FRETIS = '"+cpFretis+"'  "
	cQuery += " AND ZLD_LJFRET = '"+cpLjFret+"'  "
	cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dt1) + "' AND '" + DTOS(dt2) + "'"
	cQuery += " GROUP BY ZLD_TICKET "
	If Select("TMZ") <> 0
		TMZ->(dbCloseArea("TMZ"))
	EndIf
	cQuery := CHANGEQUERY(cQuery)
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TMZ", .T., .F. )
	While TMZ->(!Eof())
		nRet+=TMZ->VOLUME
		TMZ->(dbSkip())
	EndDo
	TMZ->(dbCloseArea())
EndIf

RestArea(aArea)
Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VFrete   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica na tabela de faixas o valor de uma determina faixa                                                  บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor dentro de uma faixa de um tipo de faixa									       						บฑฑ
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
User Function VFrete()
Local nRet := 0

nRet:=u_VolFret(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL3->ZL3_COD,SA2->A2_COD,SA2->A2_LOJA,ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM,1)

Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getFaixa บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica na tabela de faixas o valor de uma determina faixa                                                  บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor dentro de uma faixa de um tipo de faixa									       						บฑฑ
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


User Function getFaixa(cpFilial,cpSetor,cpCod,cpFaixa)

//Local aArea := GetArea()
Local nRet  := 0

cQuery := "SELECT ZLA_VALOR FROM " + RetSqlName("ZLA") + " ZLA "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLA_FILIAL = '"+xFilial("ZLA")+"'  "
cQuery += " AND ZLA_SETOR = '"+cpSetor+"'  "
cQuery += " AND ZLA_COD = '"+cpCod+"'  "
cQuery += " AND ("+ALLTRIM(str(cpFaixa))+" >= ZLA_FXINI AND "+ALLTRIM(str(cpFaixa))+" <= ZLA_FXFIM ) "

If Select("GFX") <> 0
	GFX->(dbCloseArea("GFX"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFX", .T., .F. )
While GFX->(!Eof())
	nRet := GFX->ZLA_VALOR
	GFX->(dbSkip())
EndDo
GFX->(dbCloseArea())


//RestArea(aArea)

Return(nRet)




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getSFaixa บ Autor ณ TOTVS                 บ Data da Criacao  ณ 04/09/2013                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica na tabela de faixas o valor de uma determina faixa considerando regras de step,                     บฑฑ
ฑฑบ          ณ ordem de step (crescente ou decrescente) e acumulo de valores                  										บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                  		  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               												บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor dentro de uma faixa de um tipo de faixa									       						บฑฑ
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


User Function getSFaixa(cpFilial,cpSetor,cpCod,cpFaixa)

Local aArea := GetArea()
Local nRet  := 0



cQuery := "SELECT SUM(ZLA_VALOR) ZLA_VALOR FROM"
cQuery += "(                                    "
cQuery += "	SELECT SUM(VALORC) ZLA_VALOR FROM    "
cQuery += "	(                                     "
cQuery += "		SELECT convert(decimal(18,5),(ZLA1.ZLA_STEP+ZLA1.ZLA_FXFIM-ZLA1.ZLA_FXINI)/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORC"
cQuery += "			  ,convert(decimal(18,5),(ZLA1.ZLA_STEP+ABS("+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXFIM))/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORD"
cQuery += "			  ,ZLA1.ZLA_SEQ, ZLA1.ZLA_VALOR, ZLA1.ZLA_FXINI, ZLA1.ZLA_FXFIM, ZLA1.ZLA_STEP, ZLA1.ZLA_ACUMUL, ZLA1.ZLA_STEPOR"
cQuery += "		FROM  " + RetSqlName("ZLA") + "  ZLA1"
cQuery += "		WHERE ZLA1.D_E_L_E_T_ = ' '"
cQuery += "		AND ZLA1.ZLA_FILIAL = '"+xFilial("ZLA")+"'  "
cQuery += "		AND ZLA1.ZLA_SETOR = '"+cpSetor+"'"
cQuery += "		AND ZLA1.ZLA_COD = '"+cpCod+"'"
cQuery += "		AND ZLA1.ZLA_SEQ < (SELECT ZLA_SEQ FROM  " + RetSqlName("ZLA") + "  WHERE D_E_L_E_T_ = ' '  "
cQuery += "							AND ZLA_SETOR = '"+cpSetor+"' AND ZLA_COD = '"+cpCod+"'	AND "+ALLTRIM(str(cpFaixa))+" between ZLA_FXINI AND ZLA_FXFIM )"
cQuery += "		AND ZLA1.ZLA_SEQ >=(SELECT TOP 1 ZLA_SEQ FROM  " + RetSqlName("ZLA") + "  WHERE D_E_L_E_T_ = ' '  "
cQuery += "							AND ZLA_SETOR = '"+cpSetor+"' AND ZLA_COD = '"+cpCod+"'	AND ZLA_ACUMUL = 'N' ORDER BY ZLA_SEQ DESC)"
cQuery += ""
cQuery += "		union"
cQuery += ""
cQuery += "		SELECT convert(decimal(18,5),(ZLA1.ZLA_STEP+"+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXINI)/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORC "
cQuery += "			  ,convert(decimal(18,5),(ZLA1.ZLA_STEP+ABS("+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXFIM))/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORD"
cQuery += "			  ,ZLA1.ZLA_SEQ, ZLA1.ZLA_VALOR, ZLA1.ZLA_FXINI, ZLA1.ZLA_FXFIM, ZLA1.ZLA_STEP, ZLA1.ZLA_ACUMUL, ZLA1.ZLA_STEPOR"
cQuery += "		FROM  " + RetSqlName("ZLA") + "  ZLA1"
cQuery += "		WHERE ZLA1.D_E_L_E_T_ = ' '"
cQuery += "		AND ZLA1.ZLA_FILIAL = '"+xFilial("ZLA")+"'  "
cQuery += "		AND ZLA1.ZLA_SETOR = '"+cpSetor+"'"
cQuery += "		AND ZLA1.ZLA_COD = '"+cpCod+"'"
cQuery += "		AND "+ALLTRIM(str(cpFaixa))+" between ZLA1.ZLA_FXINI AND ZLA1.ZLA_FXFIM"
cQuery += "	) AS FAIXASC WHERE ZLA_STEPOR = 'C'"
cQuery += ""
cQuery += "	union"
cQuery += ""
cQuery += "	SELECT SUM(VALORD) ZLA_VALOR FROM "
cQuery += "	("
cQuery += "		SELECT convert(decimal(18,5),(ZLA1.ZLA_STEP+ZLA1.ZLA_FXFIM-ZLA1.ZLA_FXINI)/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORC"
cQuery += "			  ,convert(decimal(18,5),(ZLA1.ZLA_STEP+ABS("+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXFIM))/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORD"
cQuery += "			  ,ZLA1.ZLA_SEQ, ZLA1.ZLA_VALOR, ZLA1.ZLA_FXINI, ZLA1.ZLA_FXFIM, ZLA1.ZLA_STEP, ZLA1.ZLA_ACUMUL, ZLA1.ZLA_STEPOR"
cQuery += "		FROM  " + RetSqlName("ZLA") + "  ZLA1"
cQuery += "		WHERE ZLA1.D_E_L_E_T_ = ' '"
cQuery += "		AND ZLA1.ZLA_FILIAL = '"+xFilial("ZLA")+"'  "
cQuery += "		AND ZLA1.ZLA_SETOR = '"+cpSetor+"'"
cQuery += "		AND ZLA1.ZLA_COD = '"+cpCod+"'"
cQuery += "		AND ZLA1.ZLA_SEQ < (SELECT ZLA_SEQ FROM  " + RetSqlName("ZLA") + "  WHERE D_E_L_E_T_ = ' '  "
cQuery += "							AND ZLA_SETOR = '"+cpSetor+"' AND ZLA_COD = '"+cpCod+"'	AND "+ALLTRIM(str(cpFaixa))+" between ZLA_FXINI AND ZLA_FXFIM )"
cQuery += "		AND ZLA1.ZLA_SEQ >=(SELECT TOP 1 ZLA_SEQ FROM  " + RetSqlName("ZLA") + "  WHERE D_E_L_E_T_ = ' ' "
cQuery += "							AND ZLA_SETOR = '"+cpSetor+"' AND ZLA_COD = '"+cpCod+"'	AND ZLA_ACUMUL = 'N' ORDER BY ZLA_SEQ DESC)"
cQuery += ""
cQuery += "		union"
cQuery += ""
cQuery += "		SELECT convert(decimal(18,5),(ZLA1.ZLA_STEP+"+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXINI)/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORC "
cQuery += "			  ,convert(decimal(18,5),(ZLA1.ZLA_STEP+ABS("+ALLTRIM(str(cpFaixa))+"-ZLA1.ZLA_FXFIM))/ZLA1.ZLA_STEP*ZLA1.ZLA_VALOR) VALORD"
cQuery += "			  ,ZLA1.ZLA_SEQ, ZLA1.ZLA_VALOR, ZLA1.ZLA_FXINI, ZLA1.ZLA_FXFIM, ZLA1.ZLA_STEP, ZLA1.ZLA_ACUMUL, ZLA1.ZLA_STEPOR"
cQuery += "		FROM  " + RetSqlName("ZLA") + "  ZLA1"
cQuery += "		WHERE ZLA1.D_E_L_E_T_ = ' '"
cQuery += "		AND ZLA1.ZLA_FILIAL = '"+xFilial("ZLA")+"'  "
cQuery += "		AND ZLA1.ZLA_SETOR = '"+cpSetor+"'"                             
cQuery += "		AND ZLA1.ZLA_COD = '"+cpCod+"'"
cQuery += "		AND "+ALLTRIM(str(cpFaixa))+" between ZLA1.ZLA_FXINI AND ZLA1.ZLA_FXFIM"
cQuery += "	) AS FAIXASD WHERE ZLA_STEPOR = 'D'"
cQuery += ") AS FAIXAS"



If Select("GFX") <> 0
	GFX->(dbCloseArea("GFX"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFX", .T., .F. )
While GFX->(!Eof())
	nRet := GFX->ZLA_VALOR
	GFX->(dbSkip())
EndDo
GFX->(dbCloseArea())


RestArea(aArea)
Return(nRet)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getMIndice	บ Autor ณ TOTVS                 บ Data da Criacao  ณ 04/09/2013              					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor do indice (tipo de faixa) de qualidade do produtor, considerando media das analises 			บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Media do indice nos ultimos 2 meses, podendo considerar ou nao descartes.									บฑฑ
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
ฑฑบ          ณ          ณ                        			  			   ณ                                  ณ 			บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
	Considerar analises (em caso de 4 ou mais) dos ultimos 2 meses, descartando a maior e a menor e fazendo media das restantes
	Em caso de 3 ou menos analises, calcular media sem descarte
	Para produtores sem analise (geralmente novos cooperados), nใo tem premio
/*/



User Function getMIndice(cpFilial,cpSetor,cpProd,cpLj,cpTpFaixa,cpMedia,dpData)

Local aArea   := GetArea()
Local nRet    := 0    
Local nroAna  := 0 

Local cQuery := space(2048)




cQuery := "  	SELECT NROANA FROM ("
cQuery += "  	SELECT COUNT(ZLB_VLRANA) AS NROANA FROM " + RetSqlName("ZLB") + " ZLB " 
cQuery += " 	WHERE D_E_L_E_T_ = ' ' "
cQuery += " 	AND ZLB_FILIAL = '"+cpFilial+"'  "
cQuery += " 	AND ZLB_SETOR = '"+cpSetor+"'  "
cQuery += " 	AND ZLB_RETIRO = '"+cpProd+"'  "
cQuery += " 	AND ZLB_RETILJ = '"+cpLj+"'  "
cQuery += " 	AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
cQuery += " 	AND ZLB_DATA "
cQuery += " 		BETWEEN CONVERT(char(6),DATEADD(m, -1, '"+DTOS(dpData)+"'),112)+'01' "
cQuery += " 		AND		CONVERT(char(8),DATEADD(D, -1,CONVERT(char(6),DATEADD(m, +1, '"+DTOS(dpData)+"'),112)+'01'),112) "
cQuery += " 	) AS ANA"

If Select("GFZ") <> 0
	GFZ->(dbCloseArea("GFZ"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFZ", .T., .F. )       
	dbSelectArea("GFZ")
	nroAna := GFZ->NROANA
GFZ->(dbCloseArea())

If nroAna > 3

	cQuery := " 	SELECT AVG(ZLB_VLRANA) TOTALANA FROM ( "
	cQuery += " 	SELECT ZLB_VLRANA FROM " + RetSqlName("ZLB") + " ZLB "
	cQuery += " 	WHERE D_E_L_E_T_ = ' ' "
	cQuery += " 	AND ZLB_FILIAL = '"+cpFilial+"'  "
	cQuery += " 	AND ZLB_SETOR = '"+cpSetor+"'  "
	cQuery += " 	AND ZLB_RETIRO = '"+cpProd+"'  "
	cQuery += " 	AND ZLB_RETILJ = '"+cpLj+"'  "
	cQuery += " 	AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
	cQuery += " 	AND ZLB_DATA "
	cQuery += " 		BETWEEN CONVERT(char(6),DATEADD(m, -1, '"+DTOS(dpData)+"'),112)+'01' "
	cQuery += " 		AND		CONVERT(char(8),DATEADD(D, -1,CONVERT(char(6),DATEADD(m, +1, '"+DTOS(dpData)+"'),112)+'01'),112) "
	cQuery += " 	EXCEPT "
	cQuery += " 	SELECT MAX(ZLB_VLRANA) FROM " + RetSqlName("ZLB") + " ZLB "
	cQuery += " 	WHERE D_E_L_E_T_ = ' ' "
	cQuery += " 	AND ZLB_FILIAL = '"+cpFilial+"'  "
	cQuery += " 	AND ZLB_SETOR = '"+cpSetor+"'  "
	cQuery += " 	AND ZLB_RETIRO = '"+cpProd+"'  "
	cQuery += " 	AND ZLB_RETILJ = '"+cpLj+"'  "
	cQuery += " 	AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
	cQuery += " 	AND ZLB_DATA "
	cQuery += " 		BETWEEN CONVERT(char(6),DATEADD(m, -1, '"+DTOS(dpData)+"'),112)+'01' "
	cQuery += " 		AND		CONVERT(char(8),DATEADD(D, -1,CONVERT(char(6),DATEADD(m, +1, '"+DTOS(dpData)+"'),112)+'01'),112) "
	cQuery += " 	EXCEPT "
	cQuery += " 	SELECT MIN(ZLB_VLRANA) FROM " + RetSqlName("ZLB") + " ZLB "
	cQuery += " 	WHERE D_E_L_E_T_ = ' ' "
	cQuery += " 	AND ZLB_FILIAL = '"+cpFilial+"'  "
	cQuery += " 	AND ZLB_SETOR = '"+cpSetor+"'  "
	cQuery += " 	AND ZLB_RETIRO = '"+cpProd+"'  "
	cQuery += " 	AND ZLB_RETILJ = '"+cpLj+"'  "
	cQuery += " 	AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
	cQuery += " 	AND ZLB_DATA "
	cQuery += " 		BETWEEN CONVERT(char(6),DATEADD(m, -1, '"+DTOS(dpData)+"'),112)+'01' "
	cQuery += " 		AND		CONVERT(char(8),DATEADD(D, -1,CONVERT(char(6),DATEADD(m, +1, '"+DTOS(dpData)+"'),112)+'01'),112) "
	cQuery += " 	) AS ZLB "

Else

	cQuery := "  	SELECT AVG(ZLB_VLRANA) AS TOTALANA FROM " + RetSqlName("ZLB") + " ZLB  "
	cQuery += " 	WHERE D_E_L_E_T_ = ' ' "
	cQuery += " 	AND ZLB_FILIAL = '"+cpFilial+"'  " 
	cQuery += " 	AND ZLB_SETOR = '"+cpSetor+"'  "
	cQuery += " 	AND ZLB_RETIRO = '"+cpProd+"'  "
	cQuery += " 	AND ZLB_RETILJ = '"+cpLj+"'  "
	cQuery += " 	AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
	cQuery += " 	AND ZLB_DATA "
	cQuery += " 		BETWEEN CONVERT(char(6),DATEADD(m, -1, '"+DTOS(dpData)+"'),112)+'01' "
	cQuery += " 		AND		CONVERT(char(8),DATEADD(D, -1,CONVERT(char(6),DATEADD(m, +1, '"+DTOS(dpData)+"'),112)+'01'),112) "

Endif



// testar change query

If Select("GFY") <> 0
	GFY->(dbCloseArea("GFY"))
EndIf

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFY", .T., .F. )
While GFY->(!Eof())
	nRet := GFY->TOTALANA
	GFY->(dbSkip())
EndDo
GFY->(dbCloseArea())


RestArea(aArea)
Return(nRet)






/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getIndiceบ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor do indice (tipo de faixa) de qualidade do produtor                                             บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Media do indice nos ultimos 3 meses                 															บฑฑ
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
User Function getIndice(cpFilial,cpSetor,cpProd,cpLj,cpTpFaixa,cpMedia,dpData,cTPRet)

Local aArea   := GetArea()
Local nMesAnt := Val(SubStr(DtoS(dpData),5,2))-3//Mes anterior
Local nAnoAnt := Val(SubStr(DtoS(dpData),1,4))  //Ano anterior
Local cDtAtu1 := DtoS(FirstDay(dpData))//1o dia da data Atual
Local cDtAtu2 := DtoS(LastDay(dpData))//Ultimo dia da data Atual
Local nTotal  := Iif(cpMedia=="G",nTotal:=1,nTotal:=0)//Verifica se eh media aritimetica ou geometrica
Local nqtd    := 0
Local nAna_1  := 0
Local nAna_2  := 0
Local nRet    := 0
Local cDtAnt  := ""
Local lDesq   := .F. //Amostra desqualificada

DEFAULT cTPRet := "3"

//??????????????????????????????????????????????????????????
//? Primeiramente obtem as analises do mes, caso nao tenha ?
//? busca dos 3 ultimos meses.                             ?
//??????????????????????????????????????????????????????????
cQuery := " SELECT ZLB_VLRANA AS TOTAL,ZLB_DESQUA FROM " + RetSqlName("ZLB") + " ZLB "
cQuery += " WHERE D_E_L_E_T_ = ' '"
cQuery += " AND ZLB_FILIAL = '"+cpFilial+"'  "
cQuery += " AND ZLB_SETOR = '"+cpSetor+"'  "
cQuery += " AND ZLB_RETIRO = '"+cpProd+"'  "
cQuery += " AND ZLB_RETILJ = '"+cpLj+"'  "
//cQuery += " AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
cQuery += " AND ZLB_CODLAB = '"+cpTpFaixa+"'  "
cQuery += " AND ZLB_DATA BETWEEN '"+cDtAtu1+"' AND '"+cDtAtu2+"' "
cQuery += " ORDER BY ZLB_DATA"

If Select("GFZ") <> 0
	GFZ->(dbCloseArea("GFZ"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFZ", .T., .F. )

//If GFZ->ZLB_DESQUA <> "S"
	While GFZ->(!Eof()) .And. nQtd <= 2 //So permite duas analises por mes
		
		nQtd++
		
		Do Case
			Case nQtd == 1 //ANALISE 1
				nAna_1 := GFZ->TOTAL
			Case nQtd == 2 //ANALISE 2
				nAna_2 := GFZ->TOTAL
		EndCase
		
		If cpMedia == "G" //SOMA PARA MEDIA
			nTotal*=GFZ->TOTAL
		Else
			nTotal+=GFZ->TOTAL
		EndIf
		GFZ->(dbSkip())
	EndDo
//Else
//	lDesq := .T.
//EndIf
GFZ->(dbCloseArea())

//?????????????????????????????????????????????????????????????????????????????????????????????????
//? Verifica se nao houve analise dentro do mes e se nao esta desqualificada.                     ?
//? Caso nao tenha analise no mes busca a media dos 3 ultimos meses.                              ?
//?????????????????????????????????????????????????????????????????????????????????????????????????
If nQtd == 0 .And. !lDesq
	
	// Pega data de 3 meses atras
	If nMesAnt<=0
		nMesAnt +=12
		nAnoAnt := Val(SubStr(DtoS(dpData),1,4))-1
	EndIf
	cDtAnt:=ALLTRIM(STR(nAnoAnt))+StrZero(nMesAnt,2)+"01"
	
	// Obtem as tres ultimas analises
	cQuery := " SELECT ZLB_VLRANA AS TOTAL FROM " + RetSqlName("ZLB") + " ZLB "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	cQuery += " AND ZLB_FILIAL = '"+cpFilial+"'  "
	cQuery += " AND ZLB_SETOR = '"+cpSetor+"'  "
	cQuery += " AND ZLB_RETIRO = '"+cpProd+"'  "
	cQuery += " AND ZLB_RETILJ = '"+cpLj+"'  "
	cQuery += " AND ZLB_TIPOFX = '"+cpTpFaixa+"'  "
	cQuery += " AND ZLB_DATA BETWEEN '"+cDtAnt+"' AND '"+DtoS(dpData)+"' "
	cQuery += " AND ZLB_DESQUA <> 'S' " //Tratamento de desqualificacao de analise.
	cQuery += " ORDER BY ZLB_DATA DESC "
	
	If Select("GFZ") <> 0
		GFZ->(dbCloseArea("GFZ"))
	EndIf
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFZ", .T., .F. )
	
	While GFZ->(!Eof())
		nQtd++
		If cpMedia == "G"
			nTotal*=GFZ->TOTAL
		Else
			nTotal+=GFZ->TOTAL
		EndIf
		GFZ->(dbSkip())
	EndDo
	GFZ->(dbCloseArea())
EndIf

//????????????????????????????????????????????????????????????????????
//? Verifica se eh media aritimetica ou geometrica.                  ?
//????????????????????????????????????????????????????????????????????
If cpMedia=="G"
	nRet := nTotal^(1/nQtd)
Else
	nRet := nTotal/nQtd
EndIf

//Quando o tipo eh 1 ou 2 retorna o valor da analise
//Quando o tipo eh 3, retorna a media
Do Case
	Case cTPRet == '1'//Analise 1 no demonstrativo
		nRet := IIF(cpTpFaixa $ "040003#040004",nAna_1/1000,Round(nAna_1,4))
	Case cTPRet == '2'//Analise 2 no demonstrativo
		nRet := IIF(cpTpFaixa $ "040003#040004",nAna_2/1000,Round(nAna_2,4))
	Case cTPRet == 'M'//Media no demonstrativo
		nRet := IIF(cpTpFaixa $ "040003#040004",nRet/1000,Round(nRet,4))
	OtherWise
		nRet := Round(nRet,4)//Retorna o valor da analise para calculo da qualidade no MIX
EndCase

RestArea(aArea)
Return(nRet)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PAGTOESCALAบ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2013                					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por escala (volume)                                                             บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor da bonificacao por volume                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function PagtoEscala(cpTipo,cpCodigo)

Local nVlrInd := 0
Local qtdDias := 0
Local nVlrFx  := 0
Local nTotal  := 0
Local nVolume := U_VLEITE()
Local cTMedia := ""

dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
If dbSeek(xFILIAL("ZL9")+cpCodigo)


	//Se encontrar volume
	If nVolume <> 0
		qtdDias := (VAL(DTOS(ZLE_DTFIM)))-(VAL(DTOS(ZLE_DTINI))) 
		// calcula media de volume/dia dentro do mes
		nVlrInd := nVolume/qtdDias
		//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
		nVlrFx := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)

		If cpTipo == "C" // credito
			If nVlrFx > 0
				nTotal += nVlrFx*nVolume
			EndIf
		Else // debito
			If nVlrFx < 0
				nTotal += nVlrFx*nVolume
			EndIf
		EndIf
	Else
		//Retirado porque o produtor pode ficar sem analise, nesses casos qdo tiver a proxima analise, faz a media das 3 ultimas e paga pro mesmo.
		//xMagHelpFis("Qualidade","O produtor "+SA2->A2_COD+" nใo possui Anแlise de Qualidade!","Cadastre todos os tipos de anแlises para este produtor, na rotina Anแlise da Qualidade!")
	EndIf
EndIf

dbCloseArea("ZL9")

Return nTotal


/*/
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Programa  ? PAGTOQUAL? Autor ? TOTVS                 ? Data da Criacao  ? 11/12/2008                						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Descricao ? Retorna valor da bonificacao por qualidade                                                                   ???
???          ?                   												                               				???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Uso       ?                                                                     						                    ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Parametros? ExpC01 - Indica se trata de uma faixa que deve creditar ou debitar( no caso de analise da qualidade).        ???
???          ? ExpC02 - Codigo do Tipo de Faixa.                    						                                ???
???          ?          			   							                               						        ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Retorno   ? Valor da bonificacao por qualidade                  															???
???          ?          			   							                               						        ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Usuario   ? Microsiga                                                                                					???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Setor     ? Gestao do Leite.                                                                        						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Autor     ? Data     ? Motivo da Alteracao  				               ?Usuario(Filial+Matricula+Nome)    ?Setor        ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???          ?          ?                               				   ?                                  ?   	        ???
???----------?----------?--------------------------------------------------?----------------------------------?-------------???
???          ?          ?                    							   ?                                  ? 			???
???----------?----------?--------------------------------------------------?----------------------------------?-------------???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
/*/
User Function PagtoQual(cpTipo,cpCodigo)

Local nVlrInd := 0
Local nVlrFx  := 0
Local nTotal  := 0
Local nVolume := _pnVLEITE //U_VLEITE()
Local cTMedia := ""

dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
If dbSeek(xFILIAL("ZL9")+cpCodigo)
	
	//Obtem o valor que esta na Analise da Qualidade.
	//Se nao encontrar nenhuma analise, retorna zero
	//nVlrInd := u_getIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,ZL9->ZL9_COD,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
	nVlrInd := u_getIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,ZL9->ZL9_CODLAB,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
	
	//Se encontrar alguma analise da qualidade
	If nVlrInd <> 0
		//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
		nVlrFx := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)
		
		If cpTipo == "C" // credito
			If nVlrFx > 0
				nTotal += nVlrFx*nVolume
			EndIf
		Else // debido
			If nVlrFx < 0
				nTotal += nVlrFx*nVolume
			EndIf
		EndIf
	Else
		//Retirado porque o produtor pode ficar sem analise, nesses casos qdo tiver a proxima analise, faz a media das 3 ultimas e paga pro mesmo.
		//xMagHelpFis("Qualidade","O produtor "+SA2->A2_COD+" n?o possui An?lise de Qualidade!","Cadastre todos os tipos de an?lises para este produtor, na rotina An?lise da Qualidade!")
	EndIf
EndIf

dbCloseArea("ZL9")

Return nTotal



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ pagtoQual	บ Autor ณ TOTVS                 บ Data da Criacao  ณ 04/09/2013                					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por qualidade considerando os steps                                             บฑฑ
ฑฑบ          ณ                   												                               									บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Indica se trata de uma faixa que deve creditar ou debitar( no caso de analise da qualidade).        บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Tipo de Faixa EST                    						                                บฑฑ
ฑฑบ          ณ ExpC03 - Codigo do Tipo de Faixa CCS                 						                                บฑฑ
ฑฑบ          ณ ExpC04 - Codigo do Tipo de Faixa CBT                    						                                บฑฑ
ฑฑบ          ณ ExpC05 - Codigo do Tipo de Faixa Qualidade              						                                บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor da bonificacao por qualidade                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
/*
User Function PagtoQual(cpTipo,cpCodEST,cpCodCCS,cpCodCBT,cpCodQUAL)

	Local nVlrIndEST := 0
	Local nVlrIndCCS := 0
	Local nVlrIndCBT := 0
	Local nVlrIndQUAL := 0
	Local nVlrFxEST  := 0
	Local nVlrFxCCS  := 0
	Local nVlrFxCBT  := 0
	Local nVlrFxQUAL  := 0
	Local nTotal  := 0
	Local nVolume := U_VLEITE('','','N')
	Local cTMedia := ""

	dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
	dbSetOrder(1)//ZL9_FILIAL+ZL9_COD

	If dbSeek(xFILIAL("ZL9")+cpCodEST)
	//Obtem o valor que esta na Analise de EST
	//Se nao encontrar nenhuma analise, retorna zero
		nVlrIndEST := u_getIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,cpCodEST,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
	//Se encontrar alguma analise de EST
		If nVlrIndEST <> 0
	//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
			nVlrFxEST := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,cpCodEST,nVlrIndEST)
		EndIf
	EndIf

	If dbSeek(xFILIAL("ZL9")+cpCodCCS)

	//Obtem o valor que esta na Analise da CCS.
	//Se nao encontrar nenhuma analise, retorna zero            
		nVlrIndCCS := u_getIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,cpCodCCS,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
		//Se encontrar alguma analise da qualidade
		If nVlrIndCCS <> 0
		//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
			nVlrFxCCS := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,cpCodCCS,nVlrInd)
		EndIf
	EndIf
	

	If dbSeek(xFILIAL("ZL9")+cpCodCBT)

	//Obtem o valor que esta na Analise de CBT.
	//Se nao encontrar nenhuma analise, retorna zero
		nVlrIndCBT := u_getIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,cpCodCBT,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
	
		//Se encontrar alguma analise de CBT
		If nVlrIndCBT <> 0                                                      
		//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
			nVlrFxCBT := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrIndCBT)
		EndIf
	EndIf

// total de pontos para ํndice de faixa de qualidade 
	nVlrFxQUAL := nVlrFxEST + nVlrFxCCS + nVlrFxCBT

	If dbSeek(xFILIAL("ZL9")+cpCodQUAL)
	// Compara o valor do Total de pontos da Qualidade com as Faixas de Indica็ใo Cadastradas 
		nVlrFxQUAL:= u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,cpCodQUAL,nVlrFxQUAL)
	EndIf

	If cpTipo == "C" // credito
		If nVlrFxQUAL > 0
			nTotal += nVlrFxQUAL*nVolume
		EndIf
	Else // debito
		If nVlrFxQUAL < 0
			nTotal += nVlrFxQUAL*nVolume
		EndIf 
	EndIf


		dbCloseArea("ZL9")

	Return nTotal

*/

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณpagtoSQualบ Autor ณ TOTVS                 บ Data da Criacao  ณ 04/09/2013                			     		บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por qualidade considerando os steps                                             บฑฑ
ฑฑบ          ณ                   												                               		 	    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Indica se trata de uma faixa que deve creditar ou debitar( no caso de analise da qualidade).        บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Tipo de Faixa.                    						                                บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor da bonificacao por qualidade                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function PagtoSQual(cpTipo,cpCodigo)

Local nVlrInd := 0
Local nVlrFx  := 0
Local nTotal  := 0
Local nVolume := U_VLEITE()
Local cTMedia := ""

dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
If dbSeek(xFILIAL("ZL9")+cpCodigo)

	//Obtem o valor que esta na Analise da Qualidade.
	//Se nao encontrar nenhuma analise, retorna zero
	nVlrInd := u_getMIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,ZL9->ZL9_COD,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)

	//Se encontrar alguma analise da qualidade
	If nVlrInd <> 0
		//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
		nVlrFx := u_getSFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)

		If cpTipo == "C" // credito
			If nVlrFx > 0
				nTotal += nVlrFx*nVolume
			EndIf
		Else // debito
			If nVlrFx < 0
				nTotal += nVlrFx*nVolume
			EndIf
		EndIf
	Else
		//Retirado porque o produtor pode ficar sem analise, nesses casos qdo tiver a proxima analise, faz a media das 3 ultimas e paga pro mesmo.
		//xMagHelpFis("Qualidade","O produtor "+SA2->A2_COD+" nใo possui Anแlise de Qualidade!","Cadastre todos os tipos de anแlises para este produtor, na rotina Anแlise da Qualidade!")
	EndIf
EndIf

dbCloseArea("ZL9")

Return nTotal



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PAGTOFIDEL  Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por qualidade                                                                   บฑฑ
ฑฑบ          ณ                   												                               									บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																																	บฑฑ
ฑฑบ          ณ                     						                                บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 0 (nao recebe) ou 1 (recebe)		                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function PagtoFidel()


Local vlrFide 	:= 0
Local ftrBoni 	:= Rtrim(GetMv("LT_FTRBONI"))
Local mesBoni 	:= Rtrim(GetMv("LT_MESBONI"))             
Local codProd 	:= SA2->A2_COD  
Local maxMesC 	:= ''   

// armazena o maior mes de coleta do produtor
cQuery := " SELECT MAX(SUBSTR(ZLD_DTCOLE,1,6)) MAX_MESCOLE FROM  " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' '"
cQuery += " AND ZLD_RETIRO = '"+codProd+"' "

If Select("GF0") <> 0
	GF0->(dbCloseArea("GF0"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF0", .T., .F. )

While GF0->(!Eof())
	maxMesC:=GF0->MAX_MESCOLE  
	GF0->(dbSkip())
EndDo
GF0->(dbCloseArea())

                  
          
// atribui 0 para produtores que nao entregaram leite no mes que esta sendo calculado
// If maxMesC <> SubStr(DTOS(MonthSub(STOD(ZLE->ZLE_DTFIM,1)),1,6))     
If 0 <> 0
	vlrFide := 0                 
	
Else
// verifica se houve alguma interrupcao no historico do produtor 
// (se em toda a historia ele deixou de entregar em algum mes)   
// se a quantidade de meses que houve coleta + mes da primera coleta for igual ao mes da ultima coleta...
// significa que nao houve interrupcao 
// se nunca interrompeu, devera receber fidelidade 
	cQuery := "SELECT CONVERT(CHAR(6),DATEADD(M,"
	cQuery += "				(SELECT COUNT(*) QTDCOLE FROM (SELECT distinct SUBSTR(ZLD_DTCOLE,1,6) ZLD_MESCOLE FROM " + RetSqlName("ZLD") + " ZLD"
	cQuery += "				WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' '"
	cQuery += "				AND ZLD_RETIRO = '"+codProd+"') ZLD)-1"
	cQuery += "				MIN(SUBSTR(ZLD_DTCOLE,1,6))+'01'),112) INTMESCOLE FROM " + RetSqlName("ZLD") + " ZLD"
	cQuery += "WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' '"
	cQuery += "AND ZLD_RETIRO = '"+codProd+"'"
 
	If Select("GF1") <> 0
		GF1->(dbCloseArea("GF1"))
	EndIf
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF1", .T., .F. )
	
	While GF1->(!Eof())
		intMesC:=GF1->INTMESCOLE  
		GF1->(dbSkip())
	EndDo
	GF1->(dbCloseArea())
	
	If maxMesC == intMesC
		vlrFide := 1
	Else 
	// caso contrario, devera ser verificado 
	// 		1 - a data da ultima interrupcao do produtor
	// 		2 - a data do ultimo fechamento
	// 		3 - subtrair o segundo pelo primeiro, dividir pelo fator LT_FTRBONI, arredondar e comparar com LT_MESBONI 
		cQuery := "SELECT CONVERT(CHAR(8),DATEADD(D, 1,MAX(ZLD_DTCOLE)),112) DTINTERRUP FROM " + RetSqlName("ZLD") + " ZLD"
		cQuery += "WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' '"
		cQuery += "AND ZLD_RETIRO = '"+codProd+"'"
		cQuery += "AND SUBSTR(ZLD_DTCOLE,1,6) ="
		cQuery += "	(SELECT TOP 1 CONVERT(CHAR(6),DATEADD(M, 0, ZLD_MESCOLE+'01'),112) MESINTERRUP FROM"
		cQuery += "		(SELECT ROW_NUMBER() OVER(ORDER BY ZLD_MESCOLE desc) AS 'ROWNUMBER', ZLD_MESCOLE FROM"
		cQuery += "			(SELECT distinct SUBSTR(ZLD_DTCOLE,1,6) ZLD_MESCOLE FROM " + RetSqlName("ZLD") + " ZLD"
		cQuery += "			WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' ' AND ZLD_RETIRO = '"+codProd+"')"
		cQuery += "		TB)"
		cQuery += "	TB2"
		cQuery += "	WHERE CONVERT(CHAR(6),DATEADD(M, ROWNUMBER-1, ZLD_MESCOLE+'01'),112) <>"
		cQuery += "		(SELECT MAX(SUBSTR(ZLD_DTCOLE,1,6)) MAX_MESCOLE "
		cQuery += "		FROM " + RetSqlName("ZLD") + " ZLD "
		cQuery += "		WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' ' AND ZLD_RETIRO = '"+codProd+"')"
		cQuery += "	ORDER BY 1 DESC)"
		
		If Select("GF2") <> 0
			GF2->(dbCloseArea("GF2"))
		EndIf
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF2", .T., .F. )
		
		While GF2->(!Eof())
			dtInterrup:=GF2->DTINTERRUP  
			GF2->(dbSkip())
		EndDo
		GF2->(dbCloseArea())
		
		
		cQuery := "SELECT MAX(ZLF_DTFIM) AS ZLF_DTFIM"
		cQuery += "FROM " + RetSqlName("ZLF") + " ZLF"
		cQuery += "WHERE ZLF.D_E_L_E_T_ = ' ' "
		cQuery += "AND ZLF_STATUS = 'F'"

		If Select("GF3") <> 0
			GF3->(dbCloseArea("GF3"))
		EndIf
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF3", .T., .F. )
		
		While GF3->(!Eof())
			dtUltFech:=GF3->ZLF_DTFIM  
			GF3->(dbSkip())
		EndDo
		GF3->(dbCloseArea())
		
		
		cQuery := "SELECT ROUND(DATEDIFF(DAY, '"+dtUltFech+"','"+dtInterrup+"')/"+ftrBoni+",0) QTDMESES"

		If Select("GF4") <> 0
			GF4->(dbCloseArea("GF4"))
		EndIf
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF4", .T., .F. )
		
		While GF4->(!Eof())
			qtdMeses:=GF4->QTDMESES  
			GF4->(dbSkip())
		EndDo
		GF4->(dbCloseArea())		


		If qtdMeses >= mesBoni
			vlrFide := 1
		Else
			vlrFide := 0
		Endif
	
		
	Endif

Endif


Return vlrFide    



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PAGTOBPF  Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                								บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por qualidade                                                                   บฑฑ
ฑฑบ          ณ                   												                               									บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																																	บฑฑ
ฑฑบ          ณ                     						                                													บฑฑ
ฑฑบ          ณ          			   							                               						        						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 0 (nao recebe) ou 1 (recebe)		                  																				บฑฑ
ฑฑบ          ณ          			   							                               						       						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                							บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						  บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   								บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor         บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ                               				   ณ                                  ณ   	        	   บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 							บฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function pagtoBPF()

                             

Local vlrBPF	 	:= SA2->A2_L_BPF
Local nVolume 	:= U_VLEITE()


Return vlrBPF*nVolume


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PFIDEL  Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2008                					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da bonificacao por qualidade                                                                   บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						               		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 0 (nao recebe) ou 1 (recebe)		                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function PFIDEL(cpFaixa)

                             

Local vlrFide 	:= 0
Local nVolume 	:= U_VLEITE('','','N')
Local codProd 	:= SA2->A2_COD  
Local qtdMes  	:= 0
Local dtIni	    := ''
Local nVlrInd   := 0 
Local qtdAno	:= 0   


cQuery:= "SELECT distinct SUBSTR(ZLD_DTCOLE,1,08) ZLD_MESCOLE FROM " + RetSqlName("ZLD") + " ZLD "
cQuery+= "WHERE ZLD_FILIAL = '"+xFilial("ZLD")+"' AND D_E_L_E_T_ = ' ' "
cQuery+= "AND ZLD_RETIRO = '"+codProd+"'
cQuery+= "order by ZLD_MESCOLE"

If Select("GF0") <> 0
	GF0->(dbCloseArea("GF0"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GF0", .T., .F. )

dtIni := GF0->ZLD_MESCOLE

While GF0->(!Eof())
	qtdMes ++	
	GF0->(dbSkip())
	IF(DateDiffDay( dtIni , GF0->ZLDMESCOLE )) > 60//Apura Diferenca em Dias entre duas Datas 
		qtdMes := 0 
	EndIF
	dtIni := GF0->ZLDMESCOLE 
EndDo
GF0->(dbCloseArea())     



IF (qtdMes > 11)   
       	Do Case
			Case (qtdMes  >= 12 .AND. qtdMes  < 24)
				qtdAno = 1
	   		Case (qtdMes  >= 24 .AND. qtdMes  < 36)
				qtdAno = 3
			Case (qtdMes  >= 36 .AND. qtdMes  < 60)
				qtdAno = 5		
			Case (qtdMes  >60)
				qtdAno := 10
		EndCase                                                                                              
        nVlrInd := qtdAno  
		nVlrFx := u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,cpFaixa,nVlrInd)
Else
	nVlrFx := 0 
EndIf	

Return nVlrFx*nVolume

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ vlrDesvioบ Autor ณ TOTVS                 บ Data da Criacao  ณ 18/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor do desvio de rota realizado por um fretista                                                    บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor do Desvio                                     															บฑฑ
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
User Function vlrDesvio(cpTpPagto,cpFilial,cpSetor,cpLinha,cpFretis,cpLj,cpMix)
Local aArea:=GetArea()
Local dti,dtf
Local nRet:=0
Local nCusto:=0
Local nQtdLinhas:=0
Local nTotVol:=0
Local nCount :=0
Local nResto :=0
Local nAux:=0
Local lachou:=.F.

Iif( Empty(cpFilial) , cpFilial:=xFILIAL("ZLF") ,  )
Iif( Empty(cpSetor)  , cpSetor:=ZL2->ZL2_COD ,  )
Iif( Empty(cpLinha)  , cpLinha:=ZL3->ZL3_COD ,  )
Iif( Empty(cpFretis) , cpFretis:=SA2->A2_COD ,  )
Iif( Empty(cpLj)     , cpLj:=SA2->A2_LOJA ,  )
Iif( Empty(cpMix)    , cpMix:=ZLE->ZLE_COD ,  )

dti:=POSICIONE("ZLE",1,xFILIAL("ZLE")+cpMix,"ZLE_DTINI")
dtf:=POSICIONE("ZLE",1,xFILIAL("ZLE")+cpMix,"ZLE_DTFIM")

// Obtem valor total dos desvios do Fretista
cQuery := "SELECT (ZLC_QTD*ZLC_VALOR) AS TOTAL, ZLH_FINANC AS FIN, ZLH_FATOR AS FATOR "
cQuery += " FROM " + RetSqlName("ZLC") + " ZLC, " + RetSqlName("ZLH") + " ZLH "
cQuery += " WHERE ZLC.D_E_L_E_T_ = ' '"
cQuery += " AND ZLH.D_E_L_E_T_ = ' '"
cQuery += " AND ZLC_FILIAL = '"+cpFilial+"'  "
cQuery += " AND ZLC_SETOR = '"+cpSetor+"'  "
cQuery += " AND ZLC_LINROT = '"+cpLinha+"'  "
cQuery += " AND ZLC_FRETIS = '"+cpFretis+"'  "
cQuery += " AND ZLC_LJFRET = '"+cpLj+"'  "
cQuery += " AND ZLC_CODZLH = ZLH_COD  "

If !Empty(cpTpPagto)
	cQuery += " AND ZLC_FORPAG = '"+cpTpPagto+"'  "
EndIf
cQuery += " AND ZLC_DTCOLE BETWEEN '"+dtos(dti)+"' AND '"+dtos(dtf)+"'  "
If Select("GFZ") <> 0
	GFZ->(dbCloseArea("GFZ"))
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFZ", .T., .F. )

While GFZ->(!Eof())
	If GFZ->FIN == "S"
		If GFZ->FATOR == "A"
			nCusto+=GFZ->TOTAL
		Else
			nCusto-=GFZ->TOTAL
		EndIf
	EndIf
	GFZ->(dbSkip())
EndDo
GFZ->(dbCloseArea())

/*
//Retirado o rateio em 11/02/10
// obtem as linhas movimentadas pelo fretista
cQuery := "SELECT ZLD_LINROT,SUM(ZLD_QTDBOM) AS VOLUME FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' '"
//cQuery += " AND ZLD_FILIAL = '"+cpFilial+"'  "
cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
cQuery += " AND ZLD_SETOR  = '"+cpSetor+"'  "
cQuery += " AND ZLD_FRETIS = '"+cpFretis+"' "
cQuery += " AND ZLD_LJFRET = '"+cpLj+"' "
cQuery += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dti) + "' AND '" + DTOS(dtf) + "'"
cQuery += " GROUP BY ZLD_LINROT"
If Select("TRW") <> 0
TMPZLD->(dbCloseArea("TRW"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRW", .T., .F. )

// Obtendo totais
While TRW->(!Eof())
nQtdLinhas++
nTotVol+=TRW->VOLUME
TRW->(dbSkip())
EndDo

// Ratendo Custo
nResto:=round(nCusto,2)
nRet:=0
cText:=""
If nQtdLinhas > 0
TRW->(dbgotop())
While TRW->(!Eof())
nCount++
nAux:=(TRW->VOLUME/nTotVol)*nCusto
nAux:=round(nAux,2)
If nQtdLinhas == nCount
nAux:=nResto
EndIf

If ALLTRIM(TRW->ZLD_LINROT) == ALLTRIM(cpLinha)
nRet:=nAux
lachou:=.T.
EndIf
cText+=TRW->ZLD_LINROT+"\"
nResto-=nAux
TRW->(dbSkip())
EndDo
Else
xMagHelpFis("Fretista sem Movimento",;
"Nao foi possivel ratear o custo ao transportador "+cpFretis+" por nao haver movimento do mesmo.",;
"Para fazer o rateio ้ preciso que o mesmo tenha coletado leite!")
EndIf
TRW->(dbCloseArea())
*/

//If !lachou .And. nCusto > 0
//	alert("Nao foi possivel fazer o rateio! Linhas procuradas:"+cText+" Em:"+cpLinha)
//EndIf

RestArea(aArea)
//Retirado o rateio em 11/02/10
//Return nRet
Return(nCusto)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getMedVolบ Autor ณ TOTVS                 บ Data da Criacao  ณ 18/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna media de volume da producao de leite de um produtor                                                  บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Produtor Loja  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Media de producao                                   															บฑฑ
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
User Function getMedVol(cpPrd,cpLj)
Local aArea := GetArea()
Local dti,dtf
Local nMes := Val(SubStr(dtos(ddatabase),5,2))
Local nAno := Val(SubStr(dtos(ddatabase),1,4))
Local nCount:= 0
Local nRet:=0
Local n

For n:=1 to 3

	nMes:=nMes-1
	If nMes==0
		nMes:=12
		nAno--
	EndIf
	nAux:=StrZero(nAno,4)+StrZero(nMes,2)+"01"
	dti:=stod(nAux)
	dtf:=lastday(dti)

	cQuery := " SELECT SUM(ZLD_QTDBOM) AS TOTAL FROM " + RetSqlName("ZLD") + " ZLD "
	cQuery += " WHERE D_E_L_E_T_ = ' '"
	cQuery += " AND ZLD_FILIAL = '"+xFILIAL("ZLD")+"'  "
	cQuery += " AND ZLD_RETIRO = '"+cpPrd+"'  "
	cQuery += " AND ZLD_RETILJ = '"+cpLj+"'  "
	cQuery += " AND ZLD_DTCOLE BETWEEN '"+dtos(dti)+"' AND '"+dtos(dtf)+"'  "
	If Select("GFZ") <> 0
		GFZ->(dbCloseArea("GFZ"))
	EndIf
	cQuery := CHANGEQUERY(cQuery)
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "GFZ", .T., .F. )
	If GFZ->(!Eof())
		If GFZ->TOTAL != 0
			nRet+=GFZ->TOTAL
			nCount++
		EndIf
	EndIf
	GFZ->(dbCloseArea())


Next n

// calcula media
nRet:=ROUND(nRet/nCount,2)

RestArea(aArea)
Return nRet
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ getMedFatบ Autor ณ TOTVS                 บ Data da Criacao  ณ 18/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna media de Pagto/faturamento liquido do fornecedor                                                     บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Fornece. Loja  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Media de Faturamento liquido                        															บฑฑ
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
User Function getMedFat(cpPrd,cpLj)
Local aArea := GetArea()
Local dti,dtf
Local nMes := Val(SubStr(dtos(ddatabase),5,2))
Local nAno := Val(SubStr(dtos(ddatabase),1,4))
Local nCount:= 0
Local nRet:=0
Local n

For n:=1 to 3

	nMes:=nMes-1
	If nMes==0
		nMes:=12
		nAno--
	EndIf
	nAux:=StrZero(nAno,4)+StrZero(nMes,2)+"01"
	dti:=stod(nAux)
	dtf:=lastday(dti)

	cQry := "SELECT "
	cQry += " SUM(CASE WHEN ZLF_DEBCRE = 'C'"
	cQry += "        THEN ZLF_TOTAL"
	cQry += "        Else 0"
	cQry += "     END) AS CREDITO,"
	cQry += " SUM(CASE WHEN ZLF_DEBCRE = 'D'"
	cQry += "        THEN ZLF_TOTAL"
	cQry += "        Else 0"
	cQry += "     END) AS DEBITO"
	cQry += " FROM "+RetSqlName("ZLF")+" ZLF "
	cQry += " WHERE ZLF.D_E_L_E_T_ = ' '"
	cQry += " AND ZLF.ZLF_FILIAL = '" +xFILIAL("ZLF")+ "'"
	cQry += " AND ZLF.ZLF_RETIRO  = '" +cpPrd+ "'"
	cQry += " AND ZLF.ZLF_RETILJ = '" +cpLj+ "'"
	cQry += " AND ZLF.ZLF_DTINI BETWEEN '" +dtos(dti)+ "' AND '"+dtos(dtf)+"' "
	If Select("GFZ") <> 0
		GFZ->(dbCloseArea("GFZ"))
	EndIf
	cQry := CHANGEQUERY(cQry)
	dbUseArea( .T., "TOPCONN", TcGenQry(,,cQry), "GFZ", .T., .F. )
	If GFZ->(!Eof())
		If GFZ->CREDITO != 0
			nRet+=(GFZ->CREDITO-GFZ->DEBITO)
			nCount++
		EndIf
		GFZ->(dbSkip())
	EndIf
	GFZ->(dbCloseArea())

Next n

nRet:=round(nRet/nCount,2)

RestArea(aArea)
Return nRet
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณShowGrafico Autor ณ TOTVS                 บ Data da Criacao  ณ 22/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Mostra Grafico simples                                                                                       บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Titulo,Array com as colunas, Array com os valores das colunas												บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                              															บฑฑ
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
User Function ShowGrafico(cTitulo,aColunas,aValores)
Local oGraph
Local nSerie
Local nAltura:=40
Local nModelo:=4
Local n

DEFINE MSDIALOG oDlgGrf FROM  00,00 TO 405,550 TITLE "Grafico" PIXEL OF oMainWnd
oScroll:= TScrollBox():New(oDlgGrf,05,05,180,250,.T.,.T.,.T.)
@ 005,005 MSGRAPHIC oGraph SIZE 30*LEN(aColunas),150 OF oScroll
oGraph:SetMargins( 20, 20, 20, 20 )
oGraph:SetGradient( GDBOTTOMTOP, CLR_HGRAY, CLR_WHITE )
oGraph:SetTitle( , cTitulo  , CLR_BLACK , A_LEFTJUST , GRP_TITLE )
nSerie1 := oGraph:CreateSerie( nModelo )
nSerie2 := oGraph:CreateSerie( nModelo )
nSerie3 := oGraph:CreateSerie( nModelo )
For n:=1 to len(aColunas)
	oGraph:Add(nSerie1,aValores[n],aColunas[n],CLR_GREEN)
Next n
oGraph:l3D := .T.
oGraph:SetLegenProp( GRP_SCRTOP, CLR_YELLOW, GRPLASTVAL, .F. )
@190,010 Button OemToAnsi("Fechar") Size 40,10 Action close(oDlgGrf) OF oDlgOpc PIXEL
@190,060 Button OemToAnsi("Salvar") Size 40,10 Action GrafSavBmp(oGraph) OF oDlgOpc PIXEL
@190,110 Button OemToAnsi("Imprimir") Size 40,10 Action u_PrintGraph(oGraph) OF oDlgOpc PIXEL
// ---------------------------------------------------------------------------------------------
// | O Botao abaixo usa a funcao PmsGrafMail(oGrafico,cAssunto,aDestinos,aTabela,nColLeft)     |
// | que mostra a tela de endereco de destino e assunto. Essa tela executa a funcao abaixo:    |
// | PmsEnvGrff(oGrafico,cAssunto,aTexto,cTo,cCC,aTabela,nEspacos) que envia o e-mail.         |
// | Os parametros MV_EMCONTA,MV_RElseRV e MV_EMSENHA devem estar preenchidos                  |
// ---------------------------------------------------------------------------------------------
@190,160 Button OemToAnsi("E-mail") Size 40,10 Action PmsGrafMail(oGraph,space(30),{""},,1) OF oDlgOpc PIXEL

ACTIVATE MSDIALOG oDlgGrf Centered

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ valFrtVeiบ Autor ณ TOTVS                 บ Data da Criacao  ณ 22/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Valida se o veiculo pertence ao fretista                                                                     บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Fretista Loja Veiculo					                               										บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Verdadero ou Falso                                  															บฑฑ
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
User Function ValFrtVei(cpFretis,cpLj,cpVeicul)
Local aArea:=GetArea()
Local bret:=.F.

// Posiciona no Veiculo
dbSelectArea("ZL4")
dbSetOrder(1)
dbSeek(xFILIAL("ZL4")+cpVeicul)
If found()

	// Posiciona no Motorista
	dbSelectArea("ZL0")
	dbSetOrder(1)
	dbSeek(xFILIAL("ZL0")+ZL4->ZL4_MOTORI)
	If found()

		// se o Motorista pertence ao Fretista retorna verdadeiro
		If ZL0->ZL0_FRETIS == cpFretis .And. ZL0->ZL0_FRETLJ == cpLj
			bret:=.T.
		EndIf

	EndIf
	dbCloseArea("ZL0")


EndIf
dbCloseArea("ZL4")

If !bRet
	xMagHelpFis("Veiculo","Veiculo nao pertence ao Fretista selecionado!","Selecione um veiculo em que o motorista do mesmo perten็a ao Fretista!")
EndIf

RestArea(aArea)
Return bret
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณPrintGraphบ Autor ณ TOTVS                 บ Data da Criacao  ณ 22/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Imprime grafico                                                                                              บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Objeto do Grafico    					                               										บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                              															บฑฑ
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
User Function PrintGraph(oGrafico)
Local oPrint
Local nAltura,nLargura
Local cRaizServer := If(issrvunix(), "/", "\")

oPrint:= TMSPrinter():New( "Relatorio de Grafico" )
oPrint:SetPortrait() // ou SetLandscape()
oPrint:Setup()

oPrint:StartPage()

//oPrint:Say(200,300,"texto",TFont():New("Arial",9,10,.T.,.T.,5,.T.,5,.T.,.F.))

// Ajusta tamanho do grafico ao papel
nLargura := (oGrafico:nWidth*2)
nAltura  := (oGrafico:nHeight*2)
If nLargura > 1900
	nLargura := 1900
EndIf

// Transforma grafico em Imagem
cBmpName := CriaTrab(,.F.)+".BMP"
oGrafico:SaveToBMP( cBmpName, cRaizServer )
oPrint:SayBitmap(100,100,cRaizServer + cBmpName,nLargura,nAltura)

oPrint:EndPage()
oPrint:Preview()

Return nil

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณRayToXml  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 22/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Cria um arquivo XML de um Array                                                                              บฑฑ
ฑฑบ          ณ Converte array para XLM 						                               									บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Array , Nome do Arquivo			                               										บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                              															บฑฑ
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
User Function RayToXml(aTabela,cFileName)
LOcal Y, i
Private nHdlE    := fCreate(cFileName)
Private cEOL    := "CHR(13)+CHR(10)"

// Cabecalho do XML
cLin := '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?> '
cLin += '<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" '
cLin += ' xmlns:o="urn:schemas-microsoft-com:office:office" '
cLin += ' xmlns:x="urn:schemas-microsoft-com:office:excel" '
cLin += ' xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" '
cLin += ' xmlns:html="http://www.w3.org/TR/REC-html40"> '
cLin += ' <Styles><Style ss:ID="Default" ss:Name="Normal"></Style><Style ss:ID="s21"><NumberFormat ss:Format="Short Date"/></Style></Styles> '
cLin += ' <Worksheet ss:Name="Planilha"><Table> '
fWrite(nHdlE,cLin,Len(cLin))

// Convertendo Array
For i:=1 to len(aTabela)

	// inicia linha
	cLin:="<Row>"
	fWrite(nHdlE,cLin,Len(cLin))

	For y:=1 to len(aTabela[i])

		If ValType(aTabela[i,y]) == "N"
			cLin:='   <Cell><Data ss:Type="Number">'+ALLTRIM(str(aTabela[i,y]))+'</Data></Cell> '
		ElseIf ValType(aTabela[i,y]) == "D"
			cData:=dtos(aTabela[i,y])
			cData:=SubStr(cData,1,4)+"-"+SubStr(cData,5,2)+"-"+SubStr(cData,7,2)
			cLin:='   <Cell ss:StyleID="s21"><Data ss:Type="DateTime">'+cData+'</Data></Cell> '
		Else
			cLin:='   <Cell><Data ss:Type="String">'+aTabela[i,y]+'</Data></Cell> '
		EndIf
		fWrite(nHdlE,cLin,Len(cLin))

	Next y

	// finaliza linha
	cLin:="</Row>"
	fWrite(nHdlE,cLin,Len(cLin))

Next i

// Rodape do XML
cLin := ' </Table></Worksheet></Workbook> '
fWrite(nHdlE,cLin,Len(cLin))

fClose(nHdlE)

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT002   บAutor  ณ TOTVS              บ Data ณ  01/07/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function LinMaxRec(cpFretis,cpLj,dpDt1,dpDt2)

Local nMaxVol:=0
Local cMaxLin:=""

cQuery := " SELECT ZLD_LINROT AS LINHA, SUM(ZLD_QTDBOM) AS VOLUME "
cQuery += " FROM "+RetSqlName("ZLD")+" ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_FRETIS = '"+cpFretis+"' "
cQuery += " AND ZLD_LJFRET = '"+cpLj+"' "
cQuery += " AND ZLD_DTCOLE BETWEEN '"+dtos(dpDt1)+"' AND '"+dtos(dpDt2)+"' "
cQuery += " GROUP BY ZLD_LINROT "
If Select("TRR") <> 0
	TRR->(dbCloseArea("TRR"))
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRR", .T., .F. )
While TRR->(!Eof())
	If TRR->VOLUME > nMaxVol
		cMaxLin:=TRR->LINHA
		nMaxVol:=TRR->VOLUME
	EndIf
	TRR->(dbSkip())
EndDo
TRR->(dbCloseArea())


Return cMaxLin


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT002   บAutor  ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function FaltaLeite(cpSetor,cpLinha,cpFretis,cpLj,dt1,dt2)

Local nTotDIf := 0 //Diferenca do Volume do veiculo pela Coleta
Local nTotVol := 0 //Total do Volume do Veiculo
Local nTotCol := 0 //Total da coleta do produtor
Local nPer    := 0 //Diferenca entre o volume e coleta em percentual

If ALLTRIM(cpLinha) != ALLTRIM(LinMaxRec(cpFretis,cpLj,dt1,dt2))
	Return nTotDif
EndIf

cQuery := "SELECT ZLD_FILIAL,ZLD_FRETIS,ZLD_LJFRET,ZLD_SETOR,ZLD_TICKET,MAX(ZLD_DTCOLE) AS DTCOLETA,MAX(ZLD_TOTBOM) AS VOLUME,SUM(ZLD_QTDBOM) AS COLETA "
cQuery += " FROM " + RetSqlName("ZLD") + " ZLD "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZLD_DTCOLE BETWEEN '" + dtos(dt1) + "' AND '" + dtos(dt2) + "' "
cQuery += " AND ZLD_SETOR = '" + cpSetor + "'"
cQuery += " AND ZLD_FRETIS = '"+ cpFretis +"'  "
cQuery += " AND ZLD_LJFRET = '"+ cpLj +"'  "
cQuery += " AND ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQuery += " GROUP BY ZLD_FILIAL,ZLD_FRETIS,ZLD_LJFRET,ZLD_SETOR,ZLD_TICKET"
cQuery += " ORDER BY ZLD_FILIAL,ZLD_SETOR,ZLD_FRETIS,ZLD_LJFRET,ZLD_TICKET"

If Select("TRR") <> 0
	TRR->(dbCloseArea("TRR"))
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRR", .T., .F. )

While TRR->(!Eof())

	nTotVol += TRR->VOLUME //Volume no Veiculo
	nTotCol += TRR->COLETA //Quantidade total coletada do produtor

	TRR->(dbSkip())
EndDo
TRR->(dbCloseArea())

//Encontra a diferenca
nTotDIf := nTotVol - nTotCol

//Se houve falta de Leite
//Siginifica que no Veiculo tem menos leite do que o coletado do produtor
If nTotDIf < 0
	//Multiplica por menos para o valor negativo ficar positivo
	nTotDIf *= -1

	//Calcula o percentual da diferenca em relacao ao volume do veiculo
	nPer := ( (nTotDif*100) / nTotVol )

	//Verifica se o percentual encontrado eh menor que o toleravel (0.35) menos de meio porcento.
	If nPer < 0.35
		nTotDIf := 0
	EndIf
Else//Se sobrou leite
	nTotDIf := 0
EndIf

Return nTotDif

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT002   บ Autor ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ValSetPar()

Local mvRet     := ALLTRIM(ReadVar())
Local lRet	:= .F.

// retorna setores que podem ser acessados pelo usuario
cpSetor:=POSICIONE("ZLU",1,xFILIAL("ZLU")+PADR(cUserName,25),"ZLU_SETOR")



If &(mvRet) $ cpSetor
	lRet:=.T.
EndIf

Return lRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ArredMax บ Autor ณ TOTVS                 บ Data da Criacao  ณ 10/02/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Arredonda um valor para o maior numero inteiro, por exemplo: 10,02 para 11 ou 10,99 para 11.                 บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Valor a ser arredondado.		                               										            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor arredondado.                                  															บฑฑ
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
User Function ArredMax(nValor)

If Int(nValor) < nValor
	nValor := Round(nValor+0.5,0)
EndIf

Return(nValor)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT002  บ Autor ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function unbaixa(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpMotBx,dpData,npValor,cpSeq)

Local lRet:=.T.
Local aArea := GetArea()
Private lMsErroAuto := .F.

Private lBaixaAbat:= .F.
Private lNotBax   := .F.
Private lAglImp   := .F.
Private lBxCec    := .F.
Private nTotImpost:= 0
Private nTotAdto  := 0
Private aBaixaSE5 := {}

dbSelectArea("SE2")
dbSetOrder(1)

aTitulo := {{"E2_PREFIXO",cpPrefixo,Nil},;
{"E2_NUM"	    ,cpNum	     ,Nil},;
{"E2_PARCELA"   ,cpParcela  ,Nil},;
{"E2_TIPO"	    ,cpTipo     ,Nil},;
{"E2_FORNECE"   ,cpForn            ,Nil},;
{"E2_LOJA"	    ,cpLoja           ,Nil},;
{"AUTJUROS"		,0				        ,Nil},;
{"AUTDESCONT"	,0		 		        ,Nil},;
{"AUTMOTBX"		,cpMotBx    ,Nil},;
{"AUTDTBAIXA"	,dpData	    ,Nil},;
{"AUTDTCREDITO"	,dpData    ,Nil},;
{"AUTHIST"		,"Cancto Bx ",Nil},;
{"AUTVLRPG"		,npValor	,Nil},;
{"AUTVALREC"	,npValor	,Nil}}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Altera o modulo para Financeiro, senao o SigaAuto nao executa.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nModulo := 6
cModulo := "FIN"

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Busca o numero da Baixa.                                      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//nBaixa := NroSeq(cpPrefixo,cpNum,cpParcela,cpTipo,cpForn,cpLoja,cpSeq)
dbSelectArea("SE2")
dbSetOrder(1)
dbgotop()
dbSeek(xFILIAL("SE2")+cpPrefixo+cpNum+cpParcela+cpTipo+cpForn+cpLoja)

//Funcao Padrao do Sistema que retorna um array com as baixas a serem canceladas
/*aBaixaSE5 := Sel080Baixa("VL /V2 /BA /RA /CP /LJ /NCC/",cpPrefixo,cpNum,cpParcela,cpTipo,@nTotAdto,@lBaixaAbat,cpForn,cpLoja,@lBxCec,.T.,@lNotBax,@nTotImpost,@lAglImp)
nBaixa:=0
For nPos := 1 to len(aBaixaSE5)
If SubStr(aBaixaSE5[nPos],69,2) == cpSeq
nBaixa := nPos
Exit
EndIf
Next nPos
*/

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ SigaAuto de Cancelamento de Baixa de Contas a Pagar. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
MSExecAuto( {|x,y,z| Fina080(x,y,z)},aTitulo,5,.T.)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Restaura o modulo em uso. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
nModulo := "2"
cModulo := "COM"

If lMsErroAuto
	lRet:=.F.
EndIf

RestArea(aArea)
Return lRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT002  บ Autor ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getVolDay(cpCodPrd,cpLj,cpDia,cpOpc)

Local aArea := GetArea()
Local nRet:=0
DEFAULT cpOpc := "P"  // O parametro cpOpc eh passado no demonstrativo de associaco

//cQuery += " AND ZLD_SETOR = '"+cpSetor+"' "
// Obtem Volume do dia
cQuery := " SELECT SUM(ZLD_QTDBOM) AS VOLUME "
cQuery += " FROM "+RetSqlName("ZLD")+" ZLD "
If cpOpc == "A"
	cQuery += " JOIN "+RetSqlName("SA2")+" SA2 ON A2_L_GRUPO = '"+cpCodPrd+"' AND A2_COD = ZLD_RETIRO AND A2_LOJA = ZLD_RETILJ AND SA2.D_E_L_E_T_ = ' ' "
EndIf
cQuery += " WHERE ZLD_FILIAL = '"+xFILIAL("ZLD")+"' "
If cpOpc == "P"
	cQuery += " AND ZLD_RETIRO = '"+cpCodPrd+"' "
	cQuery += " AND ZLD_RETILJ = '"+cpLj+"' "
EndIf
cQuery += " AND ZLD_DTCOLE = '"+cpDia+"' "
cQuery += " AND ZLD.D_E_L_E_T_ = ' ' "
If Select("TRD") <> 0
	TRD->(dbCloseArea("TRD"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRD", .T., .F. )

While !TRD->(Eof())
	nRet:=TRD->VOLUME
	TRD->(dbSkip())
EndDo
TRD->(dbCloseArea())

RestArea(aArea)
Return nRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT002  บ Autor ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getVlrMix(cpSetor,cpLinha,cpMix)

Local aArea := GetArea()
Local nRet := 0

cQuery := " SELECT * "
cQuery += " FROM "+RetSqlName("ZL8")+" ZL8 "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND ZL8_FILIAL = '"+xFILIAL("ZL8")+"' "
cQuery += " AND ZL8_MIX = 'S' "
If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )

While !TRX->(Eof())
	If TRX->ZL8_DEBCRE == "C"
		nRet += u_getTotEv(xFILIAL("ZL8"),TRX->ZL8_COD,cpSetor,cpLinha,,,cpMix)
	Else
		nRet -= u_getTotEv(xFILIAL("ZL8"),TRX->ZL8_COD,cpSetor,cpLinha,,,cpMix)
	EndIf
	TRX->(dbSkip())
EndDo
TRX->(dbCloseArea())

dbSelectArea("ZLE")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLE")+cpMix)
	nRet := (nRet/U_VolLeite(xFILIAL("ZL8"),ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM,cpSetor,cpLinha,"",""))
Else
	nRet := 0
EndIf

RestArea(aArea)
Return nRet
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TXRESFRI บ Autor ณ TOTVS                 บ Data da Criacao  ณ 26/03/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da taxa de resfriamentoo inteiro, por exemplo: 10,02 para 11 ou 10,99 para 11.                 บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Valor a ser arredondado.		                               										            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor arredondado.                                  															บฑฑ
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

User Function TXRESFRI()
Local aArea := GetArea()
Local nRet := 0

cQuery := " SELECT A2_COD,A2_LOJA,A2_L_TXRES,A2_L_TPTXF "
cQuery += " FROM "+RetSqlName("SA2")+" SA2 "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND A2_L_TANQ = '"+SA2->A2_COD+"' "
cQuery += " AND A2_L_TXRES != 0 "
If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )

While !TRX->(Eof())
	If TRX->A2_L_TPTXF == "L"//Por Litro
		nRet += U_VolLeite(xFILIAL("ZLD"),ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM,ZL2->ZL2_COD,,TRX->A2_COD,TRX->A2_LOJA)*TRX->A2_L_TXRES
	Else//Valor Fixo
		nRet += TRX->A2_L_TXRES
	EndIf
	TRX->(dbSkip())
EndDo
TRX->(dbCloseArea())


RestArea(aArea)
Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TXDSFRT  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 26/03/2009                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da taxa de Desconto de Frete obtida do cadastro do produtor                                    บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Valor a ser arredondado.		                               										            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor arredondado.                                  															บฑฑ
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
User Function TXDSFRT()

Local nRet:=0
Local nVol:=0
Local nVlr:=0

If SA2->A2_L_TPFRT=="L" .And. SA2->A2_L_TXFRT != 0//Por Litro
	nVol:=u_VolLeite(xFILIAL("ZLD"),ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM,ZL2->ZL2_COD,ZL3->ZL3_COD,SA2->A2_COD,SA2->A2_LOJA)
	nRet:=nVol*SA2->A2_L_TXFRT
	If nVol == 0
		xMagHelpFis("Falha",;
		"Taxa de Desconto de Frete nao foi gerado por nao haver volume produzido pelo Produtor.",;
		"Verifique se o produtor "+SA2->A2_COD+" da linha "+ZL3->ZL3_COD+" tem movimentacao.")
	EndIf
EndIf
If SA2->A2_L_TPFRT=="P" .And. SA2->A2_L_TXFRT != 0//Por Percentual
	// Total pago ao produtor vezes a porcentagem informada no cadastro
	nVlr:=u_getTotCr(xFILIAL("ZLF"),ZL2->ZL2_COD,ZL3->ZL3_COD,SA2->A2_COD,SA2->A2_LOJA,ZLE->ZLE_COD,ZLE->ZLE_VERSAO)
	nRet:=nVlr*(SA2->A2_L_TXFRT/100)
	If nVlr == 0
		xMagHelpFis("Falha",;
		"Taxa de Desconto de Frete nao foi gerado por nao haver valor para calculo da porcentagem.",;
		"Verifique se o produtor "+SA2->A2_COD+" da linha "+ZL3->ZL3_COD+" ja foi gerado os valores do leite.")
	EndIf
EndIf

Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TXFRETE  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 10/02/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor da taxa de frete que foi descontada do produtor e deve ser repassada ao Fretista de primeiro บฑฑ
ฑฑบ          ณ percurso.         												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.                                                  										            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor da taxa.                                     															บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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
User Function TXFRETE()

Local aArea := GetArea()
Local nRet  := 0

cQuery := " SELECT A2_COD,A2_LOJA,A2_L_TXFRT,A2_L_TPFRT "
cQuery += " FROM "+RetSqlName("SA2")+" SA2 "
cQuery += " WHERE D_E_L_E_T_ = ' ' "
cQuery += " AND A2_L_FRETI = '"+SA2->A2_COD+"' "
cQuery += " AND A2_L_TXFRT <> 0 "
If Select("TRX") <> 0
	TRX->(dbCloseArea("TRX"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRX", .T., .F. )

While !TRX->(Eof())
	If TRX->A2_L_TPFRT == "L"//Por Litro
		nRet += U_VolLeite(xFILIAL("ZLD"),ZLE->ZLE_DTINI,ZLE->ZLE_DTFIM,ZL2->ZL2_COD,,TRX->A2_COD,TRX->A2_LOJA)*TRX->A2_L_TXFRT
	Else//Porcentagem
		nRet += TRX->A2_L_TXFRT
	EndIf
	TRX->(dbSkip())
EndDo
TRX->(dbCloseArea())


RestArea(aArea)
Return nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT002  บ Autor ณ TOTVS              บ Data ณ  01/27/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AbreExcel(cFileName)

If ! ApOleClient( 'MsExcel' )
	MsgAlert( "Excel nao instalado neste computador!" ) //'MsExcel nao instalado'
	Return
EndIf

oExcelApp := MsExcel():New()
oExcelApp:WorkBooks:Open( cFileName ) // Abre uma planilha
oExcelApp:SetVisible(.T.)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetSetor บ Autor ณ TOTVS                 บ Data da Criacao  ณ 21/07/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Valida setor digitado no campo                                                       						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Codigo do Produtor.                                                                                          บฑฑ
ฑฑบ          ณ Codigo da Loja do Produtor.                                                                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ cCondicao - Codigo do Setor.                                                                             	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GetSetor(cProd,cLoj)

Local aArea   := GetArea()
Local cpSetor := ""

DEFAULT cLoj := "01"

//Cadastro de Produtor
dbSelectArea("SA2")
dbSetOrder(1)
If dbSeek(xFILIAL("SA2")+cProd+cLoj)

	//Cadastro de Rota/Linha
	dbSelectArea("ZL3")
	dbSetOrder(1)
	dbSeek(xFILIAL("ZL3")+SA2->A2_L_LI_RO+SA2->A2_L_TP_LR)

	cpSetor := ZL3->ZL3_SETOR
EndIf

RestArea(aArea)
Return(cpSetor)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MovProd  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 27/07/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Verifica se o produtor tem alguma movimentacao no perํodo.                           						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Exclusao de produtor.                                             											บฑฑ
ฑฑบ          ณ Alteracao de Loja de entrega.                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Codigo do Produtor.                                                                                          บฑฑ
ฑฑบ          ณ Codigo da Loja do Produtor.                                                                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ .T. nao tem movimentacao; .F. Tem movimentacao.                                                          	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MovProd(cProdutor,cLoja,lMsg)

Local lRet := .T.//Nao tem movimentacao
Local cQuery := ""
Local aArea  := GetArea()
Local nCont  := 0
Local cMsg   := ""
Local cDtIni := SUBSTR(DTOS(DATE()),1,6)+"01"
Local cDtFim := SUBSTR(DTOS(DATE()),1,6)+"31"

//RECEPCAO DE LEITE
cQuery := " SELECT COUNT(ZLD_CODREC) AS CONT"
cQuery += " FROM " + RetSqlName("ZLD")
cQuery += " WHERE ZLD_RETIRO = '" + cProdutor + "'"
cQuery += " AND ZLD_RETILJ = '" + cLoja + "'"
cQuery += " AND D_E_L_E_T_ = ' '"
cQuery += " AND ZLD_DTCOLE BETWEEN  '" + cDtIni + "' AND '" + cDtFim + "'"

If Select("TRB") > 0
	dbSelectArea("TRB")
	dbCloseArea("TRB")
EndIf
cQuery := CHANGEQUERY(cQuery)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof()) .And. TRB->CONT > 0
	lRet := .F.
	cMsg := "RECEPCAO DE LEITE"
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

//CONVENIO
cQuery := " SELECT COUNT(ZLL_COD) AS CONT"
cQuery += " FROM " + RetSqlName("ZLL")
cQuery += " WHERE ZLL_RETIRO = '" + cProdutor + "'"
cQuery += " AND ZLL_RETILJ = '" + cLoja + "'"
cQuery += " AND D_E_L_E_T_ = ' '"
cQuery += " AND ZLL_DATA BETWEEN  '" + cDtIni + "' AND '" + cDtFim + "'"
cQuery := CHANGEQUERY(cQuery)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof()) .And. TRB->CONT > 0
	lRet := .F.
	cMsg += If(Empty(cMsg),"CONVENIOS EXTERNOS"," e CONVENIOS EXTERNOS")
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")


//ANALISE DA QUALIDADE
cQuery := " SELECT COUNT(ZLB_SETOR) AS CONT"
cQuery += " FROM " + RetSqlName("ZLB")
cQuery += " WHERE ZLB_RETIRO = '" + cProdutor + "'"
cQuery += " AND ZLB_RETILJ = '" + cLoja + "'"
cQuery += " AND D_E_L_E_T_ = ' '"
cQuery += " AND ZLB_DATA BETWEEN  '" + cDtIni + "' AND '" + cDtFim + "'"
cQuery := CHANGEQUERY(cQuery)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof()) .And. TRB->CONT > 0
	lRet := .F.
	cMsg += If(Empty(cMsg),"ANALISE DE QUALIDADE"," e ANALISE DE QUALIDADE")
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

//EMPRESTIMOS
cQuery := " SELECT COUNT(ZLO_COD) AS CONT"
cQuery += " FROM " +RetSqlName("ZLO")+ " ZLO, " +RetSqlName("ZLM")+ " ZLM"
cQuery += " WHERE ZLO.ZLO_VECTO >=  '"+cDtIni+"'"
cQuery += " AND ZLO.D_E_L_E_T_ = ' '"
cQuery += " AND ZLO.ZLO_COD = ZLM.ZLM_COD"
cQuery += " AND ZLM.ZLM_SA2COD = '" + cProdutor + "'"
cQuery += " AND ZLM.ZLM_SA2LJ  = '" + cLoja + "'"
cQuery += " AND ZLM.D_E_L_E_T_ = ' '"
cQuery := CHANGEQUERY(cQuery)
dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQuery))),'TRB',.F.,.T.)

If TRB->(!Eof()) .And. TRB->CONT > 0
	lRet := .F.
	cMsg += If(Empty(cMsg),"EMPRESTIMO"," e EMPRESTIMO")
EndIf

dbSelectArea("TRB")
dbCloseArea("TRB")

If lMsg//Se mostra mensagem
	If !lRet//Se encontrou movimentacoes para o produtor
		xMagHelpFis("Mensagem","Aten็ใo, existem lan็amentos de :"+cMsg+" para o produtor.","Exclua primeiro as movimenta็๕es e em seguida exclua o produtor.")
	EndIf
EndIf

RestArea(aArea)
Return(lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetLteFilบ Autor ณ TOTVS                 บ Data da Criacao  ณ 27/07/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Busca quantidade de leite na zld por filial do produtor                              						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inclusao de recepcao de leite                                     											บฑฑ
ฑฑบ          ณ Importacao de recpcao de leite via coletor de dados                                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Codigo do ticket                                                                                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Quantidade de leite por filial                                                                           	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/


User Function GetLteFil(cTicket)
Local aRet := {}
Local cAlias := "TRBLTEFIL"
Local cFiltro := "% AND ZLD_TICKET = '" + cTicket + "' %"

If Select(cAlias) > 0
	dbSelectArea(cAlias)
	dbCloseArea(cAlais)
EndIf

BeginSql alias cAlias
	SELECT
	SUM(ZLD_QTDBOM) AS QUANT, ZLD_FILENT
	FROM
	%table:ZLD% ZLD
	WHERE
	ZLD_FILIAL = %Exp:xFilial("ZLD")% AND
	ZLD.%notDel%
	%exp:cFiltro%
	GROUP BY
	ZLD_FILENT
EndSql

//Percorre query resultado e adiciona no array
dbSelectArea("TRBLTEFIL")
dbGoTop()
While TRBLTEFIL->(!Eof())
	aadd(aRet,{TRBLTEFIL->ZLD_FILENT,TRBLTEFIL->QUANT})
	TRBLTEFIL->(dbSkip())
EndDo




Return aRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetSldProบ Autor ณ TOTVS                 บ Data da Criacao  ณ 19/04/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Ler debitos e creditos do produtor e retornar o saldo.                                                       บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cProdutor,cLoja,cMes,cAno,cDiaPgto,cGrpCnv     		                               						    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ array com debitos do produtor                                                                             	บฑฑ
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
User Function GetSldPro(cCod,cLoja,cMes,cAno,cDiaPgto,cGrpCnv,cSetor,cMix)

Local nCnt    := 1
Local nSld    := 0
Local nTotCre := 0
Local nTotDeb := 0
Local cQuery  := ""
Local nConvenios := 0
Local aConvenios := {}

// Obtem Eventos lancados ao produtor corrente
cQuery := " SELECT ZLF_EVENTO AS EVENTO,ZLF_DEBCRE AS DEBCRE,MAX(ZLF_QTDBOM) AS QTDBOM,SUM(ZLF_TOTAL) AS TOTAL,SUM(ZLF_VLRPAG) AS VLRPAG "
cQuery += " ,MAX(ZLF_DCREVE) as DCREVE,MAX(ZL8.ZL8_GRUPO) ZL8_GRUPO, MAX(ZL8_DESCRI) ZL8_DESCRI "
cQuery += " FROM "+RetSqlName("ZLF")+" ZLF "
cQuery += " , "+RetSqlName("ZL8")+" ZL8 "
cQuery += " WHERE ZL8.D_E_L_E_T_ = ' '  AND ZLF.D_E_L_E_T_ = ' '"
cQuery += " AND ZLF.ZLF_EVENTO = ZL8.ZL8_COD "
cQuery += " AND ZL8.ZL8_RECIBO = 'S' "
cQuery += " AND ZL8.ZL8_GRUPO NOT IN ('"	+ cGrpCnv + "','000011','000099')"//CONVENIO/EMPRESTIMOS/EXCLUSIVO SISTEMA
cQuery += " AND ZLF_FILIAL = '"+xFILIAL("ZLF")+"' "
cQuery += " AND ZLF_FILIAL = '"+xFILIAL("ZL8")+"' "
cQuery += " AND ZLF_CODZLE = '"+cMix+"' "
cQuery += " AND ZLF_SETOR  = '"+cSetor+"' "
cQuery += " AND ZLF_RETIRO  = '"+cCod+"' "
cQuery += " AND ZLF_RETILJ = '"+cLoja+"' "
cQuery += " AND ZLF_TP_MIX = 'L' "
cQuery += " GROUP BY ZLF_DEBCRE,ZL8_GRUPO,ZLF_EVENTO,ZLF_SEQ "
cQuery += " ORDER BY ZLF_DEBCRE,ZL8_GRUPO,ZLF_EVENTO "
If Select("TRC") <> 0
	TRC->(dbclosearea("TRC"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRC", .T., .F. )

While !TRC->(Eof())

	//Tratamento para nao imprimir uma linha em branco com valor zerado quando
	//o produtor nao tem nada de qualidade.
	If TRC->TOTAL > 0
		If TRC->DEBCRE == "C"
			nTotCre+=TRC->TOTAL
		Else
			nTotDeb+=TRC->TOTAL
		EndIf
	EndIf

	TRC->(dbskip())
EndDo
TRC->(dbCloseArea())

// IMPRIME CONVENIOS
aConvenios := U_RGLTCNV(cCod,cLoja,cMes,cAno,cDiaPgto,cGrpCnv,cMix)

For nCnt := 1 To Len(aConvenios)
	nConvenios += aConvenios[nCnt,2]
Next

If nConvenios > 0
	nTotDeb+=nConvenios
EndIf

nSld := nTotCre-nTotDeb
Return(nSld)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณRGLTCNV   บ Autor ณ TOTVS                 บ Data da Criacao  ณ 21/09/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Ler debitos do produtor e retornar para a consulta produtor e extrato produtor                               บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cProdutor,cLoja,cMes,cAno,cDiaPgto,cGrpConv     		                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ array com debitos do produtor                                                                             	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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
User Function RGLTCNV(cProdutor,cLoja,cMes,cAno,cDiaPgto,cGrpConv,cMix,lAgluSld)

Local aConvenios := {}
Local cFiltro    := ""
Local cDtIni     := ""
Local cDtFim     := ""
Local cQuery     := ""
Local nSldDevedor:= 0
Local nAcresFina := 0
Local nJurTit    := 0
Local nSE2Acresc := 0
Local cGrpEmFn   := Rtrim(GetMv("LT_GEVEMFN")) //grupo evento emprestimo e financiamentos MARCO-TUB027
Local cMixStatus := POSICIONE("ZLF",1,XFILIAL("ZLF")+cMix+'1'+cProdutor+cLoja,"ZLF_STATUS")
Local cFunrural  := Rtrim(GetMv("LT_EVEINSS"))
Local cSenar     := Rtrim(GetMv("LT_EVESENA"))
Local lDetalha   := GetMv("LT_DETALHA")
Local cPrefVen   := POSICIONE("ZL8",1,xFILIAL("ZL8")+Rtrim(GetMv("LT_CONVINT")),"ZL8_PREFIX")
Local cPesqE2    := ""
Local dBkpDT     := dDataBase

Default lAgluSld := .T. //Indica se deve aglutinar o saldo devedor e mostrar os itens das notas de conv. interno ou nao.

// busca prefixo e natureza no cadastro do evento VENDAS INTERNAS
ZL8->(dbSetOrder(1))
If ZL8->(dbSeek(xFilial("ZL8")+GetMv("LT_CONVINT")))
	_cPrefE2 := ZL8->ZL8_PREFIX
Else
	xMagHelpFis("Gestใo Leite","Convenio nใo encontrado!","Verifique o parametro LT_CONVINT e o cadastro de Eventos")
	Return(aConvenios)
EndIf

If Empty(cProdutor) .Or. Empty(cLoja) .Or. Empty(cAno) .Or. Empty(cMes) .Or. Empty(cDiaPgto)
	ApMsgStop("Para buscar os convenios favor informar os parโmetros Produtor, Loja, Mes e Ano.")
	Return(aConvenios)
Else
	//Altera a database para a funcao FA080juros calcular os juros corretamente
	dDataBase := LastDay(STOD(cAno+cMes+cDiaPgto))
	dBaixa    := LastDay(STOD(cAno+cMes+cDiaPgto))
	cDtIni    := cAno+cMes+(strzero(val(cDiaPgto)+1,2))
	cDtFim    := DtoS(U_ADDMes(STOD(cAno+cMes+cDiaPgto),1))
EndIf

If Select("CSQL") > 0
	CSQL->(dbCloseArea("CSQL"))
EndIf

// se mix fechado - ler dados do mix, se mix aberto, ler dados do financeiro
If cMixStatus == 'F' // FECHADO

	BeginSql alias "CSQL"

		SELECT
		ZLF_EVENTO,ZLF_SE1HIS,ZLF_SE1VEN,ZLF_SE1VLR,ZLF_SE1SLD,ZLF_VLRPAG,ZLF_L_SEEK,ZLF_SE1JUR,ZLF_SE1ACR
		FROM
		%TABLE:ZLF% ZLF
        JOIN %TABLE:ZL8% ZL8 ON ZL8.ZL8_FILIAL = %XFILIAL:ZL8% AND ZL8_COD = ZLF.ZLF_EVENTO AND ZL8_TPEVEN <> 'A' AND ZL8.%NOTDEL%
		WHERE
		ZLF_RETIRO = %exp:cProdutor%
		AND ZLF_RETILJ = %exp:cLoja%
		AND ZLF_CODZLE = %exp:cMix%
		AND ZLF_EVENTO NOT IN(%exp:cFunrural%,%exp:cSenar%)
		AND ZLF_DEBCRE = 'D' AND ZLF_STATUS = 'F'
		AND ZLF.ZLF_FILIAL = %XFILIAL:ZLF% AND ZLF.%NOTDEL%

		ORDER BY ZLF_SE1VEN

	EndSql

	While !CSQL->(Eof())
		// aglutinar saldo devedor
		If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
			While !CSQL->(Eof()) .And. CSQL->ZLF_SE1VEN < cDtIni
				nSldDevedor += (CSQL->ZLF_SE1SLD + CSQL->ZLF_SE1ACR)
				nAcresFina  += CSQL->ZLF_SE1JUR
				CSQL->(dbSkip())
			EndDo

			If nSldDevedor > 0
				AADD(aConvenios,{"Saldo Devedor ",nSldDevedor," ",0,0,0})
				nSldDevedor := 0
			EndIf

			If nAcresFina > 0
				AADD(aConvenios,{"Acr้scimo Financeiro ",nAcresFina," ",0,0,0})
				nAcresFina := 0
			EndIf
			//Tratamento para NAO aglutinar o saldo devedor
		Else
			While !CSQL->(Eof()) .And. CSQL->ZLF_SE1VEN < cDtIni
				If CSQL->ZLF_EVENTO <> ALLTRIM(GetMv("LT_EVEESTO"))//Codigo do evento de ESTORNO DE LANCAMENTO INDEVIDO - 000028
					AADD(aConvenios,{Rtrim(CSQL->ZLF_SE1HIS),(CSQL->ZLF_SE1SLD + CSQL->ZLF_SE1ACR),"",CSQL->ZLF_VLRPAG,CSQL->ZLF_SE1JUR,CSQL->ZLF_SE1VLR,CSQL->ZLF_SE1VLR})
				EndIf
				CSQL->(dbSkip())
			EndDo
		EndIf

		// buscar detalhamento das vendas
		If CSQL->ZLF_EVENTO==ALLTRIM(GetMv("LT_CONVINT"))//"000022"//Convenios Internos

			cPesqE2 := Rtrim(CSQL->ZLF_L_SEEK)
			//convenios internos
			If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
				BeginSql alias "VENDAS"
					SELECT
					E2_NUM
					,E2_FORNECE
					,E2_LOJA
					,SUBSTR(D2_EMISSAO,7,2)+'/'+SUBSTR(D2_EMISSAO,5,2) + ' ' + Rtrim(D2_SERIE) + '-' + D2_DOC + ' ' + SUBSTR(SB1.B1_DESC,1,60) as Descricao
					//,SubStr(D2_EMISSAO,7,2)||'/'||SubStr(D2_EMISSAO,5,2) || ' ' || Rtrim(D2_SERIE) || '-' || D2_DOC || ' ' || SubStr(SB1.B1_DESC,1,60) as Descricao
					,D2_QUANT as Quantidade
					,D2_TOTAL as Valor

					FROM
					%TABLE:SE2% SE2
					,%TABLE:SD2% SD2
					,%TABLE:SB1% SB1

					WHERE
					E2_NUM = D2_DOC
					AND E2_FORNECE = D2_CLIENTE
					AND E2_LOJA = D2_LOJA
					AND SD2.D2_COD = SB1.B1_COD
					AND E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA = %exp:cPesqE2%
					AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL%
					AND SE2.E2_FILORIG = SD2.D2_FILIAL AND SD2.%NOTDEL%
					AND SB1.B1_FILIAL = %XFILIAL:SB1% AND SB1.%NOTDEL%
					ORDER BY D2_EMISSAO
				EndSql
			Else
				BeginSql alias "VENDAS"
					SELECT
					E2_NUM
					,E2_FORNECE
					,E2_LOJA
					,SUBSTR(E2_EMISSAO,7,2)+'/'+SUBSTR(E2_EMISSAO,5,2) + ' ' + Rtrim(E2_PREFIXO) + '-' + E2_NUM + '/'+Rtrim(E2_PARCELA) as Descricao
					//,SubStr(E2_EMISSAO,7,2)||'/'||SubStr(E2_EMISSAO,5,2) || ' ' || Rtrim(E2_PREFIXO) || '-' || E2_NUM || '/'||Rtrim(E2_PARCELA) as Descricao
					,E2_VALOR   as Valor

					FROM
					%TABLE:SE2% SE2

					WHERE
					E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA = %exp:cPesqE2%
					AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL%
					ORDER BY E2_PREFIXO,E2_NUM
				EndSql
			EndIf

			While !VENDAS->(Eof())
				If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
					AADD(aConvenios,{Rtrim(VENDAS->Descricao) + Transform(VENDAS->Quantidade,"@E 999,999.99"),VENDAS->Valor,cGrpConv,0,0,0})
				Else
					AADD(aConvenios,{Rtrim(VENDAS->Descricao),VENDAS->Valor,cGrpConv,CSQL->ZLF_VLRPAG,CSQL->ZLF_SE1JUR,CSQL->ZLF_SE1VLR})
				EndIf
				VENDAS->(dbSkip())
			EndDo

			dbCloseArea("VENDAS")
			dbSelectArea("CSQL")

		ElseIf CSQL->ZLF_EVENTO <> ALLTRIM(GetMv("LT_EVEESTO"))//Codigo do evento de ESTORNO DE LANCAMENTO INDEVIDO - 000028
			nSE2Acresc := CSQL->ZLF_SE1SLD + CSQL->ZLF_SE1ACR//Saldo do titulo + Acrescimo Financeiro(Ocorre nos emprestimos - GLE)
			AADD(aConvenios,{CSQL->ZLF_SE1HIS,nSE2Acresc,CSQL->ZLF_EVENTO,CSQL->ZLF_VLRPAG,CSQL->ZLF_SE1JUR,CSQL->ZLF_SE1VLR})
		EndIf

		CSQL->(dbSkip())
	EndDo

	dbCloseArea("CSQL")
	Return(aConvenios)
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ BUSCA SALDO DEVEDOR .                         ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
BeginSql alias "CSQL"

	SELECT
	E2_PREFIXO
	,E2_NUM
	,E2_PARCELA
	,E2_TIPO
	,E2_FORNECE
	,E2_LOJA
	,E2_VALOR
	,E2_SALDO
	,E2_VENCTO
	,E2_VALJUR
	,E2_PORCJUR
	,E2_MOEDA
	,E2_EMISSAO
	,E2_TXMOEDA
	,E2_BAIXA
	,E2_HIST AS DESCRICAO
	,E2_SALDO+E2_ACRESC-E2_DECRESC AS VALOR

	FROM
	%TABLE:SE2% SE2

	WHERE
	E2_TIPO = 'NDF'
	AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
	//AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
	AND E2_SALDO > 0
	AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL%
	AND E2_FORNECE = %exp:cProdutor%
	AND E2_LOJA = %exp:cLoja%
	AND E2_VENCTO < %exp:cDtIni%

	ORDER BY E2_EMISSAO

EndSql

If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
	While !CSQL->(Eof())

		nSldDevedor += CSQL->VALOR

		// saldo devedor - buscar juros de titulos abertos
		SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		SE2->(dbSeek(xFILIAL("SE2")+CSQL->E2_PREFIXO+CSQL->E2_NUM+CSQL->E2_PARCELA+CSQL->E2_TIPO+CSQL->E2_FORNECE+CSQL->E2_LOJA))

		//nJurTit   += ROUND(fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2"),2)
		nJurTit += NOROUND(fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2"),2)

		CSQL->(dbSkip())
	EndDo

	If nSldDevedor > 0
		AADD(aConvenios,{"Saldo Devedor ",nSldDevedor,"",0,0,0})
	EndIf

	If nJurtit > 0
		AADD(aConvenios,{"Acr้scimo Financeiro ",nJurTit,"",0,0,0})
	EndIf
Else
	While !CSQL->(Eof())

		//Saldo devedor - buscar juros de titulos abertos
		SE2->(dbSetOrder(1))//E2_FILIAL+E2_PREFIXO+E2_NUM+E2_PARCELA+E2_TIPO+E2_FORNECE+E2_LOJA
		SE2->(dbSeek(xFILIAL("SE2")+CSQL->E2_PREFIXO+CSQL->E2_NUM+CSQL->E2_PARCELA+CSQL->E2_TIPO+CSQL->E2_FORNECE+CSQL->E2_LOJA))

		//nJurTit   += ROUND(fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2"),2)
		nJurTit     := NOROUND(fa080Juros(SE2->E2_MOEDA, SE2->E2_SALDO ,"SE2"),2)
		nSldDevedor := CSQL->VALOR

		AADD(aConvenios,{Rtrim(CSQL->DESCRICAO),nSldDevedor,"",0,nJurTit,CSQL->E2_VALOR})

		CSQL->(dbSkip())
	EndDo
EndIf

dbCloseArea("CSQL")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ CONVENIOS INTERNOS - LOJA RACAO E EMPORIO.    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
	BeginSql alias "CSQL"
		SELECT
		E2_NUM
		,E2_FORNECE
		,E2_LOJA
		,SUBSTR(D2_EMISSAO,7,2)+'/'+SUBSTR(D2_EMISSAO,5,2) + ' ' + Rtrim(D2_SERIE) + '-' + D2_DOC + ' ' + SUBSTR(SB1.B1_DESC,1,60) as Descricao
		//,SubStr(D2_EMISSAO,7,2)||'/'||SubStr(D2_EMISSAO,5,2)||' '||Rtrim(D2_SERIE) || '-' || D2_DOC || ' ' || SUBSTR(SB1.B1_DESC,1,60) as Descricao
		,D2_QUANT as Quantidade
		,D2_TOTAL as Valor

		FROM
		%TABLE:SE2% SE2
		,%TABLE:SD2% SD2
		,%TABLE:SB1% SB1

		WHERE
		SE2.E2_NUM = SD2.D2_DOC
		AND SE2.E2_FORNECE = SD2.D2_CLIENTE
		AND SE2.E2_LOJA = SD2.D2_LOJA
		AND SD2.D2_COD = SB1.B1_COD
		AND SE2.E2_TIPO = 'NDF'
		AND SE2.E2_SALDO <> 0
		AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
		//AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
		AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL%
		AND SE2.E2_FILORIG = SD2.D2_FILIAL AND SD2.%NOTDEL%
		AND SB1.B1_FILIAL = %XFILIAL:SB1% AND SB1.%NOTDEL%
		AND SE2.E2_FORNECE = %exp:cProdutor%
		AND SE2.E2_LOJA = %exp:cLoja%
		//AND SE2.E2_VENCTO BETWEEN %exp:cDtIni% AND %exp:cDtFim%
		//ALTERADO PORQUE ESTAVA PEGANDO TITULO COM EMISSAO EM FEVEREIRO
		//E TENTANDO BAIXAR EM JANEIRO, DAI O SIGAAUTO NAO PERMITE
		AND E2_VENCTO <= %exp:cDtFim%
		AND E2_EMISSAO <= %exp:DtoS(dDataBase)%
		ORDER BY D2_EMISSAO
	EndSql
Else
	BeginSql alias "CSQL"
		SELECT
		E2_NUM
		,E2_FORNECE
		,E2_LOJA
		,SUBSTR(E2_EMISSAO,7,2)+'/'+SUBSTR(E2_EMISSAO,5,2) + ' ' + Rtrim(E2_PREFIXO) + '-' + E2_NUM + '/'+Rtrim(E2_PARCELA) as Descricao
		//,SubStr(E2_EMISSAO,7,2)||'/'||SubStr(E2_EMISSAO,5,2)||' '||Rtrim(E2_PREFIXO)||'-'||E2_NUM||'/'||Rtrim(E2_PARCELA) as Descricao
		,E2_VALOR as Valor

		FROM
		%TABLE:SE2% SE2

		WHERE
		SE2.E2_TIPO = 'NDF'
		AND SE2.E2_SALDO <> 0
		AND SE2.E2_PREFIXO = %exp:cPrefVen%
		AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL%
		AND SE2.E2_FORNECE = %exp:cProdutor%
		AND SE2.E2_LOJA = %exp:cLoja%
		//AND SE2.E2_VENCTO BETWEEN %exp:cDtIni% AND %exp:cDtFim%
		//ALTERADO PORQUE ESTAVA PEGANDO TITULO COM EMISSAO EM FEVEREIRO
		//E TENTANDO BAIXAR EM JANEIRO, DAI O SIGAAUTO NAO PERMITE
		AND E2_VENCTO <= %exp:cDtFim%
		AND E2_EMISSAO <= %exp:DtoS(dDataBase)%
		ORDER BY E2_PREFIXO,E2_NUM
	EndSql
EndIf

While !CSQL->(Eof())
	If lAgluSld//Aglutina o Saldo Devedor e mostra os itens das notas de conv. interno
		AADD(aConvenios,{Rtrim(CSQL->Descricao) + Transform(CSQL->Quantidade,"@E 999,999.99"),CSQL->Valor,cGrpConv,0,0,0})
	Else
		AADD(aConvenios,{Rtrim(CSQL->Descricao),CSQL->Valor,cGrpConv,0,0,0})
	EndIf
	CSQL->(dbSkip())
EndDo
dbCloseArea("CSQL")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ ADIANTAMENTOS, EMPRESTIMOS, FINANCIAMENTOS.   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
BeginSql alias "CSQL"

	SELECT
	E2_NUM
	,E2_FORNECE
	,E2_LOJA
	,E2_HIST as Descricao
	,E2_SALDO+E2_ACRESC-E2_DECRESC as Valor

	FROM
	%TABLE:SE2% SE2
	,%TABLE:ZLM% ZLM

	WHERE
	SE2.E2_NUM = ZLM.ZLM_COD
	AND SE2.E2_FORNECE = ZLM.ZLM_SA2COD
	AND SE2.E2_LOJA = ZLM.ZLM_SA2LJ
	AND SE2.E2_TIPO = 'NDF'
	AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
	//AND SUBSTR(SE2.E2_PREFIXO,1,2) = 'GL'
	AND SE2.E2_FILIAL = %XFILIAL:SE2% AND SE2.%NOTDEL% AND ZLM.%NOTDEL%
	AND SE2.E2_FORNECE = %exp:cProdutor%
	AND SE2.E2_LOJA = %exp:cLoja%
	//AND SE2.E2_VENCTO BETWEEN %exp:cDtIni% AND %exp:cDtFim%
	//ALTERADO PORQUE ESTAVA PEGANDO TITULO COM EMISSAO EM FEVEREIRO
	//E TENTANDO BAIXAR EM JANEIRO, DAI O SIGAAUTO NAO PERMITE
	AND E2_VENCTO <= %exp:cDtFim%
	AND E2_EMISSAO <= %exp:DtoS(dDataBase)%
	AND E2_SALDO > 0 //ALTERADO 25/02/11

	ORDER BY E2_EMISSAO

EndSql

While !CSQL->(Eof())
	AADD(aConvenios,{Rtrim(CSQL->Descricao),CSQL->Valor,cGrpEmFn,0,0,0})
	CSQL->(dbSkip())
EndDo

dbCloseArea("CSQL")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ CONVENIO EXTERNOS AO LATICINIO - FARMACIA, ETC.   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cFiltro := "%"
If !Empty(cProdutor) .And. !Empty(cLoja) .And. !Empty(cAno) .And. !Empty(cMes)
	cFiltro +=	" AND ZLL_RETIRO = '" + cProdutor + "'"
	cFiltro +=	" AND ZLL_RETILJ = '" + cLoja + "'"
	cFiltro +=	" AND ZLL_VENCTO BETWEEN '" + cDtIni + "' AND '" + cDtFim + "'"
	cFiltro +=	" AND ZL8_GRUPO = '" + cGrpConv + "'"
Else
	ApMsgStop("Para buscar os convenios favor informar os parโmetros Produtor, Loja, Mes e Ano.")
EndIf
cFiltro += "%"

BeginSql alias "CSQL"

	//SELECT SubStr(ZLL_DATA,7,2)||'/'||SubStr(ZLL_DATA,5,2) || ' ' || ZLL_OBSERV as Descricao,ZLL_VALOR as Valor
	SELECT SUBSTR(ZLL_DATA,7,2)+'/'+SUBSTR(ZLL_DATA,5,2) + ' ' + ZLL_OBSERV as Descricao,ZLL_VALOR as Valor
	FROM
	%TABLE:ZLL% ZLL
	, %TABLE:ZL8% ZL8
	, %TABLE:SA2% SA2
	WHERE
	ZLL.ZLL_EVENTO = ZL8.ZL8_COD
	AND ZLL_CONVEN = A2_COD
	AND ZLL_LJCONV = A2_LOJA
	AND ZLL.ZLL_STATUS IN ('A','P')
	AND ZLL.ZLL_FILIAL = %XFILIAL:ZLL% AND ZLL.%NOTDEL%
	AND ZL8.ZL8_FILIAL = %XFILIAL:ZL8% AND ZL8.%NOTDEL%
	AND SA2.A2_FILIAL = %XFILIAL:SA2% AND SA2.%NOTDEL%
	%exp:cFiltro%
	ORDER BY
	ZLL_DATA

EndSql

While !CSQL->(Eof())
	AADD(aConvenios,{CSQL->Descricao,CSQL->Valor,cGrpConv,0,0,0})
	CSQL->(dbSkip())
EndDo

dBaixa    := dBkpDT
dDataBase := dBkpDT
dbCloseArea("CSQL")
Return(aConvenios)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ GetFilEntบ Autor ณ TOTVS                 บ Data da Criacao  ณ 28/09/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Busca a filial de entrega da linha de acordo com a data.                                        			    บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑบ          ณ A linha esta vinculada a filial de entrega, no entanto a filial de entrega pode ser alterada na virada do mesบฑฑ
ฑฑบ          ณ com isto criamos a tabela ZLG que armazena em qual filial a linha estava ate determinada data.               บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inclusao de recepcao de leite                                     											บฑฑ
ฑฑบ          ณ Importacao de recpcao de leite via coletor de dados                                                          บฑฑ
ฑฑบ          ณ Integracao da qualidade.                                                                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Codigo do produtor                                                                                           บฑฑ
ฑฑบ          ณ Loja do Produtor.                                                                                            บฑฑ
ฑฑบ          ณ Data de referencia.    .                                                                                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Filial de entrega.                                                                                       	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function GetFilEnt(cProd,cLj,dData)

Local cFilia := ""
Local cUltDia:= DTOS(LastDay(dData))
Local aArea  := GetArea()

//Posiciona no cadastro de Produtor
dbSelectArea("SA2")
dbSetOrder(1)//A2_FILIAL+A2_COD+A2_LOJA
dbSeek(XFILIAL("SA2")+cProd+cLj)

//Posiciona no cadastro de Linha
dbSelectArea("ZL3")
dbSetOrder(1)//ZL3_FILIAL+ZL3_COD+ZL3_TIPO
dbSeek(XFILIAL("ZL3")+SA2->A2_L_LI_RO,.T.)

//Posiciona no Log de Linha versus Filial
dbSelectArea("ZLG")
dbSetOrder(1)//ZLG_FILIAL+ZLG_COD+ZLG_VENCTO
If dbSeek(XFILIAL("ZLG")+SA2->A2_L_LI_RO+cUltDia)
	cFilia := ZLG->ZLG_FILENT
Else
	cFilia := ZL3->ZL3_FILENT
EndIf

RestArea(aArea)
Return(cFilia)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ getIdFaz บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Busca o ID da Fazenda.                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico.                                                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getIdFaz(cLinha)

Local cAlias := "TRBIDFAZ"
Local cFiltro := "%"

Local _cPLEITE := "P"//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

If Select(cAlias) > 0
	dbSelectArea(cAlias)
	dbCloseArea(cAlias)
EndIf



cFiltro += " AND SUBSTR(A2_L_IDFAZ ,1,2) = '" + strzero(val(cLinha),2)  + "' "


cFiltro += "%"

BeginSql alias cAlias
	SELECT
	MAX(A2_L_IDFAZ) AS IDFAZ
	FROM
	%table:SA2%
	WHERE
	A2_L_TPFOR IN ('P','T')
	//A2_C_TPFOR IN  %exp:U_ajusSQL(_cPLEITE)% //#LETRAS
	AND %notDel% AND A2_FILIAL = %xFilial:SA2%
	%exp:cFiltro%
Endsql


cRet := TRBIDFAZ->IDFAZ

cRet := Soma1(cRet)

Return cRet


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณgetIdTanquบ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Busca o ID do tanque.                                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Generico.                                                  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function getIdTanque(cIdFaz)

Local cRet := ""

cRet := "T" + Substr(cIdFaz,1,2)+SubStr(cIdFaz,4,3)

Return cRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณlstTanque   บ Autor ณ Jeovane            	บ Data da Criacao  ณ 30/09/2010                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Monta Tela para consulta de Tanques                                                                			บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Tem por objetivo auxiliar na escolha dos codigos de tanques   												บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum.                                                                                 						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                 	                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Logistica                                                                               						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function lstTanque()

Local i := 0

Local _cTANQUE := U_GETRELA1("1","ZL1_TANQUE") //#LETRAS

Private nTam      := 0
Private nMaxSelect := 0
Private aCat      := {}
Private MvRet     := Alltrim(ReadVar())
Private MvPar     := ""
Private cTitulo   := ""
Private MvParDef  := ""

#IFDEF WINDOWS
	oWnd := GetWndDefault()
#EndIf

//Tratamento para carregar variaveis da lista de opcoes
nTam:=6
nMaxSelect := 1 //14 * 7 = 98 (cod(6) +";") = 7
cTitulo :="Tanques"
cAlias := "TRBTANQUES"

If Select(cAlias) > 0
	dbSelectArea(cAlias)
	dbCloseArea(cAlias)
EndIf

//cFiltro := "% AND A2_L_LI_RO = '" + M->A2_L_LI_RO + "'%"

//AND A2_L_CLASS = 'D'
BeginSql alias cAlias
	SELECT
	DISTINCT A2_L_TANQ,A2_NOME,A2_L_LI_RO
	FROM
	%table:SA2%
	WHERE
	A2_FILIAL = %xFilial:SA2%
	AND A2_L_TPFOR IN ('P','T') 
	//AND A2_C_TPFOR IN %U_ajusSQL(_cTANQUE)% 
	AND A2_L_CLASS = 'D'
	AND A2_L_LI_RO = %exp:M->A2_L_LI_RO%
	AND %notDel%
EndSql

TRBTANQUES->(dbGoTop())
while TRBTANQUES->(!eof())
	MvParDef += AllTrim(TRBTANQUES->A2_L_TANQ)
	aAdd(aCat,AllTrim(TRBTANQUES->A2_NOME )) //AllTrim(ACY->ACY_GRPVEN)+" - "+
	TRBTANQUES->(dbSkip())
enddo



MvPar:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
&MvRet:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))


//Executa funcao que monta tela de opcoes
f_Opcoes(@MvPar,cTitulo,aCat,MvParDef,12,49,.F.,nTam,nMaxSelect)


//Tratamento para separar retorno com barra ";"
&MvRet := ""
For i:=1 to Len(MvPar) step 6
	If !(SubStr(MvPar,i,1) $ " |*")
		&MvRet  += SubStr(MvPar,i,6) + ";"
	EndIf
Next i


//Trata para tirar o ultimo caracter
&MvRet := SubStr(&MvRet,1,Len(&MvRet)-1)

//Guarda numa variavel Private o retorno da fun็ใo
//cRetlstRed := &MvRet

Return(.T.)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ _DtValid บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna a data valida, ou seja, fora sabado e domingo.     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado no MPSDU para dar Replace, pois a funcao DATAVALIDA  บฑฑ
ฑฑบ          ณ da erro no SX5.                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function _DtValid(dData)

/*
Pode-se usar tambem o LastDay( < dData>, [ nTipo] )
dData Data para calculo. X
nTipo Parโmetro de cแlculo(Numerico).

0 ou Branco - Ultimo dia do mes em Pauta;
1 - Primeiro dia util do mes;
2 - Ultimo dia util do mes;
3 - Proximo dia util apos a data informada.
Se a data informada for util, a funcao retorna a propria data.

*/

If UpPer(ALLTRIM(CDOW(dData))) == "SATURDAY"
	dData := dData+2
ElseIf UpPer(ALLTRIM(CDOW(dData))) == "SUNDAY"
	dData := dData+1
Else
	dData := dData
EndIf

Return(dData)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ClassTq  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna a classificacao do tanque do produtor.             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ClassTq(cTanque)

Local cArea := GetArea()
Local cRet  := ""

dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)
	cRet := ZLS->ZLS_CLASTQ
EndIf

//*************************
//Classificacao do Tanque
//*************************
//I -> Individual - So um produtor usa o tanque
//P -> Plataforma - Leite entregue pelo produtor, em latao direto no laticinio
//C -> Coletivo
//     Varios produtores usam o tanque;
//     Um deles eh titular(Dono ou Administra) do tanque;
//     Analise de qualidade por tanque.
//U -> Comunitario
//     Varios produtores usam o tanque;
//     Um deles eh titular(Dono ou Administra) do tanque;
//     Analise de qualidade por produtor.

RestArea(cArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ DonoTq   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o dono do tanque do produtor.                      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function DonoTq(cTanque)

Local cArea := GetArea()
Local cRet  := ""

dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)
	cRet := ZLS->ZLS_ENTIDA
EndIf

//****************************************
//Entidade proprietaria (Dono) do Tanque
//****************************************
//P-Produtor
//L-Laticinio
//A-Associacao
//E-Prefeitura

RestArea(cArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ TitTq    บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna se o produtor passado nos parametro eh ou nao o    บฑฑ
ฑฑบ          ณ titular do tanque.                                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MGLT009()                                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function TitTq(cProdutor,cLoja)

Local cArea := GetArea()
Local cRet  := "N"
Local cQry  := ""

cQry := "SELECT ZLT_TITULA FROM "+RetSqlName("ZLT")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLT_SA2COD = '" + cProdutor + "'"
cQry += " AND ZLT_SA2LJ  = '" + cLoja + "'"

If Select("TITQ") <> 0
	TITQ->(dbCloseArea("TITQ"))
EndIf
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TITQ", .F., .T.)
If !TITQ->(Eof())
	cRet := TITQ->ZLT_TITULA
EndIf

TITQ->(dbCloseArea("TITQ"))
RestArea(cArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ProdTit  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o produtor+loja titular do tanque.                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ GENERICO                                                   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ProdTit(cTanque)

Local cArea := GetArea()
Local cRet  := ""
Local cQry  := ""

cQry := "SELECT ZLT_SA2COD,ZLT_SA2LJ FROM "+RetSqlName("ZLT")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLT_COD    = '" + cTanque + "'"
cQry += " AND ZLT_TITULA = 'S'"

If Select("PRTQ") <> 0
	PRTQ->(dbCloseArea("PRTQ"))
EndIf
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "PRTQ", .F., .T.)
If !PRTQ->(Eof())
	cRet := PRTQ->ZLT_SA2COD+PRTQ->ZLT_SA2LJ
EndIf

PRTQ->(dbCloseArea("PRTQ"))
RestArea(cArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ LeiTq    บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna se o produtor passado nos parametro eh ou nao o    บฑฑ
ฑฑบ          ณ leiteiro do tanque.                                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MGLT009()                                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function LeiTq(cProdutor,cLoja,cEvento)

Local cArea := GetArea()
Local cRet  := "N"
Local cQry  := ""
Local lFrt1 := If(cEvento==AllTrim(GetMV("LT_EVEFRT1")),.T.,.F.)

//Verifica se o evento se trata de evento de Frete.
//Caso seja deve-se avaliar se o produtor eh leiteiro ou nao.
//Caso contrario, se o evento nao eh de frete, sempre retorna Nao.
If lFrt1
	cQry := "SELECT ZLT_LEITEI FROM "+RetSqlName("ZLT")
	cQry += " WHERE D_E_L_E_T_ = ' '"
	cQry += " AND ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
	cQry += " AND ZLT_SA2COD = '" + cProdutor + "'"
	cQry += " AND ZLT_SA2LJ  = '" + cLoja + "'"

	If Select("TLEI") <> 0
		TLEI->(dbCloseArea("TLEI"))
	EndIf
	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TLEI", .F., .T.)
	If !TLEI->(Eof())
		cRet := TLEI->ZLT_LEITEI
	EndIf

	TLEI->(dbCloseArea("TLEI"))
EndIf

RestArea(cArea)
Return(cRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ValidTq  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna se o tanque pode ser utilizado pelo produtor.      บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ValidTq(cCod,cLoj,cTq)

Local cArea := GetArea()
Local lRet  := .T.

dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTq)
	dbSelectArea("ZLT")
	dbSetOrder(1)//ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ
	If !dbSeek(xFILIAL("ZLT")+ZLS->ZLS_COD+cCod+cLoj)
		lRet := .F.
		xMagHelpFis("Produtor X Tanque","O tanque "+cTq+" nใo possui o produtor "+cCod+"/"+cLoj+" cadastrado no mesmo.","Acesse o cadastro de tanques(ZLS) e informe este produtor nos itens(ZLT) do tanque.")
	EndIf
Else
	lRet := .F.
	xMagHelpFis("Inexistente","O codigo "+cTq+" de tanque nใo existe no cadastro de tanques(ZLS).","Pressione F3 e selecione um tanque.")
EndIf

RestArea(cArea)
Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VlrRepFrtบ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o valor do repasse de frete.                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VlrRepFrt(cTanque,cTipo,cCodFX,cEvetRep)

Local cArea   := GetArea()
Local nVlr    := 0
Local nRet    := 0

DEFAULT cCodFX := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Posiciona no cadastro de Tanques - Cabecalho. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Posiciona no cadastro de Tanques - Itens.     ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("ZLT")
	dbSetOrder(1)//ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ
	If dbSeek(xFILIAL("ZLT")+cTanque+SA2->A2_COD+SA2->A2_LOJA)

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ              T A X A    D E    F R E T E                              ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		//Se o evento esta sendo executado para o Leiteiro.
		If ZLT->ZLT_LEITEI == "S"
			//Tipo de Taxa de Frete igual a LITRO.
			If ZLS->ZLS_TPFRT == "L"
				nRet := ZLS->ZLS_TXFRT * U_VLTETQ(cTanque,FirstDay(dDataBase),LastDay(dDataBase))
			ElseIf ZLS->ZLS_TPFRT == "K"//Tipo de Taxa de FRETE igual a KM
				nRet := U_KMTQ(ZLS->ZLS_TXFRT,ZLS->ZLS_KM,(LastDay(dDataBase)-FirstDay(dDataBase))+1)
			EndIf
		Else//O evento esta sendo executado para um participante do tanque
			//Tipo de Taxa de Frete igual a Litro
			If ZLS->ZLS_TPFRT == "L"
				nRet := (ZLS->ZLS_TXFRT * U_VLTETQ(cTanque,FirstDay(dDataBase),LastDay(dDataBase),.T.,.F.)) *;
				(U_PercAgr(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase))/100)
			ElseIf ZLS->ZLS_TPFRT == "K"//Tipo de Taxa de FRETE igual a KM
				nVlr := U_KMTQ(ZLS->ZLS_TXFRT,ZLS->ZLS_KM,(LastDay(dDataBase)-FirstDay(dDataBase))+1)
				nRet := nVlr * (U_PercAgr(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase))/100)
				nRet := U_Arred(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase),nRet,nVlr,cEvetRep)
			EndIf
		EndIf
	EndIf
EndIf

RestArea(cArea)
Return(nRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ KMTQ     บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o valor do repasse de resfriamento.                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function KMTQ(nVlrKm,nQtdKm,nQtdDias)

Local cArea := GetArea()
Local nRet  := nVlrKm * nQtdKm * nQtdDias

RestArea(cArea)
Return(nRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VlrRepRfmบ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o valor do repasse de resfriamento.                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VlrRepRfm(cTanque,cTipo,cCodFX,cEvetRep)

Local cArea   := GetArea()
Local nVlr    := 0
Local nRet    := 0

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Posiciona no cadastro de Tanques - Cabecalho. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Posiciona no cadastro de Tanques - Itens.     ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	dbSelectArea("ZLT")
	dbSetOrder(1)//ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ
	If dbSeek(xFILIAL("ZLT")+cTanque+SA2->A2_COD+SA2->A2_LOJA)

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ            T A X A    D E    R E S F R I A M E N T O                  ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		//Se o evento esta sendo executado para o Titular do Tanque.
		If ZLT->ZLT_TITULA == "S"
			//Tipo de Taxa de Resfriamento igual a valor Fixo.
			If ZLS->ZLS_TPRES == "F"
				nRet := ZLS->ZLS_TXRES
				nVlr := ZLS->ZLS_TXRES
			ElseIf ZLS->ZLS_TPRES == "V" //Tipo de Taxa de Resfriamento igual a Volume
				nRet := U_GETFAIXA(XFILIAL("ZL9"),"000001",cCodFX,U_VLTETQ(cTanque,FirstDay(dDataBase),LastDay(dDataBase)))
				nVlr := nRet
			EndIf
		Else//O evento esta sendo executado para um agregado
			//Tipo de Taxa de Resfriamento igual a valor Fixo
			If ZLS->ZLS_TPRES == "F"
				nVlr := ZLS->ZLS_TXRES
				nRet := ZLS->ZLS_TXRES * (U_PercAgr(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase))/100)
				nRet := U_Arred(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase),nRet,nVlr,cEvetRep)
			ElseIf ZLS->ZLS_TPRES == "V" //Tipo de Taxa de Resfriamento igual a Volume
				nRet := U_GETFAIXA(XFILIAL("ZL9"),"000001",cCodFX,U_VLTETQ(cTanque,FirstDay(dDataBase),LastDay(dDataBase)))
				nVlr := nRet
				nRet := nRet * (U_PercAgr(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase))/100)
				nRet := U_Arred(cTanque,cTipo,SA2->A2_COD,SA2->A2_LOJA,FirstDay(dDataBase),LastDay(dDataBase),nRet,nVlr,cEvetRep)
			EndIf
		EndIf
	EndIf
EndIf

RestArea(cArea)
Return(nRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VLTETQ   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o volume total de leite de um tanque.              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em VlrRepas().                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VLTETQ(cCodTq,dDtIni,dDtFim,lLeiteiro,lTitular)

Local cArea := GetArea()
Local cQry  := ""
Local nTot  := 0

Default lLeiteiro := .F.
Default lTitular  := .F.

cQry := "SELECT SUM(ZLD.ZLD_QTDBOM) AS QTDE FROM "
cQry += RetSqlName("ZLT") + "  ZLT, " + RetSqlName("ZLD") + "  ZLD"
cQry += " WHERE ZLT.D_E_L_E_T_ = ' ' AND ZLD.D_E_L_E_T_ = ' '"
cQry += " AND ZLT.ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLD.ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry += " AND ZLT.ZLT_SA2COD = ZLD.ZLD_RETIRO"
cQry += " AND ZLT.ZLT_SA2LJ  = ZLD.ZLD_RETILJ"
cQry += " AND ZLT.ZLT_COD    = '"+ cCodTq +"'"
cQry += " AND ZLD_DTCOLE  >= '"+DTOS(dDtIni)+"' AND ZLD_DTCOLE  <= '"+DTOS(dDtFim)+"' "

//Se considera o volume de todos que tem desconto de Frete
If lLeiteiro
	cQry += " AND ZLT_DESCFR = 'S'"
EndIf

//Se considera o volume de todos que tem desconto de Resfriamento
If lTitular
	cQry += " AND ZLT_DESCRE = 'S'"
EndIf

If Select("TZLD") <> 0
	TZLD->(dbCloseArea("TZLD"))
EndIf

TCQUERY cQry NEW ALIAS "TZLD"

dbSelectArea("TZLD")
If !TZLD->(Eof())
	nTot := TZLD->QTDE
EndIf

TZLD->(dbCloseArea("TZLD"))
RestArea(cArea)
Return(nTot)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ QTDKML   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o volume total de leite de um tanque.              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em VlrRepas().                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function QTDKML(cCodLin,dDtIni,dDtFim)

Local cArea := GetArea()
Local cQry  := ""
Local nTot  := 0

cQry := "SELECT (SUM(ZLD.ZLD_KM)/COUNT(1)) AS QTDE FROM "
cQry += + RetSqlName("ZLD") + "  ZLD"
cQry += " WHERE ZLD.D_E_L_E_T_ = ' '"
cQry += " AND ZLD.ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry += " AND ZLD.ZLD_LINROT    = '"+ cCodLin +"'"
cQry += " AND ZLD_DTCOLE  >= '"+DTOS(dDtIni)+"' AND ZLD_DTCOLE  <= '"+DTOS(dDtFim)+"' "

If Select("TZLD") <> 0
	TZLD->(dbCloseArea("TZLD"))
EndIf
cQry := changequery(cQry)
TCQUERY cQry NEW ALIAS "TZLD"
//dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TZLD", .F., .T.)
If !TZLD->(Eof())
	nTot := TZLD->QTDE
EndIf

TZLD->(dbCloseArea("TZLD"))

RestArea(cArea)
Return(nTot)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ PercAgr  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o percentual correspondente ao produtor.           บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑบ          ณ O desconto do tanque eh rateado proporcionalmente ao       บฑฑ
ฑฑบ          ณ volume de leite de cada produtor, ou seja, quem produz     บฑฑ
ฑฑบ          ณ mais leite paga um valor maior do que um produtor que      บฑฑ
ฑฑบ          ณ produz menos.                                              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em VlrRepas().                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function PercAgr(cTanque,cTipo,cProdutor,cLoja,dDtIni,dDtFim)

Local cArea := GetArea()
Local cQry  := ""
Local nTot  := 0
Local nQtd  := 0
Local nRet  := 0

cQry := "SELECT ZLD_RETIRO,ZLD_RETILJ,SUM(ZLD_QTDBOM) AS QTDE FROM "
cQry += RetSqlName("ZLT")+ " ZLT, "+RetSqlName("ZLD")+" ZLD"
cQry += " WHERE ZLT.D_E_L_E_T_ = ' ' AND ZLD.D_E_L_E_T_ = ' '"
cQry += " AND ZLT.ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLD.ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry += " AND ZLT.ZLT_SA2COD  = ZLD.ZLD_RETIRO"
cQry += " AND ZLT.ZLT_SA2LJ   = ZLD.ZLD_RETILJ"
cQry += " AND ZLT.ZLT_COD = '" + cTanque + "'"
cQry += " AND ZLD.ZLD_DTCOLE >= '"+DTOS(dDtIni)+"' AND ZLD.ZLD_DTCOLE <= '"+DTOS(dDtFim)+"'"
If cTipo == "R"//Resfriamento
	cQry += " AND ZLT.ZLT_DESCRE = 'S'"
ElseIf cTipo == "F"//Frete
	cQry += " AND ZLT.ZLT_DESCFR = 'S'"
EndIf
cQry += " GROUP BY ZLD_RETIRO,ZLD_RETILJ"

If Select("TZLT") <> 0
	TZLT->(dbCloseArea("TZLT"))
EndIf
cQry := CHANGEQUERY(cQry)

dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TZLT", .F., .T.)

While TZLT->(!Eof())

	If ALLTRIM(cProdutor+cLoja) == ALLTRIM(TZLT->ZLD_RETIRO+TZLT->ZLD_RETILJ)
		nQtd := TZLT->QTDE
	EndIf

	nTot += TZLT->QTDE
	TZLT->(dbSkip())
EndDo

//Acha o percentual correspondente da quantidade do produtor
nRet := nQtd*100 / nTot

TZLT->(dbCloseArea("TZLT"))
RestArea(cArea)
Return(nRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Arred    บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o arrendondado.                                    บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑบ          ณ O desconto do tanque eh rateado proporcionalmente ao       บฑฑ
ฑฑบ          ณ volume de leite de cada produtor. Com isto o calculo pode  บฑฑ
ฑฑบ          ณ gerar diferenca de centavos. Para amenizar este efeito,    บฑฑ
ฑฑบ          ณ esta funcao ira somar ou subtrair ate cinco centavos para  บฑฑ
ฑฑบ          ณ ajustar o valor final do repasse.                          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em VlrRepas().                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ParC01 - Codigo do tanque.                                 บฑฑ
ฑฑบ          ณ ParC02 - Tipo da taxa, Resfriamento ou Frete.              บฑฑ
ฑฑบ          ณ ParC03 - Codigo do Produtor.                               บฑฑ
ฑฑบ          ณ ParC04 - Loja do Produtor.                                 บฑฑ
ฑฑบ          ณ ParD05 - Data Inicio dos eventos e volume leite.           บฑฑ
ฑฑบ          ณ ParD06 - Data Final dos eventos e volume leite.            บฑฑ
ฑฑบ          ณ ParN07 - Valor do desconto de repasse do produtor agregado.บฑฑ
ฑฑบ          ณ ParN08 - Valor do credito de repasse do produtor titular.  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function Arred(cTanque,cTipo,cProdutor,cLoja,dDtIni,dDtFim,nVlrDes,nVlrCre,cEvetRep)

Local cArea := GetArea()
Local cQry  := ""
Local nTot  := 0
Local nDif  := 0
Local nRet  := 0

cQry := "SELECT ZLD_RETIRO,ZLD_RETILJ,SUM(ZLD_QTDBOM) AS QTDE,ZLF_TOTAL AS VLR FROM "
cQry += RetSqlName("ZLT")+ "  ZLT, "+RetSqlName("ZLD")+" ZLD, "+RetSqlName("ZLF")+"  ZLF"
cQry += " WHERE ZLT.D_E_L_E_T_ = ' ' AND ZLD.D_E_L_E_T_ = ' ' AND ZLF.D_E_L_E_T_ = ' '"
cQry += " AND ZLT.ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLD.ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry += " AND ZLF.ZLF_FILIAL = '" + xFILIAL("ZLF") + "'"
cQry += " AND ZLT.ZLT_SA2COD  = ZLD.ZLD_RETIRO"
cQry += " AND ZLT.ZLT_SA2COD  = ZLF.ZLF_RETIRO"
cQry += " AND ZLT.ZLT_SA2LJ   = ZLD.ZLD_RETILJ"
cQry += " AND ZLT.ZLT_SA2LJ   = ZLF.ZLF_RETILJ"
cQry += " AND ZLT.ZLT_COD = '" + cTanque + "'"
cQry += " AND ZLD.ZLD_DTCOLE  BETWEEN '"+DTOS(dDtIni)+"' AND '"+DTOS(dDtFim)+"'"
If cTipo == "R"//Resfriamento
	cQry  += " AND ZLT.ZLT_DESCRE = 'S'"
Else//Frete
	cQry  += " AND ZLT.ZLT_DESCFR = 'S'"
EndIf
cQry += " AND ZLF.ZLF_EVENTO = '" + cEvetRep + "'"
cQry += " AND ZLF.ZLF_DEBCRE = 'D'"
cQry += " AND ZLF.ZLF_DTINI = '"+DTOS(dDtIni)+"'"
cQry += " AND ZLF.ZLF_DTFIM = '"+DTOS(dDtFim)+"'"
cQry += " GROUP BY ZLD_RETIRO,ZLD_RETILJ,ZLF_TOTAL"

If Select("TARR") <> 0
	TARR->(dbCloseArea("TARR"))
EndIf
cQry := CHANGEQUERY(cQry)
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TARR", .F., .T.)

While TARR->(!Eof())
	nTot += TARR->VLR
	TARR->(dbSkip())
EndDo

//Verifica o tamanho da diferenca
//Se o valor total do Repasse menos o valor total do que ja foi descontado de repasse
//for ate r$ 0,05 centavos, ajusta.
nDif := nVlrCre - (nTot + nVlrDes)
If nDif >= -0.05 .And. nDif <= 0.05
	nRet := nVlrDes + nDif
Else
	nRet := nVlrDes
EndIf

TARR->(dbCloseArea("TARR"))
RestArea(cArea)
Return(nRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ NroAgreg บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o numero de agregados de um tanque.                บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em VlrRepas().                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function NroAgreg(cTanque,cTipo)

Local cArea := GetArea()
Local cQry  := ""
Local nTot  := 0

cQry  := " SELECT COUNT(*) AS QTDE FROM " + RETSQLNAME("ZLT") + " ZLT "
cQry  += " WHERE ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry  += " AND ZLT_COD    = '"+ cTanque +"'"
If cTipo == "R"//Refriamento
	cQry  += " AND ZLT_DESCRE = 'S'"
Else//Frete
	cQry  += " AND ZLT_DESCFR = 'S'"
EndIf
cQry  += " AND (ZLT.D_E_L_E_T_ = ' ')"

If Select("TZLT") <> 0
	TZLT->(dbCloseArea("TZLT"))
EndIf
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TZLT", .F., .T.)
If !TZLT->(Eof())
	nTot := TZLT->QTDE
EndIf

TZLT->(dbCloseArea("TZLT"))
RestArea(cArea)
Return(nTot)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ NroDay   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o numero de dias que tem o mes da database.        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function NroDay()
Return( (LastDay(dDatabase) - FirstDay(dDatabase))+1 )

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MaisLte  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 23/03/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna a Media de volume de leite do produtor na ultima safra (usado nas formulas dos eventos).             บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑบ          ณ Safra (nas aguas) vai de Outubro a Marco.				                               						บฑฑ
ฑฑบ          ณ Entressafra ( nas secas) Abril a Setembro.				                               						บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cpTipo (Latao ou Tanque); cpTpForn (Produtor ou Fretista); cFilLinha (S=Filtra Linha N=Nao Filtra linha)     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Media do volume de leite do produtor na safra.                                                              	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MaisLte(cSafraINI,cSafraFIM)

Local cArea  := GetArea()
Local cQry2  := ""
Local nTot   := 0
Local lSafra := .F.
Local cAnoPas:= ALLTRIM(Str(Val(Substr(DTOS(dDataBase),1,4))-1)) //Ano passado
Local cAnoAtu:= Substr(DTOS(dDataBase),1,4) //Ano Atual
Local cDtINI := cAnoPas+cSafraINI+"01" // 01/10/2010
Local cDtFIM := cAnoAtu+cSafraFIM+"31" // 31/03/2011

//Bonificacao no periodo de entressafra (De 04-Abril a 09-Setembro desse ano).
//Busca a media da ultima safra (De 10-Outubro do ano passado a 03-Marco desse ano).
cQry2  := " SELECT AVG(ZLD_QTDBOM) AS MEDIA FROM " + RETSQLNAME("ZLD") + " ZLD "
cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry2  += " AND ZLD_DTCOLE BETWEEN  '" + cDtINI + "' AND '" + cDtFIM + "'"
cQry2  += " AND ZLD_SETOR  = '"+ ZL2->ZL2_COD +"'"
cQry2  += " AND ZLD_RETIRO = '"+ SA2->A2_COD  + "'"
cQry2  += " AND ZLD_RETILJ = '"+ SA2->A2_LOJA + "'"
cQry2  += " AND (ZLD.D_E_L_E_T_ = ' ')"

If Select("MED1") <> 0
	MED1->(dbCloseArea("MED1"))
EndIf
cQry2 := CHANGEQUERY(cQry2)
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "MED1", .F., .T.)
If !MED1->(Eof())
	nTot := MED1->MEDIA
EndIf

MED1->(dbCloseArea("MED1"))
RestArea(cArea)
Return(nTot)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VeiTranspบ Autor ณ TOTVS                 บ Data da Criacao  ณ 22/12/2008                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna os veiculos de determinado Transportador.                                                            บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Transportador e Loja.					                               										บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Codigo dos veiculos.                                															บฑฑ
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
User Function VeiTransp(cFretis,cLj)

Local aArea   := GetArea()
Local cMot    := ""
//Alterado para parametros da funcao para atender a modificacao nas rotas
//Local cFretis := M->ZL3_FRETIS
//Local cLj     := M->ZL3_FRETLJ
Local cQuery  := ""

// Percorre o cadastro de Motorista
// e para cada motorista da Transportadora
// busca o veiculo

/*
//Cadastro de Motorista
dbSelectArea("ZL0")
dbSetOrder(1)
dbGoTop()

While ZL0->(!Eof())
//Valida se o motorista pertence a transportadora
If ALLTRIM(ZL0->ZL0_FRETIS) == ALLTRIM(cFretis) .And. ALLTRIM(ZL0->ZL0_FRETLJ) == ALLTRIM(cLj)
//Cadastro de veiculo
dbSelectArea("ZL4")
dbSetOrder(3)//ZL4_FILIAL+ZL4_MOTORI
If dbSeek(xFILIAL("ZL4")+ZL0->ZL0_COD)//Pesquisa com o codigo do motorista
cMot += ZL4->ZL4_COD+"/" //Codigo do Veiculo
EndIf
EndIf
ZL0->(dbSkip())
EndDo
*/

cQuery := "SELECT ZL4_COD FROM "+RetSqlName("ZL0")+" ZL0, "+RetSqlName("ZL4")+" ZL4"
cQuery += " WHERE ZL0.D_E_L_E_T_ = ' '"
cQuery += " AND ZL4.D_E_L_E_T_ = ' '"
cQuery += " AND ZL0_FILIAL = '"+xFILIAL("ZL0")+"'"
cQuery += " AND ZL4_FILIAL = '"+xFILIAL("ZL4")+"'"
cQuery += " AND ZL0_FRETIS = '"+cFretis+"'"
cQuery += " AND ZL0_FRETLJ = '"+cLj+"'"
cQuery += " AND ZL0_COD = ZL4_MOTORI"

If Select("MOT") <> 0
	MOT->(dbCloseArea("MOT"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "MOT", .T., .F. )

While MOT->(!Eof())
	If !Empty(MOT->ZL4_COD)
		cMot += MOT->ZL4_COD+"/" //Codigo do Veiculo
	EndIf
	MOT->(dbSkip())
EndDo

MOT->(dbCloseArea())
RestArea(aArea)
Return(cMot)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VldProd  บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida o produtor no cadastro de tanque, para que o mesmo  บฑฑ
ฑฑบ          ณ produtor nao seja usado em tanques diferentes.             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Cadastro de Tanques.                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VldProd(cCodTq,cCodPro,cLoja)

Local lRet    := .T.
Local cQry    := ""
Local nProc   := 0
Local aArea   := GetArea()
Local nPosCod := Ascan(aHeader,{|x| AllTrim(x[2]) == "ZLT_SA2COD"})
Local nPosLoj := Ascan(aHeader,{|x| AllTrim(x[2]) == "ZLT_SA2LJ"})

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ VALIDA SE O PARTICIPANTE JA ESTA EM OUTRO TANQUE. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
cQry := " SELECT COUNT(*) AS CONTADOR FROM " + RETSQLNAME("ZLT") + " ZLT "
cQry += " WHERE ZLT_FILIAL = '" + xFILIAL("ZLT") + "'"
cQry += " AND ZLT_COD <> '"+ cCodTq  + "'"
cQry += " AND ZLT_SA2COD = '"+ cCodPro +"'"
cQry += " AND ZLT_SA2LJ  = '"+ cLoja  + "'"
cQry += " AND (ZLT.D_E_L_E_T_ = ' ')"

If Select("TZLT") <> 0
	TZLT->(dbCloseArea("TZLT"))
EndIf
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry), "TZLT", .F., .T.)

If !TZLT->(Eof()) .And. TZLT->CONTADOR > 0
	lRet := .F.
	MsgAlert("Este PARTICIPANTE ja esta sendo utilizado em outro tanque.")
EndIf
dbCloseArea("TZLT")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica se o participante digitado ja existe neste tanque ou nao. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
For nProc := 1 To Len(Acols)
	If nProc <> n .And. Acols[nProc,nPosCod] == cCodPro .And. Acols[nProc,nPosLoj] == cLoja
		xMagHelpFis("Produtor repetido",;
		"Nใo ้ permitido utilizar o mesmo Produtor/Loja mais de uma vez no mesmo Tanque.",;
		"Escolha outro Produtor/Loja.")
		Return(.F.)
	EndIf
Next

RestArea(aArea)
Return(lRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MedCol   บ Autor ณ Microsiga          บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna o media por coleta de determinado perํodo          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado em Eventos(Zl8).                                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MedCol(cvLin,cvretiro,cvljret,dviDtCol,dvfDtCol)

Local nRet		 := 0
Local nDiasM 	 := GetMv("LT_DIASMC") //Numero de dias para m้dia de coleta


cQuery := "SELECT (SUM(ZLD_TOTBOM)/COUNT(*)) AS MEDIA FROM "
cQuery += RetSqlName("ZLD") + " WHERE D_E_L_E_T_ = ' ' "
cQuery += "  AND ZLD_FILIAL = '" + xFilial("ZLD") + "'"
cQuery += "  AND ZLD_DTLANC >= '" +dtos(dviDtCol)+ "' "
cQuery += "  AND ZLD_DTLANC <= '" +dtos(dvfDtCol)+ "' "
cQuery += "  AND ZLD_LINROT = '" +cvLin+ "' "
cQuery += "  AND ZLD_RETIRO = '" +cvretiro+ "' "
cQuery += "  AND ZLD_RETILJ = '" +cvljret+ "' "


If Select("TZLD") > 0
	dbSelectArea("TZLD")
	TZLD->(dbCloseArea())
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(Upper(cQuery))),'TZLD',.F.,.T.)

If TZLD->(!Eof())
	nRet := TZLD->MEDIA
EndIf

dbSelectArea("TZLD")
TZLD->(dbCloseArea())

Return nRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ RGLTDEP  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 03/03/2011                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Busca o total de credito do produtor dentro do periodo de fechamento.                                        บฑฑ
ฑฑบ          ณ                  												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Implantacao das rotinas referente a Gestao do Leite.                						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cProdutor,cLoja,cMes,cAno,cDiaPgto     		                               						            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor referente a deposito realizado pelo produtor na conta da Empresa.                                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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
User Function RGLTDEP(cProdutor,cLoja,cMes,cAno,cDiaPgto)

Local nVlr   := 0
Local cDtIni := ""
Local cDtFim := ""
Local cQry   := ""
Local cData  := ""
Local cHist  := ""

If Empty(cProdutor) .Or. Empty(cLoja) .Or. Empty(cAno) .Or. Empty(cMes) .Or. Empty(cDiaPgto)
	ApMsgStop("Para buscar os convenios favor informar os parโmetros Produtor, Loja, Mes e Ano.")
	Return(nVlr)
Else
	cDtIni := cAno+cMes+"01"
	cDtFim := cAno+cMes+"31"
EndIf

cQry := "SELECT E2_HIST,E2_EMISSAO,E2_VALOR+E2_ACRESC-E2_DECRESC AS VALOR"
cQry += " FROM "+RetSqlName("SE2")
cQry += " WHERE D_E_L_E_T_ = ' '"
cQry += " AND E2_FILIAL  = '"+xFILIAL("SE2")+"'"
cQry += " AND E2_FORNECE = '"+cProdutor+"'"
cQry += " AND E2_LOJA    = '"+cLoja+"'"
cQry += " AND E2_TIPO    = 'NF '"
cQry += " AND E2_PREFIXO = 'NCF'"
cQry += " AND E2_VENCTO BETWEEN '"+cDtIni+"' AND '"+cDtFim+"'"

If Select("DEP") > 0
	dbSelectArea("DEP")
	dbCloseArea("DEP")
EndIf

dbUseArea(.T.,"TOPCONN",TCGenQry(,,ALLTRIM(UpPer(cQry))),"DEP",.F.,.T.)

If DEP->(!Eof()) .And. DEP->VALOR > 0
	nVlr  := DEP->VALOR
	cData := DTOC(STOD(DEP->E2_EMISSAO))
	cHist := DEP->E2_HIST
EndIf

dbSelectArea("DEP")
dbCloseArea("DEP")

Return({nVlr,cData,cHist})

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AIncent  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 00/00/0000                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณFuncao utilizada para realizar a verificacao do tipo de tributacao(Tributado, isento ou diferido) a que se 	บฑฑ
ฑฑบ			 ณpertence o produtor, verificando o saldo inicial ja lancado para o produtor e considerando o volume atual.    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cCodProd  - Codigo do Produtor																				บฑฑ
ฑฑบ     	 ณ _cEstProd  - Estado do Produtor  																			บฑฑ
ฑฑบ     	 ณ _nVolume   - Volume que esta sendo realizada a insercao do leite na recepcao, considera o volume de forma 	บฑฑ
ฑฑบ          ณ aglutinada no acols por CODIGO DO PRODUTOR + ESTADO DO PRODUTOR									  			บฑฑ
ฑฑบ          ณ_dDtFinal   - Armazena a data final a ser considerada para o calculo do volume total de leite do associado no	บฑฑ
ฑฑบ          ณano.                                                                                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ _aTributac(1 - Tipo de tributacao do leite - 2 Volume de leite)                                             	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ OMS                                                                                  						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AIncent(_cCodProd,_cEstProd,_nVolume,_dDtFinal,_cTpTribut,_cLojProd,_dDtColeta)

Local _cAliasZLD:= ""
Local _cAliasZLX:= ""

Local _sDtInic  := ""
Local _sDtFinal := ""

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSera considerada a database do sistema para determinar o intervalo inicialณ
//ณe final da litragem anual do produtor ficar flexivel.                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
//Local _cAnoAtual:= YEAR(Date())
Local _cAnoAtual:= YEAR(_dDtFinal)

Local _nVolZLD  := 0
Local _nVolZLX  := 0

Local _aTributac:= {}

Local _nVolTrib := 0
Local _nvolIsent:= 0

Local _nVolAnual:= GetMv("LT_LIMINCE")//Armazena a litragem maxima anual que o produtor podera ter para ter seu leite do tipo TRIBUTADO, ao superar este limite muda para ISENTO.

Local _cTipProd	:= POSICIONE("SA2",1,XFILIAL("SA2")+_cCodProd+_cLojProd,"A2_TIPO")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณAlteracao efetuada para que                                                      ณ
//ณa recepcao efetuada no dia 01 do mes 01 de qualquer ano nao seja                 ณ
//ณconsiderada para avaliacao de saldo da litragem anual pois para o calculo        ณ
//ณde tributacao nao se considera o dia de lancamento e como este eh o primeiro dia ณ
//ณdo ano nao deve haver calculo de tributacao.                                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณInidica que estamos no mes de janeiro no seu primeiro dia de qualquer ano.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If SubStr(DtoS(_dDtFinal),5,4) != '0101'

	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณDefine a data inicial como dia 01 do mes 01 do ano corrente isto de acordo com a data do servidor.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	_sDtInic := AllTrim(Str(_cAnoAtual)) + '0101'

	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณAlterada a data final de verificacao de volume para que seja considerado  ณ
	//ณsomente o volume para calculo de tributacao do dia anterior ao lancamento.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
	_sDtFinal:= DtoS(_dDtFinal)

	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se o tipo do leite do produtor eh tributado para realizacao dosณ
	//ณcalculos de enquadramento na faixa de tributacao, somente existe        ณ
	//ณtributacao para o estado de MG, outros estados devem ser considerados   ณ
	//ณcomo diferido.									                       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/

	IF _cTipProd == "F" .And. _cEstProd == 'MG'
	//If _cTpTribut $ 'TI' .And. _cEstProd == 'MG'

		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para realizar o somatorio da litragem do produtor dentro do anoณ
		//ณna recepcao de leite(ZLD), considerando somente o estado de MG.      ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		_cAliasZLD:= GetNextAlias()
		QryInc(2,_cAliasZLD,_cCodProd,_cEstProd,_sDtInic,_sDtFinal,_cLojProd)

		dbSelectArea(_cAliasZLD)
		(_cAliasZLD)->(dbGoTop())

		If !(_cAliasZLD)->(Eof())

			_nVolZLD:= (_cAliasZLD)->QTDELTZLD

		EndIf

		dbSelectArea(_cAliasZLD)
		(_cAliasZLD)->(dbCloseArea())

		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para selecionar a litragem inicial do produtor ou de um outro laticinio.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		_cAliasZLX:= GetNextAlias()
		QryInc(3,_cAliasZLX,_cCodProd,"",_sDtInic,_sDtFinal)

		If Select(_cAliasZLX)<>0
			dbSelectArea(_cAliasZLX)
			(_cAliasZLX)->(dbGoTop())
	
			If !(_cAliasZLX)->(Eof())
	
				_nVolZLX:= (_cAliasZLX)->QTDELTZLX
	
			EndIf
	
			dbSelectArea(_cAliasZLX)
			(_cAliasZLX)->(dbCloseArea())
		EndIf

		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se o leite do produtor atingiu a faixa de 657.000 mudando ณ
		//ณde leite tributado para isento.                                    ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/

		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica a litragem total do produtor sem considerar o leite que esta   ณ
		//ณsendo inserido na recepcao atual, sendo que este leite da recepcao atualณ
		//ณpode se enquadrar em duas faixas tributado e isento.                    ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
		If (_nVolZLD + _nVolZLX) > _nVolAnual
			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณTodo o leite que entrou eh do tipo ISENTO.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			aAdd(_aTributac,{"D",_nVolume})

			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณAtualiza o cadastro do Produto. Caso o campo A2_L_TRIBU for diferente   ณ
			//ณdo calculado, gravar o calculado no campo A2_L_TRIBU e data da altera็aoณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
/*Comentado por Guilherme Fran็a - 11/08/17 pois estแ em desuso
			IF _cTpTribut <> "D"
				dbSelectArea( "SA2" )
				If SA2->(dbseek(xfilial('SA2')+_cCodProd+_cLojProd))
					RecLock("SA2",.F.)

						SA2->A2_L_TRIBU := "D"
						SA2->A2_L_DTINC	:= _dDtColeta

					SA2->(MsUnlock())
				ENDIF
			ENDIF
*/
		Else

			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณTodo o leite que entrou eh do tipo TRIBUTADO.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
			aAdd(_aTributac,{"T",_nVolume})

			/*
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณAtualiza o cadastro do Produto. Caso o campo A2_L_TRIBU for diferente   ณ
			//ณdo calculado, gravar o calculado no campo A2_L_TRIBU                    ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			*/
/*Comentado por Guilherme Fran็a - 11/08/17 pois estแ em desuso
			IF _cTpTribut <> "T"
				dbSelectArea( "SA2" )
				If SA2->(dbseek(xfilial('SA2')+_cCodProd+_cLojProd))
					RecLock("SA2",.F.)

						SA2->A2_L_TRIBU := "T"
						SA2->A2_L_DTINC	:= STOD("")         

					SA2->(MsUnlock())
				ENDIF
			ENDIF
*/
		EndIf

		/*
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณLeite do produtor do tipo diferido.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		*/
	Else

		//1 - Tipo de tributacao do leite(D - Diferido /T - Tributado / I - Isento)
		//2 - Volume de leite para cada tipo de tributacao
		aAdd(_aTributac,{"I",_nVolume})

	EndIf

	/*
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณRealiza a atualizacao do status do lancamento dos saldos iniciais ณ
	//ณcomo ja utilizado para realizar o calculo do incentivo a producao.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	*/
//	QryInc(4,,_cCodProd,"",_sDtInic,_sDtFinal)

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuando for o primeiro dia de qualquer ano nao efetuara nenhum calculo         ณ
	//ณcom relacao a tributacao do leite, pois para o calculo da tributacao do leite ณ
	//ณnao se considera o dia de lancamento como este eh o primeiro dia do ano nao seณ
	//ณfaz nenhum tipo de calculo.                                                   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Else

	aAdd(_aTributac,{_cTpTribut,_nVolume})

EndIf

Return _aTributac

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ QryInc   บ Autor ณ                       บ Data da Criacao  ณ 00/00/0000                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณFuncao utilizada para executar querys no banco de dados.														บฑฑ
ฑฑบ			 ณ																											    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _nOpcao    - Numero da query a ser executada.																บฑฑ
ฑฑบ     	 ณ _cAlias    - Alias da query	     																			บฑฑ
ฑฑบ     	 ณ _cCodProd  - Codigo do Produtor																				บฑฑ
ฑฑบ			 ณ _cEstProd  - Estado do Produtor																				บฑฑ
ฑฑบ			 ณ _sDtIni    - Data inicial para checagem da litragem															บฑฑ
ฑฑบ			 ณ _sDtFinal  - Data final para checagem da litragem															บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum					                                                                                  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ OMS                                                                                  						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function QryInc(_nOpcao,_cAlias,_cCodProd,_cEstProd,_sDtIni,_sDtFinal,_cLojProd)

Local _cQuery:= ''

Do Case

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณQuery para realizar o somatorio da litragem do produtor dentro do anoณ
	//ณna recepcao de leite(ZLD).                                           ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 2

		BeginSql alias _cAlias
			SELECT
			SUM(ZLD.ZLD_QTDBOM) QTDELTZLD
			FROM
			%Table:ZLD% ZLD
			JOIN %Table:SA2% SA2 ON SA2.A2_COD = ZLD.ZLD_RETIRO AND SA2.A2_LOJA = ZLD.ZLD_RETILJ
			WHERE
			ZLD_FILIAL = %Exp:xFilial("ZLD")%
			AND ZLD.D_E_L_E_T_ = ' '
			AND SA2.D_E_L_E_T_ = ' '
			AND ZLD.ZLD_RETIRO = %Exp:_cCodProd%
			AND SA2.A2_EST = %Exp:_cEstProd%
			AND ZLD.ZLD_RETILJ = %Exp:_cLojProd%
			AND ZLD.ZLD_DTCOLE BETWEEN %Exp:_sDtIni% AND %Exp:_sDtFinal%
		EndSql

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณQuery para selecionar o somatorio da litragem que foi fornecida como     ณ
		//ณsaldo inicial do produtor ou saldo de fornecidomento de leite para outro ณ
		//ณlaticionio dentro do mesmo ano.                                          ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 3
/*
		BeginSql alias _cAlias
			SELECT
			SUM(ZLX_LITRAG) QTDELTZLX
			FROM
			%Table:ZLX%
			WHERE
			D_E_L_E_T_ = ' '
			AND ZLX_FILIAL = %Exp:xFilial("ZLX")%
			AND ZLX_PRODUT = %Exp:_cCodProd%
			AND ZLX_DATA BETWEEN %Exp:_sDtIni% AND %Exp:_sDtFinal%
		EndSql
*/
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณRealiza a atualizacao do status do lancamento dos saldos iniciais ณ
		//ณcomo ja utilizado para realizar o calculo do incentivo a producao.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	Case _nOpcao == 4

		_cQuery := "UPDATE "
		_cQuery += RetSqlName("ZLX")
		_cQuery += " SET ZLX_FLAG = 'S' "
		_cQuery += "WHERE D_E_L_E_T_ = ' '"
		_cQuery += " AND ZLX_FILIAL  = '" + xFilial("ZLX") + "'"
		_cQuery += " AND ZLX_PRODUT  = '" + _cCodProd      + "'"
		_cQuery += " AND ZLX_FLAG = 'N'"
		_cQuery += " AND ZLX_DATA BETWEEN '" + _sDtIni + "' AND '" + _sDtFinal + "'"

		TCSqlExec(_cQuery)

EndCase

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ AtuStatusบ Autor ณ TOTVS                	บ Data da Criacao  ณ 23/05/2012                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para gravar o status dos fechamentos.                                                      		    บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Fechamento do leite.                              															บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Alias/Nome da tabela.                                                                   						บฑฑ
ฑฑบ			 ณ Conteudo a ser gravado na tabela.                                                       						บฑฑ
ฑฑบ          ณ Codigo do Produtor.                           						                                        บฑฑ
ฑฑบ          ณ Loja do Produtor.                             						                                        บฑฑ
ฑฑบ          ณ Codigo de tributacao.                         						                                        บฑฑ
ฑฑบ          ณ "S" define uma nota por produtor; "N" uma nota por municipio.                                                บฑฑ
ฑฑบ          ณ Se nota por municipio, passar o codigo do municipio.                                                         บฑฑ
ฑฑบ          ณ Se nota por municipio, passar a Unidade Federativa (Ex: MG ).                                                บฑฑ
ฑฑบ          ณ Data inicio do MIX.                           						                                        บฑฑ
ฑฑบ          ณ Data fim do MIX.                           						                                            บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum                                                 	                                                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ                                                                                          					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Logistica                                                                               						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ----------ณ----------ณ--------------------------------------------------ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function AtuStatus(cValor,cProdutor,cLoja,cPrefixo,cNroNota,cTribu,cMultNota,cMun,cUF,dDtIni,dDtFIm)
	
	Local cUpdate 		:= ""
	Local aTab01  		:= {"ZL9","ZLP","ZLS","ZLA","ZLN","ZLH"}//TIPOS DE FAIXAS / VLR X GRUPO BONIFICACAO / ANALISES X DATA CALCULO / FAIXA DE INDICACAO /GRUPO BONIF. X TP FAIXAS/ CABECALHO DESCONTO FRETE
	//Local aTab02  	    := {"ZLF","ZLB","ZLD"} //ANALISE DE QUALIDADE / RECPECAO DE LEITE /ITENS DO MIX
	Local aTab02  		:= {"ZLF","ZLD"} //RECPECAO DE LEITE /ITENS DO MIX
	Local nI      		:= 0
	Local lSqlOk  		:= .F.
	
	Default cMultNota 	:= "S"
	Default cMun      	:= ""
	Default cUF       	:= ""
	Default dDtIni    	:= Ctod("")
	Default dDtFIm    	:= Ctod("")
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Esse grupo de update nao avalia o produtor+loja porque ele deve ser  ณ
	//ณ alterado somente no fim do fechamento do leite, pois o status nessas ณ
	//ณ tabelas vale para todos os produtores.                               ณ
	//ณ                                                                      ณ
	//ณ Assim se pelo menos um produtor estiver fechado, o status desses     ณ
	//ณ cadastros tambem sera fechado e so ficara em aberto quando todos     ณ
	//ณ os produtores estiverem em aberto.                                   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	If Empty(cProdutor) .And. Empty(cLoja)
		For nI := 1 To Len(aTab01)
	
			//Se nao ocorreram erros, executa o update
			If !lDeuErro
				/*
				cUpdate := "UPDATE " + RetSqlName(aTab01[nI]) + " SET " + aTab01[nI]+"_STATUS = '" + cValor + "'"
				cUpdate += " WHERE D_E_L_E_T_ = ' '"
				cUpdate += " AND " + aTab01[nI]+"_FILIAL  = '" + xFilial(aTab01[nI]) + "'"
				cUpdate += " AND " + aTab01[nI]+"_STATUS <> '" + cValor + "'"
	
				//TIPOS DE FAIXAS / VLR X GRUPO BONIFICACAO / ANALISES X DATA CALCULO / FAIXA DE INDICACAO
				If aTab01[nI] $ "ZL9/ZLP/ZLS/ZLA"
				cUpdate += " AND "+ aTab01[nI]+"_DTVIGE = '" + DtoS(dDataBase) + "'"
				//GRUPO BONIF. X TP FAIXAS
				ElseIf aTab01[nI] == "ZLN"
				cUpdate += " AND ZLN_VIGENC = '" + DtoS(dDataBase) + "'"
				// CABECALHO DESCONTO FRETE
				ElseIf aTab01[nI] == "ZLH"
				cUpdate += " AND ZLH_DTINIC = '" + DtoS(dDtIni) + "'"
				cUpdate += " AND ZLH_DTFINA = '" + DtoS(dDtFim) + "'"
				EndIf
	
				lSqlOk := !(TCSqlExec(cUpdate) < 0)
	
				If !lSqlOk
				lDeuErro := .T.
				xMagHelpFis("NAO CONFORMIDADE 99 - UPDATE STATUS",;
				TcSqlError(),;
				"Nใo Conformidade ao executar o Update de gravacao dos Status! "+;
				"Nใo confirme esta mensagem e informe ao Suporte T้cnico.")
				EndIf
				*/
			EndIf
		Next nI
	Else
		For nI := 1 To Len(aTab02)
	
			//Se nao ocorreram erros, executa o update
			If !lDeuErro
	
				If aTab02[nI] == "ZLF"
					If !Empty(cTribu)//Qdo eh cancelamento atualiza todos
						cUpdate := "UPDATE " + RetSqlName(aTab02[nI]) + " SET ZLF_STATUS = '" + cValor + "', ZLF_ACERTO = 'S'"
					Else
						cUpdate := "UPDATE " + RetSqlName(aTab02[nI]) + " SET ZLF_STATUS = 'P', ZLF_ACERTO = 'N' , ZLF_VLRPAG = 0 , ZLF_L_SEEK = ' '"
					EndIf
	
					If cMultNota != "S" // Se NF por Municipio
						cUpdate += ", ZLF_MUN = '"+cMun+"'"
						cUpdate += ", ZLF_EST = '"+cUF+"'"
					Else
						cUpdate += ", ZLF_MUN = ' '"
						cUpdate += ", ZLF_EST = ' '"
					EndIf
				Else
					cUpdate := "UPDATE " + RetSqlName(aTab02[nI]) + " SET " + aTab02[nI]+"_STATUS = '" + cValor + "'"
				EndIf
	
				cUpdate += " WHERE D_E_L_E_T_ = ' '"
				cUpdate += " AND " + aTab02[nI]+"_FILIAL  = '" + xFilial(aTab02[nI]) + "'"
				cUpdate += " AND " + aTab02[nI]+"_STATUS <> '" + cValor + "'"
	
				//ANALISE DE QUALIDADE / RECPECAO DE LEITE
				//If aTab02[nI] $ "ZLB/ZLD"
				If aTab02[nI] == "ZLD"
	
					//If aTab02[nI] == "ZLB"
					//	cUpdate += " AND SUBSTR(ZLB_DATA,1,6)   = '" + SubStr(DtoS(dDataBase),1,6) + "'"
					//Else
					cUpdate += " AND ZLD_DTCOLE BETWEEN '" + DtoS(dDtIni) + "' AND '" + DtoS(dDtFim) + "'"
					//cUpdate += " AND ZLD_TRIBUT  =      '" + cTribu       + "'"
					//EndIf
	
					cUpdate += " AND "+ aTab02[nI]+"_RETIRO = '" + cProdutor + "'"
					cUpdate += " AND "+ aTab02[nI]+"_RETILJ = '" + cLoja     + "'"
	
					//ITENS DO MIX
				ElseIf aTab02[nI] == "ZLF"
					cUpdate += " AND " + aTab02[nI] + "_A2COD   = '" + cProdutor    + "'"
					cUpdate += " AND " + aTab02[nI] + "_A2LOJA  = '" + cLoja        + "'"
					cUpdate += " AND " + aTab02[nI] + "_DTINI   = '" + DtoS(dDtIni) + "'"
					cUpdate += " AND " + aTab02[nI] + "_DTFIM   = '" + DtoS(dDtFim) + "'"
					cUpdate += " AND " + aTab02[nI] + "_TP_MIX  = 'L'"
					If !Empty(_cPrefixo)
			//			cUpdate += " AND " + aTab02[nI] + "_SE2PRE  = '" + cPrefixo        + "'"
			//			cUpdate += " AND " + aTab02[nI] + "_SE2NUM  = '" + cNroNota        + "'"
					EndIf
					If !Empty(cTribu)//Qdo eh cancelamento deleta todos
						cUpdate += " AND " + aTab02[nI] + "_TRIBUT  = '" + cTribu   + "'"
						cUpdate += " AND " + aTab02[nI] + "_ACERTO <> 'S'"
					EndIf
				EndIf
	
				lSqlOk := !(TCSqlExec(cUpdate) < 0)
				
				If lSqlOk .and.  (TcGetDB() == 'ORACLE')
					lSqlOk := !(TCSqlExec(" COMMIT ") < 0)
				EndIf
				
	
				If !lSqlOk
					lDeuErro := .T.
					xMagHelpFis("NAO CONFORMIDADE 99 - UPDATE STATUS",;
					TcSqlError(),;
					"Nใo Conformidade ao executar o Update de gravacao dos Status! "+;
					"Nใo confirme esta mensagem e informe ao Suporte T้cnico.")
				EndIf
			EndIf
		Next nI
	EndIf
	
Return(lSqlOk)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณatualizSE5บ Autor ณ                       บ Data da Criacao  ณ 00/00/0000                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ	DescricaoณAtualizacao de campo na tabela SE5 para posterior uso em possivel cancelamento do emprestimo, convenio para   บฑฑ
ฑฑบ          ณque no cancelamento somente seja cancelada a baixa referente ao mix que se esta cancelando, por exemplo um	บฑฑ
ฑฑบ          ณemprestimo que tenha somente uma parcela e que tenha sofrido baixa em dois mix de fechamento ao cancelar 		บฑฑ
ฑฑบ			 ณo ultimo mix gerado o saldo de todo o titulo era voltado, nao somente o que tinha sido baixado por este mix.	บฑฑ																								บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณGestao do Leite. 										               						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ  _cCodMix   - Codigo do Mix	                                                                                บฑฑ
ฑฑบ			 ณ	_cVersao   - Versao do Mix   																				บฑฑ
ฑฑบ			 ณ  _cSetor    - Codigo do Setor																				บฑฑ
ฑฑบ			 ณ  _cLinha    - Codigo do Produtor 																			บฑฑ
ฑฑบ			 ณ  _cPrefixo  - Prefixo do titulo  																			บฑฑ
ฑฑบ			 ณ  _cTipo     - Tipo do titulo  																				บฑฑ
ฑฑบ			 ณ	_cNumero   - Numero do titulo																				บฑฑ
ฑฑบ			 ณ	_cParcela  - Parcela do Titulo																				บฑฑ
ฑฑบ			 ณ	_cFornec   - Fornecedor do Titulo																			บฑฑ
ฑฑบ			 ณ	_cLoja     - Loja do Titulo																					บฑฑ
ฑฑบ			 ณ	_cMotBaixa - Motivo da Baixa																				บฑฑ
ฑฑบ			 ณ  _nValor    - Valor do Titulo  																				บฑฑ
ฑฑบ			 ณ  _nValor    - Valor do Evento                                                                    			บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ										                                                                   		บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                              					    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function atualizSE5(_cCodMix,_cVersao,_cSetor,_cPrefixo,_cTipo,_cNumero,_cParcela,_cFornec,_cLoja,_cMotBaixa,_nValor,nSeq)

Local _lRet  := .F.
Local _cQuery:= ""

_cQuery := "UPDATE "
//_cQuery += RetSqlName("SE5") + " SE5 "
_cQuery += RetSqlName("SE5")
_cQuery += " SET E5_L_SEEK = '" + _cCodMix + _cVersao + _cSetor + "' "
_cQuery += "WHERE"
_cQuery += " D_E_L_E_T_ = ' '"
_cQuery += " AND E5_FILIAL = '"  + xFilial("SE5")  + "'"
_cQuery += " AND E5_SITUACA <> 'C'"
_cQuery += " AND E5_TIPODOC = 'BA'"
_cQuery += " AND E5_MOTBX = '"   + _cMotBaixa      + "'"
_cQuery += " AND E5_PREFIXO = '" + _cPrefixo       + "'"
_cQuery += " AND E5_TIPO = '"    + _cTipo          + "'"
_cQuery += " AND E5_NUMERO = '"  + _cNumero        + "'"
_cQuery += " AND E5_PARCELA = '" + _cParcela       + "'"
_cQuery += " AND E5_CLIFOR = '"  + _cFornec        + "'"
_cQuery += " AND E5_LOJA = '"    + _cLoja          + "'"
_cQuery += " AND E5_DATA = '"    + DtoS(dDataBase) + "'"
//_cQuery += " AND E5_VALOR = '"   + AllTrim(Str(_nValor)) + "'"
//_cQuery += " AND E5_SEQ = '"   + AllTrim(Str(nSeq)) + "'"
_cQuery += " AND E5_L_SEEK = ' '"

_lRet := !(TCSqlExec(_cQuery) < 0)

Return _lRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณvolLeiTr  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 00/00/0000                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao para retonar a litragem do produtor considerando o tipo de leite(T-Tributado, I-Isento e D-Diferido). บฑฑ
ฑฑบ          ณ 															                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ  _cFilial   - Codigo da Filial																				บฑฑ
ฑฑบ          ณ  _cSetor    - Codigo do Setor																				บฑฑ
ฑฑบ			 ณ  _cLinha    - Codigo da Linha																				บฑฑ
ฑฑบ			 ณ  _cRetiro   - Codigo do Produtor																				บฑฑ
ฑฑบ			 ณ  _cRetLoj   - Codigo da Loja do Produtor																	   	บฑฑ
ฑฑบ          ณ  _dDtInic   - Data Inicial																					บฑฑ
ฑฑบ			 ณ	_dDtFinal  - Data Final																						บฑฑ
ฑฑบ			 ณ	_cTributac - Tipo da Tributacao                                                                             บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Litragem do produtor de acordo com os filtros.			                                                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function volLeiTr(_cFilial,_cSetor,_cLinha,_cRetiro,_cRetLoj,_dDtInic,_dDtFinal,_cTributac)

Local _aArea    := GetArea()
Local _cFiltro  := "%"
Local _cAlias   := GetNextAlias()
Local _nQtdeLeit:= 0

If !Empty(_cFilial)
	_cFiltro += " AND ZLD_FILIAL = '" + _cFilial + "'"
EndIf

If !Empty(_dDtInic) .And. !Empty(_dDtFinal)
	_cFiltro += " AND ZLD_DTCOLE BETWEEN '" + DtoS(_dDtInic) + "' AND '" + DtoS(_dDtFinal) + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFiltro do tipo de tributacao: T - Tributado, D - Diferido, I - Isento. ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Empty(_cTributac)
	_cFiltro += " AND ZLD_TRIBUT = '" + _cTributac + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFiltro do Setorณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Empty(_cSetor)
	_cFiltro += " AND ZLD_SETOR = '" + _cSetor + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFiltra da Linhaณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Empty(_cLinha)
	_cFiltro += " AND ZLD_LINROT = '" + _cLinha + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFiltro do Retiroณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Empty(_cRetiro)
	_cFiltro += " AND ZLD_RETIRO = '" + _cRetiro + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFiltro da Loja do Retiro ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If !Empty(_cRetLoj)
	_cFiltro += " AND ZLD_RETILJ = '" + _cRetLoj + "'"
EndIf

_cFiltro += "%"

BeginSql alias _cAlias
	SELECT
	  SUM(ZLD_QTDBOM) QTDLEITE
	FROM
	 %Table:ZLD%
	WHERE
	 D_E_L_E_T_ = ' '
	 %Exp:_cFiltro%
EndSql

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

_nQtdeLeit:= (_cAlias)->QTDLEITE

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFinaliza a area criada anteriormente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())

RestArea(_aArea)
Return(_nQtdeLeit)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ calcImp  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 00/00/0000                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Funcao usada para realizar o somatorio dos eventos que foram lancados que farao parte da base de calculo do  บฑฑ
ฑฑบ			 ณ imposto levando em consideracao a questao da tributacao.														บฑฑ
ฑฑบ			 ณ 																											    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cImposto - Armazena o nome do imposto a ser calculado Ex: INSS,SENAR,SEST,PIS,COFINS,ETC.	     			บฑฑ
ฑฑบ          ณ _cIncentiv- S-Indica para eventos que sejam Tributados serao acrescido 2.5%, Isentos: 2.4%, diferido:0 		บฑฑ
ฑฑบ			 ณ no somatorio dos eventos que foram encontrados que se enquadram no imposto corrente. 		     			บฑฑ
ฑฑบ          ณ _cTribut  - Indica o tipo de tributacao que esta sendo gerado o evento. Ex: T-Tributado, I-Isento, D-Diferidoบฑฑ
ฑฑบ          ณ _cSetor	 - Codigo do Setor																	     			บฑฑ
ฑฑบ          ณ _cLinha	 - Codigo da Linha																					บฑฑ
ฑฑบ          ณ _cProdutor- Codigo do Produtor																				บฑฑ
ฑฑบ          ณ _cLojProd - Codigo da Loja do Produtor																		บฑฑ
ฑฑบ          ณ _cCodMix	 - Codigo do Mix que esta sendo efetuado o lancamento do evento.    				     			บฑฑ
ฑฑบ          ณ _cVersao	 - Versao do Mix que esta sendo efetuado o lancamento do evento.							    	บฑฑ
ฑฑบ          ณ _lCalcInc - Variavel do tipo logica que informa se o calculo a ser efetuado eh de incentivo ou impostos.  	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor base para calculo do valor do imposto.										      						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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
User Function calcImp(_cImposto,_cIncentiv,_cTribut,_cSetor,_cLinha,_cProdutor,_cLojProd,_cCodMix,_cVersao,_lCalcInc)

Local _aArea     := GetArea()
Local _cAlias    := GetNextAlias()
Local _nVlrRetor := 0
Local _nVlrEvent := 0
Local _nVlrIcent := 0
Local _cEventInc := AllTrim(GetMv("LT_EVEINCE"))
Local _cFiltro   := "%"

Local _cPLEITE	:= "P"//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS

_cFiltro += " AND ZLF.ZLF_FILIAL = '" + xFilial("ZLF")  + "'"
_cFiltro += " AND ZL8.ZL8_FILIAL = '" + xFilial("ZL8")  + "'"

If Len(AllTrim(_cSetor)) > 0
	_cFiltro += " AND ZLF.ZLF_SETOR = '"  + _cSetor         + "'"
EndIf

If Len(AllTrim(_cLinha)) > 0
	_cFiltro += " AND ZLF.ZLF_LINROT = '" + _cLinha         + "'"
EndIf

If Len(AllTrim(_cProdutor)) > 0
	_cFiltro += " AND ZLF.ZLF_RETIRO = '"  + _cProdutor      + "'"
EndIf

If Len(AllTrim(_cLojProd)) > 0
	_cFiltro += " AND ZLF.ZLF_RETILJ = '" + _cLojProd       + "'"
EndIf

If Len(AllTrim(_cTribut)) > 0
	_cFiltro += " AND ZLF.ZLF_TRIBUT = '" + _cTribut        + "'"
EndIf

_cFiltro += " AND ZLF.ZLF_CODZLE = '" + _cCodMix        + "'"
_cFiltro += " AND ZLF.ZLF_VERSAO = '" + _cVersao        + "'"

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณPara que o evento de incentivo nao entre no calculo da base.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If _cIncentiv == 'N'
	_cFiltro += " AND ZLF.ZLF_EVENTO <> '" + _cEventInc     + "'"
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Verifica para cada tipo de imposto a ser calculado de acordo com ณ
//ณ o evento, verifica quais eventos foram configurados para fazer   ณ
//ณ parte da base de calculo.                                        ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Len(AllTrim(_cImposto)) > 0
	Do Case
		Case _cImposto == "INSS"
			_cFiltro += " AND ZL8.ZL8_BASINS = 'S'"
		Case _cImposto == "SENAR"
			_cFiltro += " AND ZL8.ZL8_SENAR = 'S'"
		Case _cImposto == "SEST"
			_cFiltro += " AND ZL8.ZL8_SEST = 'S'"
		Case _cImposto == "COFINS"
			_cFiltro += " AND ZL8.ZL8_COFINS = 'S'"
		Case _cImposto == "PIS"
			_cFiltro += " AND ZL8.ZL8_PIS = 'S'"
		Case _cImposto == "INCENTIVO"
			_cFiltro += " AND ZL8.ZL8_INCENT = 'S'"
	EndCase
EndIf

_cFiltro +="%"

BeginSql alias _cAlias
	SELECT
			SUM(
			    CASE WHEN ZL8_DEBCRE = 'C' THEN
		          ZLF.ZLF_TOTAL
		        Else
		          0
			   END) AS CREDITO,
		    SUM(
		        CASE WHEN ZL8_DEBCRE = 'D' THEN
		          ZLF.ZLF_TOTAL
		        Else
		          0
			   END) AS DEBITO
	FROM
	      %Table:ZLF% ZLF 
		  //%Table:ZLF% ZLF, %Table:SA2% SA2 //#LETRAS
	      JOIN %Table:ZL8% ZL8 ON ZL8.ZL8_COD = ZLF.ZLF_EVENTO //#LETRAS
//		  INNER JOIN %Table:SA2% SA2 ON ZLF.ZLF_RETIRO = SA2.A2_COD AND ZLF.ZLF_RETILJ = SA2.A2_LOJA //#LETRAS  
	WHERE
	      ZLF.D_E_L_E_T_ = ' '
	      AND ZL8.D_E_L_E_T_ = ' '
	      AND SUBSTR(ZLF.ZLF_RETIRO,1,1) = 'P' //#LETRAS
		  //AND SA2.A2_C_TPFOR IN %Exp:U_ajusSQL(_cPLEITE)%  //#LETRAS
	      AND ZLF.ZLF_ACERTO <> 'S'
	      AND ZLF.ZLF_ORIGEM <> 'F'
	      %Exp:_cFiltro%
EndSql

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

If !(_cAlias)->(Eof())

	_nVlrEvent:= (_cAlias)->CREDITO - (_cAlias)->DEBITO

	If _nVlrEvent > 0
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณVerifica se esta se calculando o valor do incentivo ou efetuando ณ
		//ณo somatorio dos eventos de credito para calculo de algum imposto.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If _lCalcInc
			If _cTribut == "T"
				_nVlrIcent:= _nVlrEvent * (2.5/100)
			ElseIf _cTribut == "I"
				_nVlrIcent:= _nVlrEvent * (2.4/100)
			EndIf

			_nVlrRetor:= _nVlrIcent

			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณCalculo de algum imposto.ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Else
			_nVlrRetor:= _nVlrEvent
		EndIf
	EndIf
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณFinaliza a area criada anteriormente.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())

RestArea(_aArea)
Return(_nVlrRetor)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TotQual     บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2010             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor liquido pago pela analise da qualidade, ou seja, total de credito menos total de redutor.    บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Relatorio de Padrao de Pagamento de Qualidade                     											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Setor.                                                                      						บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Produtor.                                                                                 บฑฑ
ฑฑบ          ณ ExpC03 - Loja do Produtor.                                                                                   บฑฑ
ฑฑบ          ณ ExpC04 - Periodo (Ano/Mes)                                                                                   บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpN01 - Valor total da qualidade na ZLF.                                                 	                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function TotQual(cSetor,cProdutor,cLoja,cAnoMes)

Local aArea  := GetArea()
Local nRet   := 0
Local nTotCre:= 0
Local nTotDeb:= 0
Local cDtIni := cAnoMes+"01"
Local cDtFim := DtoS(LastDay(STOD(cDtIni)))

cQuery := " SELECT ZLF_DEBCRE AS DEBCRE, SUM(ZLF_TOTAL) AS TOTAL"
cQuery += " FROM "+RetSqlName("ZLF")+" ZLF "
cQuery += " 	JOIN "+RetSqlName("ZL8")+" ZL8  ON ZL8_FILIAL = '"+xFILIAL("ZL8")+"' "
cQuery += " 	AND ZL8_COD = ZLF_EVENTO AND ZL8.D_E_L_E_T_ = ' ' "
cQuery += " 	AND ZL8.ZL8_GRUPO IN("+ALLTRIM(GetMv("LT_BON_RED"))+")"
cQuery += " WHERE "
cQuery += " ZLF_FILIAL = '"+xFILIAL("ZLF")+"' "
cQuery += " AND ZLF_DTINI = '"+cDtIni+"' "
cQuery += " AND ZLF_DTFIM = '"+cDtFim+"' "
cQuery += " AND ZLF_SETOR = '"+cSetor+"' "
cQuery += " AND ZLF_RETIRO = '"+cProdutor+"' "
cQuery += " AND ZLF_RETILJ = '"+cLoja+"' "
cQuery += " AND ZLF_TP_MIX = 'L' "
cQuery += " AND ZLF.D_E_L_E_T_ = ' ' "
cQuery += " GROUP BY ZLF_DEBCRE,ZLF_EVENTO,ZLF_SEQ "
cQuery += " ORDER BY ZLF_DEBCRE,ZLF_EVENTO "

If Select("TRC") <> 0
	TRC->(dbCloseArea("TRC"))
EndIf
dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRC", .T., .F. )

While !TRC->(Eof())

	//Tratamento para nao imprimir uma linha em branco com valor zerado quando
	//o produtor nao tem nada de qualidade.
	If TRC->TOTAL > 0
		If TRC->DEBCRE == "C"
			nTotCre += TRC->TOTAL
		Else
			nTotDeb += TRC->TOTAL
		EndIf
	EndIf

	TRC->(dbSkip())
EndDo

nRet := nTotCre - nTotDeb

TRC->(dbcloseArea())
RestArea(aArea)
Return(nRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ TotQual     บ Autor ณ TOTVS                 บ Data da Criacao  ณ 02/12/2010             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o valor liquido pago pela analise da qualidade, ou seja, total de credito menos total de redutor.    บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Relatorio de Padrao de Pagamento de Qualidade                     											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ ExpC01 - Setor.                                                                      						บฑฑ
ฑฑบ          ณ ExpC02 - Codigo do Produtor.                                                                                 บฑฑ
ฑฑบ          ณ ExpC03 - Loja do Produtor.                                                                                   บฑฑ
ฑฑบ          ณ ExpC04 - Periodo (Ano/Mes)                                                                                   บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ ExpN01 - Valor total da qualidade na ZLF.                                                 	                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function DatLInha( dDat1, dDat2,lMsg)
lRet:=.T.
IF dDat2 >= dDat1
	lRet:=.T.
Else
	lRet:=.F.
	IF lMsg
		MsgAlert("Data Final nใo pode ser inferior a Data Inicial")
	Else
		MsgAlert("Hora Final nใo pode ser inferior a Hora Inicial")	
	EndIF
EndIF


Return (lRet)

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Pprodu      บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o pagamento de bonifica็ใo ao produtor referente a produtividade 								    บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado no campo f๓rmulas da rotina de eventos 	                  											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                         						บฑฑ
ฑฑบ          ณ cCodGor	:= C๓digo da faixa de Gordura                                                                       บฑฑ
ฑฑบ          ณ cCodPreB	:= C๓digo da faixa de Pre็o BASE(COA)                                                               บฑฑ
ฑฑบ          ณ cCodPreE	:= C๓digo da faixa de Pre็o Excesso                                                                 บฑฑ
ฑฑบ          ณ cCodProd	:= C๓digo da faixa de Produtividade                                                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                                                            	                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function Pprodu(cCodGor,cCodPreB,cCodPreE,cCodProd)

Local nVolume := U_Vleite('','','N')
Local nDiasApu:= (VAL(DTOS(ZLE->ZLE_DTFIM)))-(VAL(DTOS(ZLE->ZLE_DTINI))) //Quantidade de dias do MIX
Local nVlrFx  := ""
Local nTotalB := ""
Local nTotalE := ""
Local cDICota :=GetMV('LT_COTAIN') //MMDD da data inicial da cota do leite
Local cDFCota :=GetMV('LT_COTAFIN') //MMDD da data final da cota do leite
Local nCota	  := 0	//Quantidade de leite cota
Local nVolCota:= 0  //Quantidade de leite cota dia
Local nVoCotM := 0 // Quantidade do cota no perํodo do mix 
Local nBloq   := 2
Local nBonProd:= nVolume/nDiasApu // produ็ใo utilizado no cadastro de faixas de produtividade 
Local nPercPdt:= "" // recebe o percentual encontrado no cadastro de faixas de produtividade 

// somente paga adicional se for maior que 50 
IF nBonProd > 50 
// Verifica se o evento pre็o excesso estแ bloqueado
dbSelectArea("ZL8")
dbSetOrder(1)
If dbSeek(xFILIAL("ZL8")+cCodPreE)
	If Found()
		nBloq := ZL8->ZL8_MSBLQL
	EndIf
Endif 			
IF  Val(SubStr(dTos(Date()),5,2)) < Val(SubStr(cDFCota,1,2))  //Verifica se ha mudan็a de ano na data de calculo da cota
	nCota		:= U_VLeitePe(,,,sToD((Year(Date)-1)+cDICota),sToD((Year(Date)-1)+cDFCota)) 
	nVolCota	:= nCota/(sToD((Year(Date)-1)+cDFCota)-sToD((Year(Date)-1)+cDICota))   //Volume de leite da cota por dia
Else
	nCota		:= U_VLeitePe(,,,sToD(Year(Date)+cDICota),sToD(Year(Date)+cDFCota))
	nVolCota	:= nCota/(sToD(Year(Date)+cDFCota)-sToD(Year(Date)+cDICota))   //Volume de leite da cota por dia
EndIF 


//Volume de leite da cota para o MIX
nVoCotM		:= nVolCota*nDiasApu					 

If  nVolume <= nVoCotM	
	nVolBas := nVolume
    nVolExe := 0
Else
	nVolBas := nVoCotM
	nVolExe := nVolume - nVoCotM
EndIF                            

//Se encontrar volume
If nVolBas <> 0

dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
// Procura na tabela de faixas qual a porcentagem de produtividade

If dbSeek(xFILIAL("ZL9")+cCodProd)
	nPercPdt:= u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nBonProd)
EndIf

If dbSeek(xFILIAL("ZL9")+cCodGor)
	//Obtem o valor que esta na Analise da Qualidade De Gordura 
	//Se nao encontrar nenhuma analise, retorna zero
	// 		     getMIndice(cpFilial,      cpSetor,     cpProd,     cpLj,        cpTpFaixa,   cpMedia,        dpData)
	nVlrInd := u_getMIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,ZL9->ZL9_COD,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
		// Se achou alguma qualidade 
		IF nVlrInd <> 0 
			If nVolExe > 0 .And. nBloq == 2 // se tiver excesso e se o evento de Excesso nใo estando bloqueado
				If dbSeek(xFILIAL("ZL9")+cCodPreE)					
					// Obt้m o valor da faixa de Pre็o 
					//         getFaixa(cpFilial,      cpSetor,     cpCod,       cpFaixa)  
	    			nVlrFx:= u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)
	    			nTotalE := ((nVlrFx*nPercPdt)/100)*nVolExe // Valor Excesso 
	    			dbSeek(xFILIAL("ZL9")+cCodPreB)
	    			nVlrFx:= u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)
	    			nTotalB := ((nVlrFx*nPercPdt)/100)*nVolBas // Valor Base
	    		Endif
	    	ElseIf dbSeek(xFILIAL("ZL9")+cCodPreB)
	    			nVlrFx:= u_getFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,ZL9->ZL9_COD,nVlrInd)
	    			nTotalB := ((nVlrFx*nPercPdt)/100)*nVolume	//Valor Base 		
			EndIf
		EndIf
EndIf
EndIf
dbCloseArea("ZL9")
EndIf
Return nTotalB+nTotalE


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัอออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ Peperda     บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/12/2013             						บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna o Valor de desconto do produtor (Rateio de Perdas)               								    บฑฑ
ฑฑบ          ณ                                 							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Usado no campo f๓rmulas da rotina de eventos 	                  											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                         						บฑฑ
ฑฑบ          ณ cCodGor:= C๓digo da faixa de Gordura                                                                         บฑฑ
ฑฑบ          ณ cCodPreB:= C๓digo da faixa de Pre็o BASE(COTA)                                                               บฑฑ
ฑฑบ          ณ cCodPreE:= C๓digo de faixa de Pre็o Excesso                                                                  บฑฑ
ฑฑบ          ณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                                                            	                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                       						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function Peperda()

	Local _cPLEITE 	:= "P"//U_GETRELA1("1","ZL1_PLEITE")
	Local _cAlias   := GetNextAlias()
	Local _aArea    := GetArea()
	Local _cCod		:= SA2->A2_COD 
	Local nVolume 	:= U_Vleite('','','N')
	Local cTot 		:= ''
	Local Vperd		:= '' 
	
	// Condi็ใo do evento A2_L_RPERD == S , s๓ ativar o evento se ele participa do rateio de perdas 
	
	// sai na nota Bonus AGO, deverแ ser gerado um cr้dito que sai na nota, e um d้bito que desconto na conta corrente do cooperado, esse evento seria o de cr้dito
	// para sair na nota 
	
	BeginSql alias _cAlias
		Select 
			A2_L_RPERD, A2_L_VPERD
		FROM %Table:SA2%
			WHERE D_E_L_E_T_ = ' '
		AND A2_L_TPFOR IN %Exp:U_ajusSQL(_cPLEITE)% 
		AND A2_COD = %Exp:_cCod%
	ENDSQL    
	    
	dbSelectArea(_cAlias)
	(_cAlias)->(dbGoTop())
	
	Vperd := (_cAlias)->A2_L_VPERD
	
	If ((_cAlias)->A2_L_VPERD >= 0) 
		cTot := nVolume *(0,01) // desconta 1% do leite do produtor 
		RECLOCK("SA2",.F.)
		SA2->A2_L_VPERD := Vperd - cTot
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณFinaliza a area criada anteriormente.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	dbSelectArea(_cAlias)
	(_cAlias)->(dbCloseArea())
	
	RestArea(_aArea)

Return cTot 



/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ VLeitePe บ Autor ณ TOTVS                 บ Data da Criacao  ณ 01/12/2013               						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume do leite do produtor com perํodo de inicio e fim para apura็ใo(usado nas formulas dos eventos)	บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ cpTipo (Latao ou Tanque); cpTpForn (Produtor ou Fretista); cFilLinha (S=Filtra Linha N=Nao Filtra linha)     บฑฑ
ฑฑบ			 | dDatIni(Data inicial para apura็ใo); dDatFim (Data final para apura็ใo)                                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume do leite do produtor                                                                              	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function VLeitePe(cpTipo,cpTpForn,cFilLinha,dDatIni,dDatFim)

	Local cArea := GetArea()
	Local cQry2
	Local _TOT := 0
	Local cpFilial := ""
	
	Local _cPLEITE := "P"//U_GETRELA1("1","ZL1_PLEITE") //#LETRAS
	Local _cGRANEL := "T/G"//U_GETRELA1("1","ZL1_GRANEL") //#LETRAS
	
	cQry2  := " SELECT SUM(ZLD_QTDBOM) TBOM, SUM(ZLD_QTDACI) TACI FROM " + RETSQLNAME("ZLD") + " ZLD "
	//cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZL8") + "'"
	cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
	cQry2  += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(dDatIni) + "' AND '" + DTOS(dDatFim) + "'"
	cQry2  += " AND ZLD_SETOR = '"+ ZL2->ZL2_COD +"'"
	//----------------------------------------------------
	// Verifica se o parametro de filtrar esta preenchido
	// Se sim, filtra a linha. Se nao, nao filtra
	//----------------------------------------------------
	If Empty(cFilLinha)
		cQry2  += " AND ZLD_LINROT = '" + ZL3->ZL3_COD + "'"
	Else
		If cFilLinha == "S"
			cQry2  += " AND ZLD_LINROT = '" + ZL3->ZL3_COD + "'"
		EndIf
	EndIf
	//----------------------------------------------------
	// Se o parametros do tipo do fornecedor nao estiver
	// preenchido filtra o produtor
	// Caso contrario filtra pelo PRODUTOR OU FRETISTA
	//----------------------------------------------------
	If Empty(cpTpForn)
		cQry2  += " AND ZLD_RETIRO = '" + SA2->A2_COD + "'"
		cQry2  += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
	Else
		//If cptpForn == "PRODUTOR" .Or. cpTpForn $ "C/G/T"//#LETRAS
		If cptpForn == "PRODUTOR" .Or. cpTpForn $ _cPLEITE //#LETRAS
	
			cQry2  += " AND ZLD_RETIRO = '" + SA2->A2_COD + "'"
	
			//----------------------------------------------------
			// Se nao filtrar a linha significa que quer se obter
			// o volume total do produtor.
			// Portanto nao se deve filtrar a Loja tambem
			//----------------------------------------------------
			If Empty(cFilLinha)
				cQry2 += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
			Else
				If cFilLinha == "S"
					cQry2 += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
				EndIf
			EndIf
	
		EndIf
		//if cptpForn == "FRETISTA" .Or. cpTpForn == "F" //#LETRAS
		If cptpForn == "FRETISTA" .Or. cpTpForn $ _cGRANEL
			cQry2  += " AND ZLD_FRETIS = '" + SA2->A2_COD + "'"
			cQry2  += " AND ZLD_LJFRET = '" + SA2->A2_LOJA + "'"
		EndIf
	EndIf
	cQry2  += " AND (ZLD.D_E_L_E_T_ = ' ')"
	If Select("TRAB1") <> 0
		TRAB1->(dbCloseArea("TRAB1"))
	EndIf
	cQry2 := CHANGEQUERY(cQry2)
	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB1", .F., .T.)
	If !TRAB1->(Eof())
		If Empty(cpTipo)
			_TOT  := TRAB1->TBOM + TRAB1->TACI
		Else
			cClassTq := Posicione('ZLT',1,XFILIAL('ZLT')+SA2->A2_L_TANQ,'ZLT_CLASTQ')
			If cpTipo == "TANQUE" .Or. cpTipo == "T"// tanque
				If cClassTq != "N" .And. cClassTq != "L"
					_TOT  := TRAB1->TBOM + TRAB1->TACI
				EndIf
			EndIf
			If cpTipo == "LATAO" .Or. cpTipo == "L" // latao
				If cClassTq == "N" .Or. cClassTq == "L"
					_TOT  := TRAB1->TBOM + TRAB1->TACI
				EndIf
			EndIf
		EndIf
	EndIf
	RestArea(cArea)

Return _TOT

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ PAGTOCOTAบ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2013                  					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retorna valor da do pagamento do leite de acordo com a cota (volume)                                         บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณcApura ='C' = leite Base; cApura = 'E' = leite excedente                         						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Valor da bonificacao por volume                  															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function PagtoCota(cpTipo,cpCodigo,cApura)
	
	Local nVlrInd := 0
	Local qtdDias := 0
	Local nVlrFx  := 0
	Local nTotal  := 0
	Local nVolume := U_VLEITE('','','N')   
	Local nVolBas := 0
	Local nVolExe := 0
	Local cDICota :=GetMV('LT_COTAIN') //MMDD da data inicial da cota do leite
	Local cDFCota :=GetMV('LT_COTAFIN') //MMDD da data final da cota do leite
	Local nCota	  := 0	//Quantidade de leite cota
	Local nVolCota:= 0  //Quantidade de leite cota dia
	Local cTMedia := ""
	DEFAULT cApura := 'C'
	
	IF  Val(SubStr(dTos(Date()),5,2)) < Val(SubStr(cDFCota,1,2))  //Verifica se ha mudan็a de ano na data de calculo da cota
		nCota		:= U_VLeitePe(,,,sToD((Year(Date)-1)+cDICota),sToD((Year(Date)-1)+cDFCota)) 
		nVolCota	:= nCota/(sToD((Year(Date)-1)+cDFCota)-sToD((Year(Date)-1)+cDICota))   //Volume de leite da cota por dia
	Else
		nCota		:= U_VLeitePe(,,,sToD(Year(Date)+cDICota),sToD(Year(Date)+cDFCota))
		nVolCota	:= nCota/(sToD(Year(Date)+cDFCota)-sToD(Year(Date)+cDICota))   //Volume de leite da cota por dia
	EndIF 
	
	nDiasApu	:=ZLE->ZLE_DTFIM - ZLE->ZLE_DTINI   //Quantidade de dias do MIX
	nVoCotM		:=nVolCota*nDiasApu					 //Volume de leite da cota para o MIX
	
	If  nVolume <= nVolCota
		nVolBas := nVolume
	    nVolExe := 0
	Else
		nVolBas := nVolCota
		nVolExe := nVolume - nVolCota
	EndIF                            
	
	dbSelectArea("ZL9")//GLT - TIPOS DE FAIXAS
	dbSetOrder(1)//ZL9_FILIAL+ZL9_COD
	If dbSeek(xFILIAL("ZL9")+cpCodigo)
	
		//Se encontrar volume
		If nVolBas <> 0
	
			//Obtem o valor que esta na Analise da Qualidade.
			//Se nao encontrar nenhuma analise, retorna zero
			nVlrInd := u_getMIndice(xFILIAL("ZL8"),ZL2->ZL2_COD,SA2->A2_COD,SA2->A2_LOJA,ZL9->ZL9_COD,ZL9->ZL9_MEDIA,ZLE->ZLE_DTFIM)
		
			//Se encontrar alguma analise da qualidade
			If nVlrInd <> 0
				//Compara o valor da Analise da Qualidade com as Faixas de Indicacao cadastradas
				nVlrFx := u_getSFaixa(xFILIAL("ZL8"),ZL2->ZL2_COD,cpCodigo,nVlrInd)
		
				If cpTipo == "C" // credito
					If nVlrFx > 0
						If cApura  == 'C'
							nTotal += nVlrFx*nVolBas
						ElseIF cApura == 'E'
							nTotal += nVlrFx*nVolExe
						EndIF
					EndIf
				Else // debito
					If nVlrFx < 0
						If cApura  == 'C'
							nTotal += nVlrFx*nVolBas
						ElseIF cApura == 'E'
							nTotal += nVlrFx*nVolExe
						EndIF
					EndIf
				EndIf
			EndIF
		EndIf
	EndIf
	
	dbCloseArea("ZL9")

Return nTotal   


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ COMPZERO บ Autor ณ TOTVS                 บ Data da Criacao  ณ 11/09/2013                  					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Completa campo do c๓digo do tanque com 0 a esquerda                                                          บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณ                  										                    						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 									                 															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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
User Function CompZero()

M->ZLS_COD := StrZero(Val(M->ZLS_COD),6)   

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ajusSQL  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 14/02/2014                  					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Ajusta formato da variavel na consulta.                                                                      บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณ                  										                    						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 									                 															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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

User Function ajusSQL(_cString)

	Local _cVar	:= "('"

	for _i := 1 to len(_cString)
		
		_cVar += SubStr(_cString,_i,1)
		_cVar += "','"
	
	Next
	
	_cVar := SubStr(_cVar,1,Len(_cVar)-2)
	
	_cVar += ")"

Return _cVar

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ ProgCal  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 28/04/2014                  					บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Calculo dos programas educampo/balde cheio.                                                                  บฑฑ
ฑฑบ          ณ                   												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                     						                   	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ         																										บฑฑ
ฑฑบ          ณ                     						                                									บฑฑ
ฑฑบ          ณ                  										                    						        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ 									                 															บฑฑ
ฑฑบ          ณ          			   							                               						        บฑฑ
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

User Function ProgCal(_cProd,_cProdLj,_cProg)

	Local aArea 	:= GetArea()
	Local _cSQL		:= GetNextAlias()
	//Local _cSQL2	:= GetNextAlias()

	Local _dData	:= dDataBase
	Local _nVlr 	:= 0
	Local _cQuery 	:= ""        
	
	Local aLastQuery	:= {}
	Local cLastQuery
	
	BeginSql alias _cSQL
		SELECT
		ZP4_CODCOO
		,ZP4_LJCOO
		,ZP4_DATA
		,ZP4_COD
		FROM %Table:ZP4% ZP4
		WHERE
		ZP4.D_E_L_E_T_ = ' '
		AND ZP4_FILIAL  = %Exp:xFilial("ZP4")%
		AND ZP4_VIGENT = %Exp:'S'%
		AND ZP4_ENTSA = %Exp:'E'%
		AND ZP4_CODCOO = %Exp:_cProd%
		AND ZP4_LJCOO = %Exp:_cProdLj%
		AND ZP4_COD = %Exp:_cProg%     
		AND ZP4_DATA <= %Exp:_dData%
		ORDER BY ZP4_DATA DESC
	EndSql          
	
	aLastQuery    := GetLastQuery()
  	cLastQuery    := aLastQuery[2]
	
	If  !(_cSQL)->(Eof())
	
			DbSelectArea("ZP3")
			ZP3->(DbSetOrder(2))
			If ZP3->(DbSeek(xFilial("ZP3")+(_cSQL)->ZP4_CODCOO+(_cSQL)->ZP4_LJCOO+(_cSQL)->ZP4_COD+SubStr(DTOS(_dData),1,6)))
				//VERIFICA SE FOI GERADO O FINANCEIRO PARA O EVENTO				
				IF ZP3->ZP3_FINANC <> "S"		
					_nVlr	:= ZP3->ZP3_VLR	          				        
					IF _nVlr > 0		
						RecLock("ZP3",.F.)  
							ZP3->ZP3_FINANC		:= "S"
							//ZP3->ZP3_MIX 		:= ZLE->ZLE_COD
							//ZP3->ZP3_VERSAO	:= ZLE->ZLE_VERSAO     
						MsUnlock()
					ENDIF
				EndIf					
			EndIf
	ENDIF

	(_cSQL)->(DBCLOSEAREA())
	
	RestArea(aArea)

Return _nVlr



/*/
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Programa  ? CalcJuros   ? Autor ? Guilherme Fran็a      ? Data da Criacao  ? 28/11/2013             						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Descricao ? Fun?ao para retornar o valor da parcela calculado conforme parametros sendo para acrescimos ou decrescimos.  ???
???          ?                                 							                               						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Uso       ? Fun็oes do financeiro                                             											???
???          ? 	 							                                                                                ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Parametros? xcTipo - Tipo do c?lculo: P=parcelamento;J=juros; D=decrescimos.                        						???
???          ? xnTaxa - Taxa de juros mensal.                                                                               ???
???          ? xnVlr  - Valor presente, para c?lculo de acr?scimo. Valor da parcela, para c?lculo de desconto.              ???
???          ? xnParc - Numero de parcelas.Usado no calculo de acr?scimos                                                   ???
???          ? xnCar  - Numero de parcelas de car?ncia.Usado no calculo de juros.                                           ???
???          ? xdVencto - Data de vencimento da parcela.                                                                    ???
???          ? xdPgto - Data de pagamento da parcela.                                                                       ???
???          ? xTipoJur - Indica se o calcul serแ Price "1", ou SAC "2"                                                     ???
???          ? F?rmula de juros compostos: M = P . (1 + i)n 	                                                            ???
???          ? F?rmula do coeficiente de c?lculo: = i/(1-(1/(1+i)^n))  		   											    ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Retorno   ? ExpN01 - Valor da parcela a pagar.                                                      	                ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Usuario   ?															                             						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Setor     ? Gestao do Leite	                                                                       						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???            						ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???Autor     ? Data     ? Motivo da Alteracao  				               ?Usuario(Filial+Matricula+Nome)    ?Setor        ???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???          ?          ?                    							   ?                                  ? 			???
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
*/
User Function CalcJuros(xcTipo,xnTaxa,xnVlr,xnParc,xnCar,xdVencto,xdPgto,xTipoJur)


Local _nTaxaM := xnTaxa / 100 // Taxa mensal
Local _nTaxaD := _nTaxaM / 30 // Taxa Di?ria
Local _nCoef := 0 // Coeficiente de c?lculo
Local _nVlrParc := 0 // Valor da parcela sem juros
Local _nRet	:= 0  
Local _nAux	:= 0 
Local _nDias := 0
Local _nJurSac := 0
DEFAULT xcTipo := "NULL"
DEFAULT xnTaxa := 0
DEFAULT xnVlr := 0
DEFAULT xnParc := 0
DEFAULT xnCar := 0
DEFAULT xTipoJur := "1"

If xcTipo == "NULL" .or. !(xcTipo $ "P/J/D")
	xMagHelpfis("Erro CalcJuros","N?o foi informado o c?lculo a realizar para a fun??o CalcJuros!",;
		"Comunique este erro ao suporte. Deve ser informado J para c?lculo de juros, ou D para calculo de descontos.")
	Return _nRet
EndIf

If xcTipo == "P" // Se solicitado calculo de juros no parcelamento
	If xnTaxa > 0
		If xTipoJur == "1" //Parcelamento Price	
			_nVlrPar := xnVlr / xnParc
			// C = i/(1-(1/(1+i)^n))
			_nCoef := _nTaxaM / (1-(1/(1+_nTaxaM)**(xnParc-xnCar)))
			If xnCar > 0 //Se carencia maior que zero, faz o valor principal menos o valor das parcelas de carencia.
				_nAux := (xnVlr - (xnCar *_nVlrPar)) * _nCoef  
			Else
				_nAux := xnVlr  * _nCoef 	
			EndIf
			_nAux := _nAux * (xnParc-xnCar)
			_nRet := (_nAux + (xnCar *_nVlrpar)) / xnParc
			_nRet := Round(_nRet,2)
		Else //Parcelamento SAC
			_nVlrPar := xnVlr / xnParc
	  		_nJurSac := xnVlr * _nTaxaM					  		
	  		For i:= 1 to xnParc
		  		_nJurSac += (xnVlr - (i*_nVlrPar)) * _nTaxaM					  		
	  		Next i
	  		_nRet := (_nJurSac + xnVlr) / xnParc
			_nRet := Round(_nRet,2)		
		EndIf
	Else
		_nRet := xnVlr / xnParc // Se taxa igual ou menor que zero, retorna total dividido pela quantidade de parcelas
		_nRet := Round(_nRet,2)
	EndIf
	
ElseIf xcTipo == "D" // Se solciitado c?lculo de descontos na antecipa??o de parcelas
	If Empty(xdVencto) .or. Empty(xdPgto)
		xMagHelpfis("Erro CalcJuros","N?o foi informada data de vencimento ou de pagamento do t?tulo!",;
			"Comunique este erro ao suporte. O calculo de desconto n?o ser? realizado.")
		Return _nRet
	EndIf	
	If xdVencto < xdPgto
		If ALLTRIM(FunName()) == "AGLT044" //Implementado para tratar baixa. Ver com Guilherme.
			Return xnVlr
		EndIf
		xMagHelpfis("Erro CalcJuros","Data de vencimento ? menor que a data do pagamento!",;
			"N?o ? permitido o c?lculo de descontos em titulos em atraso.")
		Return _nRet 
	EndIf

	If (Month(xdVencto) == Month(xdPgto)) .and. (Year(xdVencto) == Year(xdPgto))
		_nDias := xdVencto - xdPgto
	Else
		If Year(xdVencto) == Year(xdPgto)
			_nAux := ( Month(xdVencto) - Month(xdPgto) ) * 30
			_nDias := (Day(xdVencto) - Day(xdPgto)) + _nAux
		Else
			_nAux := ( Month(xdVencto)+ ((Year(xdVencto) - Year(xdPgto))*12) - Month(xdPgto) ) * 30
//			_nDias := IIf(Day(xdPgto) < Day(xdVencto),Day(xdVencto), Day(xdVencto) + 30)
//			_nDias := (_nDias - Day(xdPgto)) + _nAux
			_nDias := (Day(xdVencto) - Day(xdPgto)) + _nAux
		EndIf
	EndIf
	
	// P=M/(1+i)n  
	If xnTaxa > 0
		_nAux := (1+ _nTaxaD)**_nDias
		_nRet := xnVlr / _nAux
		_nRet := Round(_nRet,2)
		Else
		_nRet := xnVlr  // se taxa igual a zero, retorna o valor original da parcela
		_nRet := Round(_nRet,2)	
	EndIf

ElseIf xcTipo == "J" // Se solicitado calculo de juros no pagamento em atraso.
	If Empty(xdVencto) .or. Empty(xdPgto)
		xMagHelpfis("Erro CalcJuros","N?o foi informada data de vencimento ou de pagamento do t?tulo!",;
			"Comunique este erro ao suporte. O calculo de juros n?o ser? realizado.")
		Return _nRet
	Else
		//Compatibiliza a data de vencimento com feriados e finais de semana para na? calcular os juros.
		xdVencto := DataValida(xdVencto)
	EndIf	
	//M = P . (1 + i)
	If (Month(xdVencto) == Month(xdPgto)) .and. (Year(xdVencto) == Year(xdPgto))
		//Tratar data negativa (Titulo nao vencido) -> Verificar impacto Guilherme
		_nDias := xdPgto - xdVencto
		If _nDias < 0
			_nDias := 0
		EndIf
	Else
		If Year(xdVencto) == Year(xdPgto)
			_nAux := ( Month(xdPgto) -  Month(xdVencto) ) * 30
			_nDias := ( Day(xdPgto) - Day(xdVencto) ) + _nAux
		Else
			_nAux := ( Month(xdPgto) - Month(xdVencto)  +  ((Year(xdPgto) - Year(xdVencto))*12)) * 30
			_nDias := (Day(xdPgto) - Day(xdVencto)) + _nAux
		EndIf
	EndIf
	//M = P . (1 + i)n
	If xnTaxa > 0 .AND. _nDias > 0 //Tratativa para calcular juros se data de pagamento menor que vencimento. Verificar Guilherme!
		_nAux := (1+ _nTaxaD)**_nDias
		_nRet := xnVlr * _nAux
		_nRet := Round(_nRet,2)
	Else
		_nRet := xnVlr  // se taxa igual a zero, retorna o valor original da parcela Verificar Guilherme
		_nRet := Round(_nRet,2)	
	EndIf	

EndIf


//Alert(cvaltochar(_nRet))
Return _nRet
//Return


//U_CalcJuros("D",2,109.24,10,1,CTOD("20/08/2014"),CTOD("27/12/2013")) 

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณCrioscopiaบ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 27/04/2015                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume de agua entregue pelo produtor, para ser penalizado no evento de Crioscopia		บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ  BEN ALIMENTOS                                                    											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ xOpc = 1:Retorna penalidade a ser aplicada; xOpc = 2:Retorna array com historico de crioscopia               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume de agua entregue pelo produtor                                                                    	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function Crioscopia(xOpc, xProd, xLoja, xData)                     

Local cArea := GetArea()
Local _cFaixa := "030001" //Codigo da faixa de indica็a๕ da tabela ZLA
Local _nDias := SuperGetMv("LT_DIASH20",,365) //Periodo em dias para verificar se houve mistura de agua no leite
Local _dDiaIni := ""
Local _dDataFim := ""
Local _nVlrfx := 0
Local _nQtdDes := 0
Local cQry2
Local _aReturn := {}
Local _cTpTanque := ""//Posicione("ZLS",1,xFilial("ZLS")+SA2->A2_L_TANQ,"ZLS_CLASTQ") //Tipo de tanque (I=Individual; C= Coletivo)
Local _lOk := .f.

DEFAULT xData := dDatabase

_dDiaIni := DaySub(xData,_nDias) 
_dDataFim := xData


DbSelectArea("SA2")
DbSetOrder(1)
DbSeek(xFilial("SA2")+xProd+xLoja)

_cTpTanque := Posicione("ZLS",1,xFilial("ZLS")+SA2->A2_L_TANQ,"ZLS_CLASTQ") //Tipo de tanque (I=Individual; C= Coletivo)

cQry2  := " SELECT ZLD_DTCOLE DTCOLE, SUM(ZLD_QTDBOM) TBOM, SUM(ZLD_QTDH2O) AGUA, SUM(ZLD_DESH2O) DESCONT FROM " + RETSQLNAME("ZLD") + " ZLD "
cQry2  += " WHERE ZLD_FILIAL = '" + xFILIAL("ZLD") + "'"
cQry2  += " AND ZLD_DTCOLE BETWEEN  '" + DTOS(_dDiaIni) + "' AND '" + DTOS(_dDataFim) + "'"
cQry2  += " AND ZLD_SETOR = '"+ ZL2->ZL2_COD +"'"
cQry2  += " AND ZLD_RETIRO = '" + SA2->A2_COD + "'"
cQry2  += " AND ZLD_RETILJ = '" + SA2->A2_LOJA + "'"
cQry2  += " AND ZLD_QTDH2O > 0 "
cQry2  += " AND ZLD.D_E_L_E_T_ = ' '"
cQry2  += " GROUP BY ZLD_DTCOLE "
cQry2  += " ORDER BY ZLD_DTCOLE"
If Select("TRAB1") <> 0
	TRAB1->(dbCloseArea("TRAB1"))
EndIf
cQry2 := CHANGEQUERY(cQry2)
dbUseArea(.T., "TOPCONN", TCGenQry(,,cQry2), "TRAB1", .F., .T.)

While !TRAB1->(Eof())
	_nVlrfx := ROUND((TRAB1->DESCONT/TRAB1->AGUA)*100,0)
	AADD(_aReturn,{TRAB1->DTCOLE,TRAB1->TBOM,TRAB1->AGUA,_nVlrfx,TRAB1->DESCONT})
	TRAB1->(DbSkip())
EndDo

// Retorno para gatilho que irแ jogar o desconto do dia
If xOpc == 1
	If _cTpTanque == "C" //Tanque coletivo sempre sera penalizado em 100%
		_nVlrfx	:= 100
	Else
		_nVlrfx:= u_getFaixa(xFILIAL("ZLA"),ZL2->ZL2_COD,_cFaixa,Len(_aReturn)+1) 
	EndIf
	RestArea(cArea)
    Return (_nVlrfx/100)

EndIf

//Retorno para o evento da crioscopia no fechamento do leite.
If xOpc == 3
	For i:=1 to Len(_aReturn)
		If Stod(_aReturn[i][1]) >= FirstDay(_dDataFim)
			_nQtdDes += _aReturn[i][5]
		EndIf
    Next i
	RestArea(cArea)
	Return _nQtdDes
EndIf

RestArea(cArea)

Return _aReturn

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณVLDESCARTEบ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 07/05/2015                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume de leite que foi descartado e sera cobrado do produtor no fechamentodo leite.                  บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ  BEN ALIMENTOS                                                    											บฑฑ
ฑฑบ          ณ 	Usado no evento 770001 - Descarte leite                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume de leite a ser descontado do produtor                                                             	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function VLDESCARTE(_xCod,_xLoja,_xDtINi, _xDtFim)

Local _nRet := 0
Local _cAlias := GetNextAlias()
Local _cBetween := "% '"+DTOS(_xDtINi)+"' AND '"+DTOS(_xDtFim)+"' %"

BeginSql alias _cAlias
	SELECT SUM(ZLN_QTD) QTD
	FROM %Table:ZLN% ZLN
	WHERE ZLN_FILIAL = ''
	AND ZLN_CODIGO = %Exp:_xCod%
	AND ZLN_LOJA = %Exp:_xLoja%
	AND ZLN_DATA BETWEEN %Exp:_cBetween%
	AND D_E_L_E_T_ = ' '
EndSql

If !(_cAlias)->(Eof())
	_nRet := (_cAlias)->QTD
EndIf
DbCloseArea(_cAlias)

Return _nRet
	
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณVLDESCARTEบ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 07/05/2015                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona Volume de leite que foi descartado e sera cobrado do produtor no fechamentodo leite.                  บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                                  											บฑฑ
ฑฑบ          ณ 	Usado no evento 01002 - Cr้dito de transfer๊ncia de leite.                                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume de leite a ser descontado do produtor                                                             	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function CredTrfLeite(_pcCodMix, _pcProdutor, _pcLoja)

Local _aArea    := GetArea()
Local _aAreaZL8 := ZL8->(GetArea())
Local _nRetorno := 0 
Local _cAliasZLK := GetNextAlias()

BeginSql Alias _cAliasZLK
	
	SELECT SUM(ZLK_QTD) AS ZLK_QTD
	
	FROM %Table:ZLK% ZLK
	
	JOIN %Table:ZLJ% ZLJ
	ON ZLJ_FILIAL = ZLK_FILIAL
	AND ZLJ_MIX   = %Exp:_pcCodMix%
	AND ZLJ_CODIGO = ZLK_CODIGO
	AND ZLJ.D_E_L_E_T_ = ' '
	
	WHERE ZLK_FILIAL = %Exp:xFilial("ZLK")%
	AND   ZLK_CODPRO = %Exp:_pcProdutor%
	AND   ZLK_LOJPRO = %Exp:_pcLoja%
	AND   ZLK.D_E_L_E_T_ = ' '
	
EndSql

dbSelectArea(_cAliasZLK)
dbGoTop()

_nRetorno :=  ZL8->ZL8_VALOR * (_cAliasZLK)->ZLK_QTD

(_cAliasZLK)->(dbCloseArea())
                                   
RestArea(_aAreaZL8)
RestArea(_aArea)

Return(_nRetorno)

/*/ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณPICTFAVบ Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 27/04/2015                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona picture para o campo A2_L_CGCFA   no cadastro do produtor. 		บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                                      											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ xOpc = 1:Retorna penalidade a ser aplicada; xOpc = 2:Retorna array com historico de crioscopia               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ volume de agua entregue pelo produtor                                                                    	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
//User Function PictFav()
 
//Return( PICPES(M->A2_L_TPFAV) )

/*/ 
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณSIGLAFIL Autor ณ Guilherme Fran็a      บ Data da Criacao  ณ 04/07/2016                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Retona sigla da filial logada na PROMILAT.                                                           		บฑฑ
ฑฑบ          ณ                              							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ   PROMILAT                                                   											บฑฑ
ฑฑบ          ณ 	 							                                                                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ                                                                                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ                                                                                                          	บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ															                             						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite	                                                                        					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            						ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑฬฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤนฑฑ
ฑฑบ          ณ          ณ                    							   ณ                                  ณ 			บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function  SIGLAFIL(_xCod)

Local _cRet := "LOT"

Do Case 
	Case _xCod == "5301"
		_cRet := "PRO"
	Case _xCod == "5303"
		_cRet := "SRO"
	Case _xCod == "5304"
		_cRet := "SSP"
EndCase

Return _cRet

/*
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
???Programa  ?GetResf ?Autor  ?Microsiga           ? Data ?  02/24/16   ???
?????????????????????????????????????????????????????????????????????????????
???Desc.     ? C?lculo de cobran?a e cr?dito de valores de resfriamento   ???
???          ? espec?fico para Coopersucesso.                             ???
???          ?                                                            ???
?????????????????????????????????????????????????????????????????????????????
???Uso       ? AP                                                        ???
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
*/
                                              
User Function GetResf(cDebCred)
Local cArea   := GetArea()
Local nVlr    := 0
Local nRet    := 0

Local cTanque := U_GetTqPrd(SA2->A2_COD, SA2->A2_LOJA)

//?????????????????????????????????????????????????
//? Posiciona no cadastro de Tanques - Cabecalho. ?
//?????????????????????????????????????????????????
dbSelectArea("ZLS")
dbSetOrder(1)
If dbSeek(xFILIAL("ZLS")+cTanque)

	//?????????????????????????????????????????????????
	//? Posiciona no cadastro de Tanques - Itens.     ?
	//?????????????????????????????????????????????????
	dbSelectArea("ZLT")
	dbSetOrder(1)//ZLT_FILIAL+ZLT_COD+ZLT_SA2COD+ZLT_SA2LJ
	If dbSeek(xFILIAL("ZLT")+cTanque+SA2->A2_COD+SA2->A2_LOJA)

		//?????????????????????????????????????????????????????????????????????????
		//?            T A X A    D E    R E S F R I A M E N T O                  ?
		//?????????????????????????????????????????????????????????????????????????
		//Se o evento esta sendo executado para o Titular do Tanque.
		If ZLT->ZLT_TITULA == "S" .and. cDebCred == "C"
			//Tipo de Taxa de Resfriamento igual a valor Fixo.
			If ZLS->ZLS_TPRES == "F"
				nRet := ZLS->ZLS_TXRES
			ElseIf ZLS->ZLS_TPRES == "V" //Tipo de Taxa de Resfriamento igual a Volume
				nRet := ZLS->ZLS_TXRES
				nRet := nRet * U_VLTETQ(cTanque,FirstDay(dDataBase),LastDay(dDataBase),.f.,.t.)
			EndIf
		ElseIf ZLT->ZLT_TITULA != "S" .and. cDebCred == "D"//O evento esta sendo executado para um agregado
			//Tipo de Taxa de Resfriamento igual a valor Fixo
			If ZLS->ZLS_TPRES == "F"
				nRet := ZLS->ZLS_TXRES 
			ElseIf ZLS->ZLS_TPRES == "V" //Tipo de Taxa de Resfriamento igual a Volume
				nRet := ZLS->ZLS_TXRES
				nRet := nRet * _PNVLEITE
			EndIf                                                        
		EndIf
	EndIf
EndIf

RestArea(cArea)

Return(nRet)
/*
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
???Programa  ?GetTqPrd ?Autor  ?Microsiga           ? Data ?  02/24/16   ???
?????????????????????????????????????????????????????????????????????????????
???Desc.     ?Retorna c?digo do tanque do produtor.                      ???
???          ?                                                            ???
?????????????????????????????????????????????????????????????????????????????
???Uso       ? AP                                                        ???
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
?????????????????????????????????????????????????????????????????????????????
*/

User Function GetTqPrd(_pcProdutor, _pcLoja)

Local _aArea    := GetArea()
Local _cAlias   := GetNextAlias()
Local _cRetorno := "" 

BeginSql Alias _cAlias
	
	SELECT ZLT_COD
	
	FROM %Table:ZLT% ZLT
	
	WHERE ZLT_FILIAL = %xFilial:ZLT%
	AND ZLT_COD BETWEEN ' ' AND 'ZZZZZZ'
	AND ZLT_SA2COD = %Exp:_pcProdutor%
	AND ZLT_SA2LJ = %Exp:_pcLoja%
	AND ZLT.D_E_L_E_T_ = ' '
	
EndSql

dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())

_cRetorno := (_cAlias)->ZLT_COD

(_cAlias)->(dbCloseArea())

RestArea(_aArea)

Return(_cRetorno)



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Funrural บ Autor ณ Guilherme Fran็a   บ Data ณ  22/08/17   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Realiza cแlculo para o evento de funrural para apresenta็ใo   บฑฑ
ฑฑบ          ณ na tela do MIX.     							                 บฑฑ
ฑฑบ          ณ                                  				              บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Evento Funrural - AGLT020(CALCULOS MIX)                                     บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function Funrural(xValor)

//Local _nCreditos := U_GETCREDPR(ZLE->ZLE_COD,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD,,.F.)
//Local _nDebitos	 := U_GETREDUT(ZLE->ZLE_COD,SA2->A2_COD,SA2->A2_LOJA,ZL2->ZL2_COD,ZL3->ZL3_COD," ")
Local _cFunrural := Alltrim(GetMv("LT_EVEINSS"))
Local _nFator	:= 1
Local _nRet := 0
Local _nAliqFun := GetMv("LT_ALIQFUN") / 100
Local _nAliqSen := GetMv("LT_ALIQSEN") / 100
Local _cAlias := GetNextAlias()

DEFAULT xValor := 0

If xValor == 0
	BeginSql alias _cAlias
		SELECT LF.ZLF_RETIRO, LF.ZLF_RETILJ, SUM(CASE WHEN ZLF_DEBCRE = 'C' THEN ZLF_TOTAL ELSE -ZLF_TOTAL END) AS TOTAL 
		FROM %Table:ZLF% (NOLOCK) LF
		WHERE ZLF_CODZLE = %Exp:ZLE->ZLE_COD%
		AND LF.ZLF_A2COD = %Exp:SA2->A2_COD%
		AND LF.ZLF_A2LOJA = %Exp:SA2->A2_LOJA%
		//Filtrando a Filial da ZLF
		AND LF.ZLF_FILIAL  = %Exp:xFilial("ZLF")%
		AND LF.ZLF_EVENTO <> %Exp:_cFunrural%
		AND ZLF_ORIGEM = 'M'
		AND LF.%NotDel%
		GROUP BY LF.ZLF_RETIRO, LF.ZLF_RETILJ
	EndSql
	If Select(_cAlias) <> 0
		xValor := (_cAlias)->TOTAL
		
		(_cAlias)->(DbCloseArea())
	EndIf
	
EndIf


If SA2->A2_L_INSS == "S"  .AND. SA2->A2_L_SENAR == "S" 
	_nFator := 1 - (_nAliqFun + _nAliqSen) // 2,3%
ElseIf SA2->A2_L_SENAR == "S" 
	_nFator := 1 - _nAliqSen // 0,2%
ElseIf SA2->A2_L_INSS == "S"
	_nFator := 1 - _nAliqFun  // 2,1%
EndIf	

xValor := Round(xValor,4)
//_nRet := (_nCreditos - _nDebitos) / _nFator
_nRet := xValor / _nFator
//_nRet := _nRet - (_nCreditos - _nDebitos)
_nRet := _nRet - xValor

Return _nRet

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ConsDesvRot บ Autor ณ Guilherme Fran็a   บ Data ณ  15/01/15   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada na consulta padrใo ZLD_02 para selecionar o      บฑฑ
ฑฑบ          ณ ticket que ira ser lan็ado no desvio de rota.                 บฑฑ
ฑฑบ          ณ Consulta Padrใo                                               บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function ConsDesvRot()

Local _cCampo    	:= &(Alltrim(ReadVar()))  //Ticket
Local _fDtColeta 	:="% '"+DTOS(MonthSub(dDataBase,1))+"'  %" //Busca coletas de um mes atras
Local _cTemp
Local _aArray		:= {}
//Local _cFretista	:= "% '"+M->ZLC_FRETIS+"' %"
Private nTam      := 6
Private nMaxSelect:= 1
Private aCat      := {}
Private MvRet     := Alltrim(ReadVar())
Private MvPar     := ""
Private cTitulo   := ""
Private MvParDef  := ""



#IFDEF WINDOWS
	oWnd := GetWndDefault()
#ENDIF


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSeleciona as recepcoes recentes.                     ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If Select("TRBX")>0
	DbCloseArea("TRBX")
EndIf


BeginSql alias "TRBX"
	SELECT DISTINCT ZLD_TICKET, ZLD_DTCOLE, ZLD_ROTCAB, ZLD_DESCAB, ZLD_FRETIS, A2.A2_NOME
	FROM %Table:ZLD% LD
	JOIN %Table:SA2% A2 ON A2.A2_COD = LD.ZLD_FRETIS AND A2.A2_LOJA = LD.ZLD_LJFRET AND  A2.%NotDel%
	WHERE ZLD_DTCOLE > %Exp:_fDtColeta%
	//AND ZLD_FRETIS = %Exp:_cFretista%
	AND LD.%NotDel%
	ORDER BY ZLD_TICKET DESC
EndSql

dbSelectArea("TRBX")
dbGotop()

cTitulo := "TICKET | DT COLETA  |COD ROTA  |ROTA                    |COD TRANS | TRANSPORTADOR                         "


While !("TRBX")->(Eof())
	
	aAdd(aCat,("TRBX")->ZLD_TICKET + " | "+DTOC(STOD(("TRBX")->ZLD_DTCOLE))+ "  |" +("TRBX")->ZLD_ROTCAB + "    | " + SubStr(("TRBX")->ZLD_DESCAB,1,25)+"| "+("TRBX")->ZLD_FRETIS + "   | " + SubStr(("TRBX")->A2_NOME,1,25))
	
	("TRBX")->(dbSkip())
EndDo

dbSelectArea("TRBX")
dbCloseArea("TRBX")


//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณTrativa abaixo para no caso de uma alteracao do campo trazer todosณ
//ณos dados que foram selecionados anteriormente.                    ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

If Len(AllTrim(&MvRet)) == 0
	
	MvPar:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	&MvRet:= PadR(AllTrim(StrTran(&MvRet,";","")),Len(aCat))
	
Else
	
	MvPar:= AllTrim(StrTran(&MvRet,";","/"))
	
EndIf

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSomente altera o conteudo caso o usuario clique no botao okณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//Executa funcao que monta tela de opcoes
If f_Opcoes(@MvPar,cTitulo,aCat,MvParDef,12,49,.F.,nTam,nMaxSelect)
	
	&MvRet := ""
	_cTemp := ""
	
	//Tratamento para separar retorno com barra ";"
	For i:=1 to Len(MvPar)
		If !(SubStr(MvPar,i,1) $ " |*")
			_cTemp  += SubStr(MvPar,i,1)
		elseif (SubStr(MvPar,i,1) $ "|")
			AADD(_aArray,_cTemp)
			_cTemp := ""
		EndIf
	Next
	
	&MvRet:= _aArray[1]
	// aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_DESLIN" })] := _aArray[2]
	// aCols[n,ASCAN(aHeader,{|x| ALLTRIM(x[2]) == "ZLD_VERSAO" })] := _aArray[3]

Else
	
	&MvRet:= _cCampo
	
EndIf


Return(.T.)	

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMGLT002   บAutor  ณMicrosiga           บ Data ณ  02/21/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*
User Function xPutSx1(cGrupo,cOrdem,cPergunt,cPerSpa,cPerEng,cVar,; 
     cTipo ,nTamanho,nDecimal,nPresel,cGSC,cValid,; 
     cF3, cGrpSxg,cPyme,; 
     cVar01,cDef01,cDefSpa1,cDefEng1,cCnt01,; 
     cDef02,cDefSpa2,cDefEng2,; 
     cDef03,cDefSpa3,cDefEng3,; 
     cDef04,cDefSpa4,cDefEng4,; 
     cDef05,cDefSpa5,cDefEng5,; 
     aHelpPor,aHelpEng,aHelpSpa,cHelp) 

LOCAL aArea := GetArea() 
Local cKey 
Local lPort := .f. 
Local lSpa := .f. 
Local lIngl := .f. 

cKey := "P." + AllTrim( cGrupo ) + AllTrim( cOrdem ) + "." 

cPyme    := Iif( cPyme           == Nil, " ", cPyme          ) 
cF3      := Iif( cF3           == NIl, " ", cF3          ) 
cGrpSxg := Iif( cGrpSxg     == Nil, " ", cGrpSxg     ) 
cCnt01   := Iif( cCnt01          == Nil, "" , cCnt01      ) 
cHelp      := Iif( cHelp          == Nil, "" , cHelp          ) 

dbSelectArea( "SX1" ) 
dbSetOrder( 1 ) 

// Ajusta o tamanho do grupo. Ajuste emergencial para valida็ใo dos fontes. 
// RFC - 15/03/2007 
cGrupo := PadR( cGrupo , Len( SX1->X1_GRUPO ) , " " ) 

If !( DbSeek( cGrupo + cOrdem )) 

    cPergunt:= If(! "?" $ cPergunt .And. ! Empty(cPergunt),Alltrim(cPergunt)+" ?",cPergunt) 
     cPerSpa     := If(! "?" $ cPerSpa .And. ! Empty(cPerSpa) ,Alltrim(cPerSpa) +" ?",cPerSpa) 
     cPerEng     := If(! "?" $ cPerEng .And. ! Empty(cPerEng) ,Alltrim(cPerEng) +" ?",cPerEng) 

     Reclock( "SX1" , .T. ) 

     Replace X1_GRUPO   With cGrupo 
     Replace X1_ORDEM   With cOrdem 
     Replace X1_PERGUNT With cPergunt 
     Replace X1_PERSPA With cPerSpa 
     Replace X1_PERENG With cPerEng 
     Replace X1_VARIAVL With cVar 
     Replace X1_TIPO    With cTipo 
     Replace X1_TAMANHO With nTamanho 
     Replace X1_DECIMAL With nDecimal 
     Replace X1_PRESEL With nPresel 
     Replace X1_GSC     With cGSC 
     Replace X1_VALID   With cValid 

     Replace X1_VAR01   With cVar01 

     Replace X1_F3      With cF3 
     Replace X1_GRPSXG With cGrpSxg 

     If Fieldpos("X1_PYME") > 0 
          If cPyme != Nil 
               Replace X1_PYME With cPyme 
          Endif 
     Endif 

     Replace X1_CNT01   With cCnt01 
     If cGSC == "C"               // Mult Escolha 
          Replace X1_DEF01   With cDef01 
          Replace X1_DEFSPA1 With cDefSpa1 
          Replace X1_DEFENG1 With cDefEng1 

          Replace X1_DEF02   With cDef02 
          Replace X1_DEFSPA2 With cDefSpa2 
          Replace X1_DEFENG2 With cDefEng2 

          Replace X1_DEF03   With cDef03 
          Replace X1_DEFSPA3 With cDefSpa3 
          Replace X1_DEFENG3 With cDefEng3 

          Replace X1_DEF04   With cDef04 
          Replace X1_DEFSPA4 With cDefSpa4 
          Replace X1_DEFENG4 With cDefEng4 

          Replace X1_DEF05   With cDef05 
          Replace X1_DEFSPA5 With cDefSpa5 
          Replace X1_DEFENG5 With cDefEng5 
     Endif 

     Replace X1_HELP With cHelp 

     U_xPutSx1Help(cKey,aHelpPor,aHelpEng,aHelpSpa) 

     MsUnlock() 
Else 

   lPort := ! "?" $ X1_PERGUNT .And. ! Empty(SX1->X1_PERGUNT) 
   lSpa := ! "?" $ X1_PERSPA .And. ! Empty(SX1->X1_PERSPA) 
   lIngl := ! "?" $ X1_PERENG .And. ! Empty(SX1->X1_PERENG) 

   If lPort .Or. lSpa .Or. lIngl 
          RecLock("SX1",.F.) 
          If lPort 
        SX1->X1_PERGUNT:= Alltrim(SX1->X1_PERGUNT)+" ?" 
          EndIf 
          If lSpa 
               SX1->X1_PERSPA := Alltrim(SX1->X1_PERSPA) +" ?" 
          EndIf 
          If lIngl 
               SX1->X1_PERENG := Alltrim(SX1->X1_PERENG) +" ?" 
          EndIf 
          SX1->(MsUnLock()) 
     EndIf 
Endif 

RestArea( aArea ) 

Return

/*
// Cria as perguntas no dicionario de dados 

Static Function PGravaSx1(cPSx101, cPSx102, cPSx103, cPSx104, cPSx105, cPSx106, cPSx107, nPSx108, nPSx109, nPSx110, cPSx111, cPSx112, cPSx113, cPSx114, cPSx115, cPSx116, cPSx117, cPSx118, cPSx119, cPSx120, cPSx121, cPSx122, cPSx123, cPSx124, cPSx125, cPSx126, cPSx127, cPSx128, cPSx129, cPSx130, cPSx131, cPSx132, aPSx133, aPSx134, aPSx135, cPSx136)

Local cKey := "P." + AllTrim(cPSx101) + AllTrim(cPSx102) + "."

Default cPSx115 := ''
Default cPSx113 := ''
Default cPSx114 := ''
Default cPSx120 := ''
Default cPSx136 := ''

RecLock('SX1', .T.)
	
	SX1->X1_GRUPO   := cPSx101
	SX1->X1_ORDEM   := cPSx102
	SX1->X1_PERGUNT := cPSx103
	SX1->X1_PERSPA  := cPSx104
	SX1->X1_PERENG  := cPSx105
	SX1->X1_VARIAVL := cPSx106
	SX1->X1_TIPO    := cPSx107
	SX1->X1_TAMANHO := nPSx108
	SX1->X1_DECIMAL := nPSx109
	SX1->X1_PRESEL  := nPSx110
	SX1->X1_GSC     := cPSx111
	SX1->X1_VALID   := cPSx112
	SX1->X1_F3      := cPSx113
	SX1->X1_GRPSXG  := cPSx114
	
	If ColumnPos("X1_PYME") > 0
		
		If Type('cPSx115') != 'U'
			
			SX1->X1_PYME := cPSx115
			
		EndIf
		
	EndIf
	
	SX1->X1_VAR01 := cPSx116
	
	If cPSx111 == "C" // Multipla escolha.
		
		SX1->X1_DEF01   := cPSx117
		SX1->X1_DEFSPA1 := cPSx118
		SX1->X1_DEFENG1 := cPSx119
		SX1->X1_CNT01   := cPSx120
		
		SX1->X1_DEF02   := cPSx121
		SX1->X1_DEFSPA2 := cPSx122
		SX1->X1_DEFENG2 := cPSx123
		
		SX1->X1_DEF03   := cPSx124
		SX1->X1_DEFSPA3 := cPSx125
		SX1->X1_DEFENG3 := cPSx126
		
		SX1->X1_DEF04   := cPSx127
		SX1->X1_DEFSPA4 := cPSx128
		SX1->X1_DEFENG4 := cPSx129

		SX1->X1_DEF05   := cPSx130
		SX1->X1_DEFSPA5 := cPSx131
		SX1->X1_DEFENG5 := cPSx132
		
	EndIf
	
	SX1->X1_HELP := cPSx136
	
	U_xPutSx1Help(cKey, aPSx133, aPSx134, aPSx135)
	
SX1->(MsUnlock())

Return
*/
/*
User Function xPutSx1Help(cKey,aHelpPor,aHelpEng,aHelpSpa,lUpdate,cStatus)

Local cFilePor := "SIGAHLP.HLP"
Local cFileEng := "SIGAHLE.HLE"
Local cFileSpa := "SIGAHLS.HLS"
Local nRet
Local nT
Local nI
Local cLast
Local cNewMemo
Local cAlterPath := ''
Local nPos	

If ( ExistBlock('HLPALTERPATH') )
	cAlterPath := Upper(AllTrim(ExecBlock('HLPALTERPATH', .F., .F.)))
	If ( ValType(cAlterPath) != 'C' )
        cAlterPath := ''
	ElseIf ( (nPos:=Rat('\', cAlterPath)) == 1 )
		cAlterPath += '\'
	ElseIf ( nPos == 0	)
		cAlterPath := '\' + cAlterPath + '\'
	EndIf
	
	cFilePor := cAlterPath + cFilePor
	cFileEng := cAlterPath + cFileEng
	cFileSpa := cAlterPath + cFileSpa
	
EndIf

Default aHelpPor := {}
Default aHelpEng := {}
Default aHelpSpa := {}
Default lUpdate  := .T.
Default cStatus  := ""

If Empty(cKey)
	Return
EndIf

If !(cStatus $ "USER|MODIFIED|TEMPLATE")
	cStatus := NIL
EndIf

cLast 	 := ""
cNewMemo := ""

nT := Len(aHelpPor)

For nI:= 1 to nT
   cLast := Padr(aHelpPor[nI],40)
   If nI == nT
      cLast := RTrim(cLast)
   EndIf
   cNewMemo+= cLast
Next

If !Empty(cNewMemo)
	nRet := SPF_SEEK( cFilePor, cKey, 1 )
	If nRet < 0
		SPF_INSERT( cFilePor, cKey, cStatus,, cNewMemo )
	Else
		If lUpdate
			SPF_UPDATE( cFilePor, nRet, cKey, cStatus,, cNewMemo )
		EndIf
	EndIf
EndIf

cLast 	 := ""
cNewMemo := ""

nT := Len(aHelpEng)

For nI:= 1 to nT
   cLast := Padr(aHelpEng[nI],40)
   If nI == nT
      cLast := RTrim(cLast)
   EndIf
   cNewMemo+= cLast
Next

If !Empty(cNewMemo)
	nRet := SPF_SEEK( cFileEng, cKey, 1 )
	If nRet < 0
		SPF_INSERT( cFileEng, cKey, cStatus,, cNewMemo )
	Else
		If lUpdate
			SPF_UPDATE( cFileEng, nRet, cKey, cStatus,, cNewMemo )
		EndIf
	EndIf
EndIf

cLast 	 := ""
cNewMemo := ""

nT := Len(aHelpSpa)

For nI:= 1 to nT
   cLast := Padr(aHelpSpa[nI],40)
   If nI == nT
      cLast := RTrim(cLast)
   EndIf
   cNewMemo+= cLast
Next

If !Empty(cNewMemo)
	nRet := SPF_SEEK( cFileSpa, cKey, 1 )
	If nRet < 0
		SPF_INSERT( cFileSpa, cKey, cStatus,, cNewMemo )
	Else
		If lUpdate
			SPF_UPDATE( cFileSpa, nRet, cKey, cStatus,, cNewMemo )
		EndIf
	EndIf
EndIf
Return
*/
