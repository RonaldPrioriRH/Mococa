#include 'totvs.ch'
#INCLUDE 'PROTHEUS.CH'
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"

/*/{Protheus.doc} CALCCOMISSAO

Classe responsável por fazer calculos e processamentos de comissão.

@author Danilo Brito
@since 02/03/2017
@version P12
@param Nao recebe parametros
@return nulo
/*/

CLASS CALCCOMISSAO

	DATA cVendedor
	DATA aDadosApura
	DATA lShowMsg
	DATA cMsgErro
	DATA aCpoDadosAp
	DATA bPos
	DATA nDiasWarmUp
	DATA nFatWarmUp
	DATA nTotPremio
	DATA cIdApura
	DATA cInVend
	DATA cClient
	Data cEst

	//Metodo construtor da classe
	METHOD New(cVendedor, lShowMsg) CONSTRUCTOR

	//Metodo para obter código do vendedor
	METHOD GetVendedor()

	//Metodo para setar vendedor para utilização na classe
	METHOD SetVendedor(cVendedor)

	//Metodo Interno para validar vendedor
	METHOD ValidVend()

	//Metodo para obter percentual comissão vendedor PJ
	METHOD GetPercPJ(cCodProd, cCodGrupo, cClient, cEst)

	//Metodo para fazer apuração da comissão CLT
	METHOD ApuraCLT(dDataIni, dDataFim)

	//Metodo para fazer gravação da apuração
	METHOD GravaApuracao()

	//Metodo para obter sequencial da apuração
	METHOD BuscaSeqApura()

	//Metodo que retorna o sequencial utilizado na gravaçao da apuraçao
	METHOD GetIdApura()

	//Metodo Interno que posiciona na regra de comissão
	METHOD PosRegra(cCodProd, cCodGrupo, cClient, cEst)

	//Metodo Interno que posiciona na Base Premio de comissão
	METHOD PosBasePre()

	//Metodo Interno que posiciona na meta de comissão
	METHOD GetMetas(cAno, cMes, cCodProd, cCodGrupo, nMetaVol, nMetaFat, nMetaMCT)

	//Metodo para buscar qtd dias warmup
	METHOD CalcDiasWarmUp(dDataIni, dDataFim)

	//Metodo para gerar linha em branco do vetor aDadosApura
	METHOD GetEmptyLin()

	//Metodo para buscar volume realizado do vendedor
	METHOD BuscaVolRea(cProd, cGrupo, dDataIni, dDataFim)

	//Metodo para buscar margem MCT realizado do vendedor
	METHOD BuscaMCTRea(cProd, cGrupo, dDataIni, dDataFim)

	//Metodo para obter condiçao IN do vendedor com seus filhos
	METHOD GetInVend()

	//Metodo Interno para mostrar erros de processamento
	METHOD ShowError()

	//Metodo para obter erros de processamento
	METHOD GetError()

	//Metodo destrutor da classe
	METHOD Destroy()

ENDCLASS

//-----------------------------------------------------------------
// Metodo Contrutor da Classe
//-----------------------------------------------------------------
METHOD New(cVendedor, lShowMsg) CLASS CALCCOMISSAO

	Default cVendedor := ""
	Default lShowMsg := .T.

	//inicializando variaveis
	::lShowMsg    := lShowMsg
	::cMsgErro    := ""
	::aDadosApura := {}
	::aCpoDadosAp := {"Z07_PROD","Z07_GRUPO","Z07_METVOL","Z07_REAVOL","Z07_PATVOL","Z07_PREVOL","Z07_PMETMC","Z07_PREAMC","Z07_PATMCT","Z07_PREMCT","Z07_DTINI","Z07_DTFIM","Z02_PVOL","Z02_PMARG","Z07_METFAT","Z07_REAFAT","Z07_PATFAT","Z07_PREFAT","Z02_PFATUR"}
	::bPos 		  := {|cCampo| aScan(::aCpoDadosAp, cCampo) }
	::nDiasWarmUp := 0
	::nFatWarmUp  := 0
	::nTotPremio  := 0
	::cIdApura	  := ""
	::cInVend	  := ""

	::SetVendedor(cVendedor)

Return

//-----------------------------------------------------------------
// Metodo para destrutor da classe
//-----------------------------------------------------------------
METHOD Destroy() CLASS CALCCOMISSAO

	//FreeObj(Self)

Return

//-----------------------------------------------------------------
// Metodo para validar código do vendedor
//-----------------------------------------------------------------
METHOD SetVendedor(cVendedor) CLASS CALCCOMISSAO

	::cVendedor := cVendedor

	if !::ValidVend()
		::cVendedor := " "
	endif

Return

//-----------------------------------------------------------------
// Metodo para obter código do vendedor
//-----------------------------------------------------------------
METHOD GetVendedor() CLASS CALCCOMISSAO
Return ::cVendedor

