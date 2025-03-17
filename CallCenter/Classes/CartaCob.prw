#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH" 
#include "topconn.ch"
#Include "Colors.ch" 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ CartaCob บ Autor ณ Raphael Martins     บ Dataณ 28/11/2016  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Classe de rotina de Envio de Carta de Cobranca			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa			                                          บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Class CartaCobranca

	Data oDlgCob
	Data oPanel
	Data oPanel1
	Data oPanel2
	Data oPanel3
	Data oMail	
	
	//atributos do panel de filtros
	Data oClienteDe
	Data oClienteAte
	Data oLojaDe
	Data oLojaAte
	Data oComboVenc
	Data oDiasDe
	Data oDiasAte
	Data oComboCarta
	
	Data cClienteDe
	Data cClienteAte
	Data cLojaDe
	Data cLojaAte
	Data aComboVenc
	Data nDiasDe
	Data nDiasAte
	Data aComboCarta	
	
	//atributos do panel de titulos
	Data oGridTit
	Data  __XVEZ    
	Data _nMarca    
	
	//atributos do panel de totalizadores
	Data oTotalSel
	Data oQtdSel
	Data nTotalTit
	Data nQtdTit
	
	//Metodo construtor da classe
	Method New() Constructor
	
	//metodo responsavel pela criacao do panel de filtros
	Method MontaPnl1()
	
	//metodo responsavel pela criacao do panel de grid de titulos
	Method MontaPnl2()
	
	//metodo responsavel pela cria็ใo do panel inferior da tela
	Method MontaPnl3()

	//metodo responsavel pela consulta dos titulos de acordo com os filtros realizados
	Method ConsultaTit()
    
    //metodo para inicializar os atributos da classe
	Method InitVars()
	
	//metodo para limpar grid de titulos
	Method LimpaGrid()
	
	//metodo para marcar/desmarcar a linha da grid
	Method CliqueGrid()
	
	//metodo para marcar/desmarcar todas as linhas da grid
	Method MarcaTodos()
	
	//Metodo para montar as cartas de cobranca a serem enviadas
	Method MontaCartas()
	
	//metodo para enviar as cartas de cobranca para os clientes selecionados
	Method SendCartas()
	
	
EndClass

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ New	   บ Autor ณ Raphael Martins      บ Dataณ 28/11/2016  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo construtor da classe								  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aviso Urgente                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Method New() Class CartaCobranca

Local oGroup1			:= NIL
Local nSeparador		:= 0 
Local nLargPanel		:= 0
Local nAltPanel			:= 0 
Local nAltTela			:= 0
Local nLargTela			:= 0
Local nAltPnl1			:= 60
Local nAltPnl3			:= 45
Local aObjects 			:= {} 
Local aSizeAut	   		:= MsAdvSize()
//Local aObjects			:= {}   
Local aPosObj			:= {}  
Local aPanels			:= {}


// Largura, Altura, Modifica largura, Modifica altura
aAdd( aObjects, { 100,	100, .T., .T. } ) // PANEL COM AS ABAS

aInfo  	:= { aSizeAut[ 1 ], aSizeAut[ 2 ], aSizeAut[ 3 ], aSizeAut[ 4 ], 2, 2 }
aPosObj := MsObjSize( aInfo, aObjects, .T. , .T.)         

DEFINE DIALOG ::oDlgCob TITLE " Carta de Cobranca " FROM aSizeAut[7], 0 TO aSizeAut[6], aSizeAut[5] PIXEL // STYLE DS_MODALFRAME   

nAltTela			:= ::oDlgCob:nClientHeight / 2
nLargTela			:= ::oDlgCob:nClientWidth  / 2

// crio pain้is que serใo disponibilizados para as suas respectivas fun็๕es
@ 000, 000 MSPANEL ::oPanel SIZE nLargTela, nAltTela OF ::oDlgCob COLORS 0, 16777215   

//pego a largura e altura do panel principal
nLargPanel 	:= ::oPanel:nClientWidth / 2
nAltPanel	:= ::oPanel:nClientHeight / 2


// Divisใo dos pain้is
////////////////////////////////////////////////////
// PAINEL 1 - CAMPOS DE FILTROS                   //
////////////////////////////////////////////////////
// PAINEL 2               				          //
//              GRID DE TITULOS       	    	  //
//												  //
//											  	  //
////////////////////////////////////////////////////
// PAINEL ( TOTALIZADORES E OPCAO DE CARTA)   	  //
////////////////////////////////////////////////////

// Crio um array com as coordenadas dos pain้is, para facilitar a manuten็ใo

//filtros
aadd(aPanels , { nSeparador    										, nSeparador 			   			, ( nLargPanel - ( nSeparador * 2 ) ) 	, nAltPnl1 										   			})

//Grid de Cheques
aadd(aPanels , { aPanels[1,4] + ( nSeparador * 2 ) 					, nSeparador 			   			, ( nLargPanel - ( nSeparador * 2 ) ) 	, ( nAltPanel - nAltPnl1 - nAltPnl3 ) - ( nSeparador * 2 )  })

//totalizadores
aadd(aPanels , { aPanels[2,1] + aPanels[2,4] + nSeparador			, nSeparador						, ( nLargPanel - ( nSeparador * 2 ) )	, nAltPnl3 													})


// Panel de Filtros
@ aPanels[1,1] , aPanels[1,2] MSPANEL ::oPanel1 SIZE aPanels[1,3] , aPanels[1,4] OF ::oPanel COLORS 0,16777215
@ nSeparador, nSeparador GROUP oGroup1 TO ( aPanels[1,4] - nSeparador ) , ( aPanels[1,3] - nSeparador ) PROMPT "" OF ::oPanel1 COLOR 0, 16777215 PIXEL

// Panel de Cheques
@ aPanels[2,1] , aPanels[2,2] MSPANEL ::oPanel2 SIZE aPanels[2,3] , aPanels[2,4] OF ::oPanel COLORS 0, 16777215

// Panel Totalizadores
@ aPanels[3,1] , aPanels[3,2] MSPANEL ::oPanel3 SIZE aPanels[3,3] , aPanels[3,4] OF ::oPanel COLORS 0, 16777215


//inicializo as variaveis
::InitVars()

//construo o panel de filtros 
::MontaPnl1()

//construo o panel de Titulos 
::MontaPnl2()

//construo o panel de totalizadores
::MontaPnl3()


ACTIVATE MSDIALOG ::oDlgCob CENTER

Return()


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ InitVars บAutorณ Raphael Martins	 บ Dataณ 13/04/2017   	  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo que inicializa atributos da classe				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method InitVars() Class CartaCobranca

//incializo as variaveis 
::cClienteDe		:= Space( TamSX3("A1_COD")[1] )
::cClienteAte		:= 'ZZZZZZ'
::cLojaDe			:= Space( TamSX3("A1_LOJA")[1] )
::cLojaAte			:= 'ZZ'
::aComboVenc		:= {}
::aComboCarta		:= {}

aadd(::aComboVenc,"Vencidos")
aadd(::aComboVenc,"Nao Vencidos")

aadd(::aComboCarta,"A vencer")
aadd(::aComboCarta,"8 Dias")
aadd(::aComboCarta,"30 Dias")

::nDiasDe	:= 1 
::nDiasAte	:= 999

::nQtdTit	:= 0
::nTotalTit	:= 0 

::__XVEZ     := "0"  
::_nMarca    := 0 

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MontaPnl1 บAutorณ Raphael Martins	 บ Dataณ 13/04/2017   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo que monta o painel de campos para filtro			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method MontaPnl1() Class CartaCobranca

Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oSay5
Local oSay6
Local oPesquisar
Local oLimpar
Local oFntSay1  	:= TFont():New("Verdana",,14,,.T.,,,,,.F.,.F.)
Local nComboVenc	:= 1
Local nComboCarta	:= 1
	

@ 008, 005 SAY oSay1 PROMPT "Cliente De:" SIZE 038 , 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL
@ 006, 045 MSGET ::oClienteDe VAR ::cClienteDe SIZE 052, 007 F3 "SA1" OF ::oPanel1 COLORS 0, 16777215 Picture "@!" PIXEL

