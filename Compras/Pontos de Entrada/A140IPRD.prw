//PE https://tdn.totvs.com/pages/releaseview.action?pageId=6085834

//A140IPRD - Customização da Identificação do Produto

#Include 'Protheus.ch'
#Include 'Totvs.ch'
#INCLUDE "rwmake.ch"
#INCLUDE "TOPCONN.ch"
#INCLUDE "XMLXFUN.CH"
#include "ap5mail.ch"
#INCLUDE "TBICONN.CH"
#include "fileio.ch"

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

User Function A140IPRD() 
	Local aArea    := GetArea() 
	Local cFornec  := PARAMIXB[1]
	Local cLoja    := PARAMIXB[2]
	Local cPrdXML  := PARAMIXB[3]
	Local oDetItem := PARAMIXB[4]	   
	Local cSQL 	   := " "
	Local cDescProd:= " "
	Local cCNPJ    := " "
	//Local _msgX	   := " "
	//Private _cLog  := " "
	//Private _msgX  := " 
	//Private _MsgInv:= " "
	 
	//Pega Descrição do Produto no XML
	cDescProd  := StrTran(UPPER(oDetItem:_PROD:_XPROD:TEXT),".","")
	StrTran(cDescProd,'"',"")
	
	cSQL +=  " "
	cSQL +=  "SELECT A5_FORNECE, A5_LOJA, A5_NOMPROD, A5_CODPRF, A5_PRODUTO  FROM SA5010 " + STR_PULA
	cSQL +=  "WHERE SA5010.D_E_L_E_T_=' ' " + STR_PULA
	cSQL +=  "AND A5_FORNECE||A5_LOJA  = '" +cFornec+cLoja+ "' " + STR_PULA
	cSQL +=  "AND A5_CODPRF = '"+cPrdXML+"' " + STR_PULA
	
	//MemoWrite("C:\temp\SA5_PRODUTOS.sql",cSQL)
	
	cSQL := ChangeQuery(cSQL)
	
	TCQuery cSQL New Alias "QRY_PROD"
	
	DbSelectArea("QRY_PROD")
	DbGotop()
	
	DBSELECTAREA("SA2")
	SA2->(DBGOTOP())
	SA2->(DBSETORDER(1))
	if SA2->(DBSEEK(A2_FILIAL+cFornec+cLoja ))
		cCNPJ 	:= SA2->A2_CGC    
	else
		ConOut("Fornecedor com CNPJ: "+cCNPJ+" não encontrado")
	endif
		
	If QRY_PROD->(!Eof())
		//conout teste para gravar na tabela depois com RECLOCK("TABELACRIADA",.T.)
		ConOut("Produto AMARRADO: "+ QRY_PROD->A5_PRODUTO + "DESCRICAO: "+ QRY_PROD->A5_NOMPROD + " COD XML: " + cPrdXML + " CNPJ Fornecedor: " + cCNPJ  )			 
		//_MsgInv 		:= "Produto AMARRADO: "+ QRY_PROD->A5_PRODUTO + "DESCRICAO: "+ QRY_PROD->A5_NOMPROD + " COD XML: " + cPrdXML + " CNPJ Fornecedor: " + cCNPJ + " "
		//_msgX		    += _MsgInv+CHR(13)+CHR(10)	
		
		DbSelectArea("ZZX")
		DbSetOrder(1)
		If  DbSeek(xFilial("ZZX")+cFornec+cLoja+cPrdXML)
				//Deletando registro que já foram Amarrados
				While !ZZX->(Eof()) .AND. EMPTY(ZZX_PROD)  
					Reclock("ZZX",.F.)	
					ZZX->ZZX_PROD		:= QRY_PROD->A5_PRODUTO 
					ZZX->ZZX_ERRO		:= " "
					ZZX->ZZX_OBS		:= "PRODUTO FOI AMARRADO"
					ZZX->(dbDelete())
					ZZX->(DbSkip())
					MsUnlock()
				EndDo				
		EndIf
				
	Else
		ConOut("Produto NAO AMARRADO: "+ QRY_PROD->A5_PRODUTO + "DESCRICAO: "+ cDescProd + " COD XML: " + cPrdXML + " CNPJ Fornecedor: " + cCNPJ )
	    //_MsgInv 		:= "Produto NAO AMARRADO: "+ QRY_PROD->A5_PRODUTO + "DESCRICAO: "+ cDescProd + " COD XML: " + cPrdXML + " CNPJ Fornecedor: " + cCNPJ + " "
		//_msgX		    += _MsgInv+CHR(13)+CHR(10)	
		
	    //Inicia Gravação na ZZX - Tabela de Log XML caso Amarração não tenha Amarração Produto X Fornecedor 
	    DbSelectArea("ZZX")
		DbSetOrder(1)
		If !DbSeek(xFilial("ZZX")+cFornec+cLoja+cPrdXML)
			RECLOCK("ZZX",.T.)
			ZZX->ZZX_FILIAL  	:= xFilial("ZZX")
			ZZX->ZZX_COD    	:= cFornec
			ZZX->ZZX_LOJA  	    := cLoja
			ZZX->ZZX_NOME 	    := Posicione("SA2",3,xFILIAL("SA2")+cCNPJ,"A2_NOME")
			ZZX->ZZX_NREDUZ  	:= Posicione("SA2",3,xFILIAL("SA2")+cCNPJ,"A2_NREDUZ")
			ZZX->ZZX_CGC    	:= cCNPJ
			ZZX->ZZX_DATA  		:= dDatabase
			ZZX->ZZX_PROD		:= QRY_PROD->A5_PRODUTO  
			ZZX->ZZX_DESC 		:= cDescProd
			ZZX->ZZX_CODPRF     := cPrdXML
			ZZX->ZZX_ERRO		:= "COM012"
			ZZX->ZZX_OBS		:= "Fornecedor sem cadastro de Produto X Fornecedor"
			MSUNLOCK()		
		EndIF
		 
	Endif	 

	//_WriteLog(_msgX)
	
	QRY_PROD->(dbCloseArea())
	
	RestArea(aArea) 	

Return 

//Função para gravar os Log's de error. //
Static Function _WriteLog(_MsgInv)

	_cLog +=_MsgInv+CHR(13)+CHR(10)
	MemoWrite("C:\teste\IMPORTACAO_XML.TXT",_cLog)

Return
				

				