//-----------------------------------------------------------------
// Metodo para validar código do vendedor
//-----------------------------------------------------------------
METHOD ValidVend() CLASS CALCCOMISSAO
	Local lRet := .T.

	if empty(::cVendedor)
		::cMsgErro := "Vendedor não informado! Parâmetro obrigatório!"
	elseif empty(Posicione("SA3",1,xFilial("SA3")+::cVendedor,"A3_NOME"))
		::cMsgErro := "Vendedor informado inválido!"
	endif

	::ShowError()
Return lRet

//-----------------------------------------------------------------
// Metodo para mostrar erro em tela ou via conout
//-----------------------------------------------------------------
METHOD ShowError() CLASS CALCCOMISSAO
	if !empty(::cMsgErro)
		if ::lShowMsg
			MsgInfo(::cMsgErro,"Atenção!")
		else
			Conout(">> CLASS CALCCOMISSAO: " + ::cMsgErro)
		endif
	endif
Return

//-----------------------------------------------------------------
// Metodo para retornar erro
//-----------------------------------------------------------------
METHOD GetError() CLASS CALCCOMISSAO
Return ::cMsgErro

//-----------------------------------------------------------------
// Metodo para retornar percentual de comissão do PJ
//-----------------------------------------------------------------
METHOD GetPercPJ(cCodProd, cCodGrupo, cClient, cEst) CLASS CALCCOMISSAO

	Local nPercRet := 0
	Default cCodProd := Space(TamSx3("B1_COD")[1])
	Default cCodGrupo := Space(TamSx3("B1_GRUPO")[1])
	Default cClient := Space(TamSx3("A1_COD")[1])
	Default cEst := Space(TamSx3("A1_EST")[1])

	if ::ValidVend()
		if SA3->A3_TIPO == "E" //se vendedor externo (PJ)

			if empty(cCodProd+cCodGrupo+cClient+cEst)  
				::cMsgErro := "Informe um produto, grupo de produtos ou cliente e estado!"
			elseif empty(cCodProd+cCodGrupo) .and. empty(Posicione("SA1",1,xFilial("SA1")+cClient,"A1_COD"))
				::cMsgErro := "Informe um produto ou grupo de produtos!"
			elseif !empty(cCodProd) .AND. empty(Posicione("SB1",1,xFilial("SB1")+cCodProd,"B1_COD")) //.AND. empty(Posicione("SA1",1,xFilial("SA1")+cClient,"A1_COD")) .AND. empty(Posicione("SA1",1,xFilial("SA1")+cClient,"A1_EST"))     
				::cMsgErro := "Produto ou cliente informado inválido!"
			elseif !empty(cCodProd) .AND. empty(Posicione("SB1",1,xFilial("SB1")+cCodProd,"B1_COD")) 
				::cMsgErro := "Produto informado inválido!"
			elseif !empty(cCodGrupo) .AND. empty(Posicione("SBM",1,xFilial("SBM")+cCodGrupo,"BM_GRUPO"))
				::cMsgErro := "Grupo informado inválido!"
			elseif !empty(cCodGrupo) .AND. empty(Posicione("SBM",1,xFilial("SBM")+cCodGrupo,"BM_GRUPO")) //.AND. empty(Posicione("SA1",1,xFilial("SA1")+cClient,"A1_COD")) .AND. empty(Posicione("SA1",1,xFilial("SA1")+cClient,"A1_EST"))    
				::cMsgErro := "Grupo informado inválido!"
			else
				if !empty(cCodProd)
					cCodGrupo := SB1->B1_GRUPO					
				endif

				//procurando regra da mais específica para mais genérica
/*				if !empty(cCodProd) .AND. ::PosRegra(cCodProd, space(len(cCodGrupo))) //PRODUTO
					nPercRet := Z02->Z02_PCOM
				elseif ::PosRegra(space(len(cCodProd)), cCodGrupo ) //GRUPO
					nPercRet := Z02->Z02_PCOM
				elseif ::PosRegra(space(len(cCodProd)), space(len(cCodGrupo)) ) //GERAL
					nPercRet := Z02->Z02_PCOM
				endif
			endif		*/	
			   //Incluido mais dois campos de Cliente e Estado, ajuste na regra conforme o percentual
				if !empty(cCodProd) .AND. ::PosRegra(cCodProd, space(len(cCodGrupo)), space(len(cClient)), space(len(cEst))) //PRODUTO 
				   nPercRet := Z02->Z02_PCOM
				elseif ::PosRegra(cCodProd,space(len(cCodGrupo)),cClient, cEst ) //CLIENTE - ESTADO
					nPercRet := Z02->Z02_PCOM		
				elseif ::PosRegra(space(len(cCodProd)), cCodGrupo, cClient, cEst) //GRUPO - CLIENTE - ESTADO
					nPercRet := Z02->Z02_PCOM			
				elseif ::PosRegra(space(len(cCodProd)),cCodGrupo,space(len(cClient)), space(len(cEst))) //GRUPO
					nPercRet := Z02->Z02_PCOM 		
				elseif ::PosRegra(space(len(cCodProd)), space(len(cCodGrupo)),space(len(cClient)), space(len(cEst))) //GERAL
					nPercRet := Z02->Z02_PCOM					
				endif
			endif
		else
			::cMsgErro := "Tipo do vendedor não é PJ! Ação abortada."
		endif
	endif

	::ShowError()