@ 008, 105 SAY oSay2 PROMPT "Loja De:" SIZE 060 , 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL
@ 006, 135 MSGET ::oLojaDe VAR ::cLojaDe SIZE 026, 007 OF ::oPanel1 COLORS 0, 16777215 Picture "@!" PIXEL

@ 008, 170 SAY oSay3 PROMPT "Cliente Ate:" SIZE 060 , 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL
@ 006, 210 MSGET ::oClienteAte VAR ::cClienteAte SIZE 040, 007 F3 "SA1" OF ::oPanel1 COLORS 0, 16777215 Picture "@!" PIXEL

@ 008, 256 SAY oSay4 PROMPT "Loja Ate:" SIZE 060 , 010 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL
@ 006, 288 MSGET ::oLojaAte VAR ::cLojaAte SIZE 026, 007 OF ::oPanel1 COLORS 0, 16777215 Picture "@!" PIXEL

@ 025, 005 SAY oSay5 PROMPT "Considerar:" SIZE 040 , 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL

@ 025, 045 MSCOMBOBOX ::oComboVenc VAR nComboVenc ITEMS ::aComboVenc SIZE 072, 007 OF ::oPanel1 COLORS 0, 16777215 PIXEL

@ 026, 256 SAY oSay5 PROMPT "Tipo de Carta:" SIZE 100 , 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL
@ 025, 307 MSCOMBOBOX ::oComboCarta VAR nComboCarta ITEMS ::aComboCarta SIZE 072, 007 OF ::oPanel1 COLORS 0, 16777215 PIXEL


@ 026, 122 SAY oSay6 PROMPT "Dias De/Ate:" SIZE 044, 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL

@ 025, 165 MSGET ::oDiasDe VAR ::nDiasDe SIZE 034, 007 OF ::oPanel1 COLORS 0, 16777215 Picture "@E 999999" PIXEL

@ 026, 207 SAY oSay6 PROMPT "a" SIZE 013, 007 OF ::oPanel1 FONT oFntSay1 COLORS 0, 16777215 PIXEL

@ 025, 217 MSGET ::oDiasAte VAR ::nDiasAte SIZE 034, 007 OF ::oPanel1 COLORS 0, 16777215 Picture "@E 999999"  PIXEL

@ 044, 005 BUTTON oPesquisar PROMPT "Pesquisar" SIZE 048, 012 OF ::oPanel1 Action(FWMsgRun(,{|oSay| ::ConsultaTit()},'Aguarde...','Consultando Titulos...')) PIXEL
@ 044, 060 BUTTON oLimpar PROMPT "Enviar" SIZE 048, 012 OF ::oPanel1 Action(FWMsgRun(,{|oSay| ::MontaCartas()},'Aguarde...','Enviando Cartas de Cobrancas...')) PIXEL




Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MontaPnl2 บAutorณ Raphael Martins	 บ Dataณ 31/01/2017   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo que monta o painel de Grid de Titulos				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method MontaPnl2() Class CartaCobranca

Local nLargPanel    := ::oPanel2:nClientWidth / 2
Local nAltPanel	    := ::oPanel2:nClientHeight / 2  
Local aRetorno		:= {}
Local aHeaderEx		:= {}
Local aColsEx		:= {}   
Local aAlterFields	:= {}  
//Local aPanels		:= {} 

aRetorno := MontaGrids()

aHeaderEx   := aClone( aRetorno[1] )
aColsEx	    := aClone( aRetorno[2] )


::oGridTit := MsNewGetDados():New( 002, 002,nAltPanel - 5,nLargPanel - 5 , GD_UPDATE, "AllwaysTrue", "AllwaysTrue", "+Field1+Field2", aAlterFields,, 999, "AllwaysTrue", "", "AllwaysTrue", ::oPanel2, aHeaderEx, aColsEx)
::oGridTit:oBrowse:bLDblClick 	:= {|| if(::oGridTit:oBrowse:nColPos==1,::CliqueGrid(),.T. )}
::oGridTit:oBrowse:bHeaderClick 	:= {|oBrw1,nCol| if(::oGridTit:oBrowse:nColPos <> 111 .And. nCol == 1,(::MarcaTodos()),.T.)}



Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ CliqueGrid() บAutorณ Raphael Martins    บ Dataณ 25/04/2016 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Metodo para realizar a marcacao da linha					  บฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method CliqueGrid() Class CartaCobranca

Local nPosMark	:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="MARK"})
Local nPosValor	:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="VALOR"})

If ::oGridTit:aCols[::oGridTit:nAt][nPosMark] == "CHECKED" 
	::oGridTit:aCols[::oGridTit:nAt][nPosMark] := "UNCHECKED"
	
	::nQtdTit-- 
	::nTotalTit -= ::oGridTit:aCols[::oGridTit:nAt][nPosValor]
	
Else
	::oGridTit:aCols[::oGridTit:nAt][nPosMark] := "CHECKED" 
	::nQtdTit++ 
	::nTotalTit += ::oGridTit:aCols[::oGridTit:nAt][nPosValor]  
	
Endif 

::oTotalSel:Refresh() 
::oQtdSel:Refresh()
 
		  

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MarcaTodos() บAutorณ Raphael Martins    บ Dataณ 25/04/2017 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Metodo para realizar a marcacao de todas as linhas do folderฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method MarcaTodos()  Class CartaCobranca

Local nX 	  	:= 0
Local nPosMark	:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="MARK"})
Local nPosValor	:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="VALOR"})


::nQtdTit	:= 0  
::nTotalTit	:= 0 
			
if ::__XVEZ == "0"
	::__XVEZ := "1"
else
	if ::__XVEZ == "1"
		::__XVEZ := "2"
	endif
endif

If ::__XVEZ == "2"
	
	If ::_nMarca == 0
		
		For nX := 1 TO Len(::oGridTit:aCols)
			::oGridTit:aCols[nX][nPosMark] := "CHECKED"  
			::nQtdTit++ 
			::nTotalTit += ::oGridTit:aCols[nX][nPosValor]
		Next
		
		::_nMarca := 1
		
	Else
		
		For nX := 1 To Len(::oGridTit:aCols)
			::oGridTit:aCols[nX][nPosMark] := "UNCHECKED" 
		Next
		
		::_nMarca := 0
		
	Endif
	
	::__XVEZ:="0"
	
	::oGridTit:oBrowse:Refresh()
	
	::oTotalSel:Refresh() 
	::oQtdSel:Refresh()
	
Endif

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MontaPnl3 บAutorณ Raphael Martins	 บ Dataณ 13/04/2017   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo que cria o panel de totalizadores					  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method MontaPnl3() Class CartaCobranca

Local oFntSay1  	:= TFont():New("Verdana",,14,,.T.,,,,,.F.,.F.)  
Local nColorSay1	:= 6710886
Local nLargPanel    := ::oPanel3:nClientWidth / 2
//Local nAltPanel	    := ::oPanel3:nClientHeight / 2                            

@ 002, 002 GROUP oGroup1 TO 004 , nLargPanel - 4 PROMPT "" OF ::oPanel3 COLOR nColorSay1, 16777215 PIXEL
@ 005, 002 SAY oSay1 PROMPT "Total Selecionado:" SIZE 150 , 020 OF ::oPanel3 FONT oFntSay1 COLORS 0, 16777215 PIXEL
//@ 015, 002 SAY ::oTotalSel PROMPT "R$ " + AllTrim(Transform(::nTotalTit,"@E 999,999,999.99")) SIZE 050 , 020 OF ::oPanel3 FONT oFntSay1 COLORS 0, 16777215 PIXEL

@ 015, 002 MSGET ::oTotalSel VAR ::nTotalTit SIZE 060, 010 When .F. OF ::oPanel3 COLORS 0, 16777215 PIXEL Picture "@E 999,999,999.99" 

@ 005, 110 SAY oSay3 PROMPT "Quantidade Selecionada:" SIZE 150 , 020 OF ::oPanel3 FONT oFntSay1 COLORS 0, 16777215 PIXEL

