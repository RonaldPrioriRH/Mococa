#Include "RwMake.ch"
#Include "Protheus.ch"
#Include "Colors.ch"
#include "dbtree.ch"
#Include "TbiConn.ch"
#INCLUDE "FIVEWIN.CH"
#Include "Folder.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MGLT004   º Autor ³ TOTVS     º Data da Criacao  ³ 29/09/2008                						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Essa rotina monta uma arvore  baseada na tabela ZAI - Controle de Menus dos usuarios                         º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Controle dos menus do usuarios                                      						                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºParametros³ Nenhum						   							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºRetorno   ³ Nenhum						  							                               						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUsuario   ³ Microsiga                                                                                   					º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºSetor     ³ T.I.                                                                                    						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±º            			          	ATUALIZACOES SOFRIDAS DESDE A CONSTRU€AO INICIAL                   						º±±
±±ÌÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºAutor     ³ Data     ³ Motivo da Alteracao  				               ³Usuario(Filial+Matricula+Nome)    ³Setor        º±±
±±ºÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄº±±
±±º          ³          ³                               				   ³                                  ³   	        º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±º          ³          ³                    							   ³                                  ³ 			º±±
±±º----------³----------³--------------------------------------------------³----------------------------------³-------------º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function MGLT004
Local lCargo   := .T.  // Utiliza a opcao CARGO
Local lDisable := .F.  // Desabilita a DBTree
Local qtdn1:=0
Static nome := space(20)
Static ident:= "01000000000000" // id inicial
Static aDat := {}
Static itdels := {}
Private aSize    := MsAdvSize()


/* outro modelo de uso do dbtree
DEFINE MSDIALOG oDlgCtr TITLE "Controle de Usuarios" FROM aSize[7],0 to aSize[6],aSize[5]  PIXEL
oPanCon := TPanel()	:New(00,000, "", oDlgCtr, Nil, .T., .F., Nil, Nil, 640,1300, .T., .F. )

oEmpTree := DbTree():New(0 ,0 , 300 ,300 ,oDlgCtr,,,lCargo,lDisable)
oEmpTree:AddItem("A","1","User","Modulo",,,1)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("B","2","User","Modulo",,,2)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("C","3","User","Modulo",,,3)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("D","4","User","Modulo",,,4)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("E","5","User","Modulo",,,5)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("F","6","User","Modulo",,,6)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddItem("G","7","User","Modulo",,,1)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA
oEmpTree:AddTree("t","","","",,,1)
oEmpTree:AddItem("H","7","User","Modulo",,,2)  // ADCINONA UMA LINHA DE 400 E DEPOIS APAGA

ACTIVATE DIALOG oDlgCtr CENTER
*/


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Montagem da tela de processamento.                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

// Cria um diálogo 
DEFINE MSDIALOG oDlgCtr TITLE "Controle de Usuarios" FROM aSize[7],0 to aSize[6],aSize[5]  PIXEL
oPanCon := TPanel()	:New(00,000, "", oDlgCtr, Nil, .T., .F., Nil, Nil, 640,1300, .T., .F. )

@ 00,00 BUTTON "Incluir" ACTION adicitem()
@ 00,20 BUTTON "Remover" ACTION deltitem()
@ 00,40 BUTTON "Alterar" ACTION altera()
@ 00,60 BUTTON "Gravar" ACTION Processa({|| grava() },"Processando...")
@ 00,80 BUTTON "Ver ID" ACTION MsgBox(oEmpTree:getCargo())
@ 00,100 BUTTON "Fechar" ACTION close(oDlgCtr)

// Cria o DbTree no diálogo, ocupando o tamanho total do mesmo
DEFINE DBTREE oEmpTree FROM 25,00 TO 400,800 OF oPanCon CARGO


aDat := import() // importa dados da tabela para o array aDat


// conta qtd de registos no nivel 1
qtdn1:=0
for u:=1 to len(aDat)
		if substr(aDat[u,1],1,8)=="01000000"
			qtdn1++
		endif
next u

if len(aDat)==0 .or. qtdn1==0
	DBADDTREE oEmpTree PROMPT "NOVO"+space(50) RESOURCE "BMPTABLE" CARGO ident
	DBENDTREE oEmpTree
	aAdd(aDat,{ident,"Novo"})
	grava()