Return nPercRet

//-----------------------------------------------------------------
// Metodo para Posicionar na regra.
// Retorna .T. quando posicionou
//-----------------------------------------------------------------
//METHOD PosRegra(cCodProd, cCodGrupo) CLASS CALCCOMISSAO
METHOD PosRegra(cCodProd, cCodGrupo, cClient, cEst) CLASS CALCCOMISSAO

	Local lRet := .F.
	Local cRegra := " "
	Local cRegra2 := " "
	if ::ValidVend() //valida e posiciona no vendedor

		DbSelectArea("Z02")
		Z02->(DbSetOrder(4)) //Z02_FILIAL+Z02_CODIGO+Z02_PROD+Z02_GRUPO+Z02_CLIENT+Z02_ESTADO
		//lRet := Z02->(DbSeek(xFilial("Z02")+SA3->A3_XREGRA+cCodProd+cCodGrupo))  
        lRet := Z02->(DbSeek(xFilial("Z02")+SA3->A3_XREGRA+cCodProd+cCodGrupo+cClient+cEst))
         
	endif

Return lRet


//
//-----------------------------------------------------------------
// Metodo que posiciona na Base Premio de comissão
// Retorna .T. quando posicionou
//-----------------------------------------------------------------
METHOD PosBasePre() CLASS CALCCOMISSAO

	Local lRet := .F.

	if ::ValidVend() //valida e posiciona no vendedor

		DbSelectArea("Z03")
		Z03->(DbSetOrder(1)) //Z03_FILIAL+Z03_CODIGO
		lRet := Z03->(DbSeek(xFilial("Z03")+SA3->A3_XBASPRE))

	endif

Return lRet

//-----------------------------------------------------------------
//Metodo que posiciona na meta de comissão
// Retorna .T. quando posicionou
//-----------------------------------------------------------------
METHOD GetMetas(cAno, cMes, cCodProd, cCodGrupo, nMetaVol, nMetaFat, nMetaMCT)  CLASS CALCCOMISSAO

	Local aVends
	Local nX := 0

	if ::ValidVend() //valida e posiciona no vendedor

		//pegando codigo dos vendedores abaixo dele para somar (também tras ele mesmo no retorno)
		aVends := U_EstHiVen(SA3->A3_COD, 1)

		DbSelectArea("Z05")
		Z05->(DbSetOrder(2)) //Z05_FILIAL+Z05_VEND+Z05_PROD+Z05_GRUPO+Z05_ANO+Z05_MES

		For nX := 1 to len(aVends)
			if Z05->(DbSeek(xFilial("Z05")+aVends[nX]+cCodProd+cCodGrupo+cAno+cMes))

				nMetaVol += Z05->Z05_METVOL
				nMetaFat += Z05->Z05_METFAT
				nMetaMCT += Z05->Z05_PMETMC

			endif
		next nX

	endif

Return

