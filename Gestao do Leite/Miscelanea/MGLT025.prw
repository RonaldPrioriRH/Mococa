#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"


#DEFINE _ENTER CHR(13)+CHR(10)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT025  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 08/08/2013                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Rotina de importa็ใo do convenio UNIMED  - Especifico SELITA                              					บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						บฑฑ
ฑฑบ          ณ Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						บฑฑ
ฑฑบ          ณ Tabela SE2 - Contas a Pagar								                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Arquivo enviado pela Unimed.   							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑบ			 ณ														                                   						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ TOTVS - Microsiga											                             					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite                                                                          					บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL								        บฑฑ
ฑฑฬออออออออออัออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออออัออออออออออออออออออออออออออออออออออัอออออออออออออนฑฑ
ฑฑบAutor     ณ Data     ณ Motivo da Alteracao  				               ณUsuario(Filial+Matricula+Nome)    ณSetor        บฑฑ
ฑฑบฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤบฑฑ
ฑฑบ          ณ          ณ 							                       ณ----------------------------------ณ-------------บฑฑ
ฑฑศออออออออออฯออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออฯออออออออออออออออออออออออออออออออออฯอออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function MGLT025()

	Local _cTexto		:= ""
	Local _bProcess	:= {|oSelf| MGLT25Exec(oSelf)}
	
	Private _cPerg		:= "MGLT025"
	Private _cEveUnimed := AllTrim(GETMV("LT_EVEUNI")) //Cod do evento da unimed
	Private _cCodUnimed := AllTrim(GETMV("LT_UNIMED")) //Cod de cadastro da unimed SA2
	Private _aDadosOK	:= {}						   //Array com os valores evento/inss por cod. familia
	Private _cLog := ""
	Private _aImp := {}
	Private _aLog := {}
	Private _cArqImp
	Private _lArqInvalido := .T.
	
	If Empty(_cEveUnimed)
		xMagHelpFis("Inconsistecia","A rotina nใo foi parametrizada.",;
					"Informe o conte๚do dos parโmetros LT_UNIMED e LT_EVEUNI "+_ENTER;
					+"no m๓dulo Configurador.") 
		Return
	EndIf
	
	If Empty(_cCodUnimed)
		xMagHelpFis("Inconsistecia","A rotina nใo foi parametrizada.",;
					"Informe o conte๚do dos parโmetros LT_UNIMED e LT_EVEUNI "+_ENTER;
					+"no m๓dulo Configurador.")
		Return
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Chama funcao para criar os parametros caso nao existam.             ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	AjustaSX1()
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Chama a tela para preenchimento dos parametros.                     ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	/*If !Pergunte(_cPerg,.T.)
		Return()
	EndIf
	*/
	
	_cTexto := "Esta rotina tem o objetivo de efetuar a importa็ใo dos arquivos de integra็ใo do conv๊nios UNIMED."+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "Os dados importados podem ser visualizados e manipulados pela rotina de lan็amentos dos conv๊nios."+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "Ap๓s a importa็ใo do arquivo *.TXT, este terแ sua extensใo renomeada para *.IMP para evitar que o "+_ENTER
	_cTexto += "mesmo arquivo seja importado em duplicidade. "+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "O convenio serแ gerado para o fornecedor amarrado no parโmetro LT_UNIMED. "+_ENTER
	_cTexto += "O evento utilizado serแ o amarrado ao parใmetro LT_EVEUNI. "+_ENTER
	_cTexto += " "+_ENTER
		
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Sintaxe da tNewProcess():New( cFunction, cTitle, _bProcess, cDescription, _cPerg, aInfoCustom) ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	_oTProces := tNewProcess():New("MGLT025","Importa็ใo UNIMED",_bProcess,_cTexto,_cPerg)
	
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Renomeia os arquivos, para identificar que os mesmos ja foram importados. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If _lArqInvalido	
		If FRENAME(_cArqImp,Substr(_cArqImp,1,Len(_cArqImp)-3)+"IMP") == -1
			MsgAlert("Nใo foi possํvel renomear o arquivo: "+chr(13)+_cArqImp)
		EndIf
	EndIf
	/*
	If Len(_cLog) > 0
		xMagHelpFis("C๓digos Invแlidos","Os c๓digos de famํlia abaixo nใo foram localizados no cadastro de Cooperados!",_cLog)
	EndIf
	*/
	If Len(_aLog) > 0
		xMagHelpFis("C๓digos Invแlidos","Um ou mais c๓digos de famํlia nใo foram localizados no cadastro de cooperados.",;
					"Confirme esta tela para apresentar o relat๓rio com o log da importa็ใo.")
		Processa( {|| LogImport() }, "Aguarde...", "Gerando relat๓rio de Log...",.F.)
	Else
		xMagHelpFis("Importa็ใo","Importa็ao concluํda com ๊xito!",;
					"Confirme esta tela para apresentar o relat๓rio com o log da importa็ใo.")
		Processa( {|| LogImport() }, "Aguarde...", "Gerando relat๓rio de Log...",.F.)
		
	EndIf
	

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT25Exec  บ Autor ณ TOTVS TM/AP        บ Data ณ  12/12/13   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para que o usuario informe onde esta a           บฑฑ
ฑฑบ          ณ localizacao do arquivo do com os dados enviados pelo fornecedorฑฑ
ฑฑบ          ณ para importa็ใo na na tela de conv๊nios.                      บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function MGLT25Exec(oObjProc)
	
	Local _cCodSA2 	:= ""
	Local _lIncSE2ok := .F.
	Local _lDeuErro	:= .F.
	Local _cZLLNum	:= QueryCod("ZLL")
	Local _cSeq		:= "001"
	Local _dData	:= DDATABASE
	Local _dVecto	:= LastDay(DDATABASE)
	Local _nVlrNDF	:= 0
	Local _cSetor 	:= ALLTRIM(GetMv("LT_CODSETO"))//Codigo default do setor
	Local _cObs		:= "GLT - CONVENIO UNIMED"
	Local _nCont	:= 1
	Local _lSomaINSS := .F.
	
	Private dVctoCv := _dVecto // Compatibiliza็ใo com a fun็ใo INC_ZLL
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณVerifica se foi fornecido um arquivo a ser importado.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	If Len(AllTrim(MV_PAR01)) > 0
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Inicia o controle de transacao.  ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		Begin Transaction
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Valida informacoes evento.       ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		DbSelectArea("ZL8")
		DbSetOrder(1)
		If dbSeek(xFilial("ZL8")+Alltrim(_cEveUnimed))
			If ZL8->ZL8_TPEVEN != "F" .Or. ZL8->ZL8_PREFIX == "" .Or. ZL8->ZL8_DEBCRE != "D" .Or. ZL8->ZL8_NATPRD == ""
				xMagHelpFis("Evento Incorreto","O Evento precisa ser Financeiro e de D้bito com Prefixo e Natureza para ser utilizado!"+_ENTER+"Evento:"+_cEveUnimed,;
				"Selecione um evento tipo Financeiro tipo D้bito com Prefixo e Natureza!")
				Return
			EndIf
			If ZL8->ZL8_CONVEN != "S"
				xMagHelpFis("Evento Incorreto","O Evento precisa estar com campo Usado em convenio = Sim!"+_ENTER+"Evento:"+_cEveUnimed,;
				"Selecione um evento de convenio ou corrija o cadastro de convenio!")
				Return
			EndIf
		Else
			xMagHelpFis("Inconsistecia","Evento nใo localizado no cadastro.",;
					"Verifique se o c๓digo informado no parโmetro LT_EVEUNI estแ correto como cadastro de eventos.")
			Return
	    Endif
	
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Inicializa o processamento de leitura do arquivo.		ณ
		//ณ Retorno: _aDadosOK										ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		//MsgRun("Aguarde.... realizando leitura do arquivo...",,{||CursorWait(), lerArquivo(oObjProc), CursorArrow()})
		lerArquivo(oObjProc)		                              

		If Len(_aDadosOK) > 0
			DbSelectArea("SA2")
			DbSetOrder(1)
			
			//_lSomaINSS := MsgYesNo("Deseja somar o valor do INSS no d้bito do conveniado?","Importa็ใo UNIMED")
	
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณ Varredura do array.  ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			For i:= 1 to Len(_aDadosOK)
			
				_cCodSA2 := QueryCod("SA2",_aDadosOK[i][2]) //Passa o codigo da familia para localizar o codigo do cadastro SA2.	  
	/*
				If oObjProc <> Nil
					oObjProc:IncRegua2("Processando registros por c๓digo de famํlia - Linha "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(Len(_aDadosOK))))
					_nCont++
				EndIf
	*/
				If !Empty(_cCodSA2)
					SA2->(DbSeek(xFilial("SA2")+_cCodSA2))
	
					//If _lSomaINSS //Verifica se ira somar o valor do INSS ao debito do conveniado.
					//	_nVlrNDF := _aDadosOK[i][5] + _aDadosOK[i][6] // Soma valor principal com valor do INSS para gerar o titulo NDF
					//Else
						_nVlrNDF := _aDadosOK[i][4]
					//EndIf
					//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
					//ณ Chama funcao Inc_SE2 do programa AGLT010 para incluir titulos no financeiro.ณ
					//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
					_lIncSE2ok := U_Inc_SE2(ZL8->ZL8_PREFIX,_cZLLNum+_cSeq,"01","NDF",SA2->A2_COD,SA2->A2_LOJA,ZL8->ZL8_NATPRD,_dData,_dVecto,_nVlrNDF,0,0,_cCodUnimed,_cObs,0,_cEveUnimed)
	                If _lIncSE2ok
	                	U_Inc_ZLL(_cZLLNum,_cSeq,SA2->A2_COD,SA2->A2_LOJA,SubStr(SA2->A2_NOME,1,25),_nVlrNDF,"A",_dData,_dVecto,SubStr(_cCodUnimed,1,6),SubStr(_cCodUnimed,7,2),_cSetor,ZL8->ZL8_NATPRD,_cEveUnimed,0,0,xFilial("ZLL"),_cObs,1,_nVlrNDF,_nVlrNDF,0,0)
						_cSeq := Soma1(_cSeq)
						Aadd(_aImp,{_aDadosOK[i][2],SA2->A2_COD,SubStr(SA2->A2_NOME,1,25),_nVlrNDF,0 })
	                Else
		                _lDeuErro := .T.	
		   			EndIf
	            Else //Adiciona no Log que nao foi encontrado nenhum fornecedor para o codigo da familia Unimed
					//_cLog += "Cod.:"+_aDadosOK[i][3] +" - "+SubStr(_aDadosOK[i][4],1,35)+_ENTER
	            	Aadd(_aLog,{_aDadosOK[i][1],_aDadosOK[i][2],SubStr(_aDadosOK[i][3],1,35),_aDadosOK[i][4]})
	            EndIf
	        Next i
		EndIf
	
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Se houve alguma falha, desfaz todas as transacoes.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		If _lDeuErro
			DisarmTransaction()
			//_cLog := ""
			_aLog := {}
		EndIf
		
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณ Finaliza o controle de transacao, caso nao hajam falhas. ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		End Transaction
	
	EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ lerArquivo  บ Autor ณ TOTVS              บ Data ณ  12/12/13   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para realizar a importacao do arquivo gerado peloบฑฑ