@ 015, 110 MSGET ::oQtdSel VAR ::nQtdTit SIZE 060, 010 When .F.  OF ::oPanel3 COLORS 0, 16777215 PIXEL Picture "@E 999,999,999" 


Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ MontaGrid บAutorณ Raphael Martins      บ Dataณ 25/04/2017  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo que monta o grid de Titulos						  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function MontaGrids()

Local nX			:= 0 
Local aHeaderEx 	:= {}
Local aColsEx 		:= {}
Local aFieldFill 	:= {}


Aadd(aHeaderEx, {'Mark'      		 ,'MARK'  	   		,'@BMP',2,0,'','€€€€€€€€€€€€€€','C','','','',''})
Aadd(aHeaderEx, {"Cliente"		     ,"CLIENTE"    		,"@!",06,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Loja"			     ,"LOJA" 	   		,"@!",02,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Nome"			     ,"NOME_CLI"    	,"@!",60,0,"","€€€€€€€€€€€€€€","C","","","",""})
Aadd(aHeaderEx, {"Filial"		     ,"FILIAL" 	   		,"@!",04,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Prefixo"		     ,"PREFIXO"    		,"@!",03,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Titulo"		     ,"TITULO"     		,"@!",09,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Parcela"		     ,"PARCELA"    		,"@!",03,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Tipo"			     ,"TIPO" 	   		,"@!",03,0,"","€€€€€€€€€€€€€€","C","","","",""})  
Aadd(aHeaderEx, {"Valor" 		     ,"VALOR"			,"@E 999,999,999.99",09,2,"","€€€€€€€€€€€€€€","N","","","",""})   
Aadd(aHeaderEx, {"Saldo" 		     ,"SALDO"			,"@E 999,999,999.99",09,2,"","€€€€€€€€€€€€€€","N","","","",""})   
Aadd(aHeaderEx, {"Emissao"		     ,"DATA_EMIS"		,"@!",08,0,"","€€€€€€€€€€€€€€","D","","","",""}) 
Aadd(aHeaderEx, {"Vencimento"	     ,"DATA_VENC"		,"@!",08,0,"","€€€€€€€€€€€€€€","D","","","",""})  
Aadd(aHeaderEx, {"Dias Venc" 	     ,"DIA_VENC"		,"@E 999999",09,0,"","€€€€€€€€€€€€€€","N","","","",""}) 
Aadd(aHeaderEx, {"Historico"	     ,"HISTORICO"  		,"@!", 25,0,"","€€€€€€€€€€€€€€","C","","","",""})  
  



// Define field values
For nX := 1 To Len(aHeaderEx)
	
	if aHeaderEx[nX,8] == "C" 
		Aadd(aFieldFill, "")  
	elseif aHeaderEx[nX,8] == "N"
		Aadd(aFieldFill, 0)
	elseif aHeaderEx[nX,8] == "D"
		Aadd(aFieldFill, CTOD("  /  /    "))
	elseif aHeaderEx[nX,8] == "L"
		Aadd(aFieldFill, .F.)
	endif
	
Next nX

Aadd(aFieldFill, .F.)
Aadd(aColsEx, aFieldFill)

Return( {aHeaderEx,aColsEx } ) 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ConsultaTit บAutorณ Raphael Martins	 บ Dataณ 31/01/2017   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ M้todo que realiza a consulta dos titulos de acordo com filtros
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method ConsultaTit() Class CartaCobranca

Local cQry			:= "" 
Local dDataIni		:= CTOD("")
Local dDataFim		:= CTOD("")
Local aFieldAux		:= {}
Local aColsAux		:= {}	
Local nX			:= 0 

//reseto totalizadores
::nQtdTit	:= 0  
::nTotalTit	:= 0 

::oTotalSel:Refresh() 
::oQtdSel:Refresh()
	 
//valido se consulto titulo a vencer ou vencidos
If ::oComboVenc:nAt == 1 
	
	dDataIni	:= dDataBase - ::nDiasAte
	dDataFim	:= dDataBase - ::nDiasDe
else
	
	dDataIni	:= dDataBase + ::nDiasDe 
	dDataFim	:= dDataBase + ::nDiasAte
	
endif
 
//realizo a consulta dos titulos de acordo com os parametros selecionados
cQry := " SELECT "
cQry += " 	E1_CLIENTE CLIENTE, "
cQry += " 	E1_LOJA LOJA, "
//cQry += " 	E1_NOMCLI NOME, "
cQry += " 	A1_NOME NOME, "
cQry += " 	E1_FILIAL FILIAL, "
cQry += " 	E1_PREFIXO PREFIXO, "
cQry += " 	E1_NUM TITULO, "
cQry += " 	E1_PARCELA PARCELA, "
cQry += " 	E1_TIPO TIPO, "
cQry += " 	E1_EMISSAO EMISSAO, "
cQry += " 	E1_VENCREA VENCIMENTO, "
cQry += " 	E1_VALOR VALOR, "
cQry += " 	E1_SALDO SALDO, "
cQry += "   E1_HIST	HISTORICO "
cQry += " FROM " 
cQry += " 	" + RetSQLName("SE1") + " "
cQry += " 	LEFT JOIN "+RetSqlName("SA1") + "  ON SA1010.D_E_L_E_T_ = ' ' "  
cQry += " 	AND A1_COD = E1_CLIENTE "
cQry += " 	AND A1_LOJA = E1_LOJA "
cQry += " WHERE "
cQry += " 	SE1010.D_E_L_E_T_ = ' ' "
cQry += " 	AND E1_FILIAL IN (" + RetFils() + ") "
cQry += " 	AND E1_CLIENTE BETWEEN '" + ::cClienteDe + "' AND '" + ::cClienteAte + "' " 
cQry += " 	AND E1_LOJA BETWEEN '" + ::cLojaDe + "' AND '" + ::cLojaAte + "' "
cQry += " 	AND E1_VENCREA BETWEEN '"+ DtoS( dDataIni )+"' AND '" + DtoS(dDataFim) + "' "
cQry += " 	AND E1_TIPO NOT IN ('NCC','RA','AB-')
cQry += " 	AND E1_SALDO > 0 "

cQry += " ORDER BY CLIENTE,LOJA,EMISSAO,VENCIMENTO,FILIAL "	

MemoWrite( "c:\temp\CartaCob.sql", cQry )
// verifico se nใo existe este alias criado
If Select( "QRY_TITULOS" ) > 0 
	QRY_TITULOS->( DbCloseArea() )
EndIf    

// fun็ใo que converte a query gen้rica para o protheus
cQry := ChangeQuery(cQry)
	
// crio o alias temporario
TcQuery cQry New Alias "QRY_TITULOS" // Cria uma nova area com o resultado do query   
                                   
If QRY_TITULOS->( !Eof() )
	
	While QRY_TITULOS->( !Eof() )
	
		For nX := 1 To Len( ::oGridTit:aHeader ) 
			
			If Alltrim( ::oGridTit:aHeader[nX][2] ) == "MARK"
	    		Aadd(aFieldAux,"UNCHECKED")
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "CLIENTE"
	    		Aadd(aFieldAux,QRY_TITULOS->CLIENTE)                              
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "LOJA"
	    		Aadd(aFieldAux,QRY_TITULOS->LOJA)
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "NOME_CLI"
	    		Aadd(aFieldAux,QRY_TITULOS->NOME)
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "NOME_CLI"
	    		Aadd(aFieldAux,Alltrim(QRY_TITULOS->NOME))
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "FILIAL"
	    		Aadd(aFieldAux,QRY_TITULOS->FILIAL)
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "PREFIXO"
	    		Aadd(aFieldAux,QRY_TITULOS->PREFIXO)
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "TITULO"
	    		Aadd(aFieldAux,QRY_TITULOS->TITULO)
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "PARCELA"
	    		Aadd(aFieldAux,QRY_TITULOS->PARCELA)	
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "TIPO"
	    		Aadd(aFieldAux,QRY_TITULOS->TIPO)	
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "VALOR"
	    		Aadd(aFieldAux,QRY_TITULOS->VALOR)	
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "SALDO"
	    		Aadd(aFieldAux,QRY_TITULOS->SALDO)	
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "DATA_EMIS"
	    		Aadd(aFieldAux,STOD(QRY_TITULOS->EMISSAO))	
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "DATA_VENC"
	    		Aadd(aFieldAux,STOD(QRY_TITULOS->VENCIMENTO))
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "DIA_VENC"
	    		Aadd(aFieldAux,dDataBase - STOD(QRY_TITULOS->VENCIMENTO ) )
	    	elseif Alltrim( ::oGridTit:aHeader[nX][2] ) == "HISTORICO"
	    		Aadd(aFieldAux,Alltrim(QRY_TITULOS->HISTORICO ) )
	    	endif
	    	
	    	
		Next nX
	    
		Aadd(aFieldAux,.F.)
		
		Aadd(aColsAux, aFieldAux)
		
		aFieldAux	:= {}
		
		QRY_TITULOS->( DbSkip() )
	EndDo
	
