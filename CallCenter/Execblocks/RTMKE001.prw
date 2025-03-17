#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  RTMKE001     ºAutor  ³Raphael Martins   º Data ³  29/03/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina de validacao de limite maximo de ocorrencias para umº±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function RTMKE001()

Local aArea			:= GetArea()
Local aAreaSUC		:= SUC->( GetArea() )
Local aAreaSUD		:= SUD->( GetArea() )
Local lRet 			:= .T.
Local nPosProd	 	:= Ascan(aHeader,{|x| Trim(x[2])=="UD_PRODUTO"})
Local nPosDescProd 	:= Ascan(aHeader,{|x| Trim(x[2])=="UD_DESCPRO"})
//Local nPosLote		:= Ascan(aHeader,{|x| Trim(x[2])=="UD_XLOTE"})
Local nPosProducao	:= Ascan(aHeader,{|x| Trim(x[2])=="UD_XPRODUC"})
//Local nPosOcorren	:= Ascan(aHeader,{|x| Trim(x[2])=="UD_OCORREN"})
Local nQtdMaxOcor	:= SuperGetMv("MV_XQTDOCO",.F.,0)
Local cProduto 		:= Acols[N,nPosProd]
Local cDescProd		:= Acols[N,nPosDescProd]
Local cLote			:= M->UD_XLOTE
Local cProducao		:= Acols[N,nPosProducao]
//Local cOCorren		:= Acols[N,nPosOcorren]
Local cQry 			:= ""
//local uDcodigo      := M->UC_CODIGO

//////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////  CONSULTO OCORRENCIAS PARA O MESMO PRODUTO E LOTE		  ////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////// 
cQry := " SELECT COUNT(*) TOTAL_OCORRENCIAS " 
cQry += " FROM "
cQry += "  " + RetSQLName("SUD") + " 
cQry += " WHERE " 
cQry += "  D_E_L_E_T_ = ' ' " 
cQry += "  AND UD_FILIAL = '" + xFilial("SUD") + "' "
cQry += "  AND UD_PRODUTO = '" + cProduto + "' " 
cQry += "  AND UD_XLOTE   = '" + cLote + "' "
cQry += "  AND UD_XPRODUC = '" + cProducao + "'
cQry += "  AND UD_CODIGO  <> '"+ M->UC_CODIGO + "' "

// verifico se não existe este alias criado
If Select("QRYSUD") > 0
	QRYSUD->(DbCloseArea())
EndIf  
	
// crio o alias temporario
TcQuery cQry New Alias "QRYSUD" 

//valido ultrapassou o limite maximo de ocorrencias para o mesmo produto e lote
If QRYSUD->TOTAL_OCORRENCIAS > nQtdMaxOcor	
	MostraMsg(cProduto, cLote, cProducao, cDescProd )
EndIf

RestArea( aArea )
RestArea( aAreaSUC )
RestArea( aAreaSUD )

QRYSUD->(DbCloseArea())
	  
Return( lRet )

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  MostraMsg     ºAutor  ³Raphael Martins   º Data ³  29/03/17  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Rotina de visualização de mensagem de estouro de ocorrenciasº±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function MostraMsg( cProduto, cLote, cProducao , cDescProd)

Local oFechar
Local oGroup1
Local oGroup2
Local oSay1
Local oSay2
Local oSay3
Local oSay4
Local oTela
Local oIconAlert
Local oFontArial 	:= TFont():New("@Arial Unicode MS",,015,,.T.,,,,,.F.,.F.)

  DEFINE MSDIALOG oTela TITLE "Alerta de Ocorrências" FROM 000, 000  TO 200, 600 COLORS 0, 16777215 PIXEL


    @ 004, 003 GROUP oGroup1 TO 078, 298 OF oTela COLOR 0, 16777215 PIXEL
    
    @ 013, 010 REPOSITORY oIconAlert SIZE 50, 50 OF oTela PIXEL NOBORDER
	oIconAlert:LoadBmp("atencao.png")
	
	@ 013, 049 SAY oSay1 PROMPT "Atenção, atingiu o limite máximo de ocorrências!" SIZE 244, 035 OF oTela FONT oFontArial COLORS 0, 16777215 PIXEL
    @ 030, 049 SAY oSay2 PROMPT "Produto: " + Alltrim( cProduto ) + " - " +Alltrim( cDescProd ) + " " SIZE 253, 018 OF oTela FONT oFontArial COLORS 0, 16777215 PIXEL
    @ 047, 049 SAY oSay3 PROMPT "Lote: " + Alltrim( cLote ) + " "  SIZE 253, 018 OF oTela FONT oFontArial COLORS 0, 16777215 PIXEL
    @ 064, 049 SAY oSay4 PROMPT "Produção: " + Alltrim( cProducao ) + " " SIZE 253, 018 OF oTela FONT oFontArial COLORS 0, 16777215 PIXEL
     
    
    @ 078, 003 GROUP oGroup2 TO 096, 298 OF oTela COLOR 0, 16777215 PIXEL
    
    @ 082, 247 BUTTON oFechar PROMPT "Fechar" SIZE 046, 012 OF oTela Action( oTela:End() ) PIXEL

  ACTIVATE MSDIALOG oTela CENTERED
  


 //Begin transaction
 //  Inclui
//         SUD->(RecLock( "SUD" , .F. ))
//         
//              SUD->UD_XLIMOCO := Alltrim(cProduto) + " " +"Lt." + Alltrim(cLote)+" "+"Pr."+Alltrim(cProducao)  
//                           
 //        SUD->(MsUnLock()) 
 //
//  End transaction
  
   Return()