ฑฑบ          ณ coletor.                                                      บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function lerArquivo(oObj)

	Local _aDados   := {}
	Local _cCodFam   := ""
	Local _nCont	:= 1
	Local _nTotReg	:= 0
	Local _cItem    := "000"
	Local _aLinProbl:= {}
	Local _cLinhas  := ""
	Local _cLoja	:= ""
	Local aCols		:= {}
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Valida existencia do arquivo.       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If FT_FUSE(MV_PAR01) == -1
		xmaghelpfis("Arquivo invแlido",;
		"Nใo foi possํvel abrir o arquivo informado.",;
		"Favor verificar se o arquivo informado esta correto.")
		_lArqInvalido := .f.
		Return
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Armazena o nome do arquivo para renomea-lo depois de importado.       ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	_cArqImp := AllTrim(MV_PAR01)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Valida se o arquivo tem extensao IMP, ou seja, ja foi importado.      ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	If UPPER(Substr(MV_PAR01,Len(AllTrim(MV_PAR01))-2,3)) == "IMP"
		xmaghelpfis("Arquivo invอกlido",;
		"O arquivo informado jอก foi importado anteriormente.",;
		"Favor selecionar um arquivo com a extensaoo ATH. ")
		Return
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Posiciona no inicio do arquivo e verifica quantas linhas possui o arq.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	FT_FGOTOP()                  
	_nTotReg := FT_FLASTREC()
	If _nTotReg == 0   
		xmaghelpfis("Arquivo invแlido",;
		"O arquivo informado para relizar a importa็ใo nใo possui dados.",;
		"Favor verificar se o arquivo informado esta correto.")		
		Return
	EndIf
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Leitura do arquivo.   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	While !FT_FEOF()  //FACA ENQUANTO NAO FOR FIM DE ARQUIVO
		
	
		If oObj <> Nil
			oObj:IncRegua1("Realizando leitura do arquivo - Linha "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nTotReg)))
			_nCont++
		EndIf
	
		//	_aDados := strtokarr(FT_FREADLN(),";") // retorna array dos campos
		/*Aadd(_aDados  ,{Substr(FT_FREADLN(),1,6),;		//[1] Ano/Mes pagamento
						Substr(FT_FREADLN(),7,4),;		//[2] Contrato
						Substr(FT_FREADLN(),11,6),;		//[3] Codigo da Familia
						Substr(FT_FREADLN(),17,165),;	//[4] Nome beneficiario
						Val(StrTran(Substr(FT_FREADLN(),182,3)+Substr(FT_FREADLN(),186,6),",",".")),;	//[5] Valor do Evento
						Val(StrTran(Substr(FT_FREADLN(),192,10),",",".")),;	//[6] Valor INSS
						Substr(FT_FREADLN(),202,6),;	//[7] Codigo da Familia
						Substr(FT_FREADLN(),222,2),;	//[8] Codigo RDP	
						Substr(FT_FREADLN(),224,8)})	//[9] Data do Evento*/
		Aadd(_aDados  ,{Substr(FT_FREADLN(),6,1),;		//[1] Tipo
						Substr(FT_FREADLN(),7,4),;		//[2] Matricula
						Substr(FT_FREADLN(),24,40),;	//[3] Nome beneficiario
						Val(Substr(FT_FREADLN(),71,8)+"."+Substr(FT_FREADLN(),79,2))})	//[4] Valor Evento
																		
		FT_FSKIP()   //Proximo Registro Arquivo 
	EndDo
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Fechar o arquivo.   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	FT_FUSE()

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Orderna o array pelo cod. familia. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู		
	aSort(_aDados,,,{|x,y| x[2] < y[2] }) 
	
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Soma os valores de evento e INSS para registros com o mesmo Cod. de Familia. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู	
	For i:= 1 to Len(_aDados)
		
		nPos	:= aScan(_aDadosOk,{|x|x[2] == _aDados[i][2] })
		
		if nPos == 0
			Aadd(_aDadosOK,aClone(_aDados[i]))
		Else 
			_aDadosOK[nPos][4] := _aDadosOK[nPos][4] + _aDados[i][4]
			//_aDadosOK[nPos][6] := _aDadosOK[nPos][6] + _aDados[i][6]
		Endif
	
	Next i 
	
	If !(Len(_aDadosOK) > 0)
		xmaghelpfis("Falha de Processamento",;
		"Nใo foi possivel processar os dados do arquivo informado!",;
		"Verifique se a estrutura do mesmo encontra-se no padrใo, ou contacte o suporte.")
		Return Nil
	EndIf	

