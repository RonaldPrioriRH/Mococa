#INCLUDE "rwmake.ch"

/*
_____________________________________________________________________________
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦Programa  ¦ RGLTE001   ¦ Autor ¦ Claudio Ferreira   ¦ Data ¦ 12/09/2017¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦Descriçào ¦ Ponto de Entrada apos a inclusao do fornecedor             ¦¦¦
¦¦¦          ¦ Gera um Cliente de acordo com os dados do fornecedor       ¦¦¦
¦¦+----------+------------------------------------------------------------¦¦¦
¦¦¦ Uso      ¦ TOTVS-GO                                                   ¦¦¦
¦¦+-----------------------------------------------------------------------+¦¦
¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/

User Function RGLTE001()
Local _cAlias    := Alias()
Local _aAmb      := {}
Local _cNatureza := ALLTRIM(GetMv("LT_NATCLIE")) //Natureza utilizada no Produtor/Cliente

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Salva o Ambiente.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
_aAmb := GetArea()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Salvando Integridade do Sistema. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SA2")
_nOrdSA2 := IndexOrd()
_nRecSA2 := Recno()


If SA2->A2_L_TPFOR $ "P/T" // P=Produtoro ; T=Tranps. Leite Granel ; L=Lojas/Filiais
	
	dbSelectArea("SA1")
	dbSetorder(1)
	If dbSeek(xFilial("SA1")+SA2->A2_COD+SA2->A2_LOJA)
	    RecLock("SA1",.F.)
		SA1->A1_L_TPCLI := SA2->A2_L_TPFOR   // TIPO DE CLIENTE /FORNECEDOR
		SA1->A1_NOME    := SA2->A2_NOME      // NOME
		SA1->A1_NREDUZ  := SA2->A2_NREDUZ    // NOME REDUZIDO
		SA1->A1_TIPO    := If(Empty(SA1->A1_TIPO),"L",SA1->A1_TIPO)
		SA1->A1_END     := SA2->A2_END       // ENDERECO
		SA1->A1_BAIRRO  := SA2->A2_BAIRRO    // BAIRRO
		SA1->A1_MUN     := SA2->A2_MUN       // MUNICIPIO
		SA1->A1_COD_MUN := SA2->A2_COD_MUN       // MUNICIPIO
		SA1->A1_EST     := SA2->A2_EST       // ESTADO
		SA1->A1_CEP     := SA2->A2_CEP       // CEP
		SA1->A1_PESSOA  := SA2->A2_TIPO      // PESSOA FISICA OU JURIDICA
		SA1->A1_CGC     := SA2->A2_CGC       // CGC
		SA1->A1_PFISICA := SA2->A2_PFISICA   // RG PESSOA FISICA
		SA1->A1_DDD     := SA2->A2_DDD       // DDD
		SA1->A1_DDI     := SA2->A2_DDI       // DDD		
		SA1->A1_TEL     := SA2->A2_TEL       // TEL
		SA1->A1_INSCR   := SA2->A2_INSCR     // INSCRICAO
		SA1->A1_FAX     := SA2->A2_FAX       // FAX
		SA1->A1_INSCRM  := SA2->A2_INSCRM    // INSCRICAO MUNICIPAL
		SA1->A1_HPAGE   := SA2->A2_HPAGE     // HOME PAGE
		SA1->A1_EMAIL   := SA2->A2_EMAIL     // EMAIL
		SA1->A1_MSBLQL  := SA2->A2_MSBLQL    // BLOQUEADO SIM/NAO   
		SA1->A1_NATUREZ := If(Empty(SA1->A1_NATUREZ),_cNatureza,SA1->A1_NATUREZ)// NATUREZA
		SA1->A1_CODPAIS := If(Empty(SA1->A1_CODPAIS),SA2->A2_CODPAIS,SA1->A1_CODPAIS)// COD PAIS
		SA1->A1_PAIS	:= SA2->A2_PAIS		 // PAIS
		SA1->A1_ENDCOB	:= SA2->A2_L_END			//ENDERECO COBRANCA
		SA1->A1_BAIRROC := SA2->A2_L_BAIRR			// BAIRRO
		SA1->A1_CEPC    := SA2->A2_L_CEP			// CEP
		SA1->A1_MUNC    := SA2->A2_L_MUN			// MUNICIPIO
		SA1->A1_ESTC    := SA2->A2_L_EST			// ESTADO
		//SA1->A1_TELEXT	:= SA2->A2_TELEXT			// TELEFONES EXTRAS
		SA1->A1_GRPTRIB :=	SA2->A2_GRPTRIB
		SA1->A1_CNAE		:= SA2->A2_CNAE
		SA1->A1_COMPLEMEM	:= SA2->A2_COMPLEMEM
			
		If SA1->(FieldPos("A1_XOPSN")) > 0
			SA1->A1_XOPSN   := SA2->A2_XOPSN     // TEXTO DE OPTANTE PELO SIMPES
		EndIf
			
		/*
		//SA1->A1_ENDCOB  := If(Empty(SA1->A1_ENDCOB) ,SA2->A2_END    ,SA1->A1_ENDCOB )// ENDERECO
		//SA1->A1_BAIRROC := If(Empty(SA1->A1_BAIRROC),SA2->A2_BAIRRO ,SA1->A1_BAIRROC)// BAIRRO
		//SA1->A1_CEPC    := If(Empty(SA1->A1_CEPC)   ,SA2->A2_CEP    ,SA1->A1_CEPC   )// CEP
		//SA1->A1_MUNC    := If(Empty(SA1->A1_MUNC)   ,SA2->A2_MUN    ,SA1->A1_MUNC   )// MUNICIPIO
		//SA1->A1_ESTC    := If(Empty(SA1->A1_ESTC)   ,SA2->A2_EST    ,SA1->A1_ESTC   )// ESTADO
		//SA1->A1_L_CODFU	:= SA2->A2_L_CODFU 	 // CODIGO FUNCIONARIO
		//SA1->A1_LC      := SA2->A2_C_LC   		//LIMITE DE CRÉDITO
		//SA1->A1_VENCLC  := SA2->A2_C_VENLC		//VENCIMENTO LIMITE DE CRÉDITO
		//SA1->A1_C_MPGTO	:= SA2->A2_C_MPGTO		//FORMAS DE PAGAMENTO
		SA1->A1_TPCOBR  := If(Empty(SA1->A1_TPCOBR) ,"C"            ,SA1->A1_TPCOBR )
		SA1->A1_VEND    := If(Empty(SA1->A1_VEND)   ,"000001"       ,SA1->A1_VEND   )
		SA1->A1_COND    := If(Empty(SA1->A1_COND)   ,"001"          ,SA1->A1_COND   )
		SA1->A1_RISCO   := If(Empty(SA1->A1_RISCO)  ,"A"            ,SA1->A1_RISCO  )
		SA1->A1_TABELA  := If(Empty(SA1->A1_TABELA) ,"001"          ,SA1->A1_TABELA )
		SA1->A1_TPFRET  := If(Empty(SA1->A1_TPFRET) ,"F"            ,SA1->A1_TPFRET )
		SA1->A1_TRANSP  := If(Empty(SA1->A1_TRANSP) ,"00"           ,SA1->A1_TRANSP )
		SA1->A1_RECCOFI := If(Empty(SA1->A1_RECCOFI),"N"            ,SA1->A1_RECCOFI)
		SA1->A1_RECCSLL := If(Empty(SA1->A1_RECCSLL),"N"            ,SA1->A1_RECCSLL)
		SA1->A1_RECPIS  := If(Empty(SA1->A1_RECPIS) ,"N"            ,SA1->A1_RECPIS )
		SA1->A1_ABATIMP := If(Empty(SA1->A1_ABATIMP),"1"            ,SA1->A1_ABATIMP)
		SA1->A1_PRODRUR := If(Empty(SA1->A1_PRODRUR),"S"            ,SA1->A1_PRODRUR)
		*/
		MsUnLock()
	Else
		If !Empty(SA2->A2_COD)
			RecLock("SA1",.T.)
			SA1->A1_FILIAL  := SA2->A2_FILIAL    // FILIAL
			SA1->A1_L_TPCLI := SA2->A2_L_TPFOR   // TIPO DE CLIENTE /FORNECEDOR
			SA1->A1_LOJA    := SA2->A2_LOJA      // LOJA
			SA1->A1_COD     := SA2->A2_COD       // CODIGO
			SA1->A1_NOME    := SA2->A2_NOME      // NOME
			SA1->A1_NREDUZ  := SA2->A2_NREDUZ    // NOME REDUZIDO
			IF (SA2->A2_L_TPFOR == 'P')
				SA1->A1_TIPO    := "L"
			ELSE 
				SA1->A1_TIPO    := "F"
			ENDIF
			SA1->A1_END     := SA2->A2_END       // ENDERECO
			SA1->A1_BAIRRO  := SA2->A2_BAIRRO    // BAIRRO
			SA1->A1_MUN     := SA2->A2_MUN       // MUNICIPIO
			SA1->A1_COD_MUN := SA2->A2_COD_MUN   // MUNICIPIO
			SA1->A1_EST     := SA2->A2_EST       // ESTADO
			SA1->A1_CEP     := SA2->A2_CEP       // CEP
			SA1->A1_PESSOA  := SA2->A2_TIPO      // PESSOA FISICA OU JURIDICA
			SA1->A1_CGC     := SA2->A2_CGC       // CGC
			SA1->A1_PFISICA := SA2->A2_PFISICA   // RG PESSOA FISICA
			SA1->A1_DDI     := SA2->A2_DDI       // DDD
			SA1->A1_DDD     := SA2->A2_DDD       // DDD
			SA1->A1_TEL     := SA2->A2_TEL       // TEL
			SA1->A1_INSCR   := SA2->A2_INSCR     // INSCRICAO
			SA1->A1_SIMPLES	:= SA2->A2_SIMPNAC			// OPTANTE PELO SIMPLES
			SA1->A1_CONTRIB      := IIF(Alltrim(SA2->A2_INSCR) <> "ISENTO","1","2")   		//LIMITE DE CRÉDITO
			SA1->A1_FAX     := SA2->A2_FAX       // FAX
			SA1->A1_INSCRM  := SA2->A2_INSCRM    // INSCRICAO MUNICIPAL
			SA1->A1_HPAGE   := SA2->A2_HPAGE     // HOME PAGE
			SA1->A1_EMAIL   := SA2->A2_EMAIL     // EMAIL
			SA1->A1_MSBLQL  := SA2->A2_MSBLQL    // BLOQUEADO SIM/NAO
			SA1->A1_CODPAIS := SA2->A2_CODPAIS   // CODIGO DO PAIS
			SA1->A1_NATUREZ := _cNatureza        // NATUREZA
			SA1->A1_PAIS	:= SA2->A2_PAIS		 // PAIS
			SA1->A1_ENDCOB	:= SA2->A2_L_END	 //ENDERECO COBRANCA
			SA1->A1_BAIRROC := SA2->A2_L_BAIRR	 // BAIRRO
			SA1->A1_CEPC    := SA2->A2_L_CEP	 // CEP
			SA1->A1_MUNC    := SA2->A2_L_MUN	 // MUNICIPIO
			SA1->A1_ESTC    := SA2->A2_L_EST	 // ESTADO
			SA1->A1_XCODANT := SA2->A2_XCODANT
  			SA1->A1_GRPTRIB :=	SA2->A2_GRPTRIB
  			SA1->A1_CNAE		:= SA2->A2_CNAE
  			SA1->A1_COMPLEMEM	:= SA2->A2_COMPLEMEM
			If SA1->(FieldPos("A1_XOPSN")) > 0
				SA1->A1_XOPSN   := SA2->A2_XOPSN     // TEXTO DE OPTANTE PELO SIMPES
			EndIf

			/*
			//SA1->A1_ENDCOB  := SA2->A2_END       // ENDERECO
			//SA1->A1_BAIRROC := SA2->A2_BAIRRO    // BAIRRO
			//SA1->A1_CEPC    := SA2->A2_CEP       // CEP
			//SA1->A1_MUNC    := SA2->A2_MUN       // MUNICIPIO
			//SA1->A1_ESTC    := SA2->A2_EST       // ESTADO
			//SA1->A1_L_CODFU	:= SA2->A2_L_CODFU 	 // CODIGO FUNCIONARIO
			//SA1->A1_TELEXT	:= SA2->A2_TELEXT			// TELEFONES EXTRAS
			//SA1->A1_LC      := SA2->A2_C_LC   		//LIMITE DE CRÉDITO
  			//SA1->A1_VENCLC  := SA2->A2_C_VENLC		//VENCIMENTO LIMITE DE CRÉDITO
  			//SA1->A1_C_MPGTO	:= SA2->A2_C_MPGTO		//FORMAS DE PAGAMENTO 

			SA1->A1_TPCOBR  := "C"
			SA1->A1_VEND    := "000001"
			SA1->A1_COND    := "001"
			SA1->A1_RISCO   := "A"
			SA1->A1_TABELA  := "001"
			SA1->A1_TPFRET  := "F"//FOB
			SA1->A1_TRANSP  := "00"
			SA1->A1_RECCOFI := "N"
			SA1->A1_RECCSLL := "N"
			SA1->A1_RECPIS  := "N"
			SA1->A1_ABATIMP := "1"
			SA1->A1_PRODRUR := "S"
			*/
			MsUnLock()
		EndIf
	EndIf
EndIf

dbSelectArea("SA2")
dbSetOrder(_nOrdSA2)
dbGoto(_nRecSA2)

dbSelectArea(_cAlias)
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Restaura o Ambiene.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
RestArea(_aAmb)
Return 