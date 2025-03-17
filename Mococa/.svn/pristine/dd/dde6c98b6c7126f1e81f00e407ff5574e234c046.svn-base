//Bibliotecas
#Include "Protheus.ch"

/*/{Protheus.doc} RESTA001
Rotina para cadastro dos perfis de autorização para retirada do almoxarifado
@author Luciano Alvarazo
@since 07/04/2017
@version 1.0
@type function
/*/

User Function RESTA001()
	Local cAliasTb := "Z20"
	Private cCadastro := "Retirada do Almoxarifado - Usuários x Produtos"
	Private aRotina := {}
	
	//Opções do menu
	aAdd(aRotina,{"Pesquisar",  "AxPesqui",  0, 1})
	aAdd(aRotina,{"Visualizar", "U_zZ20Man", 0, 2})
	aAdd(aRotina,{"Incluir",    "U_zZ20Man", 0, 3})
	aAdd(aRotina,{"Alterar",    "U_zZ20Man", 0, 4})
	aAdd(aRotina,{"Excluir",    "U_zZ20Man", 0, 5})
	
	//Abrindo a browse
	dbSelectArea(cAliasTb)
	dbSetOrder(1)
	mBrowse( 6,1,22,75,cAliasTb)
Return

/*/{Protheus.doc} zZ20Man
Função para manipular o registro - Modelo 2
@author Atilio
@since 12/06/2016
@version undefined
	@param cAliasTb, characters, Alias da Tabela
	@param nRegP, numeric, RecNo Posicionado
	@param nOpcP, numeric, Operação
@type function
/*/

User Function zZ20Man(cAliasTb, nRegP, nOpcP)
	Local lRet	:= .F.
	Local aAux	:= {}
	Local nEsp	:= 15
	Local aCorCab := "aCoordC001"
	Local aCoordC := {15,10} 
	Local nLimite := 999
	Local cLinhaOk := "AllwaysTrue()" // Validacoes na linha da GetDados da Modelo 2
	Local cTudoOk := "AllwaysTrue()" // Validacao geral da GetDados da Modelo 2
	Local cQryUpd	:= ""
	Local nInd
	Local nAux
	Local nIndA
	
	Private aCab	:= {}
	Private aRod	:= {}
	Private aCoords := {70,5,118,315}
	Private cIniCpos := "+Z20_ITEM"   // String com o nome dos campos que devem inicializados
                                           // ao pressionar a seta para baixo.
                                           
	Private cZ20Filial := FWxFilial("Z20") //cX5Filial
//	Private cZ20DOCUME := Iif(nOpcP == 3, GETSXENUM("Z20","Z20_DOCUME"), Z20->Z20_DOCUME) //GetSx8Num("SA1","A1_COD")
	Private cZ20CODUSU := Iif(nOpcP == 3, Space(TamSX3('Z20_CODUSU')[01]), Z20->Z20_CODUSU)
	Private cZ20NOUSU := Iif(nOpcP == 3, Space(TamSX3('Z20_NOUSU')[01]), Z20->Z20_NOUSU)
