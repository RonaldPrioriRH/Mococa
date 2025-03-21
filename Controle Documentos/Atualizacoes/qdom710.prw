#include "rwmake.ch"        // incluido pelo assistente de conversao do AP5 IDE em 26/06/00
#include "topconn.ch"        // incluido pelo assistente de conversao do AP5 IDE em 26/06/00
#include "protheus.ch"        // incluido pelo assistente de conversao do AP5 IDE em 26/06/00

User Function qdom710()        // incluido pelo assistente de conversao do AP5 IDE em 26/06/00

/*/
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
北谀哪哪哪哪穆哪哪哪哪哪履哪哪哪履哪哪哪哪哪哪哪哪哪哪哪履哪哪穆哪哪哪哪哪勘�
北矲un嘺o    砆DOM601   � Autor � Programacao Quality   � Data � 14/09/99 潮�                            
北媚哪哪哪哪呐哪哪哪哪哪聊哪哪哪聊哪哪哪哪哪哪哪哪哪哪哪聊哪哪牧哪哪哪哪哪幢�
北矰escri嘺o 砊ransfere os valores das var. de memoria para var. do word  潮�
北媚哪哪哪哪呐哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪幢�
北� Uso      � 			                                                  潮�
北滥哪哪哪哪牧哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪哪俦�
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌哌�
/*/

Local _xi := 0 
//Variaveis do .DOT Padrao
OLE_SetDocumentVar( oWord, "Adv_NomeFilial"        , cNomFilial )                                            	//01 - Filial do Sistema
OLE_SetDocumentVar( oWord, "Adv_CopiaControlada"   , cTpCopia )                                              	//02 - Copia Controlada
OLE_SetDocumentVar( oWord, "Adv_Cancel"            , If( M->QDH_CANCEL == 'S','Documento Cancelado',' ' ) ) //03 - Cancelado
OLE_SetDocumentVar( oWord, "Adv_Obsoleto"          , If( M->QDH_OBSOL  == 'S','Documento Obsoleto' ,' ' ) )	//04 - Obsoleto
OLE_SetDocumentVar( oWord, "Adv_DTpDoc"            , QDXFNANTPD( M->QDH_CODTP, .t. ) )                     	//05 - Tipo
OLE_SetDocumentVar( oWord, "Adv_DataVigencia"      , if(Valtype(M->QDH_DTVIG) == 'D',DtoC( M->QDH_DTVIG ),' ')) //06 - Data de Vigencia
OLE_SetDocumentVar( oWord, "Adv_Titulo"            , M->QDH_TITULO )                                  	     	//07 - Titulo
OLE_SetDocumentVar( oWord, "Adv_Objetivo"          , cObjetivo )                        								//08 - Objetivo
OLE_SetDocumentVar( oWord, "Adv_NUsrR"             , cNomRece )                                             	//09 - Destinatario
/*
If Empty( cNomRece )
   OLE_SetDocumentVar( oWord, "Adv_NDeptoR"        , " " )
Else                                                                                                        	//10 - Departamento do Destinatario ( Nome )
   OLE_SetDocumentVar( oWord, "Adv_NDeptoR"        , QA_NDEPT( QDG->QDG_DEPTO,.T.,QDG->QDG_FILMAT) )     
Endif
*/
OLE_SetDocumentVar( oWord, "Adv_NDeptoR"           , QA_nDeptos( M->QDH_FILIAL, M->QDH_DOCTO, M->QDH_RV ) )	//11 - Departamento Recebedores - Distribuicao ( Nome )
OLE_SetDocumentVar( oWord, "Adv_NDeptoD"           , QA_nDeptos( M->QDH_FILIAL, M->QDH_DOCTO, M->QDH_RV ) )	//11 - Departamento Recebedores - Distribuicao ( Nome )
OLE_SetDocumentVar( oWord, "Adv_Sumario"           , cSumario )                                            	//12 - Sumario
OLE_SetDocumentVar( oWord, "Adv_MotivoRevisao"     , cMotRevi )                                             	//13 - Motivo da Revisao
OLE_SetDocumentVar( oWord, "Adv_ApelidoElaborador" , cApElabo )                                             	//14 - Elaboradores( Apelido )
OLE_SetDocumentVar( oWord, "Adv_ApelidoRevisor"    , cApRevis )                                             	//15 - Revisores( Apelido )
OLE_SetDocumentVar( oWord, "Adv_ApelidoAprovador"  , cApAprov )                                             	//16 - Aprovadores( Apelido )
OLE_SetDocumentVar( oWord, "Adv_ApelidoHomologador", cApHomol )                                             	//17 - Homologador ( Apelido )
OLE_SetDocumentVar( oWord, "Adv_Docto"             , Alltrim( M->QDH_DOCTO ) )                              	//18 - Codigo do Documento
OLE_SetDocumentVar( oWord, "Adv_Rv"                , M->QDH_RV )                                            	//19 - Numero da Revisao
OLE_SetDocumentVar( oWord, "Adv_Rodape"            , cRodape )                                              	//20 - Rodape


OLE_SetDocumentVar( oWord, "Adv_MdpCodigo",             cCodAtu )                                             
OLE_SetDocumentVar( oWord, "Adv_MdpNovCod",             cCodNov )                                             
OLE_SetDocumentVar( oWord, "Adv_MdsDescr",              cDescr  )                                             
OLE_SetDocumentVar( oWord, "Adv_MdpDe",                 cDe )                                             
OLE_SetDocumentVar( oWord, "Adv_MdpPara",               cPara )                                           
OLE_SetDocumentVar( oWord, "Adv_MdpRaz",                cMdpRaz )                                         
OLE_SetDocumentVar( oWord, "Adv_MdpObs",                cMdpObs )                                         
OLE_SetDocumentVar( oWord, "Adv_MdsRaz",                cMdsRaz )                                         
OLE_SetDocumentVar( oWord, "Adv_MdsObs",                cMdsObs )                                         


// Outras variaveis ja definidas que podem ser utilizadas

OLE_SetDocumentVar( oWord, "Adv_ApelidoDestino",     QA_nUsr( cFilApDes, cCodApDes, .t., "A" ) )            //20 - Destinatario ( Apelido ) 
OLE_SetDocumentVar( oWord, "Adv_ApelidoSolicitante", QA_nUsr( cFilApSol, cCodApSol, .t., "A" ) )            //21 - Solicitante ( Apelido ) *** Quando de uma solicitacao de alteracao ***
OLE_SetDocumentVar( oWord, "Adv_Elaborador",         cElabora )                                             //22 - Elaborador ( Nome )
OLE_SetDocumentVar( oWord, "Adv_Revisor",            cRevisor )                                             //23 - Revisor ( Nome )
OLE_SetDocumentVar( oWord, "Adv_Aprovador",          cAprovad )                                             //24 - Aprovador ( Nome )
OLE_SetDocumentVar( oWord, "Adv_Homologador",        cHomolog )                                             //25 - Homologador ( Nome ) 
OLE_SetDocumentVar( oWord, "Adv_Ass1",               QDXFNANASS( M->QDH_CODASS, .t. ) )                     //26 - Assunto ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_Ass2",               QDXFNANASS( M->QDH_CODAS1, .t. ) )                     //27 - Assunto 1 ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_Ass3",               QDXFNANASS( M->QDH_CODAS2, .t. ) )                     //28 - Assunto 2 ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_Ass4",               QDXFNANASS( M->QDH_CODAS3, .t. ) )                     //29 - Assunto 3 ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_Ass5",               QDXFNANASS( M->QDH_CODAS4, .t. ) )                     //30 - Assunto 4 ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_CRespR",             SI3->I3_MAT )                                          //34 - Responsavel pelo Centro de Custo ( Matricula )
OLE_SetDocumentVar( oWord, "Adv_DeptoD",             M->QDH_DEPTOD )                                        //35 - Departamento Recebedores - Distribuicao ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_DeptoE",             M->QDH_DEPTOE )                                        //36 - Departamento Elaborador ( Codigo ) 
OLE_SetDocumentVar( oWord, "Adv_NDeptoE",            QA_nDept( M->QDH_DEPTOE, .t., M->QDH_FILMAT ) )        //37 - Departamento Elaborador ( Nome )
OLE_SetDocumentVar( oWord, "Adv_CPastaR",            QDG->QDG_CODMAN )                                      //38 - Pasta ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_NPastaR",            QDXFNANMAN( QDG->QDG_CODMAN, .t., QDJ->QDJ_FILMAT ) )  //39 - Pasta ( Nome )
OLE_SetDocumentVar( oWord, "Adv_DeptoR",             QDG->QDG_DEPTO )                                       //40 - Departamento do Destinatario ( Codigo )
OLE_SetDocumentVar( oWord, "Adv_NRespR",             QA_nUsr( SI3->I3_FILMAT, SI3->I3_MAT ) )               //41 - Responsavel pelo Departamento doDestinatario ( Nome )
OLE_SetDocumentVar( oWord, "Adv_DataEmissao",        DtoC( cDtEmiss ) )                                     //42 - Data de Emissao
OLE_SetDocumentVar( oWord, "Adv_DataValidade",       DtoC( M->QDH_DTLIM ) )                                 //43 - Data de Validade
OLE_SetDocumentVar( oWord, "Adv_DataImplantacao",    DtoC( M->QDH_DTIMPL ) )                                //44 - Data de Implantacao
OLE_SetDocumentVar( oWord, "Adv_DataDistribuicao",   DtoC( QD1->QD1_DTGERA ) )                              //45 - Data de Distribuicao

//FABRICIO - MOCOCA
dbSelectArea("SM0")
dbSetOrder(1)
dbSeek(cEmpAnt + cFilAnt)
OLE_SetDocumentVar( oWord, "Adv_x_EndEmpresa"	,	SM0->M0_ENDCOB 	)                              //46 - Endere鏾 da empresa
OLE_SetDocumentVar( oWord, "Adv_x_CNPJEmpresa"	,	SM0->M0_CGC 	)                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_CidEmpresa"	,	SM0->M0_CIDCOB 	)                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_BairroEmpresa",	SM0->M0_BAIRCOB )                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_UFEmpresa"	,	SM0->M0_ESTCOB 	)                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_CEPEmpresa"	,	SM0->M0_CEPCOB 	)                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_INSCEmpresa"	,	SM0->M0_INSC 	)                              //47 - CNPJ da empresa
OLE_SetDocumentVar( oWord, "Adv_x_TELEmpresa"	,	SM0->M0_TEL 	)                              //47 - CNPJ da empresa


//PESQUISA O DEPARTAMENTO DOS ENVOLVIDOS
//FABRICIO - 10/05/2017
_aEnv 		:= {cElabora,cRevisor,cAprovad,cHomolog}
_aDeptoEnv 	:= {"Adv_x_Depto_Elaborador","Adv_x_Depto_Revisor","Adv_x_Depto_Aprovador","Adv_x_Depto_Homologador"}

For _xi := 1 to Len(_aEnv)
	dbSelectArea("QAA")
	dbSetOrder(8)
	dbGoTop()
	dbSeek(_aEnv[_xi])

	dbSelectArea("QAD")
	dbSetOrder(4)
	dbGoTop()
	dbSeek( QAA->QAA_CC )

	OLE_SetDocumentVar( oWord, _aDeptoEnv[_xi]	,	QAD->QAD_DESC	)
Next

Return


