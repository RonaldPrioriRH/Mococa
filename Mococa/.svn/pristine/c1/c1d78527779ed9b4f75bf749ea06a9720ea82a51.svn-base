#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±.±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  RTMKE005     ºAutor  ³Raphael Martins   º Data ³  04/05/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina de Geracao da FNC a partir do atendimento TMK		   ±±
±±º          ³ 					                                          º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE005(cAtendimento)

Local aArea			:= GetArea()
Local aAreaQI2		:= QI2->( GetArea() )
Local aAreaSUD		:= SUD->( GetArea() )
Local aAreaSUC		:= SUC->( GetArea() )
Local aCpoQNC		:= {}
Local aUser			:= {}
Local aRetQNC		:= {}
Local cFilBkp		:= cFilAnt
Local cCliente		:= ""
Local cLoja			:= ""
Local cDescricao	:= ""
Local cObservacao	:= ""
Local cFilResp		:= ""
Local cMatResp		:= ""
Local cDepResp		:= ""

Private aQNQI2   	:= {}
Private aQNQI3   	:= {}

SUD->( DbSetOrder(1) ) //UD_FILIAL + UD_CODIGO + UD_ITEM
QI2->( DbSetOrder(2) ) //QI2_FILIAL + QI2_FNC + QI2_REV
SUC->( DbSetOrder(1) ) //UC_FILIAL+UC_CODIGO