//	Private cZ20Emiss := Iif(nOpcP == 3, dDatabase, Z20->Z20_EMISS)
	
	Regtomemory(cAliasTb,(nOpcP==3))
	
	aHeader := {}
	aCols   := {}
	
	//Selecionando o dicionário de dados e ordenando o índice como 2 (Campo)
	DbSelectArea('SX3')
	SX3->(DbSetOrder(2))
	SX3->(DbGoTop())
	
	//Montando o cabeçalho
	aAux    := StrTokArr("Z20_CODUSU;Z20_NOUSU",';')
	aCabAux := StrTokArr("cZ20CODUSU;cZ20NOUSU",';')
	
	For nInd := 1 To Len(aAux)
		//Se encontrar o campo, adiciona no cabeçalho
		If SX3->(DbSeek(aAux[nInd]))
			&(aCorCab) := AClone(aCoordC)
			cVldAux    := Alltrim(SX3->X3_VLDUSER)
			
			/*
			//Tratamento para adicionar valid no campo do cabeçalho
			//Caso tenha conteúdo, terá .And.
			If !Empty(Alltrim(cVldAux))
				cVldAux += " .AND. "
			EndIf
			cVldAux += " u_zVALID(cPARAM)  "
			*/
			
			aAdd(aCab,{	aCabAux[nInd],;				//Nome da Variável
						&(aCorCab),;				//Array com coordenadas do Get
						SX3->X3_TITULO,;			//Titulo do Campo
						SX3->X3_PICTURE,;			//Picture
						cVldAux,;					//Validação
						SX3->X3_F3,;				//F3
						SX3->X3_VISUAL<>"V" .and. &(SX3->X3_WHEN) })		//Campo é editável?
							
			//Adicionando 1 no nome da variável
			aCorCab := Soma1(aCorCab)
			//tratamento pra mostrar os campos com 3 colunas
			if  mod(nInd,3) == 0 
				aCoordC[1] += nEsp
				aCoordC[2] := 10
			else
				//aCoordC[1] += nEsp
				aCoordC[2] := aCoordC[2] + 100
			endif
		EndIf
	Next
	
	//Ordenando o dicionário conforme Tabela
	SX3->(DbSetOrder(1))
	SX3->(DbGoTop())
	SX3->(DbSeek(cAliasTb))
	
	//Percorrendo a SX3
	While !(SX3->(EoF())) .And. (SX3->X3_ARQUIVO == cAliasTb)
		//Montando o aHeader, sem os campos do cabeçalho
		If !(Alltrim(SX3->X3_CAMPO) $ ("Z20_FILIAL;Z20_CODUSU;Z20_NOUSU"))
			If X3Uso(SX3->X3_USADO) .AND. cNivel >= X3_NIVEL
				aAdd(aHeader,{	SX3->X3_TITULO,;	//Titulo
								SX3->X3_CAMPO,;		//Campo
								SX3->X3_PICTURE,;	//Picture
								SX3->X3_TAMANHO,;	//Tamanho
								SX3->X3_DECIMAL,;	//Decimal
								SX3->X3_VLDUSER,;	//Validação do usuário
								SX3->X3_USADO,;		//Usado
								SX3->X3_TIPO,;		//Tipo
								SX3->X3_WHEN,;		//Modo Edição
								SX3->X3_F3,})		//F3
				
			EndIf
		EndIf
		
		//Pulando registro
		SX3->(DbSkip())
	EndDo
	
	//Se for inclusão monta o aCols zerado
	If nOpcP == 3
		//Montagem do aCols
		aCols := Array(1,Len(aHeader) + 1)
		for nAux := 1 to Len(aHeader)
			if aHeader[nAux][8] == "N"
				aCols[1][nAux] := 0
			elseif aHeader[nAux][8] == "C"
				aCols[1][nAux] := Space(aHeader[nAux][4])
			elseif aHeader[nAux][8] == "D"
				aCols[1][nAux] := CTOD("")		
			endif
		next nAux	 
		aCols[1][Len(aHeader)+1] := .F. //linha nao deletada
		aCOLS[1,aScan(aHeader,{|x|Trim(x[2])=="Z20_ITEM"})] := "001"
		
	//Senão, monta conforme dados cadastrados
	Else
		(cAliasTb)->(DbSetOrder(1))
		(cAliasTb)->(DbGoTop())
		If (cAliasTb)->(DbSeek(cz20Filial + cZ20CODUSU))
			//Percorrendo os registros para montar o aCols
			While !(cAliasTb)->(EoF()) .And. (cAliasTb)->Z20_CODUSU == cZ20CODUSU
				//Adicionando os dados em uma variável auxiliar
				aAuxCols := {}
				For nIndA := 1 To Len(aHeader)
					aAdd( aAuxCols,(cAliasTb)->&(aHeader[nIndA][2]) )
				Next
				aAdd(aAuxCols,.F.)				
				//Adicionando no aCols
				aAdd( aCols,aClone(aAuxCols) )				
				//Pulando o registro
				(cAliasTb)->(DbSkip())
			EndDo
		EndIf
	EndIf

	//Executando a chamada da Modelo2
	lRet := Modelo2(	cCadastro,;	//Título da Janela
						aCab,;		//Cabeçalho
						aRod,;		//Rodapé
						aCoords,;	//Coordenadas do GetDados
						nOpcP,;		//Opção (inclusão, alteração, etc)
						cLinhaOk,;	//Função para validação da Linha
						cTudoOk,;	//Função para validação do botão Confirmar
						,;			//Array com campos editáveis
						,;			//Bloco de código acionado pelo F4
						cIniCpos,;			//Campos que devem ser inicializados ao pressionar para baixo
						nLimite,;	//Limite de linhas do GetDados
						,;			//Coordenadas da montagem da dialog
						.T.,;		//Determina se as linhas podem ser deletadas ou não
						.T.,;		//Determina se a tela vai vir maximizada
						)			//Botões para ações relacionadas
	
	//Se for confirmado
	If lRet
		ConfirmSx8()
		//Se for inclusão
		If nOpcP == 3
			//Percorrendo o aCols
			For nAux := 1 To Len(aCols)
				//Se tiver excluido não será salvo
				If aCols[nAux][Len(aHeader)+1]
					Loop
				EndIf
				//Travando a tabela para gravação
				RecLock(cAliasTb,.T.)
					Z20->Z20_FILIAL	:= FWxFilial("Z20")
					Z20->Z20_CODUSU := cZ20CODUSU
					Z20->Z20_NOUSU := cZ20NOUSU
					Z20->Z20_ITEM	:= aCols[nAux][1]
					Z20->Z20_CODPRO := aCols[nAux][2]
					Z20->Z20_DESPRO := aCols[nAux][3]
					Z20->Z20_CODGRP := aCols[nAux][4]
					Z20->Z20_DESGRP := aCols[nAux][5]
				(cAliasTb)->(MsUnlock())	
			Next
			
		//Alteração
		ElseIf nOpcP == 4
			(cAliasTb)->(DbGoTop())
			aAreaTb := (cAliasTb)->(GetArea())			
			//Percorrendo os registros
			For nAux:=1 To Len(aCols)
				lExclui := aCols[nAux][Len(aHeader)+1]
				//Se conseguir posicionar na tabela juntamente com o campo de chave
				If (cAliasTb)->( DbSeek(cZ20Filial+cZ20CODUSU+aCols[nAux][1]) ) //Z20_FILIAL+Z20_CODUSU+Z20_ITEM
					RecLock(cAliasTb,.F.)
					//Se for exclusão
					If lExclui
						DbDelete()
					EndIf
					
				//Senão inclui um novo registro
				Else
					RecLock(cAliasTb,.T.)
					Z20->Z20_FILIAL	:= FWxFilial("Z20")
					Z20->Z20_CODUSU := cZ20CODUSU
					Z20->Z20_NOUSU := cZ20NOUSU
					Z20->Z20_ITEM	:= aCols[nAux][1]
					Z20->Z20_CODPRO := aCols[nAux][2]
					Z20->Z20_DESPRO := aCols[nAux][3]
					Z20->Z20_CODGRP := aCols[nAux][4]
					Z20->Z20_DESGRP := aCols[nAux][5]
				EndIf 
			
				//Senão for exclusão, adiciona rodapé e dados
				If !lExclui
					Z20->Z20_ITEM	:= aCols[nAux][1]
					Z20->Z20_CODPRO := aCols[nAux][2]
					Z20->Z20_DESPRO := aCols[nAux][3]
					Z20->Z20_CODGRP := aCols[nAux][4]
					Z20->Z20_DESGRP := aCols[nAux][5]
				EndIf
			
				//Destravando a tabela e salvando
				(cAliasTb)->(MsUnlock())
				
			Next
		
		//Exclusão
		ElseIf nOpcP == 5
			//Se for confirmado
			If MsgYesNo("Confirma a exclusão?","Atenção")
				//Exclui via update na base
				cQryUpd := " UPDATE "
				cQryUpd += "    "+RetSQLName(cAliasTb)
				cQryUpd += " SET "
				cQryUpd += "    D_E_L_E_T_= '*' "
				cQryUpd += " WHERE "
				cQryUpd += "    Z20_FILIAL = '" + FWxFilial("Z20") + "' "
				cQryUpd += "    AND Z20_CODUSU = '" + cZ20CODUSU + "' "
				nResult := TcSQLExec(cQryUpd)
				If nResult <> 0
					MsgStop("Erro ao excluir: "+Chr(13)+Chr(10)+TCSqlError(), "Atenção")
					Return .F.
				EndIf
			EndIf
		EndIf
	else
		RollbackSx8()			
	EndIf
Return .T.
