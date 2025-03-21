#Include "Protheus.ch"
#Include "totvs.ch"

User Function funTraduz(_cString,_cIdioma)

	Local aPalavPort :=  {"Contagem total","Bolores e Leveduras","Estafilococos aureus","Coliformes Totais","Col. Termotolerantes","Salmonella spp","Bacillus cereus",;
				"Ph","APROVADO SEM RESTRICOES***","Nota","Minimo","Maximo","Produto","Data da Producao","Cliente","Validade","Pedido","Container","Lote","Qtd.Expedida","Certificado de Analises","Operacao",;
				"Certificado de Qualidade","presenca","ausencia","grupo","empresa","folha","dt.ref","emiss�o","janeiro","fevereiro","mar�o","abril","maio","junho",;
				"julho","agosto","setembro","outubro","novembro","desembro","Ensaio","alimenticios","Metodo","Un. Medido","Especificado","Encontrados","Contagem Total",;
				"Contagem de Bolores e Leveduras","Contagem de Coliformes Totais","Contagem de Staphylococcus Aureus","ShelfLife 180 Dias","LABFIS","Viscosidade",;
				"Aprovado Sem Restricoes","Contaminantes","Analise Externa","AFLATOXINA","ARS�NICO","CHUMBO","C�DMIO","REALIZAO APENAS LATAS LCO","ESTANHO","Laudo",;
				"Data. Laudo","Qtde. Rej","Just. Laudo","Aprovado sem Restricoes","Metodos","RESULTADOS","Unidade","M�x","ITENS","Analista de Laboratorio",;
				"Analista Microbiologia","Coordenadorade CQ e GQ","DENSIDADE","GORDURA","SOLIDOS TOTAIS","ACIDEZ","pH","VISCOSIDADE","BRIX","UMIDADE","CRISTALIZACAO",;
				"VISCOSIDADE","dia","SENSORIAL","LABFIS","ASPECTO","NOTA","COR","ODOR","TEXTURA","PH 4 DIAS","EXP(WAL,TO,CH,VAN,OM","MERCADO EXTERNO","SHELF LIFE 210 DIAS",;
				"SHELF LIFE 240 DIAS","CONTRA PROVA 150 DIA","SHELF LIFE 60 DIAS","LIBERACAO PROCESSO","SHELF LIFE 150 DIAS","PREPARO CRE HERCULES","INST BAG CARGIL",;
				"MICROBIOLGIA","FISICO QUIMICA","SHELF LIFE 360 DIAS","SHELF LIFE 510 DIAS","SHELF LIFE 540 DIAS"," ACOMP. ENVASE","FISICO QUIMICAS","ENVASE LCO",;
				"TANQUE ESTOCAGEM","ESTABILIZADO","SHELF LIFE 120 DIAS","PREPARO CRE ING/ESP","LIOT�CNICA/GRANEL","SHELF LIFE 180 DIAS","SHELF LIFE 390 DIAS","CONTRA PROVA",;
				"PASTEURIZADO","SHELF LIFE 30 DIAS","SHELF LIFE 90 DIAS","NACIONAL","ARCOR-GRANEL","ARCOR BIG BAG 5KG","MISTURA DE CHOCOLATE","ACOMP. ENVASE",;
				"LEITE PADRONIZADO","SHELF LIFE 270 DIAS","SHELF LIFE 450 DIAS","SHELF LIFE 480 DIAS","MICROBILOGIA","LIBERACAO ESTOCAGEM","LEITE UHT ACOMP",;
				"PREPARO CREME MOCOCA","SHELF LIFE 420 DIAS","MICROLOGIA","MICROBIOLOGIA","LEITE UHT PA FQ","XAROPE BBL","ENCAIXOTAMENTO BAG","FISICO QUIMICA 1�DIA",;
				"CREME UHT PA FQ","ACOMPANHAMENTO SILO","PH DE 4 DIAS","SENSORIAL","EXP(LA CAMP,CAMPESTR","ACOMPANHAMENTO","PADRONIZADO","INSTITUCIONAL(BAG)",;
				"EXPORTACAO (EUA)","FASES","CREME UHT ACOMP","SHELF LIFE 300 DIAS","SHELF LIFE 330 DIAS","ENCAIXOTAMENTO LCO","ACOMP. CREME CRU","G/M�","PORCENTAGEM",;
				"N�VEL","MILIGRAMA/QUILOGRAMA","JOGO","QUILOGRAMA","KIT","POLEGADAS","JARDA","CENTIPOISE","NANOMETRO","UNIDADE FORMADORA DE COLONIAS POR GRAMAS",;
				"FOLHA","ROTACAO POR MINUTO","GRAUS BRIX","NUMERO POR 100g","ACIDEZ DORNIC","GRAMAS","GRAMAS POR CENTIMETRO QUADRADO","GRAMAS POR METRO CUBICO",;
				"MICRO GRAMA/QUILOGRAMA","ROLO","BALDE","CENTIMETRO","TONELADA LIQUIDA","MINUTOS","UNID FORMADORA DE COL�NIA","MILHEIRO","GRAUS Z","POTENCIAL DE HIDROGENIO",;
				"UNIDADE FORMADORA DE COLONIAS","MESH","CONJUNTO","�DORNIC","NIVEL","GRAMAS POR METRO QUDRADO","DECIMETRO","DUZIA","FOLHAS","GROZA","HORA","LITRO","LATA",;
				"�GL","PARTICULAS MAGNETICAS","UFC/100cm�","ML","MICRO","BLOCO","NITIDEZ POR TURBIDEZ","UNIDADE","�Z","UI-M�x","POTENCIAL DE HIDROG�NIO","GRAUS GL",;
				"�D","BAR","kg/m�","FRASCO","PACOTE","METRO QUADRADO","PAR","ACIDO LATICO","QUILOGRAMA FORCA POR CENTIMETRO QUADRADO","GRAUS CENTIGRADOS","UNIDADE FORMADORA DE COLONIAS POR ML",;
				"CONTAGEM DE CELULAS SOMATICAS","~HAZEN","NEWTON POR METRO","MILIGRAMA","GRAMAS POR LITRO","CENTIMETRO QUADRADO","MILAMPER","ARROBA","CENTIMETRO CUBICO",;
				"CENTO","CAIXA","GRAMA","LIBRA","METRO CUBICO","METRO","ONCA","SEGUNDOS","Volume","GRAMAS POR ML","PES","GALAO","MILILITRO","PECA","CINZAS","Kgf/cm","MIRIAMETRO",;
				"MINUTO","TESTE","GRAMAS POR METRO","QUILOGRAMA FORCA POR CENTIMETRO","SACO","NOTA DE1 A 5","ESCALA DE UMIDADE","GRAUS H","BANDEJA","MILIMETRO","CENTIGRADOS",;
				"GRAMAS POR MILILITROS","QUILOGRAMA FORCA POR CENTIMETRO CUBICO","PARTE POR MILHAO","UNID.FOR.COLONIAS POR CENTIMETRO QUADRAD","NUMERO MAIS PROVAVEL",;
				"ATIVIDADE PROTEASE","mPas","Cps","TONELADA","GRAMAS POR CENTIMETRO","GRAMAS POR CENTIMETRO CUBICO","CONTAGEM TOTAL","CONTAGEM DE COLIFORMES TOTAIS","BACILLUS CEREUS","VISCOSIDADE 1�DIA","BRIX 1�DIA","SENSORIAL","VISCOSIDADE 6�DIA","GORDURA","TEMPERATURA","VISCOSIDADE",;                            
				"ASPECTO","COR","VOLUME (TANQUE)","CONTAGEM DE STAPHYLOCOCCUS AUREUS","ACIDEZ","CONTAGEM DE BOLORES E LEVEDURAS","SORO","PEROXIDASE","BRIX","CONTAGEM DE BACILLUS SPOROTHERMODURANS",; 
				"PSICOTROFICOS","DENSIDADE","CONTAGEM DE COLIFORMES TERMOTOLERANTES","FOSFATASE","CONTAGEM DE MES�FILOS AER�BIOS VI�VEIS","ODOR","EXTRATO SECO TOTAL","CRIOSCOPIA","SALMONELA",;                              
				"FORMALDEIDO (METODO LENTO)","FORMALDEIDO (METODO RAPIDO)","TEXTURA","SABOR","pH","ALCOOL","UMIDADE","CRISTALIZACAO","pH 1�DIA","SOLIDOS TOTAIS","EXTRATO SECO DESENGORDURADO",;            
				"CONTAGEM DE COLIFORMES TERMOTOLERANTE","SOLIDOS N�O GORDUROSOS","PEROXIDO DE HIDROG�NIO","CONTAGEM DE MICROORGANISMOS PSICOTROFICO","ENCAIXOTAMENTO BBL","ENVASE CRE","ENVASE TP ","FABRICA��O LEITE PO ","DESN/PASTEURIZ","ENVASE LCO","FABRICA��O MIX BBL","FABRICA��O BBL","FABRICA��O CRE","ENVASE 1 KG ","RECEBIMENTO SORO LIQ","RECEBIMENTO DESN",;
				"ENVASE BAG","ENVASE BBL","FABRICA��O LCO","FABRICA��O MIXLCO ","FABRICA��O MIX CRE","RESFRIAMENTO LEITE","FABRICA��O SORO PO","ENCAIXOT LEITE","ENVASE CREME","FABRICA��O CALDA","ENVASE LEITE UHT","ENCAIXOTAMENTO 1KG",;
				"ENCAIXOTAMENTO BAG","ENCAIXOTAMENTO TP ","ENCAIXOTAMENTO CRE","FABRICA��O XAROPE ","RECEBIMENTO CREME ","PREPARACAO CREME","RECEBIMENTO PERM","ENCAIX LEITE","PADRONIZA��O LCO","RECEBIMENTO LEITE ","RESFRIAMENTO CREME",;
				"ENCAIXOTAMENTO LCO","PADRONIZACAO LOTE ","ENCAIXOT CREME","ENVASE 1KG","FABRICACAO LCO","Aflatoxina","Ars�nico","Chumbo","C�dmio","Estanho","Analise Externa","ACEITO COM DESVIO SIMPLES","REJEITADO TOTALMENTE","ACEITO COM DESVIO GRAVE","COM SELECAO PELO PRODUTO","LIBERACAO URGENTE"}

