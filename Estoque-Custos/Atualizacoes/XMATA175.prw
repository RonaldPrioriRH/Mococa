#include "Protheus.CH"
#include "topconn.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TBICONN.CH"

User Function XMATA175()
	Processa({|| Proc175() },"Processando...")
return

static function Proc175()

	Local aArea     := GetArea()
	Local dDataL	:= DATE()
	Local aLibera	:= {}
	Local cNumCQ	:= "" // Numero do movimento criado anteriormente
	Local cProd		:= ""
	Local cLocal	:= ""
	Local a_TSld	:= {}
	Local c_Txt		:= ""
	Local n_I		:= 0
	//------------------------//| Abertura do ambiente |//------------------------

	//PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1","SD7"
	//RPCSetType(3)
	//RPCSetEnv("99","01","","","","",{"SX5"})

	PRIVATE lMsErroAuto := .F.
	//Private lAutoErrNoFile 	:= .T.
	Private cPerg := "XMATA175"
	procregua(-1)
	ValidPerg()
	//Apresenta os parametros logo na entrada da rotina
	If !(Pergunte(cPerg,.T.))
		Return .F.
	EndIf
	cQuery := 	" SELECT SUM(D7_SALDO) AS SLD, D7_LOTECTL FROM " + RETSQLNAME("SD7") + " SD7 " + ;
	" 	INNER JOIN " + RETSQLNAME("SB1") + " SB1 ON 						  B1_COD = D7_PRODUTO 													AND SB1.D_E_L_E_T_ = ' ' " + ;
	" 	INNER JOIN " + RETSQLNAME("SDB") + " SDB ON D7_FILIAL = DB_FILIAL AND B1_COD = DB_PRODUTO AND D7_LOCAL = DB_LOCAL AND D7_NUMSEQ = DB_NUMSEQ	AND SDB.D_E_L_E_T_ = ' ' " + ;
	"   INNER JOIN " + RETSQLNAME("SBZ") + " SBZ ON BZ_FILIAL = D7_FILIAL AND BZ_COD = D7_PRODUTO 													AND SBZ.D_E_L_E_T_ = ' ' " + ;
	" WHERE D7_FILIAL= '"+xFilial("SD7")+"' AND D7_PRODUTO = '" + MV_PAR01 + "' AND substr(D7_LOTECTL,1," + cvaltochar(len(alltrim(MV_PAR02)))+") = '" + alltrim(MV_PAR02) + "' " + ;
	"AND D7_LIBERA = ' ' AND D7_LOCAL = '98' AND D7_TIPO = 0 AND SD7.D_E_L_E_T_ = ' ' AND D7_SALDO > 0 "+;
	"GROUP BY D7_LOTECTL"

	PlSQuery(cQuery, "_Q01")
	While ! Eof()

		n_EstLoc := CalcEstL(MV_PAR01, '98', dDataBase + 1, _Q01->D7_LOTECTL, ,)[1]

		aadd(a_TSld,{_Q01->D7_LOTECTL,_Q01->SLD,n_EstLoc})

		DbSelectArea("_Q01")
		DbSkip()
	EndDo

	_Q01->(DbCloseArea())

	For n_I := 1 to Len(a_TSld)

		If a_TSld[n_I,2] <> a_TSld[n_I,3]
			c_Txt += Chr(13) + Chr(10) + "Lote: " + a_TSld[n_I,1] +Chr(13) + Chr(10) +;
			" Sld à Liberar: "+ Transform(a_TSld[n_I,2],"@E 999,999") +Chr(13) + Chr(10) +;
			" Sld no Armazem 98: " + Transform(a_TSld[n_I,3],"@E 999,999"+ Chr(13) + Chr(10) ) 
		Endif 

	Next

	If c_Txt <> ""
		if Aviso("Atenção!!!","Saldos desse produto e lote não foram enviado por completo para o C.Q." + c_Txt,{"Sair","Continuar"},3) = 1
			Return
		EndIf
	Endif  

	//	Alert("Ok")

	cQuery := 	" SELECT * FROM " + RETSQLNAME("SD7") + " SD7 " + ;
	" 	INNER JOIN " + RETSQLNAME("SB1") + " SB1 ON  B1_COD = D7_PRODUTO AND SB1.D_E_L_E_T_ = ' ' " + ;
	" 	INNER JOIN " + RETSQLNAME("SDB") + " SDB ON D7_FILIAL = DB_FILIAL AND B1_COD = DB_PRODUTO AND D7_LOCAL = DB_LOCAL AND D7_NUMSEQ = DB_NUMSEQ	AND SDB.D_E_L_E_T_ = ' ' " + ;
	"   INNER JOIN " + RETSQLNAME("SBZ") + " SBZ ON BZ_FILIAL = D7_FILIAL AND BZ_COD = D7_PRODUTO 													AND SBZ.D_E_L_E_T_ = ' ' " + ;
	" WHERE D7_FILIAL= '"+xFilial("SD7")+"' AND D7_PRODUTO = '" + MV_PAR01 + "' AND substr(D7_LOTECTL,1," + cvaltochar(len(alltrim(MV_PAR02)))+") = '" + alltrim(MV_PAR02) + "' " + ;
	"AND D7_LIBERA = ' ' AND D7_LOCAL = '98' AND D7_TIPO = 0 AND SD7.D_E_L_E_T_ = ' ' AND D7_SALDO > 0"

	PlSQuery(cQuery, "XSD7")

	DbSelectArea("XSD7")

	ConOut("Inicio Geral: " + Time())

	if !XSD7->(Eof())
		While !XSD7->(Eof())
			lContinua := .F.
			lMsErroAuto := .F.
			aLibera	:= {}
			xcFil	 := XSD7->D7_FILIAL
			cNumCQ	 := XSD7->D7_NUMERO // Numero do movimento criado anteriormente
			cProd	 := XSD7->D7_PRODUTO
			cLocal	 := XSD7->D7_LOCAL
			xnQtde	 := XSD7->D7_SALDO
			cNumSeq	 := XSD7->D7_NUMSEQ
			cLoteCTL := XSD7->D7_LOTECTL
			xcEnde 	 := If ( EMPTY(XSD7->DB_LOCALIZ) , "" , XSD7->DB_LOCALIZ )
			cLocDes  := If ( EMPTY(XSD7->BZ_LOCPAD) , XSD7->B1_LOCPAD , XSD7->BZ_LOCPAD )

			ConOut(PadC("Baixas do Controle de Qualidade (CQ)",80))
			ConOut("Inicio Produto: " + Time())
			ConOut("Produto/Numero: " + XSD7->D7_PRODUTO + " - " + XSD7->B1_DESC + " - " + XSD7->D7_NUMERO)

			//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
			//| Liberação da Qualidade
			//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
			dbSelectArea("SD7")
			SD7->(dbSetOrder(1))
			SD7->(DbGoTop())
			if SD7->(dbSeek( xcFil + cNumCq + cProd + cLocal ))

				Begin Transaction
					aAdd(aLibera,{	{"D7_TIPO"  	,1  	 	,Nil},;  // 1=Libera o item do CQ / 2=Rejeita o item do CQ
					{"D7_QTDE"  	,xnQtde 	,Nil},;  //
					{"D7_OBS"  		,""      	,Nil},;  //
					{"D7_QTSEGUM"	,0  	 	,Nil},;  //
					{"D7_DATA"  	,dDataL     ,Nil},;  //
					{"D7_LOCDEST" 	,cLocDes   	,Nil},;  //
					{"D7_LOCALIZ"  	,xcEnde 	,Nil},;  //
					{"D7_MOTREJE" 	,""  	 	,Nil},;  //
					{"D7_SALDO"  	,NIL	 	,Nil},;  //
					{"D7_SALDO2"  	,NIL	 	,Nil},;
					{"D7_ESTORNO"  	,NIL	 	,Nil}})  //

					MSExecAuto({|x,y,z| MATA175(x,y)},aLibera,4)
					If !lMsErroAuto
						conout("Incluido com sucesso! ")
						conout("Incluido Produto/Numero: " + XSD7->D7_PRODUTO + " - " + XSD7->B1_DESC + " - " + XSD7->D7_NUMERO)

						lContinua := .T.

					Else
						MostraErro()

						ConOut("Erro na inclusao!")
						ConOut("Erro Produto/Numero: " + XSD7->D7_PRODUTO + " - " + XSD7->B1_DESC + " - " + XSD7->D7_NUMERO)
						DisarmTransaction()
					EndIf
					ConOut("Hora Fim: "+Time())
					ConOut("Fim Produto/Numero: " + XSD7->D7_PRODUTO + " - " + XSD7->B1_DESC + " - " + XSD7->D7_NUMERO)


					If lContinua .AND. !(Empty(xcEnde))
						SD7->(DbSkip()) //Posiciona no registro de Tipo 1 (liberado). Por default a SD7 fica posicioanda no registro tipo 0 (QTD Original)
						//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
						//| Movimenta o Endereço
						//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

						dbSelectArea("SDA")
						SDA->(dbSetOrder(1))
						if SDA->(dbSeek( xcFil + cProd + cLocDes + SD7->D7_NUMSEQ ))
							aCEnd := {  {"DA_FILIAL" , xcFil         	, nil},;
							{"DA_PRODUTO", cProd    		, nil},;
							{"DA_LOCAL"  , cLocal		  	, nil},;
							{"DA_DOC"    , SD7->D7_NUMERO  	, nil},;
							{"DA_ORIGEM" , "SD3"			, nil},;
							{"DA_NUMSEQ" , SD7->D7_NUMSEQ 	, nil} }

							//itens
							aIEnd := {}
							aAdd(aIEnd, {   {"DB_FILIAL" , xcFil         , nil},;
							{"DB_ITEM"   , "0001"        , nil},;
							{"DB_ESTORNO", " "			 , nil},;
							{"DB_LOCALIZ", xcEnde        , nil},;
							{"DB_DATA"   , dDataL     	 , nil},;
							{"DB_QUANT"  , xnQtde 		 , nil}})

							lMsErroAuto := .F.
							MsExecAuto({|x, y, z| MATA265(x, y, z)}, aCEnd, aIEnd, 3)

							IF lMsErroAuto
								MostraErro()
								DisarmTransaction()
							else
								conout("SDA Incluída com Sucesso")
							EndIf
						else
							MsgInfo("Cabeçalho SDA não encontrado. Entrar em contato com o TI. '"+xcFil + cProd + cLocDes + SD7->D7_NUMSEQ+"'")
						endif
					endif
				End Transaction

			else
				MsgInfo("Item SD7 não encontrado, informe o TI. '"+xcFil + cNumCq + cProd + cLocal+"'")
			EndIf
			DbSelectArea("XSD7")
			XSD7->(dbSkip())
		EndDo
	else
		alert("Não há dados.")
	endif
	ConOut("Fim Geral: "+Time())

	XSD7->(dbCloseArea())

	//MsgBox("Rotina finalizada com sucesso.","OK","INFO")

	RestArea(aArea)