else
	for u:=1 to len(aDat)
		if substr(aDat[u,1],3,2)=="00"
			DBADDTREE oEmpTree PROMPT aDat[u,2] RESOURCE "BMPTABLE" CARGO aDat[u,1]
			DBENDTREE oEmpTree
		endif			
	next u
endif


montini(aDat) // monta a arvore baseado no array
oEmpTree:TreeSeek(aDat[1,1]) // posiciona no primeiro node

ACTIVATE DIALOG oDlgCtr CENTER 

Return

Static Function altera()
Local vlrnome

	if oEmpTree:TreeSeek(oEmpTree:GetCargo())
	    vlrnome:=oEmpTree:GetPrompt()
		DEFINE MSDIALOG oDlgAlt TITLE "Alteracao de Item" FROM 00,00 to 100,200  PIXEL
		@ 01,17 BUTTON "Ok" ACTION altitem(vlrnome)
		@ 01,01 msGet vlrnome Size 50,10
		ACTIVATE DIALOG oDlgAlt CENTER 
	endif

return

Static Function altitem(oname)

	if oEmpTree:TreeSeek(oEmpTree:GetCargo())
          oEmpTree:ChangePrompt(oname,oEmpTree:GetCargo())       
	      for i:=1 to len(aDat)
	            if aDat[i,1]==oEmpTree:GetCargo()
	                 aDat[i,2]:=oname
	            endif
	      next i
	endif 
	close(oDlgAlt)
return

Static Function adicitem()
Local vlrnome:=space(50)

	DEFINE MSDIALOG oDlgInc TITLE "Inclusao de Item" FROM 000,000 to 100,200  PIXEL
	@ 01,17 BUTTON "Ok" ACTION incitem(vlrnome)
	@ 01,01 msGet vlrnome Size 50,10
	ACTIVATE DIALOG oDlgInc CENTER 

return

Static Function incitem(nome)
Local ax

	if oEmpTree:TreeSeek(oEmpTree:GetCargo())
		ident:=incident(oEmpTree:GetCargo())
		ax:={"FOLDER5","FOLDER6"}
		if substr(nome,1,2)=="U-"
		     ax:={"BMPUSER","BMPUSER"}
		endif
		oEmpTree:AddItem(nome,ident,ax[1],ax[2],,,)
		oEmpTree:Refresh()
		oEmpTree:SetFocus()
		aadd(aDat,{ident,nome})	
	endif
    close(oDlgInc)
return


Static Function incident(snum)
Local n1,n2,n3,n4,n5,n6,n7
Local nivatual:=0
Local ax:=0
Local ax2:=0
Local ntfound:=.t.
Local qtd:=0

// separa o numero nos niveis
n1 := substr(snum,1,2) // nivel 1
n2 := substr(snum,3,2) // nivel 2 ...
n3 := substr(snum,5,2)
n4 := substr(snum,7,2)
n5 := substr(snum,9,2)
n6 := substr(snum,11,2)
n7 := substr(snum,13,2)


// acha nivel atual do numero
if val(n2)==0 .and. ntfound
     ax:=val(n2)
     ax += veray(snum,2)
     n2:=strzero(ax,2)
     ntfound:=.f.
endif
if val(n3)==0 .and. ntfound
     ax:=val(n3)
     ax += veray(snum,3)
     n3:=strzero(ax,2)
     ntfound:=.f.
endif
if val(n4)==0 .and. ntfound
     ax:=val(n4)
     ax += veray(snum,4)
     n4:=strzero(ax,2)
     ntfound:=.f.
endif
if val(n5)==0 .and. ntfound
     ax:=val(n5)
     ax += veray(snum,5)
     n5:=strzero(ax,2)
     ntfound:=.f.
endif
if val(n6)==0 .and. ntfound
     ax:=val(n6)
     ax += veray(snum,6)
     n6:=strzero(ax,2)
     ntfound:=.f.
endif
if val(n7)==0 .and. ntfound
     ax:=val(n7)
     ax += veray(snum,7)
     n7:=strzero(ax,2)
     ntfound:=.f.
endif


snum = n1+n2+n3+n4+n5+n6+n7
return snum


Static Function veray(nx,niv)
Local nc:=1
    niv = (niv*2)-2
	for x:=1 to len(aDat)
		if substr(aDat[x,1],1,niv) == substr(nx,1,niv)
			nc++
		endif
	next ix
