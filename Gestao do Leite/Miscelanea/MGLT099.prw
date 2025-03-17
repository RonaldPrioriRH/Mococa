User Function MGLT099()
                           
   Local lRet              
                 
	dbSelectArea("ZLF")
	ZLF->(dbSetOrder(1))//ZLF_FILIAL+ZLF_CODZLE+ZLF_VERSAO+ZLF_RETIRO+ZLF_RETILJ+ZLF_EVENTO+ZLF_SEQ
	If ZLF->(dbSeek(xFilial("ZLF")+"000001"+"1"+"P04313"+"01"))
						
       lRet := .T.
	Else
       lRet := .F.
	EndIf


Return (lRet)