else
	aColsAux	:= Aclone( ::LimpaGrid() )	
endif

//atualizo a grid  
::oGridTit:SetArray( aColsAux )  
::oGridTit:nAT := 1
::oGridTit:oBrowse:Refresh()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ LimpaGrid บAutorณ Raphael Martins     บ Dataณ 25/04/2017   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Metodo para limpar e criar uma linha vazia das grids	      บฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method LimpaGrid() Class CartaCobranca

Local aFieldAux	:= {}
Local aColsAux	:= {}
Local nX 		:= 0

// Define field values
For nX := 1 To Len(::oGridTit:aHeader)
		
	if ::oGridTit:aHeader[nX,8] == "C"
		Aadd(aFieldAux, "")
	elseif ::oGridTit:aHeader[nX,8] == "N"
		Aadd(aFieldAux, 0)
	elseif ::oGridTit:aHeader[nX,8] == "D"
		Aadd(aFieldAux, CTOD("  /  /    "))
	elseif ::oGridTit:aHeader[nX,8] == "L"
		Aadd(aFieldAux, .F.)
	endif
		
Next nX

Aadd(aFieldAux, .F.)
Aadd(aColsAux, aFieldAux)

Return(aColsAux)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RetFils บAutorณ Raphael Martins     บ Dataณ 25/04/2016     บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao para retornar as filiais cadastradas no sistema     บฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RetFils()
 
Local aArea		:= GetArea()       
Local aAreaSM0	:= SM0->(GetArea()) 
Local cRet		:= ""    

SM0->( DbGotop() )

While SM0->( !EOF() )
	
	If !Empty(cRet)
		cRet += ","
	EndIf	
	cRet += "'"+PadR(Alltrim(SM0->M0_CODFIL),TamSX3("E1_FILIAL")[1])+"'"

	SM0->( DbSkip() )
EndDo


RestArea(aAreaSM0)
RestArea(aArea)

Return(cRet)
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ SendCartas บAutorณ Raphael Martins   บ Dataณ 25/04/2016    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao para montar as cartas de cobran็a para o cliente    บฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method MontaCartas() Class CartaCobranca

Local nX			:= 0 
Local nPosMark		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="MARK"})
Local nPosCli		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="CLIENTE"})
Local nPosLoja		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="LOJA"})
Local nPosTit		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="TITULO"})
Local nPosParc		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="PARCELA"})
Local nPosValor		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="VALOR"})
Local nPosVenc		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="DATA_VENC"})
Local nPosHist		:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="HISTORICO"})
Local nPosNomCli	:= aScan(::oGridTit:aHeader,{|x| AllTrim(x[2])=="NOME_CLI"})
Local cCliente		:= ""
Local cLoja			:= ""
Local cNomeCli		:= ""
Local aTituloCli	:= {}
Local lEnviou		:= .F.	
Local lErro			:= .F.

SA1->( DbSetOrder(1) ) //A1_FILIAL + A1_COD

If MsgYesNo(" Confirma o envio das cartas de cobran็a?")

	If !Empty(::oGridTit:aCols[1,nPosCli])
		
		cCliente	:= ::oGridTit:aCols[1,nPosCli]
		cLoja		:= ::oGridTit:aCols[1,nPosLoja]
		cNomeCli	:= ::oGridTit:aCols[1,nPosNomCli]
		
		//monto os dados para criar o html a ser enviado
		For nX := 1 To Len( ::oGridTit:aCols )
		
			If ::oGridTit:aCols[nX,nPosMark] == "CHECKED"
			
				Aadd(aTituloCli,;
					{::oGridTit:aCols[nX,nPosTit],;	//Numero do Titulo
					::oGridTit:aCols[nX,nPosParc],; //Parcela
					::oGridTit:aCols[nX,nPosValor],;//Valor
					::oGridTit:aCols[nX,nPosVenc],;	//Vencimento
					::oGridTit:aCols[nX,nPosHist]})	//Historico do Titulo
					
			endif
			
			//valido se trocou de cliente para montar a disparar a carta para o mesmo
			If ( nX + 1 > Len(::oGridTit:aCols ) ) .Or. !( ::oGridTit:aCols[nX + 1,nPosCli] == cCliente .And. ::oGridTit:aCols[nX + 1,nPosLoja] == cLoja) 
				
				//dispara carta de cobranca para o cliente
				If Len(aTituloCli) > 0 
				
					If SA1->( DbSeek( xFilial("SA1") + cCliente + cLoja  ) ) 
						//caso nao seja possivel enviar o email, aborta o processo
						If !( ::SendCartas( cCliente, cLoja, cNomeCli,SA1->A1_EMAIL, SA1->A1_END,SA1->A1_BAIRRO,SA1->A1_MUN,SA1->A1_EST, aTituloCli) )
							lErro := .T.
							MsgAlert("Nใo foi possivel o e-mail da carta de cobran็a, Favor revise as configura็๕es de E-mail")
							Exit
						else
							lEnviou := .T.
						EndIf
					else
						lErro := .T.
						MsgAlert("Cliente do Titulo nใo encontrado, Favor verifique o cadastro do clitente " + Alltrim( cCliente) + "/ " + Alltrim( cLoja) + " ")
						Exit
					endif
					
				endif
				
				aTituloCli	:= {}
				
				If nX + 1 <= Len(::oGridTit:aCols)
					cCliente	:= ::oGridTit:aCols[nX + 1 ,nPosCli]
					cLoja		:= ::oGridTit:aCols[nX + 1 ,nPosLoja]
					cNomeCli	:= ::oGridTit:aCols[nX + 1 ,nPosNomCli]
				endif
				
			endif
			
			//desmarco itens marcados
			::oGridTit:aCols[nX,nPosMark] := "UNCHECKED"
		Next nX
		
	endif
	//atualizo a grid  
	::oGridTit:nAT := 1
	::oGridTit:oBrowse:Refresh()

	//reseto totalizadores
	::nQtdTit	:= 0  
	::nTotalTit	:= 0 
	
	::oTotalSel:Refresh() 
	::oQtdSel:Refresh()

	//se todas as cartas foram enviadas com sucesso, mostro a mensagem
	If lEnviou .And. !lErro
		MsgInfo("Cartas de Cobran็a enviadas com sucesso!")	
	EndIf

endif

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ SendCartas บAutorณ Raphael Martins   บ Dataณ 25/04/2016    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao para enviar as cartas de cobran็a para o cliente    บฑฑ    
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Mococa		                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Method SendCartas( cCliente, cLoja, cNomeCli, cMailCli ,cEndereco, cBairro, cMunicipio, cEstado , aTituloCli) Class CartaCobranca

Local cHtml	:= ""
Local cHtml2 := " "
Local nX	:= 0
Local lRet	:= .T.
Local cLogoMoc := GetSrvProfString("Startpath","")+"logo_mococa_azul.bmp"//GetSrvProfString("Startpath","") + "DANFE" + cDescLogo + ".BMP" //Alterado por Marcos Godinho, todas as filiais imprimem a mesma logo com o mesmo nome de arquivo. 30/07/2018
 	


