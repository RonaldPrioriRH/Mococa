#include 'protheus.ch'
#include 'parmtype.ch'


User Function JbEnv02()
	U_RACDA012('0102')
Return

User Function JbEnv03()
	U_RACDA012('0103')
Return


//Job para Envio C.Q.
user function RACDA012(cFilApon)
	Local c_Qry := ""
	Local aCab := {}
	Local aItens := {}
	Local aErroAuto := {}
	Local c_Txt := ""
	Local nI := 0

	Private lMSErroAuto := .F.
	Private lAutoErrNoFile 	:= .T.

	//cFilApon := '0103'




	If !(Select("SX2") > 0)
		RPCCLEARENV()
		RPCSetType(3)
		RPCSetEnv("01",cFilApon,"","","","",{})	
	Endif

	ConOut(DtoC(Date()) +"-" + Time()  +"JbEnvCQ("+ cFilApon +")****************************************")

	DbSelectArea("Z0G")
	DbSetOrder(2)
	DbSeek(xFilial("Z0G") + '1')

	While !Eof()
		If ! RecLock("Z0G")
			DbSelectArea("Z0G")
			DbSkip()
			Loop
		endif

		If Z0G->Z0G_STATUS = '0'
			DbSelectArea("Z0G")
			DbSkip()
			Loop
		endif


		DbSelectArea("Z0E")
		DbSetOrder(4)
		If DbSeek(xFilial("Z0E") + Z0G->Z0G_ETIQ)

			If Z0E->Z0E_STATUS = '0'
				//ConOut(DtoC(Date()) +"-" + Time()  +" Preparando " + Z0G->Z0G_ETIQ )

				c_Qry := "SELECT SD3010.R_E_C_N_O_ AS REC "
				c_Qry += "FROM SD3010 "
				c_Qry += "WHERE D_E_L_E_T_ = ' ' "
				c_Qry += "AND D3_FILIAL = '"+ xFilial("SD3") +"' "
				c_Qry += "AND D3_IDENT = (SELECT H6_IDENT "
				c_Qry += "FROM SH6010 "
				c_Qry += "WHERE SH6010.D_E_L_E_T_ = ' ' "
				c_Qry += "AND H6_FILIAL = '"+ xFilial("SH6") +"' "
				c_Qry += "AND H6_X_ETQ = '"+ Z0G->Z0G_ETIQ +"') "

				PlSQuery(c_Qry,"_SD3")

				If !Eof()
					DbSelectArea("SD3")
					DbGoTo(_SD3->REC)


					aCab  := { ;
					{"DA_PRODUTO"	,SD3->D3_COD		,nil},;
					{"DA_LOCAL"		, '98'				,nil},;
					{"DA_NUMSEQ"	, SD3->D3_NUMSEQ	,nil},; //relacionado ao campo D1_NUMSEQ
					{"DA_DOC"		, SD3->D3_DOC		,nil}}  //Relacionado ao campo F1_DOC ou D1_DOC

					aItens := {{ ;
					{"DB_ITEM"		, '0001'			,nil},;
					{"DB_LOCALIZ"	, Z0G->Z0G_ENDERE	,nil},;
					{"DB_QUANT"		, SD3->D3_QUANT		,nil},;
					{"DB_DATA"		, dDATABASE		,nil}}}


					lMSErroAuto := .F.
					nModulo     := 4
					SX3->(DbSetOrder(1))

					msExecAuto({|x,y|mata265(x,y)},aCab,aItens)

					If lMSErroAuto
						aErroAuto := GetAutoGRLog()

						c_Txt := "Falha execauto!" + Chr(13) + Chr(10)

						For nI := 1 To Len(aErroAuto)
							c_Txt += aErroAuto[nI] + Chr(13) + Chr(10)
						Next

						

						//ConOut(c_Txt)

						DbSelectArea("Z0G")
						RecLock("Z0G",.F.)

						Z0G->Z0G_STATUS := '2'
						Z0G->Z0G_DTPROC := Date()
						Z0G->Z0G_HRPROC := Time()

						MsUnLock()
						//ConOut(DtoC(Date()) +"-" + Time()  +" Erro " + Z0G->Z0G_ETIQ )


					Else
						DbSelectArea("Z0G")
						RecLock("Z0G",.F.)

						Z0G->Z0G_STATUS := '0'
						Z0G->Z0G_DTPROC := Date()
						Z0G->Z0G_HRPROC := Time()

						MsUnLock()
						ConOut(DtoC(Date()) +"-" + Time()  +" Finalizada " + Z0G->Z0G_ETIQ )

					EndIf
				EndIf
				_SD3->(DbCloseArea())
			Endif
		Endif
		MsUnLock()

		DbSelectArea("Z0G")
		DbSkip()
	EndDo
return