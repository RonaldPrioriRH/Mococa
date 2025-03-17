#include 'protheus.ch'
#include 'parmtype.ch'
#include "apvt100.ch"

user function RACDA010()
	LOCAL aArea := GetArea()
	LOCAL nOpcao1
	LOCAL aMenu
	VTClear()

	nLin:=1

	@nLin,00 VTSay "Inventariar:"
	nLin+=2
	aMenu := {"Produtos Acabados","Outros Produtos","Sair"}


	While .t.
		nOpcao1:=VTaChoice(nLin,0,VTMaxRow(),VTMaxCol(),aMenu,,,nOpcao1)

		Do Case
			Case nOpcao1 == 1
			ACDA0101()
			Case nOpcao1 == 2
			VTAlert("Opção não implementada!")
			Loop
			Case nOpcao1 == 3
			exit
		EndCase	

	Enddo

	restarea(aArea)
return ( NIL )


/*
{Leitura de Etiquetas para lançamento de Saldos Inicias de Produtos Acabados utilizando a etiqueta
customizada de expedição}
*/
Static Function ACDA0101()
	LOCAL aArea := GetArea()
	LOCAL cEndereco := Space(TamSx3("BE_LOCAL")[1]+TamSx3("BE_LOCALIZ")[1])
	LOCAL cEtiqueta :=  space(U_DecEtq() + 1)
	LOCAL cLoteOP
	LOCAL cProduto
	LOCAL cLetraMQ
	LOCAL cPalete
	VTClear()
	

	While .t.
		VTClear()
		nLin:=1
		cEndereco := Space(TamSx3("BE_LOCAL")[1]+TamSx3("BE_LOCALIZ")[1])
		@nLin,00 VTSay "Endereco :"
		@nLin,11 VTGet cEndereco Valid(VldEnd(@cEndereco))
		VTRead

		if ( VTLastKey() == 27 )  
		 if VTYesNo("Deseja sair?","Sair") 
		 	exit
		 else
		 	loop
		 endif
		
				
		else

			While .t.
				nLin:=3
				@nLin,00 VTSay "Leia a Etiqueta"
				nLin+=1
				@nLin,00 VTGet cEtiqueta valid(VldEtq(cEndereco,cEtiqueta))
				VTRead
				
				If ( VTLastKey() == 27 ) .or. Empty(cEtiqueta)
					exit
				endif
				
				
				U_DecEtq(cEtiqueta,@cProduto,@cLoteOP,@cLetraMQ,@cPalete,.T.)

			Enddo


		endif

	Enddo

	restArea(aArea)
return ( NIL )



/*
{Valida se um endereço existe}
*/
Static Function VldEnd(cEndereco)
	LOCAL aArea := GetArea()
	LOCAL lRet 	:= .f.
	SBE->(DbSetOrder(1)) //Armazem + Endereco
	if Empty(cEndereco)
		VTAlert("Informe um Endereço!")
	elseif !SBE->(DbSeek(FwxFilial("SBE")+cEndereco))
		VTAlert("Endereço inexistente!")
		cEndereco := Space(TamSx3("BE_LOCAL")[1]+TamSx3("BE_LOCALIZ")[1])
	else
		lRet := .t.
	endif


	RestArea(aArea)
Return ( lRet )


/*
{Valida a Etiqueta lida}
*/

Static Function VldEtq()
LOCAL aArea := GetArea()


restarea(aArea)
return