#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.ch"
#INCLUDE "TOPCONN.ch"


#DEFINE _ENTER CHR(13)+CHR(10)
/*
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � MGLT025  � Autor � TOTVS                 � Data da Criacao  � 08/08/2013                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Rotina de importa��o do convenio UNIMED  - Especifico SELITA                              					���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Tabela ZLL - Cadastro de Lancamentos dos Convenios		                               						���
���          � Tabela SA2 - Tabela de Fornecedores = (RETIROS)			                               						���
���          � Tabela SE2 - Contas a Pagar								                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Arquivo enviado pela Unimed.   							                               						���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���			 �														                                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � TOTVS - Microsiga											                             					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite                                                                          					���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL								        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          � 							                       �----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
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
		xMagHelpFis("Inconsistecia","A rotina n�o foi parametrizada.",;
					"Informe o conte�do dos par�metros LT_UNIMED e LT_EVEUNI "+_ENTER;
					+"no m�dulo Configurador.") 
		Return
	EndIf
	
	If Empty(_cCodUnimed)
		xMagHelpFis("Inconsistecia","A rotina n�o foi parametrizada.",;
					"Informe o conte�do dos par�metros LT_UNIMED e LT_EVEUNI "+_ENTER;
					+"no m�dulo Configurador.")
		Return
	EndIf
	
	//���������������������������������������������������������������������Ŀ
	//� Chama funcao para criar os parametros caso nao existam.             �
	//�����������������������������������������������������������������������
	AjustaSX1()
	
	//���������������������������������������������������������������������Ŀ
	//� Chama a tela para preenchimento dos parametros.                     �
	//�����������������������������������������������������������������������
	/*If !Pergunte(_cPerg,.T.)
		Return()
	EndIf
	*/
	
	_cTexto := "Esta rotina tem o objetivo de efetuar a importa��o dos arquivos de integra��o do conv�nios UNIMED."+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "Os dados importados podem ser visualizados e manipulados pela rotina de lan�amentos dos conv�nios."+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "Ap�s a importa��o do arquivo *.TXT, este ter� sua extens�o renomeada para *.IMP para evitar que o "+_ENTER
	_cTexto += "mesmo arquivo seja importado em duplicidade. "+_ENTER
	_cTexto += " "+_ENTER
	_cTexto += "O convenio ser� gerado para o fornecedor amarrado no par�metro LT_UNIMED. "+_ENTER
	_cTexto += "O evento utilizado ser� o amarrado ao par�metro LT_EVEUNI. "+_ENTER
	_cTexto += " "+_ENTER
		
	//����������������������������������������������������������������������������������������������Ŀ
	//� Sintaxe da tNewProcess():New( cFunction, cTitle, _bProcess, cDescription, _cPerg, aInfoCustom) �
	//������������������������������������������������������������������������������������������������
	
	_oTProces := tNewProcess():New("MGLT025","Importa��o UNIMED",_bProcess,_cTexto,_cPerg)
	
	
	//���������������������������������������������������������������������������Ŀ
	//� Renomeia os arquivos, para identificar que os mesmos ja foram importados. �
	//�����������������������������������������������������������������������������
	If _lArqInvalido	
		If FRENAME(_cArqImp,Substr(_cArqImp,1,Len(_cArqImp)-3)+"IMP") == -1
			MsgAlert("N�o foi poss�vel renomear o arquivo: "+chr(13)+_cArqImp)
		EndIf
	EndIf
	/*
	If Len(_cLog) > 0
		xMagHelpFis("C�digos Inv�lidos","Os c�digos de fam�lia abaixo n�o foram localizados no cadastro de Cooperados!",_cLog)
	EndIf
	*/
	If Len(_aLog) > 0
		xMagHelpFis("C�digos Inv�lidos","Um ou mais c�digos de fam�lia n�o foram localizados no cadastro de cooperados.",;
					"Confirme esta tela para apresentar o relat�rio com o log da importa��o.")
		Processa( {|| LogImport() }, "Aguarde...", "Gerando relat�rio de Log...",.F.)
	Else
		xMagHelpFis("Importa��o","Importa�ao conclu�da com �xito!",;
					"Confirme esta tela para apresentar o relat�rio com o log da importa��o.")
		Processa( {|| LogImport() }, "Aguarde...", "Gerando relat�rio de Log...",.F.)
		
	EndIf
	

