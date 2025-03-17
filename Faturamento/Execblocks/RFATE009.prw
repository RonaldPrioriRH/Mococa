#include "protheus.ch"
#include "topconn.ch"

/*/{Protheus.doc} RFATE009
Validação dos campos C6_OPER e C6_TES - Pedidos de Venda - Contratos
@author TOTVS
@since 31/03/2017
@version P12
@param cOrigem,xConteudo
@return nulo
/*/

/****************************************/
User Function RFATE009(cOrigem,xConteudo)
/****************************************/

Local aArea		:= GetArea()

Local cTes 		:= ""
Local nPrcLst
Local nPrcTab
Local cProd		:= aCols[n,GdFieldPos("C6_PRODUTO")]
Local nQtdVen	:= aCols[n,GdFieldPos("C6_QTDVEN")]
Local nPrUnit	:= aCols[n,GdFieldPos("C6_PRUNIT")]
Local nPrcOrig	:= aCols[n,GdFieldPos("C6_XPRCORI")]
Local aValores := {}

If M->C5_TIPO != 'D' .AND. !empty(M->C5_TABELA) //Diferente de devolução e tem tabela preços

	If cOrigem == "OPER" //C6_OPER
		cTes := U_MaTesInt(2,xConteudo,M->C5_CLIENTE,M->C5_LOJACLI,"C",cProd,"C6_TES")
	Elseif cOrigem == "TES" //C6_TES
		cTes := xConteudo
	elseif cOrigem == "PRECO"
		cTES := M->C6_TES
	Endif

	DbSelectArea("SF4")
	SF4->(DbSetOrder(1)) //F4_FILIAL+F4_CODIGO

	If cOrigem <> "PRECO" .AND. SF4->(DbSeek(xFilial("SF4")+cTes))

		If SF4->F4_DUPLIC == "N" //Não gera financeiro (ex.: bonificação, doação, etc.)

			//Verifca se houve majoração do preço em função de Contrato
			If nPrUnit > 0

				if nPrcOrig > 0
					nPrcTab := nPrcOrig
				else
					nPrcTab := U_RetPrTab(M->C5_TABELA,cProd)
				endif

				If nPrcTab <> nPrUnit

					aCols[n,GdFieldPos("C6_PRCVEN")]	:= nPrcTab
					M->C6_PRCVEN						:= nPrcTab
					A410MultT("C6_PRCVEN",nPrcTab)

					aCols[n,GdFieldPos("C6_PRUNIT")]	:= nPrcTab
					M->C6_PRUNIT						:= nPrcTab
				Endif
			Endif
		Else
			//Verifca se deve haver majoração do preço em função de Contrato
			if nPrcOrig > 0 //se usuário digitou preço manualmente, considera
				nPrcTab := nPrcOrig
			else
				nPrcTab := U_RetPrTab(M->C5_TABELA,cProd)
			endif
			
			
			
			If nPrcTab > 0
				
				//Validado TESTE
				//nPrcLst := U_RFATE005(M->C5_TABELA,M->C5_CLIENTE,M->C5_LOJACLI,cProd,nQtdVen,cTes) 
				aValores := U_RFATE005(M->C5_TABELA,M->C5_CLIENTE,M->C5_LOJACLI,cProd,nQtdVen,cTes)
				nPrcLst  := aValores[1]
				
				If nPrcLst > nPrcTab

					aCols[n,GdFieldPos("C6_PRCVEN")]	:= nPrcLst
					M->C6_PRCVEN						:= nPrcLst
					A410MultT("C6_PRCVEN",nPrcLst)

					aCols[n,GdFieldPos("C6_PRUNIT")]	:= nPrcLst
					M->C6_PRUNIT						:= nPrcLst
				Endif
			Endif
		Endif
	else

		If xConteudo > 0

			//seto valor original aqui
			nPrcOrig := xConteudo
			nPrcTab := xConteudo
			aCols[n,GdFieldPos("C6_XPRCORI")] := nPrcTab
			M->C6_XPRCORI := nPrcTab

			//nPrcLst := U_RFATE005(M->C5_TABELA,M->C5_CLIENTE,M->C5_LOJACLI,cProd,nQtdVen,cTes,xConteudo)
			  aValores := U_RFATE005(M->C5_TABELA,M->C5_CLIENTE,M->C5_LOJACLI,cProd,nQtdVen,cTes,xConteudo)
			  nPrcLst  := aValores[1]

			//atualizo preços
			aCols[n,GdFieldPos("C6_PRCVEN")]	:= nPrcLst
			M->C6_PRCVEN						:= nPrcLst
			A410MultT("C6_PRCVEN",nPrcLst)

			aCols[n,GdFieldPos("C6_PRUNIT")]	:= nPrcLst
			M->C6_PRUNIT						:= nPrcLst

		Endif
	Endif
Endif

RestArea(aArea)

Return .T.

/*****************************************************************************/
/*
nEntSai	 	 	Numérico	 	 	Documento de 1-Entrada / 2-Saída
cTpOper	 	 	Carácter	 	 	Tipo de Operação FM_TIPO
cClieFor	 	Carácter	 	 	Código do Cliente ou Fornecedor
cLoja	 	 	Carácter	 	 	Loja do Cliente ou Fornecedor
cTipoCF	 	 	Carácter	 	 	Tipo C-Cliente / F-Fornecedor
cProduto	 	Carácter	 	 	Código do Produto
cCampo	 	 	Carácter	 	 	Alias utilizado na função
*/
User Function MaTesInt(nEntSai,cTpOper,cClieFor,cLoja,cTipoCF,cProduto,cCampo)
/*****************************************************************************/
Local cTesRet := ""
Private aHeader := {}, aCols := {}, n:=1

SX3->(DbSetOrder(2))
SX3->(DbSeek(cCampo))
Aadd(aHeader, {AllTrim(X3Titulo()),SX3->X3_CAMPO,SX3->X3_PICTURE,SX3->X3_TAMANHO,SX3->X3_DECIMAL,SX3->X3_VALID,;
					SX3->X3_USADO,SX3->X3_TIPO,SX3->X3_F3,SX3->X3_CONTEXT,SX3->X3_CBOX,SX3->X3_RELACAO})
aAdd(aCols, {"   ", .F.})

cTesRet := MaTesInt(nEntSai,cTpOper,cClieFor,cLoja,cTipoCF,cProduto,cCampo)

aHeader := Nil
aCols := Nil
n := Nil

Return(cTesRet)