Local aPalavEsp :=   {"Contaje Total","Mohos y Levaduras","Estafilococos aureus","Coliformes Totales","Salmonella spp","Col. Termotolerantes","Bacillus cereus",;
				"Ph","APROBADO SIN RESTRICIONES ***","Nota","M�nimo","M�ximo","Producto","Fecha de producci�n","Cliente","Duracion","Orden","Envase","Mucho","Cantidad emitida","Certificado de an�lisis",;
				"Operaci�n","Certificado de calidad","presencia","ausencia","grupo","empresa","hoja","dt.ref","emisi�n","enero","febrero","marzo","abril","Mayo","junio",;
				"julio","agosto","septiembre","octubre","noviembre","recuerdo","Prueba","comida","M�todo","Naciones Unidas. Mesurado","Especificado","Encontr�",;
				"Cuenta total","Conde de moho y levadura","Recuento total de coliformes","Staphylococcus Aureus Count","ShelfLife 180 d�as","LABFIS","Viscosidad",;
				"Aprobado Sin restricciones","Contaminantes","An�lisis externo","AFLATOXIN","ARS�NICO","DIRIGIR","CADMIO","HAGO SOLAMENTE CANS LCO","ESTA�O","Informe",;
				"Fecha. Informe","Qty. Rej","S�lo. Informe","Aprobado sin restricciones","M�todos","RESULTADOS","unidad","Max","ART�CULOS","Analista de laboratorio",;
				"Analista Microbiolog�a","Coordinador de CQ y GQ","DENSIDAD","GRASA","SOLIDOS TOTALES","ACIDEZ","pH","VISCOSIDAD","BRIX","HUMEDAD","CRISTALIZACI�N",;
				"VISCOSIDAD","d�a","SENSORIAL","LABFIS","ASPECTO","NOTA","COLOR","OzzLOR","TEXTURA","PH 4 D�AS","EXP (WAL, TO, CH, VAN, OM","MERCADO EXTERNO",;
				"VIDA �TIL 210 DIAS","VIDA �TIL 240 D�AS","CONTRA PRUEBA DE 150 D�AS","VIDA �TIL 60 D�AS","PROCESO DE LANZAMIENTO","VIDA �TIL 150 D�AS","PREPARANDO CRE HERCULES",;
				"INST BAG CARGIL","MICROBIOLGIA","PHYSICOCHEMICAL","VIDA �TIL 360 D�AS","VIDA �TIL 510 DIAS","VIDA �TIL 540 D�AS","ACCOMP. EMBALAJE","FISICA QUIMICA",;
				"CONTENEDOR LCO","ALMACENAMIENTO DE TANQUE","ESTABILIZADO","VIDA �TIL 120 D�AS","PREPARANDO CRE ING / ESP","LIOT�CNICA / BULK","VIDA �TIL 180 D�AS",;
				"VIDA �TIL 390 DIAS","CONTRA PRUEBA","PASTEURIZADO","VIDA �TIL 30 D�AS","VIDA �TIL 90 D�AS","NACIONAL","ARCOR-GRANEL","ARCOR BIG BAG 5KG","MEZCLA DE CHOCOLATE",;
				"ACCOMP. EMBALAJE","LECHE ESTANDARIZADA","VIDA �TIL 270 D�AS","VIDA �TIL 450 D�AS","VIDA �TIL 480 D�AS","MICROBILOG�A","ALMACENAMIENTO DE LA LIBERACI�N",;
				"LECHE UHT ACCOMP","PREPARANDO EL CREME MOCOCA","VIDA �TIL 420 D�AS","MICROLOG�A","MICROBIOLOG�A","LECHE UHT PA FQ","JARABE DE BBL","BOLSA DE BOXEO",;
				"F�SICA QU�MICA 1D�A","CREAM UHT PA FQ","ACOMPA�AMIENTO DE SILO","FOTOS DE 4 D�AS","SENSORIAL","EXP (LA CAMP, CAMPESTR","GUARNICI�N","ESTANDARIZADO",;
				"INSTITUCIONAL (BOLSA)","EXPORT (EE. UU.)","FASES","CREMA UHT ACCOMP","VIDA �TIL 300 D�AS","VIDA �TIL 330 D�AS","LCO BOXEO","ACCOMP. CREMA CRU","G / M�",;
				"PORCENTAJE","NIVEL","MILIGRAMA / KILOGRAM","JUEGO","KILOGRAMO","EQUIPO","PULGADAS","YARDA","CENTIPOISE","NANOMETRO","UNIDAD DE FORMACI�N DE COLMENAS DE CRECIMIENTO",;
				"HOJA","ROTACI�N POR MINUTO","GRAUS BRIX","N�MERO POR 100g","ACORN DORNIC","GRAMOS","GRADOS POR CENTIMETRO CUADRADO","GRAMOS POR METRO CUBICO",;
				"MICROGRAMAR / KILOGRAM","RODAR","CANGIL�N","CENT�METRO","L�QUIDO TONIFICADO","MINUTOS","UNIVERSIDAD DE COLONIA","Molinero","GRAUS Z","POTENCIAL DE HIDROGENO",;
				"UNIDAD DE FORMACI�N COLONIAL","MALLA","CONJUNTO","� DORNIC","NIVEL","GRAMAS PER METRO QUDRADO","DEC�METRO","DOCENA","HOJAS","GROZA","HORA","LITRO",;
				"ESTA�O","�GL","PART�CULAS MAGNETICAS","UFC / 100cm�","ML","MICRO","BLOQUEAR","NITIDEZ POR TURBIDEZ","UNIDAD","Cero","UI-Max","POTENCIAL DE HIDROGENO",;
				"GRAUS GL","�D","PUB","kg / m�","BOTELLA","PAQUETE","METRO CUADRADO","PAR","�CIDO L�CTICO","CUADRADO FORZADO POR EL CENT�METRO CUADRADO","GRADOS CENTIGADOS",;
				"UNIDAD DE ENTRENAMIENTO","CUENTA DE C�LULAS SOM�TICAS","~ HAZEN","NEWTON POR METRO","MILIGRAMO","GRAMAS PER LITRO","CENT�METRO CUADRADO","MILAMPER",;
				"Fuego","CENT�METRO C�BICO","CENTO","CAJERO","C�SPED","LB","METRO C�BICO","SUBTERRANEO","JAGUAR","SEGUNDOS","Volumen","GRAMOS POR ML","PIE","GAL�N",;
				"MILILITRO","PIEZA","CINZAS","Kgf / cm","MIRIAMETRO","MINUTO","PRUEBA","GRAMOS POR METRO","KILOGRAM FORCA PER CENTIMETER","BOLSO","NOTA DEL 1 AL 5",;
				"ESCALA DE HUMEDAD","GRAUS H","BANDEJA","MIL�METRO","CENTIGRADOS","GRAMOS POR MILILITROS","FUERZAS DE KILOGRAM POR CENTIMETRO C�BICO","PARTE PARA MILLONES",;
				"UNID.FOR.COLONIAS POR QUADRAD CENTIMETER","N�MERO M�S PROVABLE","ACTIVIDAD DE PROTEASAS","fregonas","Cps","TONELADA","GRAMOS CIENT�FICOS","GRAVES POR CENTIMETRO C�BICO",;
				"CUENTA TOTAL","CUENTA DE COLIFORMES TOTALES","BACILLUS CEREUS","VISCOSIDAD 1�DIA","BRIX 1�DIA","SENSORIAL","VISCOSIDAD 6 � D�A","GORDURA","TEMPERATURA","VISCOSIDAD","ASPECTO",;
				"COLOR","VOLUMEN (TANQUE)","CUENTA DE STAPHYLOCOCCUS AUREUS","ACIDEZ","Odor","SORO","PEROXIDASE","BRIX","CUENTA DE BACILLUS SPOROTHERMODURANS","PSICOTROFICOS",;
				"DENSIDAD","CUENTA DE COLIFORMES TERMOTOLERANTES","FOSFATASE","CONTAGEN DE MES�FILOS AER�BIOS VIBRALES","ODOR","EXTRATO SECO TOTAL","CRISCOPIA","SALMONELA","FORMALDEIDO (METODO LENTO)",;
				"FORMALDEIDO (METODO RAPIDO)","TEXTURA","SABOR","pH","ALCOOL","UNIDAD","CRISTALIZACION","pH 1�DIA","SOLIDOS TOTALES","EXTRATO SECO DESENGORDURADO","CUENTA DE COLIFORMES TERMOTOLERANTE",;
				"SOLIDOS NO GORDUROSOS","PEROXIDO DE HIDROGENO","CUENTA DE MICROORGANISMOS PSICOTROFICO","ENCUADRADO BBL","ENVASE CRE","ENVASE TP","FABRICACI�N LECHE PO","DESN / PASTEURIZ","ENVASE LCO","FABRICACI�N MIX BBL","FABRICACI�N BBL","FABRICACI�N CRE","ENVASE 1 KG","RECEPCI�N SORO LIQ","RECEPCI�N DESN","ENVASE BAG",;
				"ENVASE BBL","FABRICACI�N LCO","FABRICACI�N MIX LCO","FABRICACI�N MIX CRE","RESFRIAMIENTO LECHE","FABRICACI�N SORO PO","ENCAJOT LECHE","ENVASE CREMA","FABRICACI�N CALDA","ENVASE LECHE UHT","ENCAJES 1KG","ENCAJOTAMIENTO BAG",;
				"ENCENDIDO TP","ENCUADRO CREADO","FABRICACI�N XAROPE","RECEPCI�N CREMA","PREPARACION CREMA","RECIBIR PERMISO","ENCAJE LECHE","PADRONIZACI�N LCO","RECEPCI�N LECHE","RESFRIAMIENTO CREMA","ENCUADRADO LCO","PADRONIZACION LOTE",;
				"ENCAJOT CREME","ENVASE 1KG","FABRICACION LCO","Aflatoxina","Ars�nico","Plomo","Cdmio","Esta�o","Analisis Externo","ACEPTO CON DESVIOS SIMPLE","REJETIVO TOTALMENTE","ACEPTO CON DESVIO GRAVE","CON SELECCI�N POR EL PRODUCTO","LIBERACI�N URGENTE"}

