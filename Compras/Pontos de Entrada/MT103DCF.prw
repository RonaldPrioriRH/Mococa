#INCLUDE "PROTHEUS.CH"

User Function MT103DCF()

    Local oDlg       := NIL
    Local oNum       := NIL
    Local oMarca     := NIL
    Local cMarca     := SPACE(60)
    Local cNum       := SPACE(60)
    Local lInclui    := PARAMIXB[1]
    Local lAltera    := PARAMIXB[2]
    Local lVisual    := PARAMIXB[3]
    Local aCamposPar := PARAMIXB[4]
    Local aCamposRet := {}
     
     DEFINE MSDIALOG oDlg TITLE "Transportadora" FROM 0,0 TO 140,360 OF oMainWnd PIXEL
     
     @ 16,10 SAY RetTitle("F1_MARCA1") SIZE 45,09             OF oDlg PIXEL
     @ 14,50 MSGET oMarca VAR cMarca SIZE 120,09              OF oDlg PIXEL

     @ 36,10 SAY  RetTitle("F1_NUMER1")           SIZE 45,09              OF oDlg PIXEL
     @ 34,50 MSGET oNum VAR cNum        SIZE 120,09             OF oDlg PIXEL 
     
     //DEFINE SBUTTON FROM 50,143 TYPE 1 ACTION GravMot(aCamposRet,cMarca,cNum) ENABLE OF oDlg     
     
     DEFINE SBUTTON oBtnOk FROM 50,143 TYPE 1 ACTION {||oDlg:End()} ENABLE OF oDlg
                                       
     ACTIVATE MSDIALOG oDlg CENTERED

     aCamposPar:= {{"F1_MARCA1",cMarca},;
                    {"F1_NUMER1",cNum}}


Return aCamposPar

/*            
Static Function GravMot(aCamposRet,cMarca,cNum)

     aCamposRet := {{"F1_MARCA1",cMarca},;
                    {"F1_NUMER1",cNumero}}

Return Nil
*/
