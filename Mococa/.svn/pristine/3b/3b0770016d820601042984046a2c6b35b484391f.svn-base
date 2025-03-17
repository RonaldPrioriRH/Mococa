#Include "Protheus.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ RFATE040  บAutor ณTarcisio Silva MirandaบDataณ  20/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorna os valores dos impostos.							  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ										                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RFATE040(_cTes,_cCliente,_cLoja,_cTipoCli,_cProduto,_nVlrUnit)

	Local aArea 	:= GetArea()
	Local nICMS 	:= 0
	Local nST 		:= 0
	Local nPIS 		:= 0
	Local nCOFINS 	:= 0
	Local nIPI 		:= 0
	Local nSUFRAMA	:= 0 //MaFisRet(1,"IT_DESCZF") //desonera็ao total suframa
	Local nZFICMS 	:= 0 //MaFisRet(1,"IT_DESCZF") - MaFisRet(1,"IT_DESCZFPIS") - MaFisRet(1,"IT_DESCZFCOF")
	Local nZFPIS 	:= 0 //MaFisRet(1,"IT_DESCZFPIS")
	Local nZFCOFINS := 0 //MaFisRet(1,"IT_DESCZFCOF")

	Default _cTes 	 	:= ""
	Default _cCliente	:= ""
	Default _cLoja		:= ""
	Default _cTipoCli	:= ""
	Default _cProduto	:= ""
	Default _nVlrUnit	:= ""

	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณInicializa a funcao fiscal                   ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	MaFisSave()
	MaFisEnd()
	MaFisIni(_cCliente,;				// 1-Codigo Cliente/Fornecedor
	_cLoja,;							// 2-Loja do Cliente/Fornecedor				
	"C",;								// 3-C:Cliente , F:Fornecedor
	"N",;								// 4-Tipo da NF
	_cTipoCli,;							// 5-Tipo do Cliente/Fornecedor
	Nil,;
	Nil,;
	Nil,;
	Nil,;
	"MATA461")


	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณAgrega os itens para a funcao fiscal         ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	MaFisAdd(_cProduto,;			   								// 1-Codigo do Produto ( Obrigatorio )
	_cTes,;				   											// 2-Codigo do TES ( Opcional )
	1,;																// 3-Quantidade ( Obrigatorio )
	_nVlrUnit,;														// 4-Preco Unitario ( Obrigatorio )
	0,;																// 5-Valor do Desconto ( Opcional )
	"",;	   														// 6-Numero da NF Original ( Devolucao/Benef )
	"",;															// 7-Serie da NF Original ( Devolucao/Benef )
	,;																// 8-RecNo da NF Original no arq SD1/SD2
	0,;																// 9-Valor do Frete do Item ( Opcional )
	0,;																// 10-Valor da Despesa do item ( Opcional )
	0,;																// 11-Valor do Seguro do item ( Opcional )
	0,;																// 12-Valor do Frete Autonomo ( Opcional )
	_nVlrUnit,;														// 13-Valor da Mercadoria ( Obrigatorio )
	0)																// 14-Valor da Embalagem ( Opiconal )

	nICMS 		:= MaFisRet(1,"IT_VALICM")		//Valor do ICMS Normal
	nST 		:= MaFisRet(1,"LF_ICMSRET") 	//Valor ICMS Retido
	nPIS 		:= MaFisRet(1,"IT_VALPS2")		//Valor do PIS 2
	nCOFINS 	:= MaFisRet(1,"IT_VALCF2")		//Valor do COFINS 2
	nIPI 		:= MaFisRet(1,"IT_VALIPI")		//Valor do IPI
	nSUFRAMA	:= MaFisRet(1,"IT_DESCZF") 		//Valor do desconto da Zona Franca do item
	nZFICMS 	:= MaFisRet(1,"IT_DESCZF") - MaFisRet(1,"IT_DESCZFPIS") - MaFisRet(1,"IT_DESCZFCOF") //Valor do desconto da Zona Franca do item - //Desconto do PIS - //Desconto do Cofins
	nZFPIS 		:= MaFisRet(1,"IT_DESCZFPIS") 	//Desconto do PIS
	nZFCOFINS 	:= MaFisRet(1,"IT_DESCZFCOF")	//Desconto do Cofins

	MaFisEnd()
	MaFisRestore()

	RestArea(aArea)

Return({nICMS,nST,nPIS,nCOFINS,nIPI,nSUFRAMA,nZFICMS,nZFPIS,nZFCOFINS})