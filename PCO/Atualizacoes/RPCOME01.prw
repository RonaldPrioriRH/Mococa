#INCLUDE "rwmake.ch"

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ RPCOME01 º Autor ³ Claudio Ferreira   º Data ³  19/09/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Programa que refaz a tabela BSW - Usuarios                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ TOTVS-GO                                                   º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function RPCOME01()
Local cQry 		:= ''

if msgyesno("Confirma o Reprocessamento das usuarios?")
  Processa({|| RunItem() },"Processando Usuários...")
endif  
Return()

Static Function RunItem() 
Local _sAlias	:=	Alias()
Local nx
Local aAllusers := FWSFALLUSERS() 

/*
Array of Records
Array com os usuários do sistema no seguinte formato:
[n][1]: Id da tabela de usuários
[n][2]: Id do usuário
[n][3]: Login do usuário
[n][4]: Nome do usuário
[n][5]: E-mail do usuári
*/

BSW->(Dbsetorder(5))
// Busca os usuários

For nx := 1 To Len(aAllusers)
    //conout(aAllusers[nx][4] + " -" + aAllusers[nx][5])
    cCodUsr:=aAllusers[nx][2]
    If !BSW->(dbSeek(xFilial('BSW')+cCodUsr))
	  dbSelectArea("BSW")
	  If RecLock("BSW",.T.)
		BSW->BSW_FILIAL := xFilial("BSW")
		BSW->BSW_CODUSR := cCodUsr
		BSW->BSW_LOGUSR := aAllusers[nx][3]
		BSW->BSW_NOMUSR := aAllusers[nx][4]
		BSW->BSW_EMAIL  := "AUTO"
		MsUnlock("BSW")
	  EndIf
	Endif    
Next

dbSelectArea(_sAlias)
Return