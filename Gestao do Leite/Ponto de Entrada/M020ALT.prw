#INCLUDE "RWMAKE.ch"
/*/
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������������������������������������ͻ��
���Programa  � M020ALT  � Autor � TOTVS                 � Data da Criacao  � 26/01/2009                						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Descricao � Ponto de entrada apos alteracao do fornecedor. Altera o Cliente de acordo com os dados do fornecedor         ���
���          �                        									                               				        ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Uso       � Gestao do Leite                                                                                              ���
���������������������������������������������������������������������������������������������������������������������������͹��
���Parametros� Nenhum						   							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Retorno   � Nenhum						  							                               						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Usuario   � Microsiga                                                                                					���
���������������������������������������������������������������������������������������������������������������������������͹��
���Setor     � Gestao do Leite.                                                                        						���
���������������������������������������������������������������������������������������������������������������������������͹��
���            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL                   						���
���������������������������������������������������������������������������������������������������������������������������͹��
���Autor     � Data     � Motivo da Alteracao  				               �Usuario(Filial+Matricula+Nome)    �Setor        ���
���������������������������������������������������������������������������������������������������������������������������ĺ��
���          �          �                                                  �                                  �   	        ���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���          �          �                    							   �                                  � 			���
���----------�----------�--------------------------------------------------�----------------------------------�-------------���
���������������������������������������������������������������������������������������������������������������������������ͼ��
�������������������������������������������������������������������������������������������������������������������������������
�������������������������������������������������������������������������������������������������������������������������������
/*/
User Function M020ALT()
	
	Local _cAlias    := Alias()
	Local _aAmb      := {}
	Local _cNatureza := ALLTRIM(GetMv("LT_NATCLIE")) //Natureza utilizada no Produtor/Cliente
	
	//�����������������Ŀ
	//�Salva o Ambiente.�
	//�������������������
	_aAmb := GetArea()
	
	//����������������������������������Ŀ
	//� Salvando Integridade do Sistema. �
	//������������������������������������
	dbSelectArea("SA2")
	_nOrdSA2 := IndexOrd()
	_nRecSA2 := Recno()
	
	dbSelectArea("SA1")
	_nOrdSA1 := IndexOrd()
	_nRecSA1 := Recno()
	
		//If ALTERA .AND. SA2->A2_L_TPFOR $ "P/T" //P = Produtor; G = Terceiro
	If ALTERA .AND. SA2->A2_L_TPFOR $ "P/T" // C=Cooperado ; E=Funcionarios ; G=Tranps. Leite Granel ; L=Lojas/Filiais
			
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
				SA1->A1_CONTRIB      := IIF(Alltrim(SA2->A2_INSCR) <> "ISENTO","1","2")   		//LIMITE DE CR�DITO
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

				MsUnLock()
			EndIf
		EndIf
	EndIf
		

	dbSelectArea("SA2")
	dbSetOrder(_nOrdSA2)
	dbGoto(_nRecSA2)
	
	dbSelectArea("SA1")
	dbSetOrder(_nOrdSA1)
	dbGoto(_nRecSA1)
	
	dbSelectArea(_cAlias)
	//�������������������Ŀ
	//�Restaura o Ambiene.�
	//���������������������
RestArea(_aAmb)

Return(.T.)