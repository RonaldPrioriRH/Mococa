#INCLUDE 'Protheus.ch'
#INCLUDE "topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRFATA015  บAutor  ณTarcisio Silva MirandaบDataณ  07/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Alimenta a entrada do estoque no ato da saํda .			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamado pelo ponto de entrada M460FIM().   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function RFATA015()
	Local aArea 		:= GetArea()
	Local aAreaSD2		:= SD2->(GetArea())
	Local aAreaSF2 		:= SF2->(GetArea())
	Local aAreaSD1		:= SD1->(GetArea())
	Local aAreaSF1 		:= SF1->(GetArea())
	Local lRfata015 	:= GetMv("MV_XRFT15",,.T.) 	//Parametro responsavel por habilitar o funcionamento da rotina.
	Default lRoboCarga 	:= .f.  					// Se verdadeiro indica que foi acionado pela rotina de roboda carga
	Default lmvczaa 	:= .f.    					// Verdadeiro quando acionada pela rotina  MVC_ZAA
	Default lCarcSaf2 	:= .f.
	Private lMsErroAuto := .F.

	if lRfata015 //Verifica se o parametro esta habilitado. 

		if u_funExec() //so sera executado se o pedido for incluso manualamente.
			If lCarcSaf2
	            If u_atualza0(cza0->za0_chave,'2','F',sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
    	            cEtapa := '3'
        	        cStatus:= 'I'
            	    u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
					If funTransNf()
						cEtapa := '3'
						cStatus:= 'F'
						If u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
							cEtapa := '4'
							cStatus:= 'I'
							u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
						Endif
					Else 
						Return .f.
					Endif
				Endif
			ElseIf lRoboCarga
				funTransNf()
			Else
				If Funname() == 'CARC5AF2'
					If u_atualza0(cza0->za0_chave,'2','F',sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
						cEtapa := '3'
						cStatus:= 'I'
						u_atualza0(cza0->za0_chave,cEtapa,cStatus,sf2->f2_filial,cFilEnt,sc5->c5_num,sf2->f2_serie,sf2->f2_doc,cLogZa0,sf2->f2_cliente,sf2->f2_loja)
					Endif
				Endif
				If !lmvczaa .and. !lrobocarga
					Processa({|| funTransNf()},"Transmitindo Nota fiscal de Saํda...")
				Else
					funTransNf()
				Endif
			Endif
		ElseIf  lRoboCarga
			funTransNf()
		endif
	endif

	RestArea(aAreaSD1)
	RestArea(aAreaSF1)
	RestArea(aAreaSD2)
	RestArea(aAreaSF2)
	RestArea(aArea)

Return(!lMsErroAuto)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณEntraNota บAutor  ณTarcisio Silva MirandaบDataณ  07/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGera a Nota Fiscal ou pre nota dependendo do campo F4_XTESTRFฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamado pelo ponto de entrada M460FIM().   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function EntraNota(_cChvNfe)

	Local aCabec 	:= {}
	Local aAux 		:= {}
	Local nRecSD2 	:= 0
	Local aNovoIt 	:= {}
	//Local cTesTransf:= GetMv("MV_XTESTRF",,"60")//Responsavel pela Trnsferencia.
	Local cBkpFilAnt:= cFilAnt
	Local cFilSF2	:= SF2->F2_FILIAL
	Local cNumNFs 	:= SF2->F2_DOC
	Local cSerNfs 	:= SF2->F2_SERIE
	Local cCodCliNfs:= SF2->F2_CLIENTE
	Local cLjCliNfs	:= SF2->F2_LOJA
	Local lPreNf 	:= .F. 
	Local lNf 		:= .F.
	Local cLocTrf	:= SuperGetMv("FT_LOCTRF",,"") //Define local de estoque a ser considerado no doc de entrada, no processo de transfer๊ncia. Preencher por filial.
	Local cCgcCli	:= SUBSTR(_cChvNfe,7,14)
	//Local cProduto  := GetMv("MV_XNOPROD", ,"001")
	Local cCgcCli2  := Posicione("SA1",1,xFilial("SA1")+SF2->F2_CLIENTE+SF2->F2_LOJA,"A1_CGC")
	Local cFilials 	:= Posicione("SA2",3,xFilial("SA2")+cCgcCli2,"A2_FILTRF")

	Default _cChvNfe := ""
 
	SA2->(DbSelectArea("SA2"))
	SA2->(DbGotop())
	SA2->(DbSetOrder(3)) //F1_FILIAL+F1_CHVNFE
	if SA2->(DbSeek(xFilial("SA2")+cCgcCli))
		cCodFor  	:= SA2->A2_COD
		cLjFor 		:= SA2->A2_LOJA
	else
	    msginfo("O C.N.P.J. "+cCgcCli+" nใo foi encontrado no cadastro de Fornecedor.") 
	endif

	SF1->(DbSelectArea("SF1"))
	SF1->(DbGotop())
	SF1->(DbSetOrder(8)) //F1_FILIAL+F1_CHVNFE
	if !SF1->(DbSeek(cFilials+_cChvNfe))

		cFilAnt := cFilials
    
        //MSGSTOP("CFILIALS => "+cFilAnt)

		aAdd(aCabec,{"F1_TIPO"   	,"N"					, Nil})
		aadd(aCabec,{"F1_FORMUL" 	,"N" 					, Nil})
		aAdd(aCabec,{"F1_DOC"    	,StrZero(Val(cNumNFs),9), Nil})
		aAdd(aCabec,{"F1_SERIE"  	,cSerNfs				, Nil})
		aAdd(aCabec,{"F1_EMISSAO"	,date()					, Nil})
		aAdd(aCabec,{"F1_FORNECE"	,cCodFor				, Nil})
		aAdd(aCabec,{"F1_LOJA"   	,cLjFor					, Nil})
		aAdd(aCabec,{"F1_ESPECIE"	,"SPED"					, Nil})
		aAdd(aCabec,{"F1_COND"		,SF2->F2_COND			, Nil})
		//aAdd(aCabec,{"F1_CHVNFE" 	,_cChvNfe				, nil})
		aAdd(aCabec,{"F1_CHVNFE" 	,SF2->F2_CHVNFE			, nil})// Ajustado o campo acima para pegar a chave da nota de saํda para fazer a entrada	

		SD2->(DbselectArea("SD2"))
		SD2->(DbGotop())
		SD2->(DbSetOrder(3))

		if SD2->(DbSeek(SF2->F2_FILIAL+SF2->F2_DOC+SF2->F2_SERIE+SF2->F2_CLIENTE+SF2->F2_LOJA))

			While SD2->(!EOF()) .AND. cFilSF2$SD2->D2_FILIAL .AND. cNumNFs$SD2->D2_DOC .AND. cSerNfs$SD2->D2_SERIE .AND. cCodCliNfs$SD2->D2_CLIENTE .AND. cLjCliNfs$SD2->D2_LOJA

				nRecSD2 := SD2->(Recno())

				SD2->(DbGoTo(nRecSD2))
				//Zero o Array para corrigir problemas do ExecAuto da Pr้-Nota, gerando itens com quantidade duplicadas 
				aAux := {}

				aAdd(aAux, {"D1_ITEM"   , StrZero(Val(SD2->D2_ITEM),4)  , nil})
				aAdd(aAux, {"D1_COD"    , SD2->D2_COD    				, nil})
				aAdd(aAux, {"D1_UM"    	, SD2->D2_UM     				, nil})
				aAdd(aAux, {"D1_QUANT"  , SD2->D2_QUANT  				, nil})
                
        // alterado a tratativa de busca da TES

				SF4->(DbselectArea("SF4"))
				SF4->( dbSetOrder(1))
				SF4->( dbSeek(SD2->D2_FILIAL + SD2->D2_TES) )
				if !empty(SF4->F4_XTESTRF)
					aAdd(aAux, {"D1_TES"    , SF4->F4_XTESTRF , nil}) //ExecAuto Nใo funcionou passando C6_OPER.
				else
				  //  msginfo("A TES "+SD2->D2_TES+" utilizada na NF "+SD2->D2_DOC+" nใo estแ configurada para esse processo. Campo F4_XTESTRF.") 
				endif

				aAdd(aAux, {"D1_VUNIT"  , SD2->D2_PRCVEN , nil})
				aAdd(aAux, {"D1_TOTAL"  , SD2->D2_TOTAL  , nil})

				if empty(cLocTrf)

					aAdd(aAux, {"D1_LOCAL" , SD2->D2_LOCAL, nil})

				else

					aAdd(aAux, {"D1_LOCAL" , cLocTrf	  , nil})

				endif

				aAdd(aAux, {"D1_LOTECTL", SD2->D2_LOTECTL, nil})
				aAdd(aAux ,{"D1_DTVALID", SD2->D2_DTVALID, nil})
				aAdd(aAux ,{"D1_XTFIORI", SD2->D2_XTFIORI, nil}) //Alterado 19/01/2019 para gravar corretamente a filial origem na D1
			    aAdd(aAux ,{"D1_XTPVORI", SD2->D2_XTPVORI, nil})
				aAdd(aAux ,{"D1_XTITORI", SD2->D2_XTITORI, nil})
				aAdd(aNovoIt, aClone(aAux))
				SD2->(DbSkip())
			EndDo

			MSExecAuto({|x, y, z| MATA103(x, y, z)}, aCabec, aNovoIt, 3) //doc classificado

			iif(lMsErroAuto,lNf := .F.,lNf := .T.)

			if lMsErroAuto     
//				MostraErro()

				lMsErroAuto := .F.
				SF1->(DbSelectArea("SF1"))
				SF1->(DbGotop())
				SF1->(DbSetOrder(1)) //F1_FILIAL+F1_DOC+F1_SERIE+F1_FORNECE+F1_LOJA+F1_TIPO
				if !SF1->(DbSeek(cFilials+SF2->F2_DOC+SF2->F2_SERIE+cCodFor+cLjFor))
					MSExecAuto({|x, y, z| MATA140(x, y, z)}, aCabec, aNovoIt, 3) //pr้-nota
				endif
				iif(lMsErroAuto,lPreNf := .F.,lPreNf := .T.)

			endif

			if lMsErroAuto .AND. lNf == .F. .AND. lPreNf == .F.

				MostraErro()

			else

				if lPreNf
					If !lRoboCarga
						Aviso("Informa็ใo","Pr้ Nota Fiscal inclusa com sucesso!",{"Ok"})
					Endif
				elseif lNf
					If !lCarcSaf2
						Aviso("Informa็ใo","Nota Fiscal inclusa com sucesso!",{"Ok"})
					Else
						cLogErro := "Nota Fiscal inclusa com sucesso!"
						u_atualza0(nChave,'5','E',cFilPed,cFilEnt,cNumPV,StrZero(Val(cNumNFs),9),cSerNfs,cLogErro,cCodFor,cLjFor)
					Endif
				endif

			endif

		EndIf

		cFilAnt := cBkpFilAnt

        //MSGSTOP("CEMPANT => "+cEmpAnt)
        //MSGSTOP("CFILANT => "+cFilAnt)

		SM0->(DbSelectArea("SM0"))
		SM0->(DbGotop())
		SM0->(DbSetOrder(1)) //M0_CODIGO+M0_CODFIL
		if !SM0->(DbSeek(cEmpant+CfilAnt))
			msginfo(" Empresa / Filial nใo encontrada ")
  		endif


	endif

Return(!lMsErroAuto)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณfunExecบAutor  ณTarcisio Silva MirandaบDataณ  08/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFun็ใo que valida se a rotina vai ser executada ou nใo.	   ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamado pelo ponto de entrada M460FIM().   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function funExec()

	Local cQry := ""
	Local lRet := .F.

	cQry := " SELECT C5_XPVSGAC,C5_NUM FROM " + RetSqlName("SC5") + "  WHERE D_E_L_E_T_ <> '*'  						" 
	cQry += " AND C5_FILIAL = '"+SF2->F2_FILIAL+"' AND C5_NOTA = '"+SF2->F2_DOC+"' AND C5_SERIE = '"+SF2->F2_SERIE+"' 	"  

	cQry := ChangeQuery(cQry)

	if Select("TRB") > 0
		TRB->(DbCloseArea())
	endif

	TcQuery cQry New Alias "TRB"

	if empty(TRB->C5_XPVSGAC) .AND. empty(SF2->F2_XIDTRI)

		lRet := .T.

	endif

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณfunTransNf บAutor ณTarcisio Silva MirandaบDataณ 10/03/2018 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Transmite nota fiscal de saํda Automaticamente . 		  นฑฑ
ฑฑบ			   Nota fiscal autorizada -> F2_FIMP == “S”					  นฑฑ
ฑฑบ			   Nota fiscal transmitida -> F2_FIMP == “T”				  นฑฑ
ฑฑบ			   Nota fiscal uso denegado -> F2_FIMP == “D”				  นฑฑ
ฑฑบ			   Nota fiscal nใo autorizada -> F2_FIMP == “N”	   			   ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Chamado pelo ponto de entrada M460FIM().   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function funTransNf()

	Local aChvStts 	:= {}
	Local _cEmpresa := cEmpAnt					//cEmpresa, 
	Local _cFilial 	:= SF2->F2_FILIAL 			//cFilial,
	Local _Espera 	:= "0"						//cEspera, 
	Local _TpTransm := GetMv("MV_XTRANSM",,"2")	//cAmbiente (1=producao,2=Homologacao) Muito cuidado.
	Local _cSerie 	:= SF2->F2_SERIE			//cSerie
	Local _cDocDe 	:= SF2->F2_DOC				//cDoc.Inicial
	Local _cDocAte	:= SF2->F2_DOC				//cDoc.Final 
	Private _cChvNfe:= SF2->F2_CHVNFE			//Chv.Nota Fiscal

	//Mococa 
	//Fonte fun็ใo de transmissใo da NF descontinuada na realease 12.1.27
	If lCarcSaf2   // PrioriSa
		If !u_AutoNfeEnv(_cEmpresa,_cFilial,_Espera,_TpTransm,_cSerie,_cDocDe,_cDocAte) //Transmite nota fiscal.
			Return .f.
		Endif
	Else
		u_AutoNfeEnv(_cEmpresa,_cFilial,_Espera,_TpTransm,_cSerie,_cDocDe,_cDocAte) //Transmite nota fiscal.
		If !lmvczaa .and. !lrobocarga
			Aviso("Informa็ใo","Nota fiscal de saํda Transmitida com sucesso!",{"Ok"})
		Endif
	Endif
	
	Sleep(8000) //espera 8 segundos
	If lCarcSaf2 .or. lmvczaa .or. lRoboCarga 
		funAbreStt() //   Apresenta a tela de Monitor.	
	Else
		Processa({|| funAbreStt()},"Abrindo tela de apresenta็ใo de status...")//Apresenta a tela de Monitor.	
	Endif	
	Sleep(16000) //espera 16 segundos

	aChvStts := funGetChv() //Coletar os dados da nota fiscal como Chave e Status da transmissใo.

	if (!aChvStts[2]$"N" .AND. !aChvStts[2]$"D") .AND. (aChvStts[2]$"S" .OR. aChvStts[2]$"T")
		If lmvczaa .and. !lRoboCarga
			If RecLock('ZAB',.F.)
				zab->zab_status := if(aChvStts[2]=='S','F','E')
				zab->(MsUnLock())
			Endif
			funImpDanf()
		Else
			Processa({|| funImpDanf()},"Imprimindo danfe...")	
		Endif

	endif
	//Atual if aChvStts[2]$"S"   
	
	if aChvStts[2]$"S" .And. SF4->F4_TRANFIL == "1" .And. !(AllTrim(_cFilial) $ "0106/0107")   //Remove gera็ใo de Pre-Nota para as Tes que nใo sใo de Transfer๊ncia e nใo sejam das filiais 0106 e 0107
		If lCarcSaf2
			EntraNota(aChvStts[1])
		Else
			Processa({|| EntraNota(aChvStts[1])},"Gerando Nf de Entrada...")
		Endif

	//else
	
		//MsgAlert("Erro ao emitir nota fiscal de entrada!","Aten็ใo!")

	endif


Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ VldProd บAutor ณTarcisio Silva MirandaบDataณ 10/03/2018    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo que valida o Codigo do produto . 		  			   ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gera nota fiscal de entrada ou pre nota.	   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function VldProd(_cFilial,_cDoc,_cSerie,_cCliente,_cLoja,_cProduto)

	Local aAreaSF2 		:= SF2->(GetArea())
	Local aAreaSD2 		:= SD2->(GetArea())
	Local lRet			:= .T.
	Default _cFilial	:= ""
	Default _cDoc 		:= ""
	Default _cSerie 	:= ""
	Default _cCliente	:= ""
	Default _cLoja		:= "" 
	Default _cProduto 	:= ""

	While !SD2->(Eof()) .AND. SF2->F2_FILIAL$_cFilial .AND. SF2->F2_DOC$_cDoc .AND. SF2->F2_SERIE$_cSerie .AND. SF2->F2_CLIENTE$_cCliente .AND. SF2->F2_LOJA$_cLoja

		if SD2->D2_COD$_cProduto

			lRet := .F.

		endif

		SD2->(DbSkip())

	enddo

	RestArea(aAreaSF2)
	RestArea(aAreaSD2)

Return(lRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ funImpDanf บAutor ณTarcisio Silva MirandaบDataณ 10/03/2018บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Fun็ใo que imprime o danfe . 		  			   		   ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gera nota fiscal de entrada ou pre nota.	   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function funImpDanf() 

	Local cBkpFil := cFilAnt
	Private aFilBrw := {"SF2",".T."}

/*** Ash BRASIL 2022/07/27 alterando para substituir a fun็ใo u_zAtuPerg
		Caique - Removi o UPDATE na MP_SYSTEM_PROFILE e troquei a fun็ใo u_zAtuPerg por SetMVValue()  ***/
		/*
		Begin Transaction      

    		//Monta o Update
    		cQry := "UPDATE MP_SYSTEM_PROFILE SET D_E_L_E_T_ = '*', R_E_C_D_E_L_ = R_E_C_N_O_"  + CRLF
    		cQry += "WHERE P_NAME = '"+RetCodUsr()+"' "                                         + CRLF
			cQry += "AND P_PROG = 'NFSIGW' "                                                    + CRLF
    		cQry += "AND D_E_L_E_T_ <> '*' "                                                    + CRLF
 

    		MemoWrite("C:\TEMP\MP_SYSTEM_PROFILE.txt",cQry)

        	//Tenta executar o update
        	nErro := TcSqlExec(cQry)

        		If nErro != 0
        
      	    		MsgStop("Erro na execu็ใo da query: "+TcSqlError(), "Aten็ใo")
       	    		DisarmTransaction()
			
				EndIf

		End Transaction	
		*/

	Pergunte("NFSIGW",.F.)
	/*
	u_zAtuPerg("NFSIGW", "MV_PAR01", SF2->F2_DOC) //doc de
	u_zAtuPerg("NFSIGW", "MV_PAR02", SF2->F2_DOC) //doc at้
	u_zAtuPerg("NFSIGW", "MV_PAR03", SF2->F2_SERIE) //serie
	u_zAtuPerg("NFSIGW", "MV_PAR07", Stod("20010101")) //data de
	u_zAtuPerg("NFSIGW", "MV_PAR08", Stod("20490101")) //data ate
	*/
	SetMVValue("NFSIGW", "MV_PAR01", SF2->F2_DOC) //doc de
	SetMVValue("NFSIGW", "MV_PAR02", SF2->F2_DOC) //doc at้
	SetMVValue("NFSIGW", "MV_PAR03", SF2->F2_SERIE) //serie
	SetMVValue("NFSIGW", "MV_PAR07", Stod("20010101")) //data de
	SetMVValue("NFSIGW", "MV_PAR08", Stod("20490101")) //data ate
	If !lmvczaa
		SpedDanfe()
	Endif

	cFilAnt := cBkpFil 

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ funGetChv บAutor ณTarcisio Silva MirandaบDataณ 12/03/2018บ  ฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Pega a chave da nota e o status, ja que esta transacionado. ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gera nota fiscal de entrada ou pre nota.	   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function funGetChv()

	Local cChvNfe 	:= ""
	Local cFIimp 	:= ""
	Local _cQry2	:= ""
	Local lRet      := .f.
	Local nx
	For nx := 1 to 5
		//Sleep(8000) //espera 8 segundos
		_cQry2 := " SELECT F2_FIMP,F2_CHVNFE,F2_DOC FROM " + RetSqlName("SF2") + " WHERE F2_DOC = '"+SF2->F2_DOC+"' " 
		_cQry2 += " AND D_E_L_E_T_ <> '*' AND F2_SERIE = '"+SF2->F2_SERIE+"' AND F2_CLIENTE = '"+SF2->F2_CLIENTE+"' "
		_cQry2 += " AND F2_LOJA = '"+SF2->F2_LOJA+"' 																"

		_cQry2 := ChangeQuery(_cQry2)

		if Select("TRB") > 0
			TRB->(DbCloseArea())
		endif

		TcQuery _cQry2 New Alias "TRB"
		
		while TRB->(eof()) 
			If !empty(TRB->F2_CHVNFE)
				lRet := .t.
			Endif
//			funGetChv()
			cChvNfe := TRB->F2_CHVNFE
			cFIimp	:= TRB->F2_FIMP
			TRB->(dBskip())
		enddo

		TRB->(dBcloseArea())
		If lRet 
			exit
		Endif
	Next

Return({cChvNfe,cFIimp})

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ funAbreStt บAutor ณTarcisio Silva MirandaบDataณ12/03/2018บ ฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Carrega o campo de chave. 								   ฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Gera nota fiscal de entrada ou pre nota.	   				  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function funAbreStt()
	If lCarcSaf2 .or. lmvczaa .or. lrobocarga
		xSpedNFe6Mn(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,,.T./*lExibTela*/)
		//SpedNFe6Mnt(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,,.T./*lExibTela*/)
	Else
		SpedNFe6Mnt(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,,.T./*lExibTela*/)
	Endif
Return()

//SpedNFe6Mnt(SF2->F2_SERIE,SF2->F2_DOC,SF2->F2_DOC,,,,,.T./*lAutoColab*/)
Static Function xSpedNFe6Mn(cSerie,cNotaIni,cNotaFim, lCTe, lMDFe, cModel,lTMS, lAutoColab,lExibTela,lUsaColab,lNFCE,lICC)

	Local cIdEnt   := ""
	local cUrl			:= Padr( GetNewPar("MV_SPEDURL",""), 250 )
	Local cDocInicial	:= ""
	Local cDocFinal		:= ""
	Local aPerg    := {}
	Local aParam   := {Space(Len(SerieNfId("SF2",2,"F2_SERIE"))),Space(Len(SF2->F2_DOC)),Space(Len(SF2->F2_DOC)),CtoD(""),CtoD("")}
	Local aSize    := {}
	Local aObjects := {}
	Local aListBox := {}
	Local aInfo    := {}
	Local aPosObj  := {}
	Local oDlg
	Local oListBox
	Local oBtn1
	Local oBtn2
	Local oBtn3
	Local oBtn4
	Local cParNfeRem := SM0->M0_CODIGO+SM0->M0_CODFIL+"SPEDNFEREM"
	Local lOK        := .F.
	Local dDataDe		:= CtoD("")
	Local dDataAte	:= CtoD("")
	Local lSdoc     := TamSx3("F2_SERIE")[1] == 14

	Default cSerie   := ''
	Default cNotaIni := ''
	Default cNotaFim := ''
	Default lCTe     := .F.
	Default lMDFe    := .F.
	Default cModel	 := ""
	default lTMS     := .F.
	Default lAutoColab := .F.
	Default lExibTela := .F. // Nใo exibe se Falso
	Default lUsaColab := .F.
	Default lNFCE	:= IIf(FunName()$"LOJA701",.T.,.F.)
	Default lICC    := .F.

	// Tratamento da NFCe para o Loja                                         ณ
	If cModel == "65"
		If !Empty( GetNewPar("MV_NFCEURL","") )
			cURL := PadR(GetNewPar("MV_NFCEURL","http://"),250)
		Endif
	EndIf

	lUsaColab := UsaColaboracao( IIF(lCte,"2",IIF(lMDFe,"5",IIF(lNFCE,,"1"))))
	if lUsaColab .And. Empty(cModel)
		cModel := Iif(lCte,"57",iif(lMDFe,"58","55"))
	endif

	/* Define o texto apresentado no filtro/monitor conforme o doc. eletr๔nico
	*/
	If lMdfe	
		cDocInicial :=  "Manifesto Inicial"
		cDocFinal	:=  "Manifesto Final"
	ElseIf lCTe
		cDocInicial :=  "CT-e Inicial"
		cDocFinal	:=  "CT-e Final"
	Else
		cDocInicial :=  "Nota fiscal inicial"
		cDocFinal	:=  "Nota fiscal final"
	EndIf

	If !lAutoColab
		aadd(aPerg,{1, Iif(lMDFe .Or. lCTe,"Serie", "Serie da Nota Fiscal") ,aParam[01],"",".T.","",".T.",30,.F.}) // STR0249 "Serie" -- STR0010 "Serie da Nota Fiscal"
		aadd(aPerg,{1,cDocInicial,aParam[02],"",".T.","",".T.",30,.T.})
		aadd(aPerg,{1,cDocFinal,aParam[03],"",".T.","",".T.",30,.T.})

		aParam[01] := ParamLoad(cParNfeRem,aPerg,1,aParam[01])
		aParam[02] := ParamLoad(cParNfeRem,aPerg,2,aParam[02])
		aParam[03] := ParamLoad(cParNfeRem,aPerg,3,aParam[03])
	EndIF

	If lSdoc
		aadd(aPerg,{1,"Dt. Emissใo De"	,aParam[04],"@R 99/99/9999",".T.","",".T.",50,.F.}) 			//STR0826 =  "Dt. Emissใo De"
		aadd(aPerg,{1,"Dt. Emissใo At้"	,aParam[05],"@R 99/99/9999",".T.","",".T.",50,.F.}) 	//STR0827 =  "Dt. Emissใo At้"

		dDataDe  := aParam[04] := ParamLoad(cParNfeRem,aPerg,4,aParam[04])
		dDataAte := aParam[05] := ParamLoad(cParNfeRem,aPerg,5,aParam[05])
	EndIf

	If IsReady( ,,,lUsaColab )
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณObtem o codigo da entidade                                              ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		cIdEnt := GetIdEnt( lUsaColab )
		If !Empty(cIdEnt)
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณInstancia a classe                                                      ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			If !Empty(cIdEnt)
				If lAutoColab
					aParam[01] := cSerie
					aParam[02] := cNotaIni
					aParam[03] := cNotaFim
					lOK        := .T.
				Else
					If (lCTe) .And. !Empty(cSerie) .And. !Empty(cNotaIni) .And. !Empty(cNotaFim)
						aParam[01] := cSerie
						aParam[02] := cNotaIni
						aParam[03] := cNotaFim
						lOK        := .T.
					ElseIf (lMDFe) .And. !Empty(cSerie) .And. !Empty(cNotaIni) .And. !Empty(cNotaFim)
						aParam[01] := cSerie
						aParam[02] := cNotaIni
						aParam[03] := cNotaFim
						lOK        := .T.
					Else
						IF (lExibTela)
							aParam[01] := cSerie
							aParam[02] := cNotaIni
							aParam[03] := cNotaFim
							lOK        := .T.
						Else
							lOK        := ParamBox(aPerg,"SPED - NFe",@aParam,,,,,,,cParNfeRem,.T.,.T.)
							cSerie   := aParam[01]
							cNotaIni := aParam[02]
							cNotaFim := aParam[03]
						EndIF
					EndIf
					If lSdoc
						dDataDe  := aParam[04]
						dDataAte := aParam[05]
						GetFiltroF3(@aParam,,dDataDe,dDataAte)
					EndIF
				EndIF
				If (lOK)
					If lMDFe .And. !lUsaColab
						aListBox := WsMDFeMnt(cIdEnt,cSerie,cNotaIni,cNotaFim,.T.)
					Else
						aListBox := getListBox(cIdEnt, cUrl, aParam, 1, cModel, lCte, .T., lMDFe, lTMS,lUsaColab,lICC)
					EndIf
					If !Empty(aListBox) .And. !lAutoColab
						aSize := MsAdvSize()
						aObjects := {}
						AAdd( aObjects, { 100, 100, .t., .t. } )
						AAdd( aObjects, { 100, 015, .t., .f. } )

						aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
						aPosObj := MsObjSize( aInfo, aObjects )
						If !lRoboCarga
							DEFINE MSDIALOG oDlg TITLE "SPED - NFe" From aSize[7],0 to aSize[6],aSize[5] OF oMainWnd PIXEL

							If Len(aListBox[1]) >= 10
								@ aPosObj[1,1],aPosObj[1,2] LISTBOX oListBox Fields HEADER "","NF","Ambiente","Modalidade","Protocolo","Recomenda็ใo","Tempo decorrido","Tempo SEF", "Tentativas", "Observacao"; //"NF"###"Ambiente"###"Modalidade"###"Protocolo"###"Recomenda็ใo"###"Tempo decorrido"###"Tempo SEF"
									SIZE aPosObj[1,4]-aPosObj[1,2],aPosObj[1,3]-aPosObj[1,1] PIXEL
							Else
								@ aPosObj[1,1],aPosObj[1,2] LISTBOX oListBox Fields HEADER "","NF","Ambiente","Modalidade","Protocolo","Recomenda็ใo","Tempo decorrido","Tempo SEF"; //"NF"###"Ambiente"###"Modalidade"###"Protocolo"###"Recomenda็ใo"###"Tempo decorrido"###"Tempo SEF"
									SIZE aPosObj[1,4]-aPosObj[1,2],aPosObj[1,3]-aPosObj[1,1] PIXEL
							EndIf		
							oListBox:SetArray( aListBox )
							If Len(aListBox[1]) >= 10
								oListBox:bLine := { || { aListBox[ oListBox:nAT,1 ],aListBox[ oListBox:nAT,2 ],aListBox[ oListBox:nAT,3 ],aListBox[ oListBox:nAT,4 ],aListBox[ oListBox:nAT,5 ],aListBox[ oListBox:nAT,6 ],aListBox[ oListBox:nAT,7 ],aListBox[ oListBox:nAT,8 ],aListBox[ oListBox:nAT,10 ],aListBox[ oListBox:nAT,11 ] } }
							Else
								oListBox:bLine := { || { aListBox[ oListBox:nAT,1 ],aListBox[ oListBox:nAT,2 ],aListBox[ oListBox:nAT,3 ],aListBox[ oListBox:nAT,4 ],aListBox[ oListBox:nAT,5 ],aListBox[ oListBox:nAT,6 ],aListBox[ oListBox:nAT,7 ],aListBox[ oListBox:nAT,8 ] } }
							EndIf	

							@ aPosObj[2,1],aPosObj[2,4]-040 BUTTON oBtn1 PROMPT "OK"   		ACTION oDlg:End() OF oDlg PIXEL SIZE 035,011 //"OK"
							@ aPosObj[2,1],aPosObj[2,4]-080 BUTTON oBtn2 PROMPT "Mensagens"   		ACTION (Bt2NFeMnt(aListBox[oListBox:nAT][09])) OF oDlg PIXEL SIZE 035,011 //"Mensagens"
							@ aPosObj[2,1],aPosObj[2,4]-120 BUTTON oBtn3 PROMPT "Rec.XML"   		ACTION (Bt3NFeMnt(cIdEnt,aListBox[ oListBox:nAT,2 ],,lUsaColab,cModel)) OF oDlg PIXEL SIZE 035,011 //"Rec.XML"
							If lMDFe .And. !lUsaColab
								@ aPosObj[2,1],aPosObj[2,4]-160 BUTTON oBtn4 PROMPT "Refresh" 	ACTION (aListBox := WsMDFeMnt(cIdEnt,cSerie,cNotaIni,cNotaFim,.T.),oListBox:nAt := 1,IIF(Empty(aListBox),oDlg:End(),oListBox:Refresh())) OF oDlg PIXEL SIZE 035,011 //"Refresh"
							Else
								@ aPosObj[2,1],aPosObj[2,4]-160 BUTTON oBtn4 PROMPT "Refresh" 	ACTION (aListBox := getListBox(cIdEnt, cUrl, aParam, 1, cModel, lCte, .T., lMDfe, lTMS,lUsaColab),oListBox:nAt := 1,IIF(Empty(aListBox),oDlg:End(),oListBox:Refresh())) OF oDlg PIXEL SIZE 035,011 //"Refresh"
							EndIf
							@ aPosObj[2,1],aPosObj[2,4]-200 BUTTON oBtn4 PROMPT "Schema"  		ACTION (Bt3NFeMnt(cIdEnt,aListBox[ oListBox:nAT,2 ],2,lUsaColab,cModel)) OF oDlg PIXEL SIZE 035,011 //"Schema"
							ACTIVATE MSDIALOG oDlg
						Endif
					EndIf
				EndIf
			EndIf
		Else
			If !lRoboCarga
				Aviso("Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!","STR0021",{"SPED"},3)	//"Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!", STR0647 = "SPED"
			Else
				cLogRobCa:="Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!"
				xEtapa:= ' ' // u_grvlogza5(cza5->za5_carlog,cza5->za5_carga,cLogRobCa,'4',cza5->za5_filial)
			Endif

		EndIf
	Else
		If !lRoboCarga
			Aviso("Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!","STR0021",{"SPED"},3) //"Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!", STR0647 = "SPED"
		Else
			cLogRobCa:="Execute o m๓dulo de configura็ใo do servi็o, antes de utilizar esta op็ใo!!!"
			xEtapa:= ' ' // u_grvlogza5(cza5->za5_carlog,cza5->za5_carga,cLogRobCa,'4',cza5->za5_filial)
		Endif
	EndIf

Return

static function getListBox(cIdEnt, cUrl, aParam, nTpMonitor, cModelo, lCte, lMsg, lMDfe, lTMS,lUsaColab, lICC)

	local aLote			:= {}
	local aListBox			:= {}
	local aRetorno			:= {}
	local cId				:= ""
	local cProtocolo		:= ""
	local cRetCodNfe		:= ""
	local cAviso			:= ""
	local cSerie			:= ""
	local cNota			:= ""

	local nAmbiente		:= ""
	local nModalidade		:= ""
	local cRecomendacao	:= ""
	local cTempoDeEspera	:= ""
	local nTempoMedioSef	:= ""
	local nX				:= 0


	local oOk				:= LoadBitMap(GetResources(), "ENABLE")
	local oNo				:= LoadBitMap(GetResources(), "DISABLE")

	local cTenConsInd		:= ""
	local cObsConsInd		:= ""

	default lUsaColab		:= .F.
	default lMsg			:= .T.
	default lCte			:= .F.
	default lMDfe			:= .F.
	default cModelo			:= IIf(lCte,"57",IIf(lMDfe,"58","55"))
	default lTMS			:= .F.
	default lICC			:= .F.

	if cModelo <> "65"
		lUsaColab := UsaColaboracao( IIf(lCte,"2",IIf(lMDFe,"5","1")) )
	endif

	if 	lUsaColab
		//processa monitoramento por tempo
		aRetorno := colNfeMonProc( aParam, nTpMonitor, cModelo, lCte, @cAviso, lMDfe, lTMS ,lUsaColab, lICC )
	else
		//processa monitoramento
		aRetorno := procMonitorDoc(cIdEnt, cUrl, aParam, nTpMonitor, cModelo, lCte, @cAviso)
	endif

	if empty(cAviso)

		for nX := 1 to len(aRetorno)

			cId				:= aRetorno[nX][1]
			cSerie			:= aRetorno[nX][2]
			cNota			:= aRetorno[nX][3]
			cProtocolo		:= aRetorno[nX][4]
			cRetCodNfe		:= aRetorno[nX][5]
			nAmbiente		:= aRetorno[nX][7]
			nModalidade	:= aRetorno[nX][8]
			cRecomendacao	:= aRetorno[nX][9]
			cTempoDeEspera:= aRetorno[nX][10]
			nTempoMedioSef:= aRetorno[nX][11]
			aLote			:= aRetorno[nX][12]
			cTenConsInd		:= aRetorno[nX][15]
			
			if 	Len(aRetorno[nx]) >= 16 // Se TC 2.0 aRetorno[nx] terแ at้ 15 posi็๕es
				cObsConsInd		:= aRetorno[nX][16]
			endif

			aadd(aListBox,{	iif(empty(cProtocolo) .Or.  cRetCodNfe $ RetCodDene(),oNo,oOk),;
								cId,;
								if(nAmbiente == 1,"Produ็ใo","Homologa็ใo"),; //"Produ็ใo"###"Homologa็ใo"
								IIF(lUsaColab,iif(nModalidade==1,"Normal","Conting๊ncia"),IIf(nModalidade ==1 .Or. nModalidade == 4 .Or. nModalidade == 6,"Normal","Conting๊ncia")),; //"Normal"###"Conting๊ncia"
								cProtocolo,;
								cRecomendacao,;
								cTempoDeEspera,;
								nTempoMedioSef,;
								aLote,;
								cTenConsInd,;
								cObsConsInd;
							})
		next

	    if Empty(aListBox) .and. lMsg .and. !lCte
			If !lRoboCarga
	    		Aviso("STR0647","STR0106",{"SPED"})//STR0647 = "SPED"
			Endif
	    endIf

	elseif !lCTe .And. lMsg
		aviso("STR0647", cAviso,{"SPED"},3)//STR0647 = "SPED"
	endif

return aListBox




//Static Function CTIsReady(cURL,nTipo,lHelp,lUsaColab)
//Return(IsReady(cURL,nTipo,lHelp,lUsaColab))

Static Function IsReady(cURL,nTipo,lHelp,lUsaColab)

	Local cHelp    := ""
	local cError	:= ""
	Local lRetorno := .F.
	DEFAULT nTipo := 1
	DEFAULT lHelp := .F.
	DEFAULT lUsaColab := .F.
	if !lUsaColab
	If FunName() <> "LOJA701"
			If !Empty(cURL)
				PutMV("MV_SPEDURL",cURL)
			EndIf
			SuperGetMv() //Limpa o cache de parametros - nao retirar
			DEFAULT cURL      := PadR(GetNewPar("MV_SPEDURL","http://"),250)
		Else
			If !Empty(cURL)
				PutMV("MV_NFCEURL",cURL)
			EndIf
			SuperGetMv() //Limpa o cache de parametros - nao retirar
			DEFAULT cURL      := PadR(GetNewPar("MV_NFCEURL","http://"),250)
		EndIf
		//Verifica se o servidor da Totvs esta no ar
		if(isConnTSS(@cError))
			lRetorno := .T.
		Else
			If lHelp
				If !lRoboCarga
					Aviso("STR0647",IIf(Empty(GetWscError(3)),GetWscError(1),GetWscError(3)),{"STR0114"},3) // STR0647 = "SPED"
				Else
					cLogRobCa += "ERRO NA TRANSMISSรO - Problemas com TSS "+chr(13)+cht(10)
					cLogRobCa += GetWscError(3)
                    xEtapa:= ' ' // u_grvlogza5(cza5->za5_carlog,cza5->za5_carga,cLogRobCa,'4',cza5->za5_filial) // Como foi gravada a carga transfiro para proxima etapa
				Endif
			EndIf
			lRetorno := .F.
		EndIf


		//Verifica se Hแ Certificado configurado
		If nTipo <> 1 .And. lRetorno

			if( isCfgReady(, @cError) )
				lRetorno := .T.
			else
				If nTipo == 3
					cHelp := cError

					If lHelp .And. !"003" $ cHelp
						Aviso("STR0647",cHelp,{"STR0114"},3) // STR0647 = "SPED"
						lRetorno := .F.

					EndIf

				Else
					lRetorno := .F.

				EndIf
			endif

		EndIf

		//Verifica Validade do Certificado
		If nTipo == 2 .And. lRetorno
			isValidCert(, @cError)
		EndIf
	else
		lRetorno := ColCheckUpd()
		if lHelp .And. !lRetorno .And. !lAuto
			MsgInfo("STR0810") // STR0810 =  "UPDATE do TOTVS Colabora็ใo 2.0 nใo aplicado. Desativado o uso do TOTVS Colabora็ใo 2.0"
		endif
	endif

Return(lRetorno)

Static Function GetIdEnt(lUsaColab)
	local cIdEnt := ""
	local cError := ""

	Default lUsaColab := .F.

	If !lUsaColab

		cIdEnt := getCfgEntidade(@cError)
 
		if(empty(cIdEnt))
			Aviso("STR0647", cError, {"STR0114"}, 3) // STR0647 = "SPED"

		endif

	else
		if !( ColCheckUpd() )
			Aviso("STR0647", "STR0810",{"STR0114"},3) //STR0647 = "SPED", // STR0810 =  "UPDATE do TOTVS Colabora็ใo 2.0 nใo aplicado. Desativado o uso do TOTVS Colabora็ใo 2.0"
		else
			cIdEnt := "000000"
		endif
	endIf
Return(cIdEnt)