//modelo de carta de titulos a Vencer
If ::oComboCarta:nAt == 1 
	
		cHtml := ' <html> '
		cHtml += '	<head> '
		cHtml += '		<title>Cobranca Mococa</title> '
		cHtml += '	</head>  '
		cHtml += '	<body> '
		cHtml += '		<div style="text-align: right;">&nbsp;</div> '
		cHtml += '		<div style="text-align: left;"> '
		cHtml += '			<span style="font-size:16px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '

		//cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		/*
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="http://wsprotheus.mococa.com.br:8085/messenger/emp01/cotpre/logo.jpg" width="166" height="99" border="0" /> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong><span class="fontstyle0">&nbsp; </span></strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong><span class="fontstyle0">&nbsp; </span></strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		*/
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong> '
				cCliente := Alltrim( cCliente ) + "/" + Alltrim( cLoja ) + " - " + Alltrim( cNomeCli ) 
		cHtml += ' 					<span class="fontstyle0">'+	cCliente + '<br />  '
		cHtml += ' 						' + Alltrim( cEndereco ) + '<br /> '
		cHtml += ' 						' + Alltrim( cBairro ) + '<br /> '
		cHtml += ' 						' + Alltrim( cMunicipio ) + ' - ' + cEstado + ' ' 
		cHtml += ' 					</span> 	'	
		cHtml += '             </strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div>&nbsp;</div> '
		cHtml += ' <div> '
		cHtml += '     <span style="font-size: 14px;"><span style="font-family: arial, helvetica, sans-serif;">Prezado cliente,</span> </span> '
		cHtml += ' </div> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0"> '
		cHtml += '                 Pela presente forma admitida e no presente instrumento particular em direito, a Mococa S/A Produtos Aliment&iacute;cios o notifica<br /> '
		cHtml += '                 respeitosamente sobre o n&atilde;o pagamento do t&iacute;tulo abaixo: '
		cHtml += '             </span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		cHtml += ' <table style="width: 500px;" border="1" cellspacing="1" cellpadding="1"> '
		cHtml += '     <thead> '
		cHtml += '         <tr> '
		cHtml += '             <th scope="col">N&ordm; Nota</th> '
		cHtml += '             <th scope="col">Presta&ccedil;&atilde;o</th> '
		cHtml += '             <th scope="col">Valor do Documento</th> '
		cHtml += '             <th scope="col">Vencimento</th> '
		cHtml += '             <th scope="col">Observa&ccedil;&atilde;o</th> '
		cHtml += '         </tr> '
		 	For nX := 1 To Len( aTituloCli )
		cHtml += '         <tr> '
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim( aTituloCli[nX,1])+'</th> '
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim( aTituloCli[nX,2])+'</th> ' 
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ AllTrim(Transform(aTituloCli[nX,3],"@E 999,999,999.99")) +'</th> ' 
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim(DTOC(aTituloCli[nX,4]))+'</th> ' 
		cHtml += ' 			<th scope="col"> ' 
		cHtml += ' 				'+ If( !Empty( Alltrim( aTituloCli[nX,5])),Alltrim( aTituloCli[nX,5]),'&nbsp;')+'</th> '
		cHtml += ' 		
		cHtml += '         </tr> '
		 	Next nX
		cHtml += '     </thead> '
		cHtml += ' </table> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0"> '
		cHtml += '                 Desta maneira, solicitamos o pagamento no prazo de at&eacute; 5 (cinco) dias corridos o valor acima mencionado, sendo que ap&oacute;s<br /> '
		cHtml += '                 essa data o envio a cart&oacute;rio &eacute; autom&aacute;tico. '
		cHtml += '             </span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		//cHtml += ' </p> '
		//cHtml += ' <p>&nbsp;</p> '
		//cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> <span class="fontstyle0">Por gentileza solicitar boleto atualizado atrav&eacute;s dos canais de comunica&ccedil;&atilde;o constantes abaixo.</span> </span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		cHtml += ' <p> '
		cHtml += '     <strong> '
		cHtml += '         <span style="font-size: 14px;"> '
		cHtml += '             <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Vitoria Remonti&nbsp;</span></span> '
		cHtml += '         </span> '
		cHtml += '     </strong> '
		cHtml += ' </p> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Telefone: (19) 3666-7135 Ramal: 7135&nbsp;</span></span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0">E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">vitoria.remonti@mococa.com.br</a></span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		//cHtml += ' <p>&nbsp;</p> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Atenciosamente,</span></span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		cHtml += ' <h4> '
		cHtml += '     <strong> '
		cHtml += '         <span style="font-size: 14px;"> '
		cHtml += '             <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Mococa S/A Produtos Aliment&iacute;cios</span></span> '
		cHtml += '         </span> '
		cHtml += '     </strong> '
		cHtml += ' </h4> '
		//cHtml += ' <p>&nbsp;</p> '
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="http://wsprotheus.mococa.com.br:8085/messenger/emp01/cotpre/logo.jpg" width="166" height="99" border="0" /> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '


		cHtml += '	</body> '
		cHtml += '</html> '
//modelo de carta de titulos com vencimento de 8 dias
elseIf ::oComboCarta:nAt == 2 
	
		cHtml := ' <html> '
		cHtml += '	<head> '
		cHtml += '		<title>Cobranca Mococa</title> '
		cHtml += '	</head>  '
		cHtml += '	<body> '
		cHtml += '		<div style="text-align: right;">&nbsp;</div> '
		cHtml += '		<div style="text-align: left;"> '
		cHtml += '			<span style="font-size:16px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '

		//cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		/*
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="http://wsprotheus.mococa.com.br:8085/messenger/emp01/cotpre/logo.jpg" width="166" height="99" border="0" /> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong><span class="fontstyle0">&nbsp; </span></strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong><span class="fontstyle0">&nbsp; </span></strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		cHtml += ' <div style="text-align: left;">&nbsp;</div> '
		*/
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <strong> '
				cCliente := Alltrim( cCliente ) + "/" + Alltrim( cLoja ) + " - " + Alltrim( cNomeCli ) 
		cHtml += ' 					<span class="fontstyle0">'+	cCliente + '<br />  '
		cHtml += ' 						' + Alltrim( cEndereco ) + '<br /> '
		cHtml += ' 						' + Alltrim( cBairro ) + '<br /> '
		cHtml += ' 						' + Alltrim( cMunicipio ) + ' - ' + cEstado + ' ' 
		cHtml += ' 					</span> 	'	
		cHtml += '             </strong> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '
		cHtml += ' <div>&nbsp;</div> '
		cHtml += ' <div> '
		cHtml += '     <span style="font-size: 14px;"><span style="font-family: arial, helvetica, sans-serif;">Prezado cliente,</span> </span> '
		cHtml += ' </div> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0"> '
		cHtml += '                 Pela presente forma admitida e no presente instrumento particular em direito, a Mococa S/A Produtos Aliment&iacute;cios o notifica<br /> '
		cHtml += '                 respeitosamente sobre o n&atilde;o pagamento do t&iacute;tulo abaixo: '
		cHtml += '             </span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </p> '
		cHtml += ' <table style="width: 500px;" border="1" cellspacing="1" cellpadding="1"> '
		cHtml += '     <thead> '
		cHtml += '         <tr> '
		cHtml += '             <th scope="col">N&ordm; Nota</th> '
		cHtml += '             <th scope="col">Presta&ccedil;&atilde;o</th> '
		cHtml += '             <th scope="col">Valor do Documento</th> '
		cHtml += '             <th scope="col">Vencimento</th> '
		cHtml += '             <th scope="col">Observa&ccedil;&atilde;o</th> '
		cHtml += '         </tr> '
		 	For nX := 1 To Len( aTituloCli )
		cHtml += '         <tr> '
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim( aTituloCli[nX,1])+'</th> '
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim( aTituloCli[nX,2])+'</th> ' 
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ AllTrim(Transform(aTituloCli[nX,3],"@E 999,999,999.99")) +'</th> ' 
		cHtml += ' 			<th scope="col"> '
		cHtml += ' 				'+ Alltrim(DTOC(aTituloCli[nX,4]))+'</th> ' 
		cHtml += ' 			<th scope="col"> ' 
		cHtml += ' 				'+ If( !Empty( Alltrim( aTituloCli[nX,5])),Alltrim( aTituloCli[nX,5]),'&nbsp;')+'</th> '
		cHtml += ' 		
		cHtml += '         </tr> '
		 	Next nX
		cHtml += '     </thead> '
		cHtml += ' </table> '
		cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0"> '
		cHtml += '                 Desta maneira, solicitamos o pagamento no prazo de at&eacute; 5 (cinco) dias corridos o valor acima mencionado, sendo que ap&oacute;s<br /> '
		cHtml += '                 essa data o envio a cart&oacute;rio &eacute; autom&aacute;tico. '
		cHtml += '             </span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		//cHtml += ' </p> '
		//cHtml += ' <p>&nbsp;</p> '
		//cHtml += ' <p> '
		cHtml += '     <span style="font-size: 14px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <span class="fontstyle0"> '
		cHtml += ' <p>Caso o t&iacute;tulo esteja em atraso, favor entrar em contato com o departamento financeiro nos telefones:</p> '
		cHtml += ' <p><strong>Isabela Barboza</strong></p> '
		cHtml += ' <p>Telefone: (19) 3666-7132 Ramal: 7132</p> '
		cHtml += ' <p>E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">isabela.barboza@mococa.com.br</a></p> '
		cHtml += ' <p><strong>Danilo Oliveira</strong></p> '
		cHtml += ' <p>Telefone: (19) 3666-7192 Ramal: 7192&nbsp;</p> '
		cHtml += ' <p>E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">danilo.oliveira@mococa.com.br</a></p> '
		cHtml += ' <p><strong> Vitoria Remonti&nbsp; </strong></p> '
		cHtml += ' <p> Telefone: (19) 3666-7135 Ramal: 7135&nbsp; </p> '
		cHtml += ' <p> E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">vitoria.remonti@mococa.com.br</a> </p> '
		cHtml += ' <p>Permanecemos &agrave; disposi&ccedil;&atilde;o para qualquer d&uacute;vida e desde j&aacute; agradecemos a compreens&atilde;o.</p> '
		cHtml += ' <p> Atenciosamente, </p> '
		cHtml += '             </span> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		//cHtml += ' <p>&nbsp;</p> '
		cHtml += ' <h4> '
		cHtml += '     <strong> '
		cHtml += '         <span style="font-size: 14px;"> '
		cHtml += '             <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Mococa S/A Produtos Aliment&iacute;cios</span></span> '
		cHtml += '         </span> '
		cHtml += '     </strong> '
		cHtml += ' </h4> '
		//cHtml += ' <p>&nbsp;</p> '
		cHtml += ' <div style="text-align: left;"> '
		cHtml += '     <span style="font-size: 16px;"> '
		cHtml += '         <span style="font-family: arial, helvetica, sans-serif;"> '
		cHtml += '             <img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="http://wsprotheus.mococa.com.br:8085/messenger/emp01/cotpre/logo.jpg" width="166" height="99" border="0" /> '
		cHtml += '         </span> '
		cHtml += '     </span> '
		cHtml += ' </div> '


		cHtml += '	</body> '
		cHtml += '</html> '