Return
/*
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������ͻ��
���Programa  � MGLT25Exec  � Autor � TOTVS TM/AP        � Data �  12/12/13   ���
����������������������������������������������������������������������������͹��
���Desc.     � Funcao usada para que o usuario informe onde esta a           ���
���          � localizacao do arquivo do com os dados enviados pelo fornecedor��
���          � para importa��o na na tela de conv�nios.                      ���
����������������������������������������������������������������������������͹��
���Uso       � Programa Principal.                                           ���
����������������������������������������������������������������������������ͼ��
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
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
	
	Private dVctoCv := _dVecto // Compatibiliza��o com a fun��o INC_ZLL
	//�����������������������������������������������������Ŀ
	//�Verifica se foi fornecido um arquivo a ser importado.�
	//�������������������������������������������������������
	
	If Len(AllTrim(MV_PAR01)) > 0
		//����������������������������������Ŀ
		//� Inicia o controle de transacao.  �
		//������������������������������������
		Begin Transaction
		
		//����������������������������������Ŀ
		//� Valida informacoes evento.       �
		//������������������������������������
		DbSelectArea("ZL8")
		DbSetOrder(1)
		If dbSeek(xFilial("ZL8")+Alltrim(_cEveUnimed))
			If ZL8->ZL8_TPEVEN != "F" .Or. ZL8->ZL8_PREFIX == "" .Or. ZL8->ZL8_DEBCRE != "D" .Or. ZL8->ZL8_NATPRD == ""
				xMagHelpFis("Evento Incorreto","O Evento precisa ser Financeiro e de D�bito com Prefixo e Natureza para ser utilizado!"+_ENTER+"Evento:"+_cEveUnimed,;
				"Selecione um evento tipo Financeiro tipo D�bito com Prefixo e Natureza!")
				Return
			EndIf
			If ZL8->ZL8_CONVEN != "S"
				xMagHelpFis("Evento Incorreto","O Evento precisa estar com campo Usado em convenio = Sim!"+_ENTER+"Evento:"+_cEveUnimed,;
				"Selecione um evento de convenio ou corrija o cadastro de convenio!")
				Return
			EndIf
		Else
			xMagHelpFis("Inconsistecia","Evento n�o localizado no cadastro.",;
					"Verifique se o c�digo informado no par�metro LT_EVEUNI est� correto como cadastro de eventos.")
			Return
	    Endif
	
		//���������������������������������������������������������Ŀ
		//� Inicializa o processamento de leitura do arquivo.		�
		//� Retorno: _aDadosOK										�
		//�����������������������������������������������������������
		//MsgRun("Aguarde.... realizando leitura do arquivo...",,{||CursorWait(), lerArquivo(oObjProc), CursorArrow()})
		lerArquivo(oObjProc)		                              

		If Len(_aDadosOK) > 0
			DbSelectArea("SA2")
			DbSetOrder(1)
			
			//_lSomaINSS := MsgYesNo("Deseja somar o valor do INSS no d�bito do conveniado?","Importa��o UNIMED")
	
			//����������������������Ŀ
			//� Varredura do array.  �
			//������������������������
			For i:= 1 to Len(_aDadosOK)
			
				_cCodSA2 := QueryCod("SA2",_aDadosOK[i][2]) //Passa o codigo da familia para localizar o codigo do cadastro SA2.	  
	/*
				If oObjProc <> Nil
					oObjProc:IncRegua2("Processando registros por c�digo de fam�lia - Linha "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(Len(_aDadosOK))))
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
					//�����������������������������������������������������������������������������Ŀ
					//� Chama funcao Inc_SE2 do programa AGLT010 para incluir titulos no financeiro.�
					//�������������������������������������������������������������������������������
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
	
		//���������������������������������������������������Ŀ
		//� Se houve alguma falha, desfaz todas as transacoes.�
		//�����������������������������������������������������
		If _lDeuErro
			DisarmTransaction()
			//_cLog := ""
			_aLog := {}
		EndIf
		
		//����������������������������������������������������������Ŀ
		//� Finaliza o controle de transacao, caso nao hajam falhas. �
		//������������������������������������������������������������
		End Transaction
	
	EndIf

Return

/*
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������ͻ��
���Programa  � lerArquivo  � Autor � TOTVS              � Data �  12/12/13   ���
����������������������������������������������������������������������������͹��
���Desc.     � Funcao usada para realizar a importacao do arquivo gerado pelo���
���          � coletor.                                                      ���
����������������������������������������������������������������������������͹��
���Uso       � Programa Principal.                                           ���
����������������������������������������������������������������������������ͼ��
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
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
	
	//�������������������������������������Ŀ
	//� Valida existencia do arquivo.       �
	//���������������������������������������
	If FT_FUSE(MV_PAR01) == -1
		xmaghelpfis("Arquivo inv�lido",;
		"N�o foi poss�vel abrir o arquivo informado.",;
		"Favor verificar se o arquivo informado esta correto.")
		_lArqInvalido := .f.
		Return
	EndIf
	
	//�����������������������������������������������������������������������Ŀ
	//� Armazena o nome do arquivo para renomea-lo depois de importado.       �
	//�������������������������������������������������������������������������
	_cArqImp := AllTrim(MV_PAR01)
	
	//�����������������������������������������������������������������������Ŀ
	//� Valida se o arquivo tem extensao IMP, ou seja, ja foi importado.      �
	//�������������������������������������������������������������������������
	If UPPER(Substr(MV_PAR01,Len(AllTrim(MV_PAR01))-2,3)) == "IMP"
		xmaghelpfis("Arquivo inv͡lido",;
		"O arquivo informado j͡ foi importado anteriormente.",;
		"Favor selecionar um arquivo com a extensaoo ATH. ")
		Return
	EndIf
	
	//�����������������������������������������������������������������������Ŀ
	//� Posiciona no inicio do arquivo e verifica quantas linhas possui o arq.�
	//�������������������������������������������������������������������������
	FT_FGOTOP()                  
	_nTotReg := FT_FLASTREC()
	If _nTotReg == 0   
		xmaghelpfis("Arquivo inv�lido",;
		"O arquivo informado para relizar a importa��o n�o possui dados.",;
		"Favor verificar se o arquivo informado esta correto.")		
		Return
	EndIf
	
	//�����������������������Ŀ
	//� Leitura do arquivo.   �
	//�������������������������
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
	
	//���������������������Ŀ
	//� Fechar o arquivo.   �
	//�����������������������
	FT_FUSE()

	//������������������������������������Ŀ
	//� Orderna o array pelo cod. familia. �
	//��������������������������������������		
	aSort(_aDados,,,{|x,y| x[2] < y[2] }) 
	
	
	//������������������������������������������������������������������������������Ŀ
	//� Soma os valores de evento e INSS para registros com o mesmo Cod. de Familia. �
	//��������������������������������������������������������������������������������	
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
		"N�o foi possivel processar os dados do arquivo informado!",;
		"Verifique se a estrutura do mesmo encontra-se no padr�o, ou contacte o suporte.")
		Return Nil
	EndIf	

Return _aDadosOK

/*
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������ͻ��
���Programa  � AjustaSX1   � Autor � TOTVS              � Data �  00/00/00   ���
����������������������������������������������������������������������������͹��
���Desc.     � Funcao usada para validar se pergunta AGLT003 existe no       ���
���          � dicionario de dados, caso nao existe cria a pergunta.         ���
����������������������������������������������������������������������������͹��
���Uso       � Programa Principal.                                           ���
����������������������������������������������������������������������������ͼ��
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
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
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������ͻ��
���Programa  � QueryCod   � Autor � Guilherme Fran�a    � Data �  00/00/00   ���
����������������������������������������������������������������������������͹��
���Desc.     � Funcao usada para validar se pergunta AGLT003 existe no       ���
���          � dicionario de dados, caso nao existe cria a pergunta.         ���
����������������������������������������������������������������������������͹��
���Parametros� _cTab: Tabela da query (obritatorio)							 ���
���			 � _cPar: Parametro generico							 		 ���
����������������������������������������������������������������������������͹��
���Uso       � Programa Principal.                                           ���
����������������������������������������������������������������������������ͼ��
��������������������������������������������������������������������������������
��������������������������������������������������������������������������������
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
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �LogImport � Autor � Guilherme Fran�a   � Data �  30/08/13   ���
�������������������������������������������������������������������������͹��
���Descricao � Gera relatorio com os registros nao importados.            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function LogImport()
	
	//���������������������������������������������������������������������Ŀ
	//� Declaracao de Variaveis                                             �
	//�����������������������������������������������������������������������
	
	Local cPict          := ""
	Local titulo       := "Log de registros N�O importados - UNIMED"
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
	
	wnrel := SetPrint(cString,NomeProg,"",@titulo,"Log de registros importa��o UNIMED","","",.F.,aOrd,.F.,Tamanho,,.F.)
	
	If nLastKey == 27
		Return
	Endif
	
	SetDefault(aReturn,cString)
	
	If nLastKey == 27
	   Return
	Endif
	
	nTipo := If(aReturn[4]==1,15,18)
	
	//���������������������������������������������������������������������Ŀ
	//� Processamento. RPTSTATUS monta janela com a regua de processamento. �
	//�����������������������������������������������������������������������
	
	RptStatus({|| RunReport(Cabec1,Cabec2,Titulo,nLin) },Titulo)

Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �RUNREPORT � Autor � AP6 IDE            � Data �  30/08/13   ���
�������������������������������������������������������������������������͹��
���Descri��o � Funcao auxiliar chamada pela RPTSTATUS. A funcao RPTSTATUS ���
���          � monta a janela com a regua de processamento.               ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function RunReport(Cabec1,Cabec2,Titulo,nLin)

Local nOrdem


SetRegua(RecCount())

If Len(_aLog) > 0
	For i := 1 to Len(_aLog)
	   //���������������������������������������������������������������������Ŀ
	   //� Verifica o cancelamento pelo usuario...                             �
	   //�����������������������������������������������������������������������
	   If lAbortPrint
	      @nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
	      Exit
	   Endif
	
	   //���������������������������������������������������������������������Ŀ
	   //� Impressao do cabecalho do relatorio. . .                            �
	   //�����������������������������������������������������������������������
	
	   If nLin > 55 // Salto de P�gina. Neste caso o formulario tem 55 linhas...
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
	   //���������������������������������������������������������������������Ŀ
	   //� Verifica o cancelamento pelo usuario...                             �
	   //�����������������������������������������������������������������������
	   If lAbortPrint
	      @nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
	      Exit
	   Endif
	
	   //���������������������������������������������������������������������Ŀ
	   //� Impressao do cabecalho do relatorio. . .                            �
	   //�����������������������������������������������������������������������
	   If nLin > 55 // Salto de P�gina. Neste caso o formulario tem 55 linhas...
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

