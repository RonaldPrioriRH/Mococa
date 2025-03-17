#INCLUDE 'RWMAKE.CH'
#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'TOPCONN.CH'


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MGLT045   �Autor  �Irenio S. Oliveira  � Data �  20/10/10   ���
�������������������������������������������������������������������������͹��
���Desc.     �Gera��o do arquivo TXT para exporta��o do portal de convenio���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User function MGLT045()

LOCAL nOpca := 0
Local aSays:={}, aButtons:={}
Local cFunction:= "MGLT045"
Local cTitle:= "Arquivo TXT - Portal Convenio - GLT"
Local bProcess:= {|oSelf|U_MGLT045P(oSelf)}
Local cDescription:= "Rotina com o objetivo de gerar um arquivo TXT para exporta��o de dados para o portal!"

Private	cperg := "MGLT045"
PRIVATE cCadastro 	:= "Arquivo TXT - Portal Convenio - GLT"

PRIVATE aRotina := MenuDef()
PRIVATE lCabecalho

validperg()


tNewProcess():New( cFunction, cTitle, bProcess, cDescription, cPerg )


return

//Defini��o do menu
Static Function MenuDef()
Local aRotina:={ 	{ "Localizar","AxPesqui" , 0 , 1},;  //"Localizar"
{ "Incluir","Axinclui" , 0 , 3}}  //"Classificar"
Return(aRotina)


User function MGLT045P(oSelf)


//��������������������������������������������������������������������������Ŀ
//� Cria arquivo principal...                                                 �
//����������������������������������������������������������������������������
Private cArqTxt := TRIM(MV_PAR05)
Private dDataSalv := dDataBase
Private aErros := {}
Private nHdl    := fCreate(cArqTxt)
If nHdl == -1
	MsgAlert("O arquivo de nome "+cArqTxt+" n�o pode ser executado! Verifique os par�metros.","Aten��o!")
	Return
Endif

//_lnovarq := .t.

//��������������������������������������������������������������������������Ŀ
//� Monta query principal...                                                 �
//����������������������������������������������������������������������������



cSQL := "SELECT A1_COD,A1_LOJA,A1_NOME,A1_NREDUZ,A1_CGC,A1_INSCR,A1_MUN,A1_EST,A1_LC,A1_SALDUP,A1_VENCLC "
cSQL += "FROM "+retsqlname('SA1')+" SA1  "
cSQL += "WHERE SA1.D_E_L_E_T_ = ' ' "
cSQL += "AND A1_COD >= '"+MV_PAR02+"' AND A1_COD <= '"+MV_PAR03+"' "
cSQL += "AND A1_LC > 0 AND A1_MSBLQL <> '1' AND A1_VENCLC <= '"+DTOS(MV_PAR04)+"'"

msgrun("Aguarde... Buscando dados...",,{||cursorwait(),PLSQuery(cSQL,"TSA1"),cursorarrow()})

If TSA1->(Eof())
	TSA1->(DbCloseArea())
	Help("",1,"RECNO")
	Return
Endif

oSelf:SetRegua1(TSA1->(LastRec()))