Return _aDadosOK

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ AjustaSX1   บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para validar se pergunta AGLT003 existe no       บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria a pergunta.         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AjustaSX1()

	Local aHelpPor := {}
	Local aHelpSpa := {}
	Local aHelpEng := {}
	
	Aadd( aHelpPor, 'Informe o caminho e o nome do ')
	Aadd( aHelpPor, 'arquivo a ser importado.      ')
	Aadd( aHelpPor, 'Ex.: c:\totvs\convenios.txt   ')
	U_xPutSx1(_cPerg,"01","Arquivo "," "," ","mv_ch1","C",90,0,0,"G","","U_TXT","","","mv_par01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)
	
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ QueryCod   บ Autor ณ Guilherme Fran็a    บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para validar se pergunta AGLT003 existe no       บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria a pergunta.         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ _cTab: Tabela da query (obritatorio)							 บฑฑ
ฑฑบ			 ณ _cPar: Parametro generico							 		 บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function QueryCod(_cTab,_cPar)

	Local _cRet	:= ""
	Local _cFiltro := ""
	
	
	If _cTab == "ZLL"
	
		BeginSql alias "TRAB"
			SELECT
			MAX(ZLL_COD) AS ULTIMO
			FROM
			%table:ZLL%
			WHERE
			%notDel%
		EndSql
		_cRet := Soma1(TRAB->ULTIMO)
	
	ElseIf _cTab == "SA2"
	
		//_cFiltro := "% A2_L_CUNMD = '" + Alltrim(_cPar)+ "' %"
		_cFiltro := "% A2_L_MATRI = '" + Alltrim(_cPar)+ "' %"
		BeginSql alias "TRAB"
			SELECT
			A2_COD+A2_LOJA AS CODIGO
			FROM
			%table:SA2%
			WHERE
			%notDel% AND
			%exp:_cFiltro%	
		EndSql
		_cRet := TRAB->CODIGO
	EndIf
	DbCloseArea("TRAB")

Return _cRet

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณLogImport บ Autor ณ Guilherme Fran็a   บ Data ณ  30/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Gera relatorio com os registros nao importados.            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function LogImport()
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Declaracao de Variaveis                                             ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	Local cPict          := ""
	Local titulo       := "Log de registros NรO importados - UNIMED"
	Local nLin         := 80
	Local aOrd	:= {}
	Local Cabec1       := "Contrato Cod.Familia Nome                     	    Valor     Vlr.INSS"
	Local Cabec2       := ""
	Local imprime      := .T.
	Private lEnd         := .F.
	Private lAbortPrint  := .F.
	Private CbTxt        := ""
	Private limite           := 80
	Private tamanho          := "P"
	Private nomeprog         := "MGLT025" // Coloque aqui o nome do programa para impressao no cabecalho
	Private nTipo            := 18
	Private aReturn          := { "Zebrado", 1, "Administracao", 2, 2, 1, "", 1}
	Private nLastKey        := 0
	Private cbtxt      := Space(10)
	Private cbcont     := 00
	Private CONTFL     := 01
	Private m_pag      := 01
	Private wnrel      := "MGLT025" // Coloque aqui o nome do arquivo usado para impressao em disco
	
	Private cString := ""
	
	wnrel := SetPrint(cString,NomeProg,"",@titulo,"Log de registros importa็ใo UNIMED","","",.F.,aOrd,.F.,Tamanho,,.F.)
	
	If nLastKey == 27
		Return
	Endif
	
	SetDefault(aReturn,cString)
	
	If nLastKey == 27
	   Return
	Endif
	
	nTipo := If(aReturn[4]==1,15,18)
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณ Processamento. RPTSTATUS monta janela com a regua de processamento. ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuno    ณRUNREPORT บ Autor ณ AP6 IDE            บ Data ณ  30/08/13   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescrio ณ Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS บฑฑ
ฑฑบ          ณ monta a janela com a regua de processamento.               บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa principal                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)

Local nOrdem


SetRegua(RecCount())

If Len(_aLog) > 0
	For i := 1 to Len(_aLog)
	   //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	   //ณ Verifica o cancelamento pelo usuario...                             ณ
	   //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	   If lAbortPrint
	      @nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
	      Exit
	   Endif
	
	   //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	   //ณ Impressao do cabecalho do relatorio. . .                            ณ
	   //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	   If nLin > 55 // Salto de Pแgina. Neste caso o formulario tem 55 linhas...
	      Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
	      nLin := 8
	   Endif
       	
	   @nLin,001 PSAY _aLog[i][1]
	   @nLin,009 PSAY _aLog[i][2]   
	   @nLin,021 PSAY _aLog[i][3]
	   @nLin,058 PSAY _aLog[i][4] Picture "@E 99,999.99" //Transform(_aLog[i][4],"@E 99,999.99")
	   //@nLin,068 PSAY _aLog[i][5] Picture "@E 99,999.99" //Transform(_aLog[i][5],"@E 99,999.99")
	   	
	   nLin++ // Avanca a linha de impressao
	
	Next i
EndIf

nLin := 80
Cabec1       := "Cod.Familia  Cooperado                           Valor do Debito    Vlr.Inss"
Titulo	:= "Log de Registros Importados - UNIMED"
If Len(_aImp) > 0
	For i := 1 to Len(_aImp)
	   //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	   //ณ Verifica o cancelamento pelo usuario...                             ณ
	   //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	   If lAbortPrint
	      @nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
	      Exit
	   Endif
	
	   //ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	   //ณ Impressao do cabecalho do relatorio. . .                            ณ
	   //ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	   If nLin > 55 // Salto de Pแgina. Neste caso o formulario tem 55 linhas...
	      Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
	      nLin := 8
	   Endif
       //Aadd(_aImp,{_aDadosOK[i][3],SA2->A2_COD,SubStr(SA2->A2_NOME,1,25),_nVlrNDF})	
	   @nLin,001 PSAY _aImp[i][1]
	   @nLin,013 PSAY _aImp[i][2]+"-"+_aImp[i][3]   
	   //@nLin,028 PSAY _aImp[i][3]
	   @nLin,050 PSAY _aImp[i][4] Picture "@E 99,999.99" //Transform(_aImp[i][4],"@E 99,999.99")
	   @nLin,068 PSAY _aImp[i][5] Picture "@E 99,999.99" //Transform(_aImp[i][5],"@E 99,999.99")	   
	   	
	   nLin++ // Avanca a linha de impressao
	
	Next i
EndIf



SET DEVICE TO SCREEN

If aReturn[5]==1
   dbCommitAll()
   SET PRINTER TO
   OurSpool(wnrel)
Endif

MS_FLUSH()

Return