return nc

Static Function montini(aData)
Local n1,n2,n3,n4,n5,n6,n7,n8,n9,snum,ntfound,idf,ax

	for y:=1 to len(aData)
		if substr(aData[Y,1],3,2)!="00"
	        ntfound := .t.
		    snum := aData[Y,1]
			// separa o numero nos niveis
			n1 := substr(snum,1,2) // nivel 1
			n2 := substr(snum,3,2) // nivel 2 ...
			n3 := substr(snum,5,2)
			n4 := substr(snum,7,2)
			n5 := substr(snum,9,2)
			n6 := substr(snum,11,2)
			n7 := substr(snum,13,2)
			n8 := substr(snum,15,2)
			n9 := substr(snum,17,2)
	
			// acha nivel atual do numero
			if val(n3)==0 .and. ntfound
				idf:=n1+"0000000000000000"
				ntfound:=.f.
			endif
			if val(n4)==0 .and. ntfound
				idf:=n1+n2+"00000000000000"
				ntfound:=.f.
			endif
			if val(n5)==0 .and. ntfound
				idf:=n1+n2+n3+"000000000000"
				ntfound:=.f.
			endif
			if val(n6)==0 .and. ntfound
				idf:=n1+n2+n3+n4+"0000000000"
				ntfound:=.f.
			endif
			if val(n7)==0 .and. ntfound
				idf:=n1+n2+n3+n4+n5+"00000000"
				ntfound:=.f.
			endif
			if val(n8)==0 .and. ntfound
				idf:=n1+n2+n3+n4+n5+n6+"000000"
				ntfound:=.f.
			endif
			if val(n9)==0 .and. ntfound
				idf:=n1+n2+n3+n4+n5+n6+n7+"0000"
				ntfound:=.f.
			endif
			
	        if oEmpTree:TreeSeek(idf) .and. idf != ""
				ax:={"FOLDER5","FOLDER6"}
				if substr(aData[y,2],1,2)=="U-"
				     ax:={"BMPUSER","BMPUSER"}
				endif
				oEmpTree:AddItem(aData[Y,2],aData[Y,1],ax[1],ax[2],,,)
			endif
	    endif
	next y      
	oEmpTree:Refresh()
	oEmpTree:SetFocus()				

return

Static Function import()
Local dt := {}

	cQuery := "SELECT * FROM " + RetSqlName("ZAI") + " ZAI "
	cQuery += " WHERE ZAI.D_E_L_E_T_ = ' ' "
	cQuery += " ORDER BY ZAI_COD "
	
		if Select("TRB") > 0
			dbSelectArea("TRB")
			dbCloseArea("TRB")
		endif

		
		
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )
		TRB->(dbGoTop())
		while TRB->(!Eof())
		     aAdd(dt,{alltrim(TRB->ZAI_COD),TRB->ZAI_NOME})
		     TRB->(dbskip())
		enddo
		TRB->(dbCloseArea())

return dt

Static Function grava()
Local cArea:=GetArea()

		dbselectarea("ZAI")
		dbsetorder(1)

	    for x:=1 to len(aDat)
	    	wProcura := dbseek(xfilial("ZAI")+aDat[x,1])
			RecLock("ZAI",If(wProcura,.F.,.T.))
			ZAI->ZAI_COD := aDat[x,1]
			ZAI->ZAI_NOME := aDat[x,2]
			MsUnlock()
		next x
	    for x:=1 to len(itdels)
	    	Processa({|| deleting(itdels[x]) },"Deletando...")			
		next x 
		itdels:={}
		
		dbclosearea("ZAI")

RestArea(cArea)
return

Static Function deleting(id)
	    	wProcura := dbseek(xfilial("ZAI")+id)
			RecLock("ZAI",.F.)
			dbdelete()
			MsUnlock()
return

Static Function deltitem()

	IF oEmpTree:TreeSeek(oEmpTree:GetCargo()) .and. substr(oEmpTree:GetCargo(),3,2)!="00"
		aadd(itdels,oEmpTree:GetCargo())

		oEmpTree:DelItem()
		oEmpTree:Refresh()
		oEmpTree:SetFocus()

	endif
	
Static Function veritem()
	alert(oEmpTree:GetCargo())
return

Static Function lertree()
      alert(str(len(oEmpTree:aCargo)))
return