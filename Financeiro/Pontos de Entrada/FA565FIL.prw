#Include 'Protheus.ch'
#INCLUDE "topconn.ch"

/*/{Protheus.doc} FA565FIL

Ponto de Entrada Filtrar Titulos na liquidação do contas a pagar


@author Marcos Godinho
@since 16/10/2019
@version P12
@param Nao recebe parametros
@return xRet
/*/

User Function FA565FIL()
  Local cQuery 	:= ''
  Local cFilExta  :=''
    //ultimo parametro faz ja retornar no formato SQL
  If !FWIsInCallStack('liquidae2')
      If Aviso("ATENÇÃO!","Filtra Titulo?",{"Não","Sim"}) == 1
          Return cQuery
      Else
          cQuery += " AND " + BuildExpr("SE2",,cFilExta,.T.)
      EndIf
  Else
      // Habilita filtro da natureza considerando a rotina de liquidar CTE
      cQuery += " AND E2_NATUREZ BETWEEN '"+cDaNatu+"' AND '"+cAteNatu+"'  "
  Endif
Return cQuery

// aSelFil


User function FA565ADDCPO
  Local cQry := ""

  If FWIsInCallStack('liquidae2')

    cQry += "SELECT M0_CODIGO,M0_CODFIL FROM SYS_COMPANY "
    cQry += "WHERE D_E_L_E_T_ = ' '  "
    cQry += "AND M0_CODIGO = '01' "
    cQry += "AND M0_CODFIL BETWEEN '"+cDaFil+"' AND '"+cAteFil+"' "

    If Select("CSM0")
      csm0->(dBcloseArea())
    Endif
    TcQuery cQry New Alias "CSM0"

    Do While !csm0->(eof())
  		aadd(aSelFil,Alltrim(csm0->m0_codfil))
      csm0->(dbskip())
    Enddo

    csm0->(dBcloseArea())

  Endif

Return