//-----------------------------------------------------------------
// Metodo para realizar apuração do vendedor
// Retorna vetor com dados sinteticos da apuração
//-----------------------------------------------------------------
METHOD ApuraCLT(dDataIni, dDataFim) CLASS CALCCOMISSAO

	Local nX := 0
	Local nVolTmp := 0
	Local nFatTmp := 0
	Local nMetaVol := 0
	Local nMetaFat := 0
	Local nMetaMCT := 0
	Default dDataIni := STOD("")
	Default dDataFim := STOD("")

	//limpo apuração
	::nDiasWarmUp := 0
	::nTotPremio  := 0
	::aDadosApura := {}
	//{"Z07_PROD","Z07_GRUPO","Z07_METVOL","Z07_REAVOL","Z07_PATVOL","Z07_PREVOL","Z07_PMETMC",
	// "Z07_PREAMC","Z07_PATMCT","Z07_PREMCT","Z07_DTINI","Z07_DTFIM","Z02_PVOL","Z02_PMARG",
	// "Z07_METFAT","Z07_REAFAT","Z07_PATFAT","Z07_PREFAT","Z02_PFATUR"}
	if ::ValidVend() //valida e posiciona no vendedor
		if !empty(dDataIni) .AND. !empty(dDataFim)

			if dDataIni <= dDataFim

				//buscando regras para apuração
				DbSelectArea("Z02")
				Z02->(DbSetOrder(1)) //Z02_FILIAL+Z02_CODIGO+Z02_ITEM
				Z02->(DbSeek(xFilial("Z02")+SA3->A3_XREGRA))
				While Z02->(!Eof()) .AND. Z02->Z02_FILIAL+Z02->Z02_CODIGO == xFilial("Z02")+SA3->A3_XREGRA

					//adiciono uma linha vazia
					aadd(::aDadosApura , ::GetEmptyLin() )

					nX := len(::aDadosApura)

					//inserindo conteudos da regra
					::aDadosApura[nX][Eval(::bPos,"Z07_PROD")]  := Z02->Z02_PROD
					::aDadosApura[nX][Eval(::bPos,"Z07_GRUPO")] := Z02->Z02_GRUPO
					::aDadosApura[nX][Eval(::bPos,"Z02_PVOL")]  := (Z02->Z02_PVOL/100)
					::aDadosApura[nX][Eval(::bPos,"Z02_PMARG")] := (Z02->Z02_PMARG/100)
					::aDadosApura[nX][Eval(::bPos,"Z02_PFATUR")] := (Z02->Z02_PFATUR/100)
					::aDadosApura[nX][Eval(::bPos,"Z07_DTINI")] := dDataIni
					::aDadosApura[nX][Eval(::bPos,"Z07_DTFIM")] := dDataFim

					//inserindo metas
					::GetMetas(STRZERO(YEAR(dDataIni),4), STRZERO(MONTH(dDataIni),2), Z02->Z02_PROD, Z02->Z02_GRUPO, @nMetaVol, @nMetaFat, @nMetaMCT)
					::aDadosApura[nX][Eval(::bPos,"Z07_METVOL")] := nMetaVol
					::aDadosApura[nX][Eval(::bPos,"Z07_PMETMC")] := nMetaMCT
					::aDadosApura[nX][Eval(::bPos,"Z07_METFAT")] := nMetaFat

					Z02->(DbSkip())
				Enddo

				//buscando valores realizados de volume e faturamento
				For nX := 1 to len(::aDadosApura)

					nVolTmp := 0
					nFatTmp:= 0

					::BuscaVolRea(::aDadosApura[nX][Eval(::bPos,"Z07_PROD")],::aDadosApura[nX][Eval(::bPos,"Z07_GRUPO")],dDataIni, dDataFim, @nVolTmp, @nFatTmp)
					::aDadosApura[nX][Eval(::bPos,"Z07_REAVOL")] := nVolTmp
					::aDadosApura[nX][Eval(::bPos,"Z07_REAFAT")] := nFatTmp

					//linha abaixo deixada provisoriamente simular apuraçao. Remover depois e descomentar a outra
					//::aDadosApura[nX][Eval(::bPos,"Z07_REAVOL")] := ::aDadosApura[nX][Eval(::bPos,"Z07_METVOL")] * Randomize(1,120) / 100
					//::aDadosApura[nX][Eval(::bPos,"Z07_REAFAT")] := ::aDadosApura[nX][Eval(::bPos,"Z07_METFAT")] * Randomize(1,120) / 100

				Next nX

				//buscando valores realizados MCT
				For nX := 1 to len(::aDadosApura)

					::aDadosApura[nX][Eval(::bPos,"Z07_PREAMC")] := ::BuscaMCTRea(::aDadosApura[nX][Eval(::bPos,"Z07_PROD")],::aDadosApura[nX][Eval(::bPos,"Z07_GRUPO")],dDataIni, dDataFim)

					//linha abaixo deixada provisoriamente simular apuraçao. Remover depois e descomentar a outra
					//::aDadosApura[nX][Eval(::bPos,"Z07_PREAMC")] := ::aDadosApura[nX][Eval(::bPos,"Z07_PMETMC")] * Randomize(1,120) / 100

				Next nX

				//verificando dias de WarmUp
				::CalcDiasWarmUp(dDataIni, dDataFim)

				//Apuraçao Premiação
				if ::PosBasePre() //posiciona na base premio
					//apurando premiação com WarmUp
					if ::nDiasWarmUp > 0
						For nX := 1 to len(::aDadosApura)
							//Premio = VlrBasePremio * %Ating.Min * FatorDiasWarmUp * PesoRegra
							::aDadosApura[nX][Eval(::bPos,"Z07_PREVOL")]  := Z03->Z03_VLBASE * (Z03->Z03_PATMIN/100) * ::nFatWarmUp * ::aDadosApura[nX][Eval(::bPos,"Z02_PVOL")]
							::aDadosApura[nX][Eval(::bPos,"Z07_PREFAT")]  := Z03->Z03_VLBASE * (Z03->Z03_PATMIN/100) * ::nFatWarmUp * ::aDadosApura[nX][Eval(::bPos,"Z02_PFATUR")]
							::aDadosApura[nX][Eval(::bPos,"Z07_PREMCT")]  := Z03->Z03_VLBASE * (Z03->Z03_PATMIN/100) * ::nFatWarmUp * ::aDadosApura[nX][Eval(::bPos,"Z02_PMARG")]
						Next nX
					endif

					//apurando premiação pelo atingimento da meta
					For nX := 1 to len(::aDadosApura)

						//% atingido Volume = Realizado / Meta
						::aDadosApura[nX][Eval(::bPos,"Z07_PATVOL")]  := ::aDadosApura[nX][Eval(::bPos,"Z07_REAVOL")] / ::aDadosApura[nX][Eval(::bPos,"Z07_METVOL")] * 100

						//% atingido Faturamento = Realizado / Meta
						::aDadosApura[nX][Eval(::bPos,"Z07_PATFAT")]  := ::aDadosApura[nX][Eval(::bPos,"Z07_REAFAT")] / ::aDadosApura[nX][Eval(::bPos,"Z07_METFAT")] * 100

						//% atingido MCT = Realizado / Meta
						::aDadosApura[nX][Eval(::bPos,"Z07_PATMCT")]  := ::aDadosApura[nX][Eval(::bPos,"Z07_PREAMC")] / ::aDadosApura[nX][Eval(::bPos,"Z07_PMETMC")] * 100

						if ::nFatWarmUp < 1 //somente se não está em WarmUp ou está em WarmUp parcial
							//Premio = BlrBasePremio * PesoRegra * % atingido
							if ::aDadosApura[nX][Eval(::bPos,"Z07_PATVOL")] >= Z03->Z03_PATMIN //se atingiu o minimo
								if ::aDadosApura[nX][Eval(::bPos,"Z07_PATVOL")] > Z03->Z03_PATMAX //se atingiu mais que o maximo
									::aDadosApura[nX][Eval(::bPos,"Z07_PREVOL")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PVOL")] * (Z03->Z03_PATMAX/100)
								else
									::aDadosApura[nX][Eval(::bPos,"Z07_PREVOL")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PVOL")] * (::aDadosApura[nX][Eval(::bPos,"Z07_PATVOL")]/100)
							 	endif
							endif

							//Premio = BlrBasePremio * PesoRegra * % atingido
							if ::aDadosApura[nX][Eval(::bPos,"Z07_PATFAT")] >= Z03->Z03_PATMIN //se atingiu o minimo
								if ::aDadosApura[nX][Eval(::bPos,"Z07_PATFAT")] > Z03->Z03_PATMAX //se atingiu mais que o maximo
									::aDadosApura[nX][Eval(::bPos,"Z07_PREFAT")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PFATUR")] * (Z03->Z03_PATMAX/100)
								else
									::aDadosApura[nX][Eval(::bPos,"Z07_PREFAT")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PFATUR")] * (::aDadosApura[nX][Eval(::bPos,"Z07_PATFAT")]/100)
							 	endif
							endif

							//Premio = BlrBasePremio * PesoRegra * % atingido
							if ::aDadosApura[nX][Eval(::bPos,"Z07_PATMCT")] >= Z03->Z03_PATMIN //se atingiu o minimo
								if ::aDadosApura[nX][Eval(::bPos,"Z07_PATMCT")] > Z03->Z03_PATMAX //se atingiu mais que o maximo
									::aDadosApura[nX][Eval(::bPos,"Z07_PREMCT")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PMARG")] * (Z03->Z03_PATMAX/100)
								else
									::aDadosApura[nX][Eval(::bPos,"Z07_PREMCT")]  := Z03->Z03_VLBASE * ::aDadosApura[nX][Eval(::bPos,"Z02_PMARG")] * (::aDadosApura[nX][Eval(::bPos,"Z07_PATMCT")]/100)
							 	endif
							endif
						endif

						::nTotPremio += ::aDadosApura[nX][Eval(::bPos,"Z07_PREVOL")]
						::nTotPremio += ::aDadosApura[nX][Eval(::bPos,"Z07_PREFAT")]
						::nTotPremio += ::aDadosApura[nX][Eval(::bPos,"Z07_PREMCT")]
					Next nX

				endif

			else
				::cMsgErro := "Apuração abortada. Data inicio deve ser menor ou igual a data fim!"
			endif
		else
			::cMsgErro := "Apuração abortada. Datas devem ser preenchidas!"
		endif

		::ShowError()

	endif

Return ::aDadosApura

//-----------------------------------------------------------------
//Metodo para gerar linha em branco do vetor aDadosApura
//-----------------------------------------------------------------
METHOD GetEmptyLin() CLASS CALCCOMISSAO

	Local nX
	Local aRet := array(len(::aCpoDadosAp))

	For nX := 1 to len(::aCpoDadosAp)

		aRet[nX] := CriaVar(::aCpoDadosAp[nX])

	next nX

Return aRet

//-----------------------------------------------------------------
//Metodo para buscar qtd dias warmup
//-----------------------------------------------------------------
METHOD CalcDiasWarmUp(dDataIni, dDataFim) CLASS CALCCOMISSAO

	::nDiasWarmUp := 0
	::nFatWarmUp := 0

	if ::ValidVend() //valida e posiciona no vendedor
		if !empty(SA3->A3_XWMFIM) .AND. !empty(SA3->A3_XWMFIM)
			if dDataIni < SA3->A3_XWMFIM //se inicio da apuração é antes do fim do WarmUp
				if dDataIni >= SA3->A3_XWMINI .AND. dDataFim <= SA3->A3_XWMFIM //período todo em WarmUp
					::nDiasWarmUp := DateDiffDay( dDataIni , dDataFim ) + 1
					::nFatWarmUp := 1
				elseif dDataIni >= SA3->A3_XWMINI .AND. dDataFim > SA3->A3_XWMFIM //período parcial em WarmUp
					::nDiasWarmUp := DateDiffDay( dDataIni , SA3->A3_XWMFIM ) + 1
					::nFatWarmUp := ::nDiasWarmUp / DateDiffDay( dDataIni , dDataFim )
				endif
			endif
		endif
	endif

Return ::nDiasWarmUp

//-----------------------------------------------------------------
// Metodo para realizar gravação dos dados apurados, nas tabelas
// Z07-Detalhe Comissão Apurada, e SE3-Movimento de valor total da Comissão
// Retorna .T. se gravado com sucesso
//-----------------------------------------------------------------
METHOD GravaApuracao() CLASS CALCCOMISSAO

	Local lRet := .F.
	Local nX := 0
	Local aSE3 := {}
	Local cCliComiss := SuperGetMv("MV_XCLICOM",,"") //cliente para inclusao do movimento de comissão (codcli;loja) Ex: 000001;01
	Local aCliCom := StrToKArr(Alltrim(cCliComiss),";")

	Private lMsErroAuto := .F.

	DbSelectArea("Z07")

	if ::ValidVend() //valida e posiciona no vendedor

		if !empty(::aDadosApura) .AND. !empty(::nTotPremio)

			if empty(aCliCom) .OR. len(aCliCom) < 2 .OR. empty(Posicione("SA1",1,xFilial("SA1")+aCliCom[1]+aCliCom[2],"A1_COD"))
				::cMsgErro := "Parametro MV_XCLICOM não configurado. Sintaxe: codigo;loja ."
			else
				BeginTran()

				::cIdApura := ::BuscaSeqApura() //obtem sequencia apuração

				For nX := 1 to len(::aDadosApura)

					//inclui linha movimento apuração comissão
					Reclock("Z07", .T.)

						Z07->Z07_FILIAL := xFilial("Z07")
						Z07->Z07_CODIGO := ::cIdApura
						Z07->Z07_EMISSA := dDataBase
						Z07->Z07_VEND   := ::cVendedor
						Z07->Z07_DTINI	:= ::aDadosApura[nX][Eval(::bPos,"Z07_DTINI")]
						Z07->Z07_DTFIM	:= ::aDadosApura[nX][Eval(::bPos,"Z07_DTFIM")]
						Z07->Z07_PROD	:= ::aDadosApura[nX][Eval(::bPos,"Z07_PROD")]
						Z07->Z07_GRUPO	:= ::aDadosApura[nX][Eval(::bPos,"Z07_GRUPO")]
						Z07->Z07_METVOL := ::aDadosApura[nX][Eval(::bPos,"Z07_METVOL")]
						Z07->Z07_REAVOL := ::aDadosApura[nX][Eval(::bPos,"Z07_REAVOL")]
						Z07->Z07_PATVOL := ::aDadosApura[nX][Eval(::bPos,"Z07_PATVOL")]
						Z07->Z07_PREVOL := ::aDadosApura[nX][Eval(::bPos,"Z07_PREVOL")]
						Z07->Z07_PMETMC := ::aDadosApura[nX][Eval(::bPos,"Z07_PMETMC")]
						Z07->Z07_PREAMC := ::aDadosApura[nX][Eval(::bPos,"Z07_PREAMC")]
						Z07->Z07_PATMCT := ::aDadosApura[nX][Eval(::bPos,"Z07_PATMCT")]
						Z07->Z07_PREMCT := ::aDadosApura[nX][Eval(::bPos,"Z07_PREMCT")]
						Z07->Z07_METFAT := ::aDadosApura[nX][Eval(::bPos,"Z07_METFAT")]
						Z07->Z07_REAFAT := ::aDadosApura[nX][Eval(::bPos,"Z07_REAFAT")]
						Z07->Z07_PATFAT := ::aDadosApura[nX][Eval(::bPos,"Z07_PATFAT")]
						Z07->Z07_PREFAT := ::aDadosApura[nX][Eval(::bPos,"Z07_PREFAT")]

					Z07->(MsUnlock())

				Next nX

				if SA3->A3_TIPO == "I" //se vendedor interno (CLT)
					//Incluindo movimento de comissão (padrão)
					aAdd(aSE3,{"E3_VEND" 		,::cVendedor 	,Nil})
					aAdd(aSE3,{"E3_PREFIXO" 	,"CLT" 			,Nil})
					aAdd(aSE3,{"E3_NUM" 		,::cIdApura 		,Nil})
					aAdd(aSE3,{"E3_PARCELA" 	,"" 			,Nil})
					aAdd(aSE3,{"E3_EMISSAO" 	,dDataBase 		,Nil})
					aAdd(aSE3,{"E3_CODCLI" 		,SA1->A1_COD 	,Nil})
					aAdd(aSE3,{"E3_LOJA" 		,SA1->A1_LOJA 	,Nil})
					aAdd(aSE3,{"E3_BASE" 		,::nTotPremio 	,Nil})
					aAdd(aSE3,{"E3_PORC" 		,100 			,Nil})
					aAdd(aSE3,{"E3_VENCTO" 		,dDataBase 		,Nil})
					aAdd(aSE3,{"E3_MOEDA" 		,"01" 			,Nil})

					MSExecAuto({|x,y| Mata490(x,y)}, aSE3, 3) //Inclusao

					If lMsErroAuto
						::cMsgErro := MostraErro("\temp")
						DisarmTransaction()
					Else
						lRet := .T.
					Endif
				else
					lRet := .T.
				endif

				//se tudo ok, finaliza transaçao
				if lRet
					EndTran()
				endif
			endif
		else
			::cMsgErro := "Não há dados apurados para gravação!"
		endif

		::ShowError()

	endif

Return lRet


//-----------------------------------------------------------------
// Metodo para obter sequencial da apuração
//-----------------------------------------------------------------
METHOD BuscaSeqApura() CLASS CALCCOMISSAO

	Local cRet  := ""

	cRet := U_UPROXIMO("Z07", "Z07_CODIGO", xFilial("Z07"))

Return cRet

//-----------------------------------------------------------------
// Metodo para retornar ID apuraçao utilizdo
//-----------------------------------------------------------------
METHOD GetIdApura() CLASS CALCCOMISSAO
Return ::cIdApura

//-----------------------------------------------------------------
//Metodo para buscar volume realizado do vendedor
//-----------------------------------------------------------------
METHOD BuscaVolRea(cProd, cGrupo, dDataIni, dDataFim, nTotVol, nTotFat) CLASS CALCCOMISSAO

	Local cQry := ""
	Local cInVend := ::GetInVend()
	Default nTotVol := 0
	Default nTotFat := 0

	//apurando notas de saída
	cQry := " SELECT '1' AS TIPO, SUM(D2_QUANT) AS VOLUME, SUM(D2_TOTAL) AS FATURAMENTO "
	cQry += " FROM "+RetSqlName("SD2")+" SD2 "
	cQry += " INNER JOIN "+RetSqlName("SF2")+" SF2 ON (SF2.D_E_L_E_T_ <> '*' AND F2_FILIAL = D2_FILIAL AND F2_DOC = D2_DOC AND F2_SERIE = D2_SERIE AND F2_CLIENTE = D2_CLIENTE AND F2_LOJA = D2_LOJA)"
	cQry += " INNER JOIN "+RetSqlName("SB1")+" SB1 ON (SB1.D_E_L_E_T_ <> '*' AND B1_COD = D2_COD)"
	//cQry += " INNER JOIN "+RetSqlName("SF4")+" SF4 ON (SF4.D_E_L_E_T_ <> '*' AND F4_CODIGO = D2_TES)"
	cQry += " WHERE SD2.D_E_L_E_T_ <> '*' "
	cQry += "   AND D2_FILIAL = '"+xFilial("SD2")+"' "
	cQry += "   AND (F2_VEND1 IN ("+cInVend+") OR F2_VEND2 IN ("+cInVend+") OR F2_VEND3 IN ("+cInVend+") OR F2_VEND4 IN ("+cInVend+") OR F2_VEND5 IN ("+cInVend+"))"
	cQry += "   AND F2_EMISSAO BETWEEN '"+DTOS(dDataIni)+"' AND '"+DTOS(dDataFim)+"' "
	//cQry += "   AND F4_DUPLIC = 'S' " //somente tes que movimenta financeiro
	if !empty(cProd)
		cQry += "   AND B1_COD = '"+cProd+"' "
	endif
	if !empty(cGrupo)
		cQry += "   AND B1_GRUPO = '"+cGrupo+"' "
	endif

	cQry += " UNION "

	//apurando notas de devolução (entrada)
	cQry += " SELECT '2' AS TIPO, SUM(D1_QUANT) AS VOLUME, SUM(D1_TOTAL) AS FATURAMENTO "
	cQry += " FROM "+RetSqlName("SD1")+" SD1 "
	cQry += " INNER JOIN "+RetSqlName("SF2")+" SF2 ON (SF2.D_E_L_E_T_ <> '*' AND F2_FILIAL = D1_FILIAL AND F2_DOC = D1_NFORI AND F2_SERIE = D1_SERIORI AND F2_CLIENTE = D1_FORNECE AND F2_LOJA = D1_LOJA)"
	cQry += " INNER JOIN "+RetSqlName("SB1")+" SB1 ON (SB1.D_E_L_E_T_ <> '*' AND B1_COD = D1_COD)"
	cQry += " WHERE SD1.D_E_L_E_T_ <> '*' "
	cQry += "   AND D1_FILIAL = '"+xFilial("SD1")+"' "
	cQry += "   AND (F2_VEND1 IN ("+cInVend+") OR F2_VEND2 IN ("+cInVend+") OR F2_VEND3 IN ("+cInVend+") OR F2_VEND4 IN ("+cInVend+") OR F2_VEND5 IN ("+cInVend+"))"
	cQry += "   AND D1_EMISSAO BETWEEN '"+DTOS(dDataIni)+"' AND '"+DTOS(dDataFim)+"' "
	if !empty(cProd)
		cQry += "   AND B1_COD = '"+cProd+"' "
	endif
	if !empty(cGrupo)
		cQry += "   AND B1_GRUPO = '"+cGrupo+"' "
	endif

	If Select("QAUXCOM") > 0
		QAUXCOM->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUXCOM", .F., .T.)

	While QAUXCOM->(!Eof())

		if QAUXCOM->TIPO == '1' //vendas
			nTotVol += QAUXCOM->VOLUME
			nTotFat += QAUXCOM->FATURAMENTO
		elseif QAUXCOM->TIPO == '2' //devoluções
			nTotVol -= QAUXCOM->VOLUME
			nTotFat -= QAUXCOM->FATURAMENTO
		endif

		QAUXCOM->(DbSkip())
	Enddo

	QAUXCOM->(dbCloseArea())

	//ajuste pra não ficar negativo
	if nTotVol < 0
		nTotVol := 0
	endif
	if nTotFat < 0
		nTotFat := 0
	endif

Return

//-----------------------------------------------------------------
//Metodo para buscar margem MCT realizado do vendedor
//-----------------------------------------------------------------
METHOD BuscaMCTRea(cProd, cGrupo, dDataIni, dDataFim) CLASS CALCCOMISSAO

	Local nRet := 0
	Local cQry := ""
	Local cInVend := ::GetInVend()
	Local nValMC := 0
	Local nValVenda := 0

	//apurando notas de saída
	cQry := " SELECT ORIGEM, VLRTOTAL, (VLRTOTAL - ICMS - CROUTGO - CRDPRES - PIS - COFINS - CUSTO - VLRFRETE - VLRVERBA) AS VALMC "
	cQry += " FROM GMR "
	cQry += " WHERE ORIGEM IN ('NFS','NFD') "
	cQry += "   AND FILIAL = '"+cFilAnt+"' "
	cQry += "   AND VENDEDOR IN ("+cInVend+") "
	cQry += "   AND EMISSAO BETWEEN '"+DTOS(dDataIni)+"' AND '"+DTOS(dDataFim)+"' "
	if !empty(cProd)
		cQry += "   AND PRODCOD = '"+cProd+"' "
	endif
	if !empty(cGrupo)
		cQry += "   AND GRPCOD = '"+cGrupo+"' "
	endif

	If Select("QAUXCOM") > 0
		QAUXCOM->(dbCloseArea())
	EndIf

	cQry := ChangeQuery(cQry)
	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "QAUXCOM", .F., .T.)

	While QAUXCOM->(!Eof())

		if QAUXCOM->ORIGEM == 'NFS' //vendas
			nValVenda += QAUXCOM->VLRTOTAL
			nValMC += QAUXCOM->VALMC
		else //devoluções
			nValVenda -= QAUXCOM->VLRTOTAL
			nValMC -= QAUXCOM->VALMC
		endif

		QAUXCOM->(DbSkip())
	Enddo

	QAUXCOM->(dbCloseArea())

	//obtenho o percentual
	nRet := Round((nValMC/nValVenda)*100,2)

Return nRet

//-----------------------------------------------------------------
//Metodo para obter condiçao IN do vendedor com seus filhos
//-----------------------------------------------------------------
METHOD GetInVend() CLASS CALCCOMISSAO

	if empty(::cInVend)

		::cInVend := U_EstHiVen(::cVendedor, 2)

	endif

Return ::cInVend