//modelo de carta de titulos com vencimento de 8 dias
/*
elseif ::oComboCarta:nAt == 2 


		cHtml := ' <html> '
		cHtml += '	<head> '
		cHtml += '		<title>Cobranca Mococa</title> '
		cHtml += '	</head>  '
		cHtml += '	<body> '
		cHtml += '		<div style="text-align: right;">&nbsp;</div> '
		cHtml += '		<div style="text-align: right;"> '
		cHtml += '			<span style="font-size:16px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
		
				cHtml += '	<div style="text-align: right;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"><img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="'+cLogoMoc+'" width="242" height="121" border="0" /> </span> '
				cHtml += '		</span> '
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"> '
				cHtml += '				<strong><span class="fontstyle0">&nbsp; </span></strong> '
				cHtml += '			</span> '
				cHtml += '		</span> '
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"> '
				cHtml += '				<strong><span class="fontstyle0">&nbsp; </span></strong> '
				cHtml += '			</span> '
				cHtml += '		</span> ' 
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> ' 
				cHtml += '	<div style="text-align: left;">&nbsp;</div> ' 
				cHtml += '	<div style="text-align: left;"> '

		cHtml += '					<strong> '
		cCliente := Alltrim( cCliente ) + "/" + Alltrim( cLoja ) + " - " + Alltrim( cNomeCli )
	
		cHtml += '						<span class="fontstyle0">'+	cCliente + '<br /> '
		cHtml += '							' + Alltrim( cEndereco ) + '<br /> '
		cHtml += '							' + Alltrim( cBairro ) + '<br /> '
		cHtml += '							' + Alltrim( cMunicipio ) + ' - ' + cEstado + ' '
		cHtml += '						</span> '
		cHtml += '					</strong> '
		cHtml += '				</span> '
		cHtml += '			</span> '
		cHtml += '		</div> '
		cHtml += '		<div style="text-align: right;">&nbsp;</div> '
		cHtml += '		<div> '
		cHtml += '			<span style="font-size:14px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;">Prezado cliente,</span> '
		cHtml += '			</span> '
		cHtml += '		</div> '
		cHtml += '		<p> '
		cHtml += '			<span style="font-size:14px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
		cHtml += '					<span class="fontstyle0">Pela presente forma admitida e no presente instrumento particular em direito, a Mococa S/A Produtos Aliment&iacute;cios o notifica<br /> '
		cHtml += '						respeitosamente sobre o n&atilde;o pagamento do t&iacute;tulo abaixo: '
		cHtml += '					</span> '
		cHtml += '				</span> '
		cHtml += '			</span> '
		cHtml += '		</p> '
				cHtml += '		<table style="width: 500px;" border="1" cellspacing="1" cellpadding="1"> '
		cHtml += '			<thead> '
		cHtml += '				<tr> '
		cHtml += '					<th scope="col"> '
		cHtml += '						N&ordm; Nota</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						Presta&ccedil;&atilde;o</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						Valor do Documento</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						Vencimento</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						Observa&ccedil;&atilde;o</th> '
		cHtml += '				</tr> '
		
	
		
		For nX := 1 To Len( aTituloCli )
			
			cHtml += '				<tr> '
			cHtml += '					<th scope="col"> '
			cHtml += '						'+ Alltrim( aTituloCli[nX,1])+'</th> '
			cHtml += '					<th scope="col"> '
			cHtml += '						'+ Alltrim( aTituloCli[nX,2])+'</th> '
			cHtml += '					<th scope="col"> '
			cHtml += '						'+ AllTrim(Transform(aTituloCli[nX,3],"@E 999,999,999.99")) +'</th> '
			cHtml += '					<th scope="col">
			cHtml += '						'+ Alltrim(DTOC(aTituloCli[nX,4]))+'</th> '
			cHtml += '					<th scope="col"> '
			cHtml += '						'+ If( !Empty( Alltrim( aTituloCli[nX,5])),Alltrim( aTituloCli[nX,5]),'&nbsp;')+'</th> '
			cHtml += '				</tr> '
		
			
		Next nX
		cHtml += '			</thead> '
		cHtml += '			<tbody> '
		cHtml += '			</tbody> '
		cHtml += '		</table> '
		
		cHtml += ' <br /> '
		cHtml += ' <br /> '
		
		cHtml += '			<span style="font-size:14px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
		cHtml += '					<span class="fontstyle0">Desta maneira, solicitamos o pagamento no prazo de at&eacute; 5 (cinco) dias corridos o valor acima mencionado, sendo que ap&oacute;s<br /> '
		cHtml += '						essa data o envio a cart&oacute;rio &eacute; autom&aacute;tico. '
		cHtml += '					</span> '
		cHtml += '				</span> '
		cHtml += '			</span> '
		cHtml += '		</p> '
		cHtml += '		<p> '
		cHtml += '			<br /> '
		cHtml += '			<span style="font-size:14px;"> '
		cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
		cHtml += '					<span class="fontstyle0">Por gentileza solicitar boleto atualizado atrav&eacute;s dos canais de comunica&ccedil;&atilde;o constantes abaixo.</span> '
		cHtml += '				</span> '
		cHtml += '			</span> '
		cHtml += '		</p> '

			cHtml += '<p> '
			cHtml += '    <strong> '
			cHtml += '        <span style="font-size: 14px;"> '
			cHtml += '            <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Vitoria Remonti&nbsp;</span></span> '
			cHtml += '        </span> '
			cHtml += '    </strong> '
			cHtml += '</p> '
			cHtml += '<p> '
			cHtml += '    <span style="font-size: 14px;"> '
			cHtml += '        <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Telefone: (19) 3666-7135 Ramal: 7135&nbsp;</span></span> '
			cHtml += '    </span> '
			cHtml += '</p> '
			cHtml += '<p> '
			cHtml += '    <span style="font-size: 14px;"> '
			cHtml += '        <span style="font-family: arial, helvetica, sans-serif;"> '
			cHtml += '            <span class="fontstyle0">E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">vitoria.remonti@mococa.com.br</a></span> '
			cHtml += '        </span> '
			cHtml += '    </span> '
			cHtml += '</p> '
			cHtml += '<p>&nbsp;</p> '
			cHtml += '<p> '
			cHtml += '    <span style="font-size: 14px;"> '
			cHtml += '        <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Atenciosamente,</span></span> '
			cHtml += '    </span> '
			cHtml += '</p> '
			cHtml += '<h4> '
			cHtml += '    <strong> '
			cHtml += '        <span style="font-size: 14px;"> '
			cHtml += '            <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Mococa S/A Produtos Aliment&iacute;cios</span></span> '
			cHtml += '        </span> '
			cHtml += '    </strong> '
			cHtml += '</h4> '	
			cHtml += '<p>&nbsp;</p> '

		cHtml += '	</body> '
		cHtml += '</html> '

//modelo de carta de titulos com vencimento de 30 dias
*/
elseif ::oComboCarta:nAt == 3 
	
	cHtml := ' <html> '
	cHtml += '	<head> '
	cHtml += '		<title>Cobranca Mococa</title> '
	cHtml += '	</head>  '
	cHtml += '	<body> '
	cHtml += '		<div style="text-align: right;">&nbsp;</div> '
	cHtml += '		<div style="text-align: right;"> '
	cHtml += '			<span style="font-size:16px;"> '
	cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
	
				cHtml += '	<div style="text-align: right;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"><img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;" src="'+cLogoMoc+'" width="242" height="121" border="0" /> </span> '
				cHtml += '		</span> '
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"> '
				cHtml += '				<strong><span class="fontstyle0">&nbsp; </span></strong> '
				cHtml += '			</span> '
				cHtml += '		</span> '
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;"> '
				cHtml += '		<span style="font-size: 16px;"> '
				cHtml += '			<span style="font-family: arial, helvetica, sans-serif;"> '
				cHtml += '				<strong><span class="fontstyle0">&nbsp; </span></strong> '
				cHtml += '			</span> '
				cHtml += '		</span> ' 
				cHtml += '	</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> '
				cHtml += '	<div style="text-align: left;">&nbsp;</div> ' 
				cHtml += '	<div style="text-align: left;">&nbsp;</div> ' 
				cHtml += '	<div style="text-align: left;"> '

	cHtml += '					<strong> '
	cCliente := Alltrim( cCliente ) + "/" + Alltrim( cLoja ) + " - " + Alltrim( cNomeCli )
	
	cHtml += '						<span class="fontstyle0">'+	cCliente + '<br /> '
	cHtml += '							' + Alltrim( cEndereco ) + '<br /> '
	cHtml += '							' + Alltrim( cBairro ) + '<br /> '
	cHtml += '							' + Alltrim( cMunicipio ) + ' - ' + cEstado + ' '
	cHtml += '						</span> '
	cHtml += '					</strong> '
	cHtml += '				</span> '
	cHtml += '			</span> '
	cHtml += '		</div> '
	cHtml += '		<div style="text-align: right;">&nbsp;</div> '
	cHtml += '		<div> '
	cHtml += '			<span style="font-size:14px;"> '
	cHtml += '				<span style="font-family:arial,helvetica,sans-serif;">Prezado cliente,</span> '
	cHtml += '			</span> '
	cHtml += '		</div> '
	cHtml += '		<p> '
	cHtml += '			<span style="font-size:14px;"> '
	cHtml += '				<span style="font-family:arial,helvetica,sans-serif;"> '
	cHtml += '					<span class="fontstyle0">Pela presente forma admitida e no presente instrumento particular em direito, a Mococa S/A Produtos Aliment&iacute;cios o notifica<br /> '
	cHtml += '						respeitosamente sobre o n&atilde;o pagamento do t&iacute;tulo abaixo: '
	cHtml += '					</span> '
	cHtml += '				</span> '
	cHtml += '			</span> '
	cHtml += '		</p> '
			cHtml += '		<table style="width: 500px;" border="1" cellspacing="1" cellpadding="1"> '
	cHtml += '			<thead> '
	cHtml += '				<tr> '
	cHtml += '					<th scope="col"> '
	cHtml += '						N&ordm; Nota</th> '
	cHtml += '					<th scope="col"> '
	cHtml += '						Presta&ccedil;&atilde;o</th> '
	cHtml += '					<th scope="col"> '
	cHtml += '						Valor do Documento</th> '
	cHtml += '					<th scope="col"> '
	cHtml += '						Vencimento</th> '
	cHtml += '					<th scope="col"> '
	cHtml += '						Observa&ccedil;&atilde;o</th> '
	cHtml += '				</tr> '
	

	
	For nX := 1 To Len( aTituloCli )
		
		cHtml += '				<tr> '
		cHtml += '					<th scope="col"> '
		cHtml += '						'+ Alltrim( aTituloCli[nX,1])+'</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						'+ Alltrim( aTituloCli[nX,2])+'</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						'+ AllTrim(Transform(aTituloCli[nX,3],"@E 999,999,999.99")) +'</th> '
		cHtml += '					<th scope="col">
		cHtml += '						'+ Alltrim(DTOC(aTituloCli[nX,4]))+'</th> '
		cHtml += '					<th scope="col"> '
		cHtml += '						'+ If( !Empty( Alltrim( aTituloCli[nX,5])),Alltrim( aTituloCli[nX,5]),'&nbsp;')+'</th> '
		cHtml += '				</tr> '
	
		
	Next nX
	cHtml += '			</thead> '
	cHtml += '			<tbody> '
	cHtml += '			</tbody> '
	cHtml += '		</table> '
	
	cHtml += ' <br /> '
	cHtml += ' <br /> '
	cHtml += ' 				<span class="fontstyle0"><span style="font-family:arial,helvetica,sans-serif;">Houve v&aacute;rias tentativas de contato sem sucesso. Desta maneira, solicitamos o pagamento no prazo de at&eacute; 48h do valor acima<br /> '
	cHtml += ' 				mencionado atrav&eacute;s de dep&oacute;sito na conta:<br /> '
	cHtml += ' 				Banco Safra<br /> '
	cHtml += ' 				Ag. 0197<br /> '
	cHtml += ' 				C/C 210097-9<br /> '
	cHtml += ' 				CNPJ: 52.502.507/0001-47<br /> '
	cHtml += ' 				Mococa S/A Produtos Aliment&iacute;cio</span>s</span></p> '
	cHtml += ' 			<p> '
	cHtml += ' 				<span style="font-family:arial,helvetica,sans-serif;"><span class="fontstyle0">Caso o pagamento n&atilde;o seja realizado no prazo estipulado acima, ser&atilde;o tomadas medidas judiciais para cobran&ccedil;a e<br /> '
	cHtml += ' 				indeniza&ccedil;&atilde;o.<br /> '
	cHtml += ' 				Estamos &agrave; disposi&ccedil;&atilde;o nos telefones e e-mail abaixo para responder qualquer questionamento.<br /> '
	cHtml += ' 				(62) 3265-1052/1033 cobranca@mococa.com.br</span></span></p> '
	cHtml += ' 			<p> '
	cHtml += ' 				<span style="font-size:16px;"><span style="font-family:arial,helvetica,sans-serif;">Atenciosamente,</span></span></p> '
	cHtml += ' 			<p> '
	cHtml += ' 				&nbsp;</p> '
	cHtml += ' 			<h4> '
	cHtml += ' 				<span style="font-family:arial,helvetica,sans-serif;"><span class="fontstyle0">Mococa S/A Produtos Aliment&iacute;cios</span></span></h4> '
	cHtml += ' 			<h4> '
	cHtml += ' 				<span style="font-family:arial,helvetica,sans-serif;">Departamento de cobran&ccedil;a</span></h4> '
	cHtml += ' 		</body> '
	cHtml += ' 	</html> '
