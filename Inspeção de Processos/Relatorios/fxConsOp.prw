#Include "PROTHEUS.Ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณQIPR050   บAutor  ณTarcisio Silva Mirandaบ Data ณ10/11/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFun็ใo para selecionar opera็๕es especificas.				  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function fxConsOp(l1Elem)

	Local cTitulo:="Selecionar Opera็๕es . "
	Local MvPar
	Local MvParDef:=""
	Local oWnd
	Local MvRetor     := ""
	Local MvParam     := ""
	Local nAuxFor     := 1
	Local cxOpera 	  := " ("
	Private aSit:={}
	l1Elem := If (l1Elem = Nil , .F. , .T.)
	l1Elem := .F.

	oWnd := GetWndDefault()

	cAlias    := Alias()               // Salva Alias Anterior
	MvPar     := &(Alltrim(ReadVar())) // Carrega Nome da Variavel do Get em Questao
	mvRet     := Alltrim(ReadVar())    // Iguala Nome da Variavel ao Nome variavel de Retorno

	If !l1Elem
		For nFor := 1 TO Len(alltrim(MvPar))
			Mvparam += Subs(MvPar,nAuxFor,1)
			MvParam += Replicate("*",1)
			nAuxFor := (nFor * 1) + 1
		Next
	Endif  	

	cQry := " SELECT QQK_OPERAC,QQK_DESCRI "
	cQry += " FROM "+ RetSqlName("QQK")  
	cQry += " WHERE QQK_PRODUT = '"+MV_PAR03+"'  "
	cQry += " AND QQK_OPERAC IN  ( "
	cQry += "					SELECT QPR_OPERAC   "
	cQry += "					FROM " + RetSqlName("QPR") 
	cQry += "					WHERE D_E_L_E_T_ <> '*'  "
	cQry += "					AND QPR_OP = '"+MV_PAR12+"'  "
	cQry += "					AND QPR_FILIAL = '"+xFilial("QPR")+"' "
	cQry += "					) "
	cQry += " AND D_E_L_E_T_ <> '*' "  

	cQry := ChangeQuery(cQry)

	MemowRite("C:\Temp\XQIPR050.TXT",cQry)

	if Select("TRB") > 0
		TRB->(DbCloseArea())
	endif

	dbUseArea(.T.,"TOPCONN", TCGenQry(,,cQry), "TRB", .F., .T.)

	TRB->(dbSelectArea("TRB"))
	TRB->(dbgotop())	

	While !TRB->(Eof())

		mvPar     := MvParam
		Aadd(aSit,AllTrim(TRB->QQK_DESCRI))
		MvParDef+=(TRB->QQK_OPERAC)

		TRB->(DbSkip())

	enddo

	f_Opcoes(@MvPar,cTitulo,aSit,MvParDef,12,49,l1Elem,2,10)

	For I=1 to len(mvpar) step 1
		If substr(mvpar,I,1) # "*"
			mvRetor += substr(mvpar,I,1)
		Endif
	Next

	nSoma 	 := 1
	nConstt	 := 2
	nTamanho := len(Mvretor)/nConstt
	
	&MvRet := ""
	while nTamanho > 0 
		&MvRet += AllTrim(substr(Mvretor,nSoma,nConstt))+";"
		nSoma  += nConstt
		nTamanho--
	enddo
	
	dbSelectArea(cAlias)       // Retorna Alias
	
Return(.T.) 