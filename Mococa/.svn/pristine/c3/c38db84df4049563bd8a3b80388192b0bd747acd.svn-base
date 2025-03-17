#INCLUDE "PROTHEUS.CH"

#DEFINE _ENTER CHR(13)+CHR(10)
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออออหออออออออออออออออออัออออออออออออออออออออออออออออออออออออออออออออออออปฑฑ
ฑฑบPrograma  ณ MGLT303  บ Autor ณ TOTVS                 บ Data da Criacao  ณ 01/06/2016                						บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออออสออออออออออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบDescricao ณ Recแlculo do custo do leite na tabela SD3.                                                                   บฑฑ
ฑฑบ          ณ                     												                               				บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gestao do Leite                 						                                                        บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ Nenhum						   							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบRetorno   ณ Nenhum						  							                               						บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUsuario   ณ Microsiga                                                                                					บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบSetor     ณ Gestao do Leite.                                                                        						บฑฑ
ฑฑฬออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบ            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						บฑฑ
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

User Function MGLT303()

Local _cPerg  := "MGLT303"             
Local _bProcess := {|oSelf| Recalculo(oSelf) }

Private _cDtIni := ""
Private _cDtFim	:= ""
Private _cMix	:= ""

cTexto := "Esta rotina tem o objetivo de refazer o custo das movimenta็๕es do leite "+_ENTER
cTexto += "lan็adas pela rotina de recep็ใo do leite. "+_ENTER
cTexto += "Cada ticket lan็ado gera um movimento de entrada valorizado na tabela SD3, "+_ENTER
cTexto += "este movimento serแ recalculado baseado no pre็o pago aos produtores de cada"+_ENTER
cTexto += "ticket. A rotina deve ser executada antes do fechamento do estoque, portanto "+_ENTER
cTexto += "a data inicial do MIX informado nos parametros deve ser maior que o MV_ULMES. "+_ENTER
cTexto += " "+_ENTER


ValidPerg(_cPerg)    

If Pergunte(_cPerg, .T.)                
	DbSelectArea("ZLE")
	DbSetOrder(1)
	DbSeek(xFilial("ZLE")+MV_PAR01)
	_cDtIni := DTOS(ZLE->ZLE_DTINI)
	_cDtFim	:= DTOS(ZLE->ZLE_DTFIM)
	_cMix	:= MV_PAR01



			
		If ZLE->ZLE_DTINI <= GetMv("MV_ULMES") 
			MsgStop("Data inicial tem que ser maior que a data do ๚ltimo fechamento de m๊s.")
		Else
			//Processa({|| Recalculo() },"Recalculando custo do leite...")

			_oTProces := tNewProcess():New("MGLT303","Recalculando custo do leite...",_bProcess,cTexto,_cPerg)


		EndIf
EndIf

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRecalculo บAutor  ณMicrosiga           บ Data ณ  10/27/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Processamento do recแlculo do custo do leite.              บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Recalculo(oObj)

Local _cAlias := GetNextAlias()
Local _cAlias2 := "X"+GetNextAlias() 
local _cCustoLt := 0
Local _nCont := 1

Private _cFilter := ""
Private _cTicket := ""
Private _nVlrFrete := 0
Private _nQtdTkt := 0
Private _nQtdSD1 := 0
Private _cEveInss := AllTrim(GETMV("LT_EVEINSS"))

BeginSql Alias _cAlias
	
	SELECT ZLD_TICKET, ZLD_FRETIS,ZLD_LJFRET,
	SUM(ZLD_QTDBOM) AS QTD
	 	
	FROM %Table:ZLD% ZLD
	
	
	WHERE ZLD_FILIAL = %xFilial:ZLD%
	AND ZLD_DTCOLE BETWEEN %Exp:_cDtIni% AND %Exp:_cDtFim%
	AND ZLD.%NotDel% 
	
	GROUP BY ZLD_TICKET,ZLD_FRETIS,ZLD_LJFRET
	
EndSql



dbSelectArea(_cAlias)
(_cAlias)->(dbGoTop())
Count To _nReg
(_cAlias)->(DbGoTop())

While !(_cAlias)->(Eof())
		
		_cTicket := (_cAlias)->ZLD_TICKET
		_nQtdTkt := (_cAlias)->QTD
		//_cFilter := " AND LD.ZLD_TICKET = "+_cTicket+" AND LD.D_E_L_E_T_ = ' ' "
		
		BeginSql alias _cAlias2
		
			SELECT LF.ZLF_F1SEEK, LD.ZLD_QTDBOM AS QTD
			FROM %Table:ZLF% LF
				JOIN %Table:ZLD% LD ON ZLD_FILIAL = %xFilial:ZLD%  AND LD.ZLD_RETIRO = LF.ZLF_A2COD AND LD.ZLD_RETILJ = LF.ZLF_A2LOJA
				AND LD.ZLD_TICKET = %Exp:_cTicket% AND LD.%NotDel%
				
			WHERE ZLF_FILIAL = %xFilial:ZLF% //Alterado para considerar filial - Godinho 
			AND ZLF_CODZLE = %Exp:_cMix%
			AND (ZLF_SEQ = '001' OR ZLF_EVENTO  ='010001')
			AND ZLF_ORIGEM = 'M'
			AND LF.%NotDel%
			//GROUP BY ZLF_F1SEEK
           
		EndSql

	_aQuery := GetLastQuery()
	MemoWrite("C:\temp\MGLT303.txt",_aQuery[2])

	DbSelectArea(_cAlias2)
	(_cAlias2)->(DbGoTop())
	Count To _nReg
	(_cAlias2)->(DbGoTop())
	
	_cCustoLt := 0

	While !(_cAlias2)->(Eof())
		DbSelectArea("SD1")
		SD1->(DbSetOrder(1)) //D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_COD, D1_ITEM, R_E_C_N_O_, D_E_L_E_T_
		If SD1->(DbSeek(SubStr((_cAlias2)->ZLF_F1SEEK,1,24))) //0102000006258002P0000301N          
			_cCustoLt += (SD1->D1_CUSTO / SD1->D1_QUANT) * (_cAlias2)->QTD
			_nQtdSD1 += SD1->D1_QUANT
		EndIf
		(_cAlias2)->(DbSkip())
	EndDo
    
	(_cAlias2)->(DbCloseArea())	
	
	//Busca custo do frete lan็ado na tabela ZLP
	_nVlrFrete := 0 //CustoFrete((_cAlias)->ZLD_FRETIS,(_cAlias)->ZLD_LJFRET)
	//##### MOCOCA NAO AGREGA O FRETE DIRETO NO CUSTO, A ROTINA DE FRETE GERA UMA MOVIMENTAวรO Sำ DE CUSTO NO SD3
//	_nVlrFrete := _nVlrFrete * _nQtdTkt
//	_cCustoLt := _cCustoLt / _nQtdSD1
//	_cCustoLt := _cCustoLt * _nQtdTkt

	oObj:IncRegua1("Processando "+AllTrim(Str(_nCont))+" de "+AllTrim(Str(_nReg))+" ("+AllTrim(str( round((_nCont/_nReg)*100,0) ))+"%) - Ticket: " + _cTicket)
	_nCont++
	Begin Transaction 

	MsgRun("Aguarde... Calculando custo do leite. ticket : " + (_cAlias)->ZLD_TICKET ,,{||CursorWait(), SD3Recalc((_cAlias)->ZLD_TICKET, _cCustoLt) , CursorArrow()})		
    
	End Transaction  
	
	(_cAlias)->(dbSkip())

EndDo

dbSelectArea(_cAlias)
(_cAlias)->(dbCloseArea())

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ validperg   บ Autor ณ TOTVS              บ Data ณ  00/00/00   บฑฑ
ฑฑฬออออออออออุอออออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao usada para validar se pergunta AGLT003 existe no       บฑฑ
ฑฑบ          ณ dicionario de dados, caso nao existe cria a pergunta.         บฑฑ
ฑฑฬออออออออออุอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Programa Principal.                                           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ValidPerg(_cPerg)

Local aHelpPor := {}
Local aHelpSpa := {}
Local aHelpEng := {}

	
Aadd( aHelpPor, 'Informe o Codigo do MIX que sera ')
Aadd( aHelpPor, 'utilizado para filtrar os ')
Aadd( aHelpPor, 'movimentos de estoque a serem ')
Aadd( aHelpPor, 'recalculados. ')
U_xPutSx1(_cPerg,"01","Codigo do MIX ?","Codigo do MIX ?","Codigo do MIX ?","mv_ch1","C",6,0,0,"G",'ExistCpo("ZLE")',"ZLE_02","","","MV_PAR01","","","","","","","","","","","","","","","","",aHelpPor,aHelpEng,aHelpSpa)

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAGLT301   บAutor  ณMicrosiga           บ Data ณ  10/27/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static function SD3Recalc(_pcTicket, _pnCusto)

Local _aArea     	:= GetArea()
Local _cAliasSD3	:= GetNextAlias()
Local _cTicket   	:= 'GLT'+_pcTicket
Local aAutoSD3   	:= {}
Local _nModBkp   	:= nModulo
Local _cModBkp		:= cModulo 
Local _lRastro      := GetMv("MV_RASTRO") == "S"  //Verifica se o sistema efetuara o controle de rastreabilidade

BeginSql Alias _cAliasSD3
	
	SELECT
	D3_FILIAL, D3_TM, D3_COD, D3_UM, D3_QUANT, D3_LOCAL, D3_EMISSAO, D3_DOC, D3_LOTECTL,
	D3_DTVALID, D3_L_ORIG, D3_L_SETOR, D3_CUSTO1,
	D3_NUMSEQ, D3_CHAVE, D3_CF, R_E_C_N_O_ AS NUMREC
	
	FROM %Table:SD3% SD3
	
	WHERE D3_FILIAL = %xFilial:SD3% 
	AND   D3_TM = '100' 
	AND   D3_DOC = %Exp:_cTicket%
	AND   D3_ESTORNO <> 'S'
	AND   SD3.%NotDel%
	
EndSql

dbSelectArea(_cAliasSD3)
(_cAliasSD3)->(dbGoTop())

While !(_cAliasSD3)->(Eof())


	DbSelectArea("SD3")
	SD3->(DbGoto((_cAliasSD3)->NUMREC))
    RecLock("SD3",.F.)
   // SD3->D3_CUSTO1 := (_pnCusto/(_cAlias2)->QTD)*D3_QUANT)
    SD3->D3_CUSTO1 := _pnCusto
    SD3->(MsUnlock())
	

	(_cAliasSD3)->(dbSkip())
	
EndDo

dbSelectArea(_cAliasSD3)
(_cAliasSD3)->(dbCloseArea())
                 
RestArea(_aArea)

Return''



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCustoFreteบAutor  ณMicrosiga           บ Data ณ  12/06/16   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ  Retorna o custo do frete lan็ado na tabela ZLP            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CustoFrete(xcCod,xcLoja)

Local _nRet := 0

If Select("FRET") <> 0
	FRET->(dbCloseArea())
EndIf

/*
BeginSql alias "FRET"
	SELECT ZLP_VALOR/ZLP_LITROS AS CUSTO

	FROM %Table:ZLP% ZLP
	
	WHERE ZLP_MIX = %Exp:_cMix%
	AND   ZLP_FRETIS = %Exp:xcCod%
	AND   ZLP_FRETLJ = %Exp:xcLoja%	
	AND   ZLP_LITROS > 0
	AND	  ZLP_VALOR > 0
	AND   ZLP.%NotDel%

EndSql
*/
BeginSql alias "FRET"
	SELECT ZM1_FILIAL AS FILIAL, ZM0_MIX, ZM0_CODSA2, ZM0_LOJSA2, ZM0_TOTPRD,
	SUM(CASE WHEN ZM1_DEBCRE = 'C' THEN ZM1_VLRTOT ELSE -ZM1_VLRTOT END) AS VALOR,
    SUM(CASE WHEN ZM1_DEBCRE = 'C' THEN ZM1_VLRTOT ELSE -ZM1_VLRTOT END)/ ZM0_TOTPRD AS CUSTO
	FROM %Table:ZM1% ZM1
		JOIN %Table:ZM0% ZM0 ON ZM0_FILIAL = ZM1_FILIAL AND ZM0_MIX = ZM1_MIX AND ZM0_CODSA2 = ZM1_CODSA2 
			AND ZM0_LOJSA2 = ZM1_LOJSA2 AND ZM0.%NotDel% 
	WHERE ZM1_MIX = %Exp:_cMix%
	AND ZM1_CODSA2 = %Exp:xcCod%
	AND ZM1_LOJSA2 = %Exp:xcLoja%
	AND ZM1.%NotDel% 
	GROUP BY ZM1_FILIAL, ZM0_MIX, ZM0_CODSA2, ZM0_LOJSA2, ZM0_TOTPRD
EndSql

DbSelectArea("FRET")
FRET->(DbGoTop())

If !FRET->(Eof())
	_nRet := FRET->CUSTO
EndIf

Return _nRet