endif


cHtml2 :='<div style="text-align: right;">&nbsp;</div>                                                                                                                                                                           '
cHtml2 +='<div style="text-align: left;">                                                                                                                                                                                        '
cHtml2 +='    <span style="font-size: 16px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;"><img style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; float: left;"  src="'+cLogoMoc+'" width="242" height="121"    border="0" /> </span> '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</div>                                                                                                                                                                                                                 '
cHtml2 +='<div style="text-align: left;">                                                                                                                                                                                        '
cHtml2 +='    <span style="font-size: 16px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <strong><span class="fontstyle0">&nbsp; </span></strong>                                                                                                                                                   '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</div>                                                                                                                                                                                                                 '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">                                                                                                                                                                                        '
cHtml2 +='    <span style="font-size: 16px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <strong><span class="fontstyle0">&nbsp; </span></strong>                                                                                                                                                   '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</div>                                                                                                                                                                                                                 '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">&nbsp;</div>                                                                                                                                                                            '
cHtml2 +='<div style="text-align: left;">                                                                                                                                                                                        '
cHtml2 +='    <span style="font-size: 16px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <strong>                                                                                                                                                                                                   '
cHtml2 +='                <span class="fontstyle0">                                                                                                                                                                              '
cHtml2 +='                    C08168/01 - LEONARDO MARTINS DEL<br />                                                                                                                                                             '
cHtml2 +='                    R SEBASTIAO MICAEL DE SOUZA N71<br />                                                                                                                                                              '
cHtml2 +='                    JD STA EMILIA<br />                                                                                                                                                                                '
cHtml2 +='                    MOCOCA - SP                                                                                                                                                                                        '
cHtml2 +='                </span>                                                                                                                                                                                                '
cHtml2 +='            </strong>                                                                                                                                                                                                  '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</div>                                                                                                                                                                                                                 '
cHtml2 +='<div>&nbsp;</div>                                                                                                                                                                                                      '
cHtml2 +='<div>                                                                                                                                                                                                                  '
cHtml2 +='    <span style="font-size: 14px;"><span style="font-family: arial, helvetica, sans-serif;">Prezado cliente,</span> </span>                                                                                            '
cHtml2 +='</div>                                                                                                                                                                                                                 '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <span class="fontstyle0">                                                                                                                                                                                  '
cHtml2 +='                Pela presente forma admitida e no presente instrumento particular em direito, a Mococa S/A Produtos Aliment&iacute;cios o notifica<br />                                                               '
cHtml2 +='                respeitosamente sobre o n&atilde;o pagamento do t&iacute;tulo abaixo:                                                                                                                                  '
cHtml2 +='            </span>                                                                                                                                                                                                    '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<table style="width: 500px;" border="1" cellspacing="1" cellpadding="1">                                                                                                                                               '
cHtml2 +='    <thead>                                                                                                                                                                                                            '
cHtml2 +='        <tr>                                                                                                                                                                                                           '
cHtml2 +='            <th scope="col">N&ordm; Nota</th>                                                                                                                                                                          '
cHtml2 +='            <th scope="col">Presta&ccedil;&atilde;o</th>                                                                                                                                                               '
cHtml2 +='            <th scope="col">Valor do Documento</th>                                                                                                                                                                    '
cHtml2 +='            <th scope="col">Vencimento</th>                                                                                                                                                                            '
cHtml2 +='            <th scope="col">Observa&ccedil;&atilde;o</th>                                                                                                                                                              '
cHtml2 +='        </tr>                                                                                                                                                                                                          '
cHtml2 +='        <tr>                                                                                                                                                                                                           '
cHtml2 +='            <th scope="col">000198365</th>                                                                                                                                                                             '
cHtml2 +='            <th scope="col">&nbsp;</th>                                                                                                                                                                                '
cHtml2 +='            <th scope="col">177,31</th>                                                                                                                                                                                '
cHtml2 +='            <th scope="col">14/09/2022</th>                                                                                                                                                                            '
cHtml2 +='            <th scope="col">&nbsp;</th>                                                                                                                                                                                '
cHtml2 +='        </tr>                                                                                                                                                                                                          '
cHtml2 +='    </thead>                                                                                                                                                                                                           '
cHtml2 +='</table>                                                                                                                                                                                                               '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <span class="fontstyle0">                                                                                                                                                                                  '
cHtml2 +='                Desta maneira, solicitamos o pagamento no prazo de at&eacute; 5 (cinco) dias corridos o valor acima mencionado, sendo que ap&oacute;s<br />                                                            '
cHtml2 +='                essa data o envio a cart&oacute;rio &eacute; autom&aacute;tico.                                                                                                                                        '
cHtml2 +='            </span>                                                                                                                                                                                                    '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<p>&nbsp;</p>                                                                                                                                                                                                          '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;"> <span class="fontstyle0">Por gentileza solicitar boleto atualizado atrav&eacute;s dos canais de comunica&ccedil;&atilde;o constantes abaixo.</span>  </span> '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <strong>                                                                                                                                                                                                           '
cHtml2 +='        <span style="font-size: 14px;">                                                                                                                                                                                '
cHtml2 +='            <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Vitoria Remonti&nbsp;</span></span>                                                                                      '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </strong>                                                                                                                                                                                                          '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Telefone: (19) 3666-7135 Ramal: 7135&nbsp;</span></span>                                                                     '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;">                                                                                                                                                      '
cHtml2 +='            <span class="fontstyle0">E-mail: <a href="mailto:vitoria.remonti@mococa.com.br">vitoria.remonti@mococa.com.br</a></span>                                                                                   '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<p>&nbsp;</p>                                                                                                                                                                                                          '
cHtml2 +='<p>                                                                                                                                                                                                                    '
cHtml2 +='    <span style="font-size: 14px;">                                                                                                                                                                                    '
cHtml2 +='        <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Atenciosamente,</span></span>                                                                                                '
cHtml2 +='    </span>                                                                                                                                                                                                            '
cHtml2 +='</p>                                                                                                                                                                                                                   '
cHtml2 +='<h4>                                                                                                                                                                                                                   '
cHtml2 +='    <strong>                                                                                                                                                                                                           '
cHtml2 +='        <span style="font-size: 14px;">                                                                                                                                                                                '
cHtml2 +='            <span style="font-family: arial, helvetica, sans-serif;"><span class="fontstyle0">Mococa S/A Produtos Aliment&iacute;cios</span></span>                                                                    '
cHtml2 +='        </span>                                                                                                                                                                                                        '
cHtml2 +='    </strong>                                                                                                                                                                                                          '
cHtml2 +='</h4>                                                                                                                                                                                                                  '
cHtml2 +='<p>&nbsp;</p>                                                                                                                                                                                                          '
	
If ::oComboCarta:nAt == 1 
	MemoWrite( "c:\temp\html_mod1_a_vencer.html", cHtml )
elseif ::oComboCarta:nAt == 2
	MemoWrite( "c:\temp\html_mod2_vec8dias.html", cHtml )
elseif ::oComboCarta:nAt == 3
	MemoWrite( "c:\temp\html_mod3_venc30dias.html", cHtml )
Endif
																																																																																																										'

if !Empty( cHtml )
	::oMail := LSendMail():New(Alltrim(cMailCli), " Cobranca Mococa ", cHtml )
	::oMail:SetCc("caique.mercadante@hotmail.com") 
	::oMail:SetShedule(.T.)
	lRet := ::oMail:Send() 
endif

Return(lRet)