TSA1->(dbgotop())
While ! TSA1->(Eof())
	
	oSelf:IncRegua1("Processando Registro: "+TSA1->A1_COD+"/"+TSA1->A1_LOJA+" - "+TRIM(TSA1->A1_NREDUZ)+"...")
	
	
	If MV_PAR01 == 1
	
	cLin := TSA1->A1_COD+'  '
	cLin += TSA1->A1_LOJA+'  '
	cLin += TSA1->A1_NOME+'  '
	//cLin += TSA1->A1_L_LI_RO+'  '
	cLin += TSA1->A1_CGC+'  '
	cLin += TSA1->A1_INSCR+'  '
	cLin += TSA1->A1_MUN+'  '
	cLin += TSA1->A1_EST+'  '
	cLin += transform((TSA1->A1_LC * 100),"@E 99999999999")+'  '
	cLin += transform(((TSA1->A1_LC - TSA1->A1_SALDUP)  * 100),"@E 99999999999")+'  '
	cLin += Dtoc(TSA1->A1_VENCLC)+'  '
	cLin += CRLF

    Else
	
	cLin := TSA1->A1_COD+'  '
	cLin += TSA1->A1_LOJA+'  '
	cLin += TSA1->A1_NOME+'  '
	cLin += transform((TSA1->A1_LC * 100),"@E 99999999999")+'  '
	cLin += transform(((TSA1->A1_LC - TSA1->A1_SALDUP)  * 100),"@E 99999999999")+'  '
	cLin += Dtoc(TSA1->A1_VENCLC)+'  '
	cLin += CRLF
	
	Endif    
	
	If fWrite(nHdl,cLin,Len(cLin)) != Len(cLin)
		If !MsgAlert("Ocorreu um erro na grava��o do arquivo. Continua?","Aten��o!")
			Exit
		Endif
	Endif
	
TSA1->(Dbskip())
	

Enddo

//�--------------------------------------------------------------------�
//| Fecha arquivo...                                                   |
//�--------------------------------------------------------------------�
TSA1->(DbCloseArea())
fclose(nHdl)
// O arquivo texto deve ser fechado, bem como o dialogo criado na fun��o anterior

return


/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �VALIDPERG � Autor � AP5 IDE            � Data �  07/04/03   ���
�������������������������������������������������������������������������͹��
���Descri��o � Verifica a existencia das perguntas criando-as caso seja   ���
���          � necessario (caso nao existam).                             ���
�������������������������������������������������������������������������͹��
���Uso       � Programa principal                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function ValidPerg

Local _sAlias := Alias()
Local aRegs := {}
Local i,j

dbSelectArea("SX1")
dbSetOrder(1)
cPerg := PADR(cPerg,10)

//(sx1) Grupo/Ordem/Pergunta/Variavel/Tipo/Tamanho/Decimal/Presel/GSC/Valid/Var01/Def01/Cnt01/Var02/Def02/Cnt02/Var03/Def03/Cnt03/Var04/Def04/Cnt04/Var05/Def05/Cnt05
aAdd(aRegs,{cPerg,"01","Tipo de exporta��o ?","","","mv_ch1" ,"C", 1,0,0,"C","","mv_par01","Fornecedor","","","","","Limite","","","","","","","","","","","","","","","","","","","DIR",""})
aAdd(aRegs,{cPerg,"02","Do Fornecedor      ?","","","mv_ch2" ,"C", 6,0,0,"G","","mv_par02" ,"","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"03","Ate Fornecedor     ?","","","mv_ch3" ,"C", 6,0,0,"G","","mv_par03" ,"","","","","","","","","","","","","","","","","","","","","","","","","SA2",""})
aAdd(aRegs,{cPerg,"04","Data vencto Limite ?","","","mv_ch4" ,"D", 8,0,0,"G","","mv_par04" ,"","","","","","","","","","","","","","","","","","","","","","","","","",""})
aAdd(aRegs,{cPerg,"05","Arquivo de saida   ?","","","mv_ch5" ,"C", 60,0,0,"C","","mv_par05"  ,"","","","","","","","","","","","","","","","","","","","","","","","","DIR",""})
//aAdd(aRegs,{cPerg,"04","Aglutina Lan�amentos?","","","mv_ch4" ,"C", 1,0,0,"C","","mv_par04","","","","","","","","","","","","","","","","","","","","","","","","","CT5",""})

For i:=1 to Len(aRegs)
	If !dbSeek(cPerg+aRegs[i,2])
		RecLock("SX1",.T.)
		For j:=1 to FCount()
			If j <= Len(aRegs[i])
				FieldPut(j,aRegs[i,j])
			Endif
		Next
		MsUnlock()
	Endif
Next

dbSelectArea(_sAlias)

return