if SUC->( DbSeek( xFilial("SUC") + cAtendimento ))

	//gravo o codigo da entidade na FNC
	If SUC->UC_ENTIDADE == "SA1"
		cCliente	:= SubStr(SUC->UC_CHAVE,1,TamSX3("A1_COD")[1])
		cLoja		:= Substr(SUC->UC_CHAVE,TamSX3("A1_COD")[1] + 1,TamSX3("A1_LOJA")[1])
	endif
				
				
	If SUD->( DbSeek( xFilial("SUD") + cAtendimento ) ) 
	
		While SUD->(!Eof() ) .And. SUD->UD_CODIGO == cAtendimento
			
			//gero o FNC apenas para os que nao geraram ainda
			if Empty(SUD->UD_CODFNC)
			
				//posiciono na acao escolhida e valido se a mesma gera FNC
				SUQ->(DbSetOrder(1)) //UQ_FILIAL+UQ_SOLUCAO
				
				if SUQ->(DbSeek(xFilial("SUQ")+SUD->UD_SOLUCAO)) .And. SUQ->UQ_XGERFNC == 'S'
					
					//atualizo a cFilAnt para a filial da unidade Fabril, onde sera gerado a FNC
					//Foi realizada uma alteração para fixar a filial 0102, caso seja necessário alterar a parte comentada
					if !Empty(SUD->UD_XFILFA)
						cFilAnt := "0102"//SUD->UD_XFILFA
					endif
					
					cDescricao	:= "ATENDIMENTO - ITEM/ASSUNTO: " + Alltrim(SUD->UD_CODIGO)+" - " + SUD->UD_ITEM + "/" + SUD->UD_ASSUNTO "
					
					cObservacao	:= "OBSERVACAO: "  + SUD->UD_OBS
					
					//retorna o usuario responsavel pela FNC
					If !Empty(SUD->UD_OPERADO)
						
						aUser := aClone(QNCxUser(SUD->UD_OPERADO))
						
						if !(aUser[2] $ "ZZZZZZ")
							                      
							
							cFilResp	:= aUser[1]
							cMatResp	:= aUser[2]
							
						endif
							
					Endif
					
					//retorno o departamento responsavel pela FNC
					SB1->(DbSetOrder(1)) //B1_FILIAL + B1_COD
					
					if SB1->(FieldPos("B1_CODQAD")) > 0 .And. SB1->(DbSeek(xFilial("SB1")+SUD->UD_PRODUTO)) .And. !Empty(SB1->B1_CODQAD) 
					
						cDepResp := SB1->B1_CODQAD
					
					else
						cDepResp	:= SuperGetMv("MV_QNCDDES",,"")
					endif
					
					aCpoQNC := {}
					
					//QI2_FILIAL
					//Aadd(aCpoQNC,{"QI2_FILIAL" 	, "0102"				})
					//ADICIONADO PARA TESTE
					Aadd(aCpoQNC,{"QI2_TPFIC" 	, "1"				})
					Aadd(aCpoQNC,{"QI2_ORIGEM"	, "TMK"				})
					Aadd(aCpoQNC,{"QI2_DESCR"	, cDescricao		}) 
					Aadd(aCpoQNC,{"QI2_MEMO1"	, cObservacao		})			  
					Aadd(aCpoQNC,{"QI2_CODCLI"	, cCliente 			})
					Aadd(aCpoQNC,{"QI2_LOJCLI"	, cLoja 			})
					Aadd(aCpoQNC,{"QI2_CODPRO"	, SUD->UD_PRODUTO	})
					Aadd(aCpoQNC,{"QI2_FILRES"	, cFilResp			})
					Aadd(aCpoQNC,{"QI2_MATRES"	, cMatResp 			})
					aAdd(aCpoQNC,{"QI2_DESDEP"	, cDepResp			})
					aAdd(aCpoQNC,{"QI2_FILDEP" 	, cFilAnt			})//cFilAnt
					aAdd(aCpoQNC,{"QI2_XQTDAQ"  , SUD->UD_XQTDADQ   })   //Adquirida 
					aAdd(aCpoQNC,{"QI2_XQTDAV"  , SUD->UD_XQTDAVA	})   //Avariada 
					aAdd(aCpoQNC,{"QI2_XQTCOL"  , SUD->UD_XQTDCOL	})   //Coleta 
					aAdd(aCpoQNC,{"QI2_XDTFAB"  , SUD->UD_XDTFAB 	})   //Data fabricacao 
					aAdd(aCpoQNC,{"QI2_XDTVAL"  , SUD->UD_XVALIDA	})   //Validade 
					aAdd(aCpoQNC,{"QI2_XFILFA"  , SUD->UD_XFILFA    })   //Filial de fabricacao
					aAdd(aCpoQNC,{"QI2_XPRIOR"  , SUD->UD_XPRIORI   })   //Prioridade 
					aAdd(aCpoQNC,{"QI2_XLOTE"   , SUD->UD_XLOTE  	})   //Lote 
					aAdd(aCpoQNC,{"QI2_XHORAF"  , SUD->UD_XHORAF 	})   //Hora Fabricacao 
					aAdd(aCpoQNC,{"QI2_XFABRI"  , SUD->UD_XPRODUC   })   //Codigo de fabricacao
					aAdd(aCpoQNC,{"QI2_XPCOMP"  , SUD->UD_XPCOMP 	})   //Primeira compra 
					aAdd(aCpoQNC,{"QI2_XMOMPR"  , SUD->UD_XMPROBL	})   //Momento problema
					aAdd(aCpoQNC,{"QI2_XOCORR"  , SUD->UD_OCORREN	})   //Ocorrencia
					aAdd(aCpoQNC,{"QI2_CODORI"  , "100.2"	        })   // Adicionado por Alexandre Dias 
					aAdd(aCpoQNC,{"QI2_CODEFE"  , "100.1"	        })   // Adicionado por Alexandre Dias
					aAdd(aCpoQNC,{"QI2_CODCAT"  , "100.3"	        })   // Adicionado por Alexandre Dias
					//aAdd(aCpoQNC,{"QI2_XLIMOC"  , SUD->UD_XLIMOCO   })   // Adicionado por Alexandre Dias
					
					//funcao padrao para gerar a FNC 
					aRetQNC := aClone(QNCGERA(1,aCpoQNC))
					
					/////////////////////////////////////////
					// Grava o Codigo+Revisao da FNC	 ////
					////////////////////////////////////////
					RecLock("SUD",.F.)
					
						SUD->UD_CODFNC	:= aRetQNC[2] 		//Codigo da Nao-conformidade
						SUD->UD_FNCREV	:= aRetQNC[3] 		//Revisao da Nao-conformidade
						SUD->UD_STATUS 	:= "A"				//Forco o assunto como Pendente pois existe  uma  FNC sem baixa
					
					SUD->(MsUnLock())
						
				endif
			                            	
			endif
					
			SUD->( DbSkip() )
		EndDo
		
	endif

endif
                  
//retorno a filial logada
cFilAnt := cFilBkp

RestArea(aArea)
RestArea(aAreaQI2)
RestArea(aAreaSUD)
RestArea(aAreaSUC)

Return(aRetQNC)