Local aPalavIngles:= {"Total Count","Molds and Yeasts","Staphylococcus aureus","Total Coliforms","Salmonella spp","Thermotolerant Col.","Bacillus cereus",;
				"Ph","APPROVED WITHOUT RESTRICTIONS ***","Note","Minimum","Maximum","Product","Date of Production","Client","Shelf life","Order","Container","Lot","Issued Qty","Certificate of Analysis",;
				"Operation","Quality certificate","presence","absence","group","company","leaf","dt.ref","emission","January","February","March","April","May","June","July",;
				"August","September","October","November","I remember","Test","food","Method","Un. Measured","Specified","Found","Total Count","Mold and Yeast Count",;
				"Total Coliform Count","Staphylococcus Aureus Count","ShelfLife 180 Days","LABFIS","Viscosity","Approved No Restrictions","Contaminants","External Analysis",;
				"AFLATOXIN","ARSENIC","LEAD","CADMIUM","I MAKE ONLY CANS LCO","TIN","Report","Date. Report","Qty. Rej","Just. Report","Approved without Restrictions",;
				"Methods","RESULTS","unity","Max","ITEMS","Laboratory Analyst","Analyst Microbiology","CQ and GQ Coordinator","DENSITY","FAT","TOTAL SOLIDS","ACIDITY",;
				"pH","VISCOSITY","BRIX","MOISTURE","CRYSTALLIZATION","VISCOSITY","day","SENSORY","LABFIS","ASPECT","NOTE","COLOR","ODOR","TEXTURE","PH 4 DAYS","EXP (WAL, TO, CH, VAN, OM",;
				"EXTERNAL MARKET","SHELF LIFE 210 DAYS","SHELF LIFE 240 DAYS","AGAINST PROOF 150 DAY","SHELF LIFE 60 DAYS","RELEASE PROCESS","SHELF LIFE 150 DAYS",;
				"PREPARING CRE HERCULES","INST BAG CARGIL","MICROBIOLGY","PHYSICOCHEMICAL","SHELF LIFE 360 DAYS","SHELF LIFE 510 DAYS","SHELF LIFE 540 DAYS","�ACCOMP. PACKAGING",;
				"CHEMICAL PHYSICS","LCO CONTAINER","TANK STORAGE","STABILIZED","SHELF LIFE 120 DAYS","PREPARING CRE ING / ESP","LIOT�CNICA / BULK","SHELF LIFE 180 DAYS",;
				"SHELF LIFE 390 DAYS","AGAINST PROOF","PASTEURIZED","SHELF LIFE 30 DAYS","SHELF LIFE 90 DAYS","NATIONAL","ARCOR-GRANEL","ARCOR BIG BAG 5KG","CHOCOLATE MIXTURE",;
				"ACCOMP. PACKAGING","STANDARDIZED MILK","SHELF LIFE 270 DAYS","SHELF LIFE 450 DAYS","SHELF LIFE 480 DAYS","MICROBILOGY","STOCKING LIBERATION","MILK UHT ACCOMP",;
				"PREPARING CREME MOCOCA","SHELF LIFE 420 DAYS","MICROLOGY","MICROBIOLOGY","MILK UHT PA FQ","BBL SYRUP","BOXING BAG","PHYSICS CHEMICAL 1DAY","CREAM UHT PA FQ",;
				"SILO ACCOMPANIMENT","4 DAY PHOTOS","SENSORY","EXP (LA CAMP, CAMPESTR","SIDE DISH","STANDARDIZED","INSTITUTIONAL (BAG)","EXPORT (USA)","PHASES","CREAM UHT ACCOMP",;
				"SHELF LIFE 300 DAYS","SHELF LIFE 330 DAYS","LCO BOXING","ACCOMP. CREAM CRU","G / M�","PERCENTAGE","LEVEL","MILIGRAMA / KILOGRAM","GAME","KILOGRAM","KIT",;
				"INCHES","YARD","CENTIPOISE","NANOMETRO","GROWTH COLONY FORMING UNIT","LEAF","ROTATION PER MINUTE","GRAUS BRIX","NUMBER PER 100g","ACORN DORNIC","GRAMS",;
				"GRADES PER SQUARE CENTIMETER","GRAMS BY CUBIC METRO","MICRO GRAMMAR / KILOGRAM","ROLL","BUCKET","CENTIMETER","TONNED LIQUID","MINUTES","UNIVERSITY OF COLOGNE",;
				"Miller","GRAUS Z","HYDROGEN POTENTIAL","COLONIAL FORMING UNIT","MESH","SET","� DORNIC","LEVEL","GRAMAS PER METRO QUDRADO","DECIMETER","DOZEN","SHEETS","GROZA",;
				"HOUR","LITER","TIN","�GL","MAGNETIC PARTICLES","UFC / 100cm�","ML","MICRO","BLOCK","SHARPNESS BY TURBIDITY","UNITY","Zero","UI-Max","HYDROGEN POTENTIAL",;
				"GRAUS GL","�D","PUB","kg / m�","BOTTLE","PACKAGE","SQUARE METER","PAIR","LACTIC ACID","QUADOGRAM FORCED BY SQUARE CENTIMETER","CENTIGRATED GRADES","TRAINING UNIT",;
				"COUNTING OF SOMATIC CELLS","~ HAZEN","NEWTON BY METRO","MILLIGRAM","GRAMAS PER LITRO","SQUARE CENTIMETER","MILAMPER","Fire","CUBIC CENTIMETER","CENTO",;
				"CASHIER","GRASS","LB","CUBIC METER","SUBWAY","JAGUAR","SECONDS","Volume","GRAMS BY ML","FOOT","GALLON","MILLILITER","PIECE","CINZAS","Kgf / cm","MIRIAMETRO",;
				"MINUTE","TEST","GRAMS PER METER","KILOGRAM FORCA PER CENTIMETER","BAG","NOTE FROM 1 TO 5","MOISTURE SCALE","GRAUS H","TRAY","MILLIMETER","CENTIGRADOS",;
				"GRAMS PER MILILITERS","KILOGRAM FORCES BY CUBIC CENTIMETER","PART FOR MILLION","UNID.FOR.COLONIAS BY QUADRAD CENTIMETER","MOST PROVABLE NUMBER",;
				"PROTEASE ACTIVITY","mops","Cps","TONNE","CENTIMETER GRAMS","GRAVES BY CUBIC CENTIMETER","TOTAL COUNT","COLLATERAL TOTAL COUNT","BACILLUS CEREUS","viscosity 1� day","BRIX 1� DAY","SENSORY","VISCOSITY 6TH DAY","FAT","TEMPERATURE","VISCOSITY","ASPECT","COLOR","VOLUME (TANK)",;
				"STAPHYLOCOCCUS AUREUS COUNT","ACIDITY","COUNTING OF BOLORES AND YEVES","SERUM","PEROXIDASE","BRIX","COUNTING OF BACILLUS SPOROTHERMODURANS","PSYCHOTHERAPISTS","DENSITY","COUNTING OF THERMOTOLERANT COLIFORMES",;
				"FOSFATASE","COUNTING OF VIABLE AERODE MESOPHILS","ODOR","TOTAL DRY EXTRACT","CRIOSCOPY","SALMONELA","FORMALDEIDO (SLOW METHOD)","FORMALDEIDO (QUICK METHOD)","TEXTURE","FLAVOR","pH","ALCOHOL","MOISTURE","CRYSTALLIZATION",;
				"pH 1�DIA","TOTAL SOLIDS","DEGREASED DRY EXTRACT","COUNTING OF THERMOTRONATING COLIFORMES","NON-FATTY SOLIDS","HYDROGEN PEROXIDE","PSYCHOTROPIC MICROORGANISMS COUNT",;
				"BBL BOXING","CREW PACKAGING","TP PACK","MANUFACTURING MILK PO","DESN / PASTEURIZ","LCO CONTAINER","MIX BBL MANUFACTURING","BBL MANUFACTURING","CRE CREATION","PACKAGING 1 KG","SORO LIQ RECEIPT","RECEIPT OF DESN",;
				"CONTAINER BAG","BBL CONTAINER","LCO MANUFACTURE","MIX LCO MANUFACTURING","MIX CRE CREATION","COOLING MILK","MANUFACTURE SERUM PO","ENCAIXOT MILK","CREAM PACKAGING","MANUFACTURE CALDA","UHT MILK PACK","BOXING 1KG",;
				"BOXING BAG","TP BOXING","CREAM BOXING","MANUFACTURE SYRUP","CREME RECEPTION","CREAM PREPARATION","PERM RECEIPT","ENCAIX MILK","LCO STANDARDIZATION","MILK RECEPTION","COOLING CREME","LCO BOXING","STANDARD BATCH","CREAM ENCAIXOT",;
				"PACKAGING 1KG","LCO MANUFACTURING","Aflatoxin","Arsenic","Lead","Cadmium","Tin","External Analysis","I ACCEPT WITH SIMPLE DEVIATION","REJECTED TOTALLY","I ACCEPT SERIOUS DEVIATION","WITH SELECTION BY PRODUCT","URGENT RELEASE"}
					
	Local cBkpStrg 		:= CapitalAce(AllTrim(_cString))
	Local cBkpStr 		:= "/"+CapitalAce(AllTrim(_cString))
	Default _cString 	:= ""
	Default _cIdioma	:= ""
	
	
	/*if 	Upper(AllTrim(_cString)) $ "CONTAGEM DE BOLORES E LEVEDURAS"
	
			_cString := "Bolores e Leveduras"
			
	elseif Upper(AllTrim(_cString)) $ "CONTAGEM DE COLIFORMES TERMOTOLERANTES"
	
			_cString := "Col. Termotolerantes"
			
	elseif Upper(AllTrim(_cString)) $ "SALMONELA"
	
			_cString := "Salmonella spp"
			
	elseif Upper(AllTrim(_cString)) $ "CONTAGEM DE COLIFORMES TOTAIS"
	
			_cString := "Coliformes Totais"
			
	elseif Upper(AllTrim(_cString)) $ "CONTAGEM DE STAPHYLOCOCCUS AUREUS"
	
			_cString := "Estafilococos aureus"
			
	endif*/


	if !_cIdioma$"Portug�s"


		if _cIdioma$"Ingl�s"

			_cString := funTraducao(_cString,aPalavPort,aPalavIngles)
			if !Upper(AllTrim(NoAcento(cBkpStrg)))$"ANALISE EXTERNA"
				_cString += cBkpStr
			endif

		elseif _cIdioma$"Espanhol"

			_cString := funTraducao(_cString,aPalavPort,aPalavEsp)
			if !Upper(AllTrim(NoAcento(cBkpStrg)))$"ANALISE EXTERNA"
				_cString += cBkpStr
			endif

		endif
		
	else
	
		_cString := AllTrim(CapitalAce(_cString)) 

	endif
	

Return(iif(len(_cString)>42,SubStr(_cString,1,42),_cString))

//***********************************************************
//Fun��o que traduz para do portug�s para o Ingl�s||Espanhol.
//***********************************************************

Static Function funTraducao(_cString,_aTraduzDe,_aTraduzPara)

	Default _aTraduzDe	 := {}
	Default _aTraduzPara := {}
	Default _cString 	 := ""

	for i := 1 to len(_aTraduzDe)

		if Upper(AllTrim(_cString))$Upper(AllTrim(_aTraduzDe[i]))

			_cString := CapitalAce(AllTrim(_aTraduzPara[i]))
			Exit
			 
		endif

	next i

return(CapitalAce(AllTrim(_cString)))