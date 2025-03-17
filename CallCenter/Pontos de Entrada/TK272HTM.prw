#Include 'Protheus.ch'
#Include 'TopConn.ch'

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  TMKGRAVA     �Autor  �Raphael Martins   � Data �  22/08/22   ���
�������������������������������������������������������������������������͹��
���Desc.     �  Complementa o corpo do e-mail do Telemarketing 			   ��
���          �  [ aCabecalho ], [ aItens ], [ nOpc ], [ aSx3SUC ],         ��
���          �  [ aParScript ] )                                           ��
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function TK272HTM()

Local _cHtml    := ""
Local _aCabecalho := ParamIxb[1]
Local _aItens := ParamIxb[2]
Local _aSx3SUC := ParamIxb[4]
Local _aParScript := ParamIxb[5]
Local _cPriori   := ''

       If Len(_aCabecalho) > 0

            If(SUC->UC_XPRIORI == '1')
                _cPriori := 'Normal'  
            ElseIf (SUC->UC_XPRIORI == '2')
                _cPriori := 'Urgente' 
            Else
                _cPriori := 'Extraordin�rio' 
            EndIf

            aadd(_aCabecalho,_cPriori)   //Prioridade 1=Normal;2=Urgente;3=Extraordinario       
            aadd(_aCabecalho,SUC->UC_XPROTOC) //N� Protocolo
            aadd(_aCabecalho,SUC->UC_XDTCOMP) //Data da Compra
            aadd(_aCabecalho,SUC->UC_XDSMQ)   //Desc M�quina
            aadd(_aCabecalho,IIF(SUC->UC_XIDENTP =='V','Visual','Sensorial'))  //Identifica��o do Problema V=Visual;S=Sensorial
            aadd(_aCabecalho,IIF(SUC->UC_XTPEMB =='T','Tetra Pak','SIG'))  // Tipo Embalagem V=Visual;S=Sensorial
            aadd(_aCabecalho,IIF(SUC->UC_XLAUDO =='S','Sim','N�o')) // Laudo T�cnico  S=Sim;N=N�o

            _cHtml := '<p><span style="color: black; font-family: Verdana; font-size: small;"><strong>Dados Complementares</strong></span></p> '
            _cHtml += '<table border="1" width="1200"> '
            _cHtml += '<tbody> '
            _cHtml += '<tr> '
            _cHtml += '<td bgcolor="White" width="75"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Prioridade do Atendimento</strong></span></td> '
            _cHtml += '<td bgcolor="White" width="232"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>N&ordm; Protocolo</strong></span></td> '
            _cHtml += '<td align="left" bgcolor="White" width="180"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Data da Compra</strong></span></td> '
            _cHtml += '<td align="left" bgcolor="White" width="43"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Descri&ccedil;&atilde;o da M&aacute;quina</strong></span></td> '
            _cHtml += '<td align="left" bgcolor="White" width="43"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Identifica&ccedil;&atilde;o do Problema</strong></span></td> '
            _cHtml += '<td align="left" bgcolor="White" width="43"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Tipo da Embalagem</strong></span></td> '
            _cHtml += '<td bgcolor="White" width="92"><span style="color: Blue; font-family: Verdana; font-size: small;"><strong>Laudo T&eacute;cnico</strong></span></td> '
            _cHtml += '</tr> '
            _cHtml += '<tr> '
            _cHtml += '<td width="75"><span style="font-family: Arial; font-size: small;"> '+_aCabecalho[15]+' </span></td>  '
            _cHtml += '<td align="left" width="232"><span style="font-family: Arial; font-size: small;">'+_aCabecalho[16]+'</span></td> '
            _cHtml += '<td align="left" width="180"><span style="font-family: Arial; font-size: small;">'+DtoC(_aCabecalho[17])+'</span></td> '
            _cHtml += '<td align="left" width="43"><span style="font-family: Arial; font-size: small;">'+_aCabecalho[18]+'</span></td> '
            _cHtml += '<td align="left" width="43"><span style="font-family: Arial; font-size: small;">'+_aCabecalho[19]+'</span></td> '
            _cHtml += '<td align="left" width="43"><span style="font-family: Arial; font-size: small;">'+_aCabecalho[20]+'</span></td> '
            _cHtml += '<td width="92"><span style="font-family: Arial; font-size: small;">'+_aCabecalho[21]+'</span></td> '
            _cHtml += '</tr> '
            _cHtml += '</tbody> '
            _cHtml += '</table> ' 

        EndIf

Return _cHtml