Return Nil

User Function MTA175MNU()
	AADD(aRotina,{"* Bloquear Palete", 'U_BLQPLT()'	, 0, 7, 0, nil})
	AADD(aRotina,{"* Liberar Produto/Lote", 'u_XMATA175()'	, 0, 7, 0, nil})

Return Nil


User Function BLQPLT()
	Local a_Area := GetArea()
	Local n_Opc := 0
	Local c_Etq := Alltrim(Posicione("SD3",3,SD7->(D7_FILIAL+D7_PRODUTO+D7_LOCAL+D7_NUMSEQ),"D3_X_ETQ"))
	Local l_Sts := .F.

	If ! Empty(c_Etq)

		l_Sts := U_VerZ0D(c_Etq)


		n_Opc := Aviso("Atenção","Palete " + iif(!l_Sts,"Bloquear","Desbloquear") + Chr(13) + Chr(10) +;
		 "Deseja "+ iif(l_Sts,"Bloquear","Desbloquear")  + " o Palete para Expedição com a Etiqueta numero "+ Chr(13) + Chr(10) +;
		 c_Etq,{"Sim","Não"})

		If n_Opc = 1
			U_BlqZ0D(c_Etq)
		Endif
	Endif

	RestArea(a_Area)
Return


//Perguntas da execução do Calculo
Static Function ValidPerg()
	Local _sAlias,i,j
	_sAlias := Alias()
	//Retirado Sangelles 22/03/2022 ->dbSelectArea("SX1")
	//Retirado Sangelles 22/03/2022 ->dbSetOrder(1)
	cPerg := PADR(cPerg,10)
	aRegs:={}

	//Grupo/Ordem/Pergunta				/espanhol	/ingles	/Variavel/Tipo/Tamanho/Decimal/Presel/ GSC /Valid /Var01	 /Def01 /DefSpa/DefEng/Cnt01/Var02/Def02/DefEsp/DefEng/Cnt02/Var03/Def03/DefEst/DefEng/Cnt03/Var04/Def04/Def4Esp/Def4Eng/Cnt04/Var05/Def05/Def5Esp/Def5Eng/Cnt05/ f3  /pyme/grpsxg/help/picture/idfil/
	AADD(aRegs,{cPerg,"01","Produto			"	,"Espanhol","Ingles","mv_ch1","C",15      ,		0,		0,	"G",	"","mv_par01",""	,""	   ,""    ,""   ,""   ,""   ,""    ,""    ,""   ,""   ,""   ,""    ,""    ,""   ,""   ,""   ,""     ,""     ,""   ,""   ,""   ,""     ,""     ,""   ,"SB1", ""})
	AADD(aRegs,{cPerg,"02","Lote 			" 	,"Espanhol","Ingles","mv_ch2","C",11      ,		0,		0,	"G",	"","mv_par02",""	,""	   ,""    ,""   ,""   ,""   ,""    ,""    ,""   ,""   ,""   ,""    ,""    ,""   ,""   ,""   ,""     ,""     ,""   ,""   ,""   ,""     ,""     ,""   ,""   , ""})
	For i:=1 to Len(aRegs)

		//Retirado Sangelles 22/03/2022 ->If !dbSeek(cPerg+aRegs[i,2])
		//Retirado Sangelles 22/03/2022 ->If !(dbSeek(cPerg+StrZero(nX,2)))	
		cPulaLinha	:= chr(13)+chr(10)
		cQry			:= ""
		// verifico se nao existe este alias criado
		If Select("TMP") > 0
			TMP->(DbCloseArea())
		EndIf
		cQry := " SELECT * FROM " 				  + cPulaLinha
		cQry += " " + RetSqlName("SX1") + " SX1 " + cPulaLinha
		cQry += " WHERE " 						  + cPulaLinha
		cQry += " SX1.D_E_L_E_T_	<> '*' " 	  + cPulaLinha
		cQry += " AND X1_FILIAL = '" + xFilial("SX1") 	+ "' " + cPulaLinha
		cQry += " AND X1_GRUPO = '" +cPerg+StrZero(i,2)+ "' "	+ cPulaLinha

		TcQuery cQry New Alias "TMP" // Cria uma nova area com o resultado do query   
	
		if empty(TMP->X1_GRUPO)
			RecLock("SX1",.T.)
			For j:=1 to FCount()
				If j <= Len(aRegs[i])
					FieldPut(j,aRegs[i,j])
				Endif
			Next
			MsUnlock()
			dbCommit()
		EndIf
	Next
	dbSelectArea(_sAlias)
